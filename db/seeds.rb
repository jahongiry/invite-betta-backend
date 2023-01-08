# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Post.all.delete_all
Post.create(title: '1');
Post.create(title: '2');
Post.create(title: '3');
Post.create(title: '4');
Post.create(title: '1.1');
Post.create(title: '1.2');
Post.create(title: '1.3');