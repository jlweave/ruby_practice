class AddFieldsToMerchants < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :status, :integer
  end
end
