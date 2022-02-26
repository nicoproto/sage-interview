class CreateQueries < ActiveRecord::Migration[6.1]
  def change
    create_table :queries do |t|
      t.text :facts
      t.string :input
      t.integer :kind

      t.timestamps
    end
  end
end
