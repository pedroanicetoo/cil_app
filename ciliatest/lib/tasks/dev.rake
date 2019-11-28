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


    puts "Create 3 Products Default..."
        x = Product.new
        x.name = "A"
        x.description = "produto A"
        x.price = "2,20"

        y = Product.new
        y.name = "B"
        y.description = "produto B"
        y.price = "3,30"

        z = Product.new
        z.name = "C"
        z.description = "produto C"
        z.price = "4,40"

    puts "Create 3 Products Default...[OK]"


    puts "Create Products[A, B, C] fakers..."

      100.times do
        choose = [x, y, z].sample
        Product.create(
          name: choose.name,
          description: choose.description,
          price: choose.price
          )
      end

    puts "Create Products[A, B, C] fakers...[OK]"

    puts "Create Other Products fakers..."

      10.times do
        Product.create(
          name: Faker::Dota.item,
          description: Faker::MichaelScott.quote,
          price: "#{Random.rand(500)},#{Random.rand(99)}"
          )
      end

    puts "Create Other Products fakers...[OK]"


  end

  ##############################################################



end

##rake db:drop db:create db:migrate db:seed utils:generate_admins
