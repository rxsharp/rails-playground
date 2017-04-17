# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!({id: 1, email: "rickagz@gmail.com", created_at: "2017-03-16 07:07:11
", updated_at: "2017-03-29 00:19:03", password: "delta888"})

project = Project.create!({
  id: 1, name: "Higgs and Boson Associates", dueDate: "2017-09-15", budget: 10000.00, user_id: 1,
  created_at: "2017-04-16 22:07:00", updated_at: "2017-04-16 22:07:00"
  })

devEntries = DevEntry.create!([
    {id: 1, devDate: "2017-01-05", devDuration: 2.50,
      note: "Add Initial code", project_id: 1, user_id: 1,
    },
    {id: 2, project_id: 1, user_id: 1,
      devDate: "2017-01-10", devDuration: 3.50,
      note: "Add Initial style",
    },
    {id: 3, project_id: 1, user_id: 1,
      devDate: "2017-01-15", devDuration: 5.50,
      note: "Add Landing Page content",
    }
  ])
