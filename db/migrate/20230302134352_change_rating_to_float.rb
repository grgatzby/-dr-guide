class ChangeRatingToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :rating, 'float USING CAST(rating as float)'
  end
end
