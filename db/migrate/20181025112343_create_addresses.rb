class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name, null: false, default: '', limit: 34

      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
