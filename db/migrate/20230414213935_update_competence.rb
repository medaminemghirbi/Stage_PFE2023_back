class UpdateCompetence < ActiveRecord::Migration[7.0]
  def change
    add_index :competences, [:souscategorie_id, :user_id], unique: true
  end
end
