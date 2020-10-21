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
        # binding.pry
        joins(:transactions).select("items.id, items.name, sum(invoice_items.unit_price * invoice_items.quantity) as revenue").where("invoices.status='shipped' AND transactions.result='success'").group("merchant.id").order("revenue DESC").limit(quantity)
    end 
    #  going to need transactions(successful), limit by quantity, order by most revenue descending
end
