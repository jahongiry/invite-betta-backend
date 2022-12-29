class CreateWeddings < ActiveRecord::Migration[7.0]
  def change
    create_table :weddings do |t|
      t.string :kuyov
      t.string :kelin
      t.string :card
      t.string :tel
      t.string :sana
      t.string :soat
      t.string :manzil

      t.timestamps
    end
  end
end
