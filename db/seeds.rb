# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
hospital_a=Hospital.create({name:"Hospital A",place:"Place A"})
hospital_b=Hospital.create({name:"Hospital B",place:"Place B"})

hospital_a.doctor.create({name:"Doctor 1A",salary:100,dept:"Dept A1"})
hospital_a.doctor.create({name:"Doctor 2A",salary:200,dept:"Dept A2"})
hospital_b.doctor.create({name:"Doctor 1B",salary:100,dept:"Dept B1"})
hospital_b.doctor.create({name:"Doctor 2B",salary:200,dept:"Dept B2"})
