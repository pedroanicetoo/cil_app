namespace :dev do

  desc "Setup Development"
  task :setup => :environment do
    images_path = Rails.root.join('public', 'system')
    puts "DEV SETUP..."

      puts "DROP BD...#{%x(rake db:drop)}"
      puts "CREATE BD...#{%x(rake db:create)}"
      puts %x(rake db:migrate)
      puts %x(rake db:seed)
      puts %x(rake dev:generate_clients)
      puts %x(rake dev:generate_products)

    puts "DEV SETUP...[OK]"
  end

  ##############################################################

  desc "Create Clients fakers"
  task :generate_clients => :environment do

    puts "Create Clients fakers..."

      10.times do
        Client.create(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: "123",
          password_confirmation: "123",
          born: [Faker::Date.birthday(18, 65), nil].sample
          )
      end

    puts "Create Clients fakers...[OK]"
  end

  ##############################################################

  desc "Create Product fakers"
  task :generate_products => :environment do

    puts "Create Products fakers..."
     ##Criando um Producto Fake e atribuindo um preço fixo pra ele
      x = Hash.new
      100.times do
        key = Faker::Dota.item
        price = "#{Random.rand(500)},#{Random.rand(99)}"
        unless x.include? key
          x.store(key, price)
        end
      end

      # 100.times do
      #   value = x.keys.sample
      #   Product.create(
      #     name: value,
      #     description: Faker::MichaelScott.quote,
      #     price: x[value]
      #     )
      # end
      100.times do
        value = x.keys.sample
        Product.create(
          name: value,
          description: "default",
          price: x[value]
          )
      end

    puts "Create Products fakers...[OK]"


  end

  ##############################################################



end

##rake db:drop db:create db:migrate db:seed utils:generate_admins
