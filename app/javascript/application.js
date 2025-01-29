// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs"
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
import "bootstrap"
import "../stylesheets/application"
Rails.start();
