class RemoveUniqueFromEnterprices < ActiveRecord::Migration[6.1]
  def change
    remove_index :enterprises, :user_id
    add_index :enterprises, :user_id
  end
end
