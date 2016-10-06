class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :alma_mater
      t.string :academic_discipline
      t.string :specific_discipline
      t.string :specialization
      t.string :topic_of_research
      t.string :level_of_education
      t.timestamps
    end
  end
end
