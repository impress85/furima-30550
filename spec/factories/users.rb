FactoryBot.define do
  factory :user do
      nickname {Gimei.name}
      email {Faker::Internet.free_email}
      password = "123aaa"
	    password {password}
      password_confirmation {password}
      first_name { Gimei.name.first }
      first_name_katakana { Gimei.name.first.katakana }
      family_name { Gimei.name.last }
      family_name_katakana { Gimei.name.last.katakana }
      birthday {Faker::Date.birthday }
      end
end