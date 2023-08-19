if Profile.count == 0
  puts "Populando tabela profile..."
  Profile.create!(name:'Anunciante')
  Profile.create!(name:'Candidato')
  puts "Profiles criados!"
end

if User.count == 0
  user = User.create!(email: 'user@gmail.com', password: '123456', password_confirmation: '123456')
  ProfileUser.create!(user_id: 1, profile_id: 2)
end

if Skill.count == 0
  Skill.create!(name: "pesca", description: "homen com uma vara de pesca,e com tedencias a destorcer a verdade")
  Skill.create!(name: "desenvolver", description: "fala com computadores ")
end