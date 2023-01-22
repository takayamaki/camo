source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.1"
gem "sqlite3", "~> 1.4"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "rubocop"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end
