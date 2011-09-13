Factory.define :customer do |customer|
  customer.sequence(:name) { |i| "User #{i}"}
  
  customer.address '123 Way Street'
  customer.city    'Lenexa'
  customer.state   'KS'
  customer.zip     '66215'
  
  customer.phone   '(913) 123-4567'
end