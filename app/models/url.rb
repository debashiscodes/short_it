class Url < ApplicationRecord
  validates :long_url, :short_url, presence: true
  validates :short_url, uniqueness: true
  validates_format_of :long_url, :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i

  before_validation :set_short_url

  private

  def set_short_url
    self.short_url = "http://localhost:3000/" + generate_short_url
  end

  def generate_short_url
    loop do
      short_url = SecureRandom.uuid[0..6]
      break short_url unless Url.exists?(short_url: short_url)
    end
  end
end
