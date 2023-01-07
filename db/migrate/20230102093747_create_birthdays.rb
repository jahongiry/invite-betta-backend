class CreateBirthdays < ActiveRecord::Migration[7.0]
  def change
    create_table :birthdays do |t|
      t.string :mehmon
      t.string :mezbon
      t.string :card
      t.string :tel
      t.datetime :sana
      t.string :manzil
      t.string :soat

      t.timestamps
    end
  end
end
