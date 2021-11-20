class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content

      t.references :user, foreign_key: {on_delete: :cascade }, null: false
      t.references :news, foreign_key: {on_delete: :cascade }, null: false
      t.timestamps
    end
  end
end
