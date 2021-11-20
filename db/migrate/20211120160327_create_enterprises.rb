class CreateEnterprises < ActiveRecord::Migration[6.1]
  def change
    create_table :enterprises do |t|
      t.string :title
      t.string :headquaters
      t.text :description

      t.timestamps

      t.references :user, null: false , foreign_key: true, index: {unique: true }
    end
  end
end
