class AddColumnToCreatePosts < ActiveRecord::Migration[6.1]
  def change
    add_column(:posts, :active, :boolean)
  end
end
