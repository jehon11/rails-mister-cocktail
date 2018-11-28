class AddFromToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :from, :string
  end
end
