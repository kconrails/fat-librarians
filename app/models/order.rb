class Order < ActiveRecord::Base
  include SearchAddress

  belongs_to :customer
  has_and_belongs_to_many :items
  
  def weight
    return @weight if defined?(@weight)
    @weight = items.map(&:weight).sum
  end
  
  def shipping_cost
    case delivery
    when 'USPS'
      usps_shipping_cost
    when 'UPS'
      ups_shipping_cost
    when 'FedEx'
      fedex_shipping_cost
    end
  end
  
  def shipping_days
    case delivery
    when 'USPS'
      usps_shipping_days
    when 'UPS'
      ups_shipping_days
    when 'FedEx'
      fedex_shipping_days
    end
  end
  
  private
  
  def usps_shipping_cost
    2.0 + items.map(&:weight).sum
  end
  
  def ups_shipping_cost
    2.0 + (items.map(&:weight).sum * 1.5)
  end
  
  def fedex_shipping_cost
    49.95
  end
  
  def usps_shipping_days
    5
  end
  
  def ups_shipping_days
    items.map(&:weight).sum < 5 ? 2 : 6
  end
  
  def fedex_shipping_days
    1
  end
end
