task :setup_data => :environment do 	
	60.times do
		Product.create(name:Faker::Commerce.product_name,price:Faker::Commerce.price,description:Faker::Lorem.paragraph,category_id:Category.all.pluck(:id).sample,stock:Faker::Number.between(1,10),cod_eligible:true,feature_image_url:"https://www.istockphoto.com/in/photo/plant-growing-gm510222832-86161229")
	end
end