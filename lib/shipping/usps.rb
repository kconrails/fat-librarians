require File.dirname(__FILE__) + '/base'

module Shipping
  class USPS < Base
    def cost
      2.0 + weight
    end
    
    def days
      5
    end
  end
end