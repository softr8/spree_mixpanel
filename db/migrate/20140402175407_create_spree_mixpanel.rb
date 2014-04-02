class CreateSpreeMixpanel < ActiveRecord::Migration
  def change
    create_table :spree_mixpanel do |t|
      t.integer :token
      t.timestamps
    end
  end
end
