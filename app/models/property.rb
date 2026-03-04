class Property < ApplicationRecord
  has_many :maintenance_tickets, dependent: :destroy
end
