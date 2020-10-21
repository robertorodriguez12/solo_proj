class Merchant < ApplicationRecord
    validates_presence_of :name
    has_many :items
    has_many :invoices
    has_many :customers, through: :invoices

    def self.find_by_name(name)
        merchant = Merchant.where("lower(name) LIKE ?", "%" + name.downcase + "%")
    end
end
