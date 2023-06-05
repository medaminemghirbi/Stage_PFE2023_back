class CreateOffres < ActiveRecord::Migration[7.0]
  def change
    create_table :offres, id: :uuid do |t|
      t.string :titre_offre
      t.string :description
      t.integer :niveau_etude
      t.integer :experience
      t.integer :type_contrat
      t.integer :type_offre
      t.date :start_date
      t.integer :duration
      t.date :end_date
      t.float :salaire
      t.boolean :is_payed, :default => false
      t.boolean :is_completed, :default => false
      t.string :filepath
      t.string :location
      t.timestamps
      t.references :user, null: false, type: :uuid, foreign_key: true
    end
  end
end
