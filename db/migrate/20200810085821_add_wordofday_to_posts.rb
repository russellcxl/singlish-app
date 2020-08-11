class AddWordofdayToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :word_of_day, :boolean
  end
end
