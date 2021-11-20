class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name

      t.timestamps
      t.references :enterprise, foreign_key: {on_delete: :cascade }, null: false
    end
  end
end
