FactoryGirl.define do
  factory :book do
    title "Test Title"
    description "Test description"
    published_date Date.today
    unit_price 25.00
    author
  end

  factory :second_book, class: "Book" do
    title "Another Test Title"
    description "Another Test description"
    published_date Date.today
    unit_price 15.00
    author
  end
end
