Factory.define :item do |item|
  item.sequence(:name) { |i| "Item #{i}"}
  item.price  1.0
  item.weight 1.0 
end