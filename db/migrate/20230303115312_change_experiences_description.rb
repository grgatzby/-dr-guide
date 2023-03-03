class ChangeExperiencesDescription < ActiveRecord::Migration[7.0]
  def change
    change_column :experiences, :description, :text
  end
end
