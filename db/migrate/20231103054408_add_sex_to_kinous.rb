class AddSexToKinous < ActiveRecord::Migration[6.1]
  def change
    add_column :kinous, :sex, :string
  end
end
