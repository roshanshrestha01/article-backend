class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :source
      t.string :link
      t.timestamps
    end
  end
end
