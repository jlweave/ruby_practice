class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :customer_id

  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items
  has_many :bulk_discounts, through: :merchants

  enum status: [:cancelled, 'in progress', :completed]

  def total_revenue
    invoice_items.sum("unit_price * quantity")
  end

  def total_discount_rev
    invoice_items.joins(:bulk_discounts)
    .where('invoice_items.quantity >= bulk_discounts.threshold')
    .select('invoice_items.id, max(invoice_items.quantity * invoice_items.unit_price * (bulk_discounts.percentage/100.00)) as discount_rev')
    .group('invoice_items.id')
    .order('discount_rev desc')
    .sum(&:discount_rev)
  end
  # def total_discount_rev
  #   BulkDiscount.joins(:invoice_items)
  #   .select('sum((invoice_items.quantity * invoice_items.unit_price) * (bulk_discounts.percentage/100)) as discount_rev')
  #   .where('invoice_items.quantity >= bulk_discounts.threshold && invoice_items.invoice_id = ?', self.id)
  #   .group('invoice_items.id, bulk_discount.id')
  #   .order(discount_rev: :desc)
  # end

  def discount_final_rev
    total_revenue - total_discount_rev
  end
end
