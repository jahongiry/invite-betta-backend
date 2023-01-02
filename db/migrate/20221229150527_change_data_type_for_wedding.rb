class ChangeDataTypeForWedding < ActiveRecord::Migration[7.0]
  def change
    change_column :weddings, :sana, :datetime
  end
end
