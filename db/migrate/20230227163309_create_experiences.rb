class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :category
      t.string :location

      t.timestamps
    end
  end
end
