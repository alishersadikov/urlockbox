class Link < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true
  validates :title, presence: true


  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end
end
