class AddColumnUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :labs, :user_id, :integer
  end
end
