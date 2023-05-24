class AddFieldsToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :cpu, :string
    add_column :products, :ram, :string
    add_column :products, :gpu, :string
    add_column :products, :storage, :string
  end
end
