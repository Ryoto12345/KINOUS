class AddUserIdToKinous < ActiveRecord::Migration[6.1]
  def change
    add_column :kinous, :user_id, :integer
  end
end
