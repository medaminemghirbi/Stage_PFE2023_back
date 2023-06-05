class CreateDomains < ActiveRecord::Migration[7.0]
  def change
    create_table :domains, id: :uuid do |t|
      t.string :domain_name
      t.timestamps
    end
  end
end
