task :clear_data => :environment do 
		Product.delete_all
end