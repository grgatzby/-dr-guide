class AddUserOnExperiences < ActiveRecord::Migration[7.0]
  def change
    add_reference :experiences, :user
  end
end
