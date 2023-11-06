class AddHeightToKinous < ActiveRecord::Migration[6.1]
  def change
    add_column :kinous, :height, :string
  end
end
