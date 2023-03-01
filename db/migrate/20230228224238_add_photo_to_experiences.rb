class AddPhotoToExperiences < ActiveRecord::Migration[7.0]
  def change
    add_column :experiences, :photo, :string
  end
end
