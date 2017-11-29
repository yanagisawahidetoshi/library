class CreateLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :libraries do |t|
      t.string :name, :limit => 64
      t.string :lib_id, :limit => 6, :unique => true
      t.string :url, :limit => 256
      t.integer :pref_id
      t.integer :city_id
      t.string :address, :limit => 64
      t.string :post, :limit => 9
      t.string :tel, :limit => 64
      t.decimal :lat, :precision => 9, :scale => 6
      t.decimal :lng, :precision => 9, :scale => 6
      t.integer :library_category_id

      t.timestamps
    end
  end
end
