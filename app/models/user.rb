class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cryptos
  after_create :sync_to_supabase

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def sync_to_supabase
    require 'net/http'
    require 'uri'
    require 'json'

    uri = URI.parse(ENV['API_LINK_SUPABASE'])
    request = Net::HTTP::Post.new(uri)
    request["apikey"] = ENV['API_KEY_SUPABASE']
    request["Content-Type"] = "application/json"

    request.body = {
      id: self.id,
      email: self.email,
      first_name: self.first_name,
      last_name: self.last_name
    }.to_json

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    unless response.is_a?(Net::HTTPSuccess)
      Rails.logger.error("Failed to sync user to Supabase: #{response.body}")
    end
  end
end
