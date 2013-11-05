class CreateBetaProducts < ActiveRecord::Migration
  def change
    create_table :beta_products do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
