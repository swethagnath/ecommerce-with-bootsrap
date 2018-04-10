class CreateAppKings < ActiveRecord::Migration[5.1]
  def change
    create_table :app_kings do |t|

      t.timestamps
    end
  end
end
