class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content

      t.timestamps
      t.references :user, foreign_key: {on_delete: :cascade }, null: false
    end
  end
end
