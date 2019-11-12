
puts "CREATING USERS"

usr1 = User.create(name: 'luke', password_digest: BCrypt::Password.create('Jedi'), email: 'luke@ga.com')
usr2 = User.create(name: 'han', password_digest: BCrypt::Password.create('Falcon'), email: 'han@ga.com')
usr3 = User.create(name: 'leia', password_digest: BCrypt::Password.create('Alderaan'), email: 'leia@ga.com')

puts "CREATED USER:"
puts usr1.id.to_s
puts usr2.id.to_s
puts usr3.id.to_s

puts "CREATING CATEGORIES"

c1 = Category.create(name:'Auto & Transport', user_id: 1)
c2 = Category.create(name:'Entertainment', user_id: 1)
c3 = Category.create(name:'Education', user_id: 2)
c4 = Category.create(name:'Personal Care', user_id: 2)
c5 = Category.create(name:'Health & Fitness', user_id: 1)
c6 = Category.create(name:'Food & Dining', user_id: 1)
c7 = Category.create(name:'Bills', user_id: 1)
c8 = Category.create(name:'Groceries', user_id: 3)
c9 = Category.create(name:'Rent', user_id: 1)
c10 = Category.create(name:'Miscellaneous', user_id: 1)
c11 = Category.create(name:'Others', user_id: 1)

puts "CREATED CATEGORIES"
puts c1.id.to_s
puts c2.id.to_s
puts c3.id.to_s
puts c4.id.to_s
puts c5.id.to_s
puts c6.id.to_s
puts c7.id.to_s
puts c8.id.to_s
puts c9.id.to_s
puts c10.id.to_s
puts c11.id.to_s

puts "CREATING EXPENSES"

e1 = Expense.create(name: 'coffee', when: '26/10/2019', value: 10.12, user_id: usr1.id, category_id: c1.id)
e2 = Expense.create(name: 'butter', when: '26/10/2019', value: 2.60, user_id: usr1.id, category_id: c1.id)
e3 = Expense.create(name: 'transport', when: '25/10/2019', value: 24.9, user_id: usr1.id, category_id: c2.id)
e4 = Expense.create(name: 'coffee', when: '22/10/2019', value: 10.12, user_id: usr2.id, category_id: c2.id)

puts "CREATED EXPENSES"
puts e1.id.to_s
puts e2.id.to_s
puts e3.id.to_s
puts e4.id.to_s

puts "DONE"