Fabricator :user do
  email { sequence { |n| "user_#{n}@example.com" } }
  first_name 'Jane'
  last_name 'Doe'
  gender 'female'
end
