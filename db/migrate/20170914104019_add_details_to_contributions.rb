class AddDetailsToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :title, :string
  end
end
