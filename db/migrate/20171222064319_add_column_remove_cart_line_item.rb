class AddColumnRemoveCartLineItem < ActiveRecord::Migration[5.1]
  def change
  	add_column :cart_line_items,:total,:string
  end
end
