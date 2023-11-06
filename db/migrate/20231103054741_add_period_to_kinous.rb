class AddPeriodToKinous < ActiveRecord::Migration[6.1]
  def change
    add_column :kinous, :period, :string
  end
end
