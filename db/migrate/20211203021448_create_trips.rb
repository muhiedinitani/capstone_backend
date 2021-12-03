class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.integer :resort_id
      t.string :day_start
      t.string :day_end
      t.integer :user_id
      t.string :original_query

      t.timestamps
    end
  end
end
