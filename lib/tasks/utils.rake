namespace :utils do
  desc "Apenas para desenvolvimento - popula dados para teste"
  task seed: :environment do
    puts "Populando Contatos..."
    167.times do
      Contact.create!(
        name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: LeroleroGenerator.sentence
      )
    end
    puts "Contatos OK."
    puts "Populando Endereços..."
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: contact
      )
    end
    puts "Endereços OK."
    puts "Populando Telefones..."
    Contact.all.each do |contact|
      [1,2,3].sample.times do
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts "Telefones OK."
  end
end
