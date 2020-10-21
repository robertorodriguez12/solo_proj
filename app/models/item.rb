class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.find_by_name(name)
    items = Item.where("lower(name) LIKE ?", "%" + name.downcase + "%")
  end
end
