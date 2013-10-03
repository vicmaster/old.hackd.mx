Fabricator :user do
  email { sequence { |n| "user_#{n}@hackdmx.com" } }
  first_name 'Jane'
  last_name 'Doe'
  gender 'female'
end
