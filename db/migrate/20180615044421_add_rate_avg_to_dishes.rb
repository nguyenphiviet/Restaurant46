class AddRateAvgToDishes < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :rate_avg, :float, null: false, default: 0
  end
end
