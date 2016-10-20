class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :body
      t.string :project_image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
