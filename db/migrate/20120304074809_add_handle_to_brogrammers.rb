class AddHandleToBrogrammers < ActiveRecord::Migration
  def change
    change_table :brogrammers do |t|
      t.string :handle
    end
  end
end
