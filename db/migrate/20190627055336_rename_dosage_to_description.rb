class RenameDosageToDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :doses, :dosage, :description
  end
end
