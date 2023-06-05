class UpdateOffreCategorie < ActiveRecord::Migration[7.0]
  def change
    add_index :offre_categories, [:souscategorie_id, :offre_id], unique: true
  end
end
