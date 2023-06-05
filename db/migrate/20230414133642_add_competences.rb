class AddCompetences < ActiveRecord::Migration[7.0]
  def change
    create_table :competences, id: :uuid do |t|
      t.references :user , null: false, type: :uuid, foreign_key: true
      t.references :souscategorie , null: false, type: :uuid, foreign_key: true
      t.integer :niveau
      t.timestamps
    end
  end
end
