module Shipping
  class Base
    attr_accessor :weight
    
    def initialize weight = nil
      @weight = weight.nil? ? 1 : weight.to_f
    end
    
    def name
      self.class.name.split('::').last
    end
    
    def cost
      weight * 0.1
    end
    
    def days
      1
    end
  end
end