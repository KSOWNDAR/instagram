class AddReferenceToCreatePosts < ActiveRecord::Migration[6.1]
  def change
    add_reference(:posts, :account, index: true)
  end
end
