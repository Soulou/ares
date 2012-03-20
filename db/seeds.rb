admin_group = Group.create name: 'admin'
student_group = Group.create name: 'student'

User.create username: "leo", group: admin_group,
  password: "leo", email: "leo@unbekandt.eu", first_name: "Léo",
  last_name: "Unbekandt", promotion: 2014, start_year: 2011
