FactoryGirl.define do
  factory :item do
    name 
    description  
    image_url "http://via.placeholder.com/350x150"
  end

  sequence :name do |i|
    "name #{i}"
  end

  sequence :description do |i|
    "description #{i}"
  end
end