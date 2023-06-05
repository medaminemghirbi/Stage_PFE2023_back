# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_29_145232) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "candidatures", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "date_postulation"
    t.integer "etat", default: 0
    t.datetime "interview_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "offre_id"
    t.uuid "user_id"
    t.index ["offre_id", "user_id"], name: "index_candidatures_on_offre_id_and_user_id", unique: true
    t.index ["offre_id"], name: "index_candidatures_on_offre_id"
    t.index ["user_id"], name: "index_candidatures_on_user_id"
  end

  create_table "categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "categorie_name"
    t.uuid "domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_id"], name: "index_categories_on_domain_id"
  end

  create_table "certifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "certification_name"
    t.string "etablissement"
    t.date "date_certif"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_certifications_on_user_id"
  end

  create_table "competences", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "souscategorie_id", null: false
    t.integer "niveau"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["souscategorie_id", "user_id"], name: "index_competences_on_souscategorie_id_and_user_id", unique: true
    t.index ["souscategorie_id"], name: "index_competences_on_souscategorie_id"
    t.index ["user_id"], name: "index_competences_on_user_id"
  end

  create_table "domains", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "domain_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiences", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "entreprise"
    t.string "position_held"
    t.string "start_date"
    t.string "end_date"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "favoris", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "offre_id"
    t.index ["offre_id", "user_id"], name: "index_favoris_on_offre_id_and_user_id", unique: true
    t.index ["offre_id"], name: "index_favoris_on_offre_id"
    t.index ["user_id"], name: "index_favoris_on_user_id"
  end

  create_table "formations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "diplome"
    t.string "description"
    t.string "date_debut"
    t.string "date_fin"
    t.string "ecole"
    t.integer "niveau_etude"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_formations_on_user_id"
  end

  create_table "langues", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "langue_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "offre_id"
    t.uuid "candidature_id"
    t.uuid "receiver_id"
    t.uuid "sender_id"
  end

  create_table "offre_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "offre_id", null: false
    t.uuid "souscategorie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offre_id"], name: "index_offre_categories_on_offre_id"
    t.index ["souscategorie_id", "offre_id"], name: "index_offre_categories_on_souscategorie_id_and_offre_id", unique: true
    t.index ["souscategorie_id"], name: "index_offre_categories_on_souscategorie_id"
  end

  create_table "offres", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "titre_offre"
    t.string "description"
    t.integer "niveau_etude"
    t.integer "experience"
    t.integer "type_contrat"
    t.integer "type_offre"
    t.date "start_date"
    t.integer "duration"
    t.date "end_date"
    t.float "salaire"
    t.boolean "is_payed", default: false
    t.boolean "is_completed", default: false
    t.string "filepath"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.index ["user_id"], name: "index_offres_on_user_id"
  end

  create_table "souscategories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "sous_categorie_name"
    t.uuid "categorie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categorie_id"], name: "index_souscategories_on_categorie_id"
  end

  create_table "user_langues", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "langue_id", null: false
    t.integer "niveau"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["langue_id", "user_id"], name: "index_user_langues_on_langue_id_and_user_id", unique: true
    t.index ["langue_id"], name: "index_user_langues_on_langue_id"
    t.index ["user_id"], name: "index_user_langues_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "lastname"
    t.string "firstname"
    t.string "adress"
    t.integer "role"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string "society_description"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories", "domains"
  add_foreign_key "certifications", "users"
  add_foreign_key "competences", "souscategories", column: "souscategorie_id"
  add_foreign_key "competences", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "favoris", "offres"
  add_foreign_key "favoris", "users"
  add_foreign_key "formations", "users"
  add_foreign_key "offre_categories", "offres"
  add_foreign_key "offre_categories", "souscategories", column: "souscategorie_id"
  add_foreign_key "offres", "users"
  add_foreign_key "souscategories", "categories", column: "categorie_id"
  add_foreign_key "user_langues", "langues"
  add_foreign_key "user_langues", "users"
end
