class AddFrequencyToKinous < ActiveRecord::Migration[6.1]
  def change
    add_column :kinous, :frequency, :string
  end
end
