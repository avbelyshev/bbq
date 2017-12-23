class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  before_validation :user_email_downcase

  validates :user_name, presence: true, unless: 'user.present?'
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: 'user.present?'

  validates :user, uniqueness: {scope: :event_id}, if: 'user.present?'
  validates :user_email, uniqueness: {scope: :event_id}, unless: 'user.present?'

  validate :subscriber_verification, on: :create
  validate :email_verification, on: :create

  def user_email_downcase
    user_email.downcase!
  end

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def subscriber_verification
    errors[:base] << I18n.t('subscriptions.subscriber_error') if user == event.user
  end

  def email_verification
    errors[:base] << I18n.t('subscriptions.email_error') if user.blank? &&
      User.find_by_email(user_email).present?
  end
end
