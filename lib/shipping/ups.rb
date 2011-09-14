require File.dirname(__FILE__) + '/base'

module Shipping
  class UPS < Base
    def cost
      2.0 + (weight * 1.5)
    end
    
    def days
      weight < 5 ? 2.0 : 6.0
    end
  end
end