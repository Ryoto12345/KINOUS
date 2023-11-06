class AddWeightToKinous < ActiveRecord::Migration[6.1]
  def change
    add_column :kinous, :weight, :string
  end
end
