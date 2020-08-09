class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :word
      t.text :description
      t.text :example

      t.timestamps
    end
  end
end
