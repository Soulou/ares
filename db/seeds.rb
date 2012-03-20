require 'csv'

admin_group = Group.create name: 'admin'
student_group = Group.create name: 'student'

data = CSV.read("/home/leo/Projets/ares/db/ENSIIE.csv")

data.each do |line|
  if line[2] == nil then
    puts "Nom obligatoire"
    exit
  end
  if line[3] == nil then
    puts "Prenom obligatoire"
    exit
  end
  if line[6] == nil then
    puts "Email obligatoire"
    exit
  end
  if line[0] == nil then
    puts "Annee d'entree obligatoire"
    exit
  end
  if line[1] == nil then
    puts "Promotion obligatoire"
    exit
  end

  User.create username: line[2].mb_chars.normalize(:kd).downcase.strip.gsub(" ","").tr('-', '_').chomp + line[0],
              group: student_group,
              password: "coucou",
              email: line[6],
              first_name: line[3],
              last_name: line[2],
              promotion: line[1],
              start_year: line[0]
end
