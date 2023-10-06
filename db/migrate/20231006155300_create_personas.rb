class CreatePersonas < ActiveRecord::Migration[7.0]
  def change
    create_table :personas do |t|
      t.string :name
      t.text :summary
      t.text :links, array: true, default: []
      t.string :income_level
      t.string :age_range
      t.text :demographic_traits, array: true, default: []
      t.string :job_title
      t.string :department
      t.boolean :B2B

      t.timestamps
    end
  end
end
