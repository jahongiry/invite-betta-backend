class ChangeDataTypeForWeddingThird < ActiveRecord::Migration[7.0]
  def change
    change_column :weddings, :sana, :datetime, using: "sana::timestamp without time zone"
  end
end
