class Merchant < ApplicationRecord
    validates_presence_of :name
    has_many :items
    has_many :invoices
    has_many :invoice_items, through: :items
    has_many :customers, through: :invoices
    has_many :transactions, through: :invoices

    def self.find_by_name(name)
        merchant = Merchant.where("lower(name) LIKE ?", "%" + name.downcase + "%")
    end

    def self.most_revenue(quantity)
        self.select("merchants.*, sum(quantity * unit_price) as revenue").joins(invoices: [:invoice_items, :transactions]).where("transactions.result='success' AND invoices.status='shipped'").group("merchants.id").order("revenue DESC").limit(quantity)
    end 
end


