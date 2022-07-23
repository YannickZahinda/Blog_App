# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# rubocop:todo Layout/LineLength
# User.create(photo:'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60', name: 'John1', email:'john1@gmail.com', password: '123456', password_confirmation: '123456')
# rubocop:enable Layout/LineLength
# rubocop:todo Layout/LineLength
# User.create(photo:'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60', name: 'John2', email:'john2@gmail.com', password: '123456', password_confirmation: '123456')
# rubocop:enable Layout/LineLength
# rubocop:todo Layout/LineLength
# User.create(photo:'https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60', name: 'John3', email:'john3@gmail.com', password: '123456', password_confirmation: '123456')
# rubocop:enable Layout/LineLength

Post.create(user: User.first, title: 'Hello', text: 'This is my first post')
Post.create(user: User.first, title: 'Hello', text: 'This is my first post')
Post.create(user: User.second, title: 'Hello', text: 'This is my first post')
Post.create(user: User.third, title: 'Hello', text: 'This is my first post')

Comment.create(user: User.first, post: Post.second, text: 'Good improvements')
Comment.create(user: User.second, post: Post.third, text: 'Nice Post')
Comment.create(user: User.second, post: Post.second, text: 'Congrats')

Like.create(user: User.third, post: Post.third)
Like.create(user: User.second, post: Post.fourth)
Like.create(user: User.first, post: Post.second)
