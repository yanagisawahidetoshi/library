class CreatePrefs < ActiveRecord::Migration[5.1]
  def change
    create_table :prefs do |t|
      t.string :name, :limit => 4, :unique => true

      t.timestamps
    end
  end
end
