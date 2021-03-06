class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string      :name,          null: false
      t.text        :introduce,     null: false
      t.integer     :price,         null: false
      t.references  :seller,        null: false, foring_key: true

      t.timestamps
    end
  end
end
