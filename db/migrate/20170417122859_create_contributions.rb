class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.text :content
      t.timestamps null: false
    end
  end
end
