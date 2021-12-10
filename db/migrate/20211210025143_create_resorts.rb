class CreateResorts < ActiveRecord::Migration[6.1]
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :official_website
      t.float :lat
      t.float :lng
      t.integer :region_id
      t.string :region_name
      t.integer :original_id

      t.timestamps
    end
  end
end
