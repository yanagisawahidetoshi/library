class CreateLibraryCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :library_categories do |t|
      t.string :name, :limit => 16, :unique => true

      t.timestamps
    end
  end
end
