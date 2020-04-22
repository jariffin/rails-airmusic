class AddLocationToInstruments < ActiveRecord::Migration[6.0]
  def change
    add_column :instruments, :location, :string
  end
end
