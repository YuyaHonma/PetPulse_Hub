class AddAddressToOwners < ActiveRecord::Migration[6.1]
  def change
    add_column :owners, :address, :string
  end
end
