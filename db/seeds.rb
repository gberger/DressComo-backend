# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

gui = User.create({name: 'Guilherme Berger', username: 'gberger', email: 'gberger@unc.edu', password: 'pass1234', location: 'Rio de Janeiro', bio: 'PUC-Rio 2016'})
harris = User.create({name: 'Harris McClean', username: 'harris', email: 'harris@unc.edu', password: 'pass1234', location: 'Chapel Hill', bio: 'Go Tar Heels!'})

post = Post.create({author: harris, text: '#Everyday Does this look good for a college orientation session?', cloudinary_image_id: 'mirror2_dkzz31'})
post.liked_by(gui)
