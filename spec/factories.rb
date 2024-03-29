FactoryGirl.define do
  factory :team do
    name { Faker::Name.name }
    approval_time { "#{rand(59)+1}:#{rand(59)+1}" }
  end
  
  factory :match do
    description { Faker::Lorem.sentence }
    duration { "#{rand(59)+1}:#{rand(59)+1}" }
    
    association :team1, :factory => :team
    association :team2, :factory => :team
  end
end
