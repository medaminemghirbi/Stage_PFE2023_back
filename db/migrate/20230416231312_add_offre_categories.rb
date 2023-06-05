class AddOffreCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :offre_categories, id: :uuid do |t|
      t.references :offre , type: :uuid, null: false, foreign_key: true
      t.references :souscategorie , type: :uuid, null: false, foreign_key: true
      t.timestamps
    end
  end
end
