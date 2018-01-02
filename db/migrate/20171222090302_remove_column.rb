class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
  	remove_column :cart_line_items,:total
  end
end
