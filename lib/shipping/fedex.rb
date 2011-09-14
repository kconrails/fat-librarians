require File.dirname(__FILE__) + '/base'

module Shipping
  class FedEx < Base
    def cost
      49.95
    end
    
    def days
      1
    end
  end
end