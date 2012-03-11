admin_group = Group.create name: 'admin'
student_group = Group.create name: 'student'

paul = User.create username: 'chobert2010',
  group: admin_group,
  password: 'toto123',
  email: 'paul@chobert.fr',
  first_name: 'Paul',
  last_name: 'Chobert'
