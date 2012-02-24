FactoryGirl.define do

  factory :glossary do
    name "foo"
  end

  factory :term do
    sequence(:name) { |n| "term #{n}" }
    association :glossary
    association :definition
  end

  factory :definition do
    text "This is the text for fake definition!"
  end

end