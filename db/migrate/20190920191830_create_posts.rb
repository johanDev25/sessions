class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name, limit: 50
      t.text :body, limit: 250

      t.timestamps
    end
  end
end
