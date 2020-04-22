class ChangePriceToIntegerInInstruments < ActiveRecord::Migration[6.0]
  def change
    change_column :instruments, :price_per_day, :integer
  end
end
