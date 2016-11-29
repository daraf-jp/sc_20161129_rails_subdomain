class Account < ActiveRecord::Base
  # validate
  validates :subdomain, presence: true, uniqueness: { case_sensitive: false }, subdomain: true
end
