class Order < ActiveRecord::Base
  include SearchAddress

  belongs_to :customer
  has_and_belongs_to_many :items
  
  def weight
    return @weight if defined?(@weight)
    @weight = items.map(&:weight).sum
  end
  
  def shipping
    "Shipping::#{delivery}".constantize.new(weight)
  end
end
