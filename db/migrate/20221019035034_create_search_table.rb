class CreateSearchTable < ActiveRecord::Migration[6.1]
  def change
    create_table :search_tables do |t|
      t.text :query 
      t.timestamps
    end
  end
end
