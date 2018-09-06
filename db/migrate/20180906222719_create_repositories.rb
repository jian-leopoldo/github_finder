class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.string :language
      t.string :name
      t.string :full_name
      t.string :repo_url
      t.integer :repo_stars

      t.timestamps
    end
  end
end
