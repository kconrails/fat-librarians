class Customer < ActiveRecord::Base
  include SearchAddress

  has_many :orders
end
