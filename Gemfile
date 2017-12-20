source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

gem 'devise', '~> 4.3.0'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'

gem 'carrierwave'
gem 'rmagick'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end
