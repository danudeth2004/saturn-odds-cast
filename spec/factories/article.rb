FactoryBot.define do
  factory :article do
    description { "description" }
    status { 2 }
    content_attributes { { title: "Sprint on Rails" } }
  end
end
