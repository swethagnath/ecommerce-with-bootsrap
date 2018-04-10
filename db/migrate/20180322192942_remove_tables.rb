class RemoveTables < ActiveRecord::Migration[5.1]
  def change
  	drop_table :average_caches
  	drop_table :rates 
  	drop_table :overall_averages
  	drop_table :rating_caches
  end
end
