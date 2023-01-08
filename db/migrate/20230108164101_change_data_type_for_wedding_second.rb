class ChangeDataTypeForWeddingSecond < ActiveRecord::Migration[7.0]
   def change
    change_column :weddings, :sana, :string
  end
end
