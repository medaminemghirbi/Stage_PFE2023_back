class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :categorie_name
      t.belongs_to :domain , type: :uuid, foreign_key: true
      t.timestamps
    end
  end
end
