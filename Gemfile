source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end



gem "activeadmin"
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "3.3.7"
gem "cancancan", "~> 2.0"
gem "carrierwave", "1.2.2"
gem "ckeditor", github: "galetahub/ckeditor"
gem "cocoon"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "devise"
gem "elasticsearch-model"
gem "elasticsearch-rails"
gem "faker"
gem "figaro"
gem "font-awesome-rails"
gem "friendly_id"
gem "html_truncator"
gem "i18n-js"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "jquery-turbolinks"
gem "kaminari", "~> 1.1", ">= 1.1.1"
gem "mini_magick"
gem "mysql2", ">= 0.3.18", "< 0.6.0"
gem "omniauth"
gem "omniauth-facebook"
gem "omniauth-google-oauth2"
gem "omniauth-twitter"
gem "puma", "~> 3.0"
gem "ransack", github: "activerecord-hackery/ransack"
gem "rails", "~> 5.1.1"
gem "rubocop", "~> 0.54.0", require: false
gem "sass-rails", "~> 5.0"
gem "social-share-button"
gem "toastr-rails"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platform: :mri
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
