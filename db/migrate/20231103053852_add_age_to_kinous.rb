class AddAgeToKinous < ActiveRecord::Migration[6.1]
  def change
    add_column :kinous, :age, :string
  end
end
