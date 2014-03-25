source "https://rubygems.org"

gemspec

platform :ruby do
  gem "sqlite3"
end

platform :jruby do
  gem "minitest", ">= 3.0"
  gem "activerecord-jdbcsqlite3-adapter", ">= 1.3.0.beta2"
end

version = ENV["RAILS_VERSION"] || "4.0"

eval_gemfile File.expand_path("../gemfiles/#{version}.gemfile", __FILE__)

