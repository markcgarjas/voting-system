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

ActiveRecord::Schema[7.0].define(version: 2024_12_11_023921) do
  create_table 'candidates', charset: 'utf8mb4', force: :cascade do |t|
    t.bigint 'officer_position_id'
    t.bigint 'party_list_id'
    t.bigint 'election_id'
    t.string 'serial_number'
    t.string 'name'
    t.string 'section'
    t.string 'course'
    t.string 'label'
    t.integer 'votes', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['election_id'], name: 'index_candidates_on_election_id'
    t.index ['officer_position_id'], name: 'index_candidates_on_officer_position_id'
    t.index ['party_list_id'], name: 'index_candidates_on_party_list_id'
  end

  create_table 'elections', charset: 'utf8mb4', force: :cascade do |t|
    t.bigint 'organization_id'
    t.bigint 'user_id'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['organization_id'], name: 'index_elections_on_organization_id'
    t.index ['user_id'], name: 'index_elections_on_user_id'
  end

  create_table 'members', charset: 'utf8mb4', force: :cascade do |t|
    t.bigint 'organization_id'
    t.bigint 'user_id'
    t.integer 'role', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'officer_position_id'
    t.index ['officer_position_id'], name: 'index_members_on_officer_position_id'
    t.index ['organization_id'], name: 'index_members_on_organization_id'
    t.index ['user_id'], name: 'index_members_on_user_id'
  end

  create_table 'officer_positions', charset: 'utf8mb4', force: :cascade do |t|
    t.string 'name'
    t.integer 'sort'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'organizations', charset: 'utf8mb4', force: :cascade do |t|
    t.string 'name'
    t.string 'code'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'party_lists', charset: 'utf8mb4', force: :cascade do |t|
    t.bigint 'organization_id'
    t.string 'name'
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['organization_id'], name: 'index_party_lists_on_organization_id'
  end

  create_table 'users', charset: 'utf8mb4', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'first_name'
    t.string 'middle_name'
    t.string 'last_name'
    t.string 'phone_number'
    t.string 'username'
    t.integer 'role', default: 0
    t.string 'address'
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'session_token'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'candidates', 'elections'
  add_foreign_key 'candidates', 'officer_positions'
  add_foreign_key 'candidates', 'party_lists'
end
