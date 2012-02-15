FactoryGirl.define do

  factory :glossary do
    name "foo"
  end

  factory :term do
    sequence(:name) { |n| "term #{n}" }
    definition "A woodchuck can chuck as much wood as it wants."
  end

end