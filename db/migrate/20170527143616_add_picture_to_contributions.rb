class AddPictureToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :picture, :string
  end
end
