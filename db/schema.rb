# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_240_312_182_936) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'answers', force: :cascade do |t|
    t.string 'complete_answer', null: false
    t.string 'tag'
    t.string 'title', null: false
    t.string 'short_answer'
    t.bigint 'question_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'area_of_knowledges', force: :cascade do |t|
    t.string 'subject', null: false
    t.string 'area_name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'institutions', force: :cascade do |t|
    t.string 'name', null: false
    t.jsonb 'image_data'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[name user_id], name: 'index_institutions_on_name_and_user_id', unique: true
    t.index ['user_id'], name: 'index_institutions_on_user_id'
  end

  create_table 'permissions', force: :cascade do |t|
    t.string 'permission_name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'questions', force: :cascade do |t|
    t.text 'complete_question', null: false
    t.string 'tag'
    t.string 'title', null: false
    t.bigint 'area_of_knowledge_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['area_of_knowledge_id'], name: 'index_questions_on_area_of_knowledge_id'
  end

  create_table 'user_permissions', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'permission_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['permission_id'], name: 'index_user_permissions_on_permission_id'
    t.index ['user_id'], name: 'index_user_permissions_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'encrypted_password', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.text 'authentication_token'
    t.datetime 'authentication_token_created_at'
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.index ['authentication_token'], name: 'index_users_on_authentication_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'answers', 'questions'
  add_foreign_key 'questions', 'area_of_knowledges'
  add_foreign_key 'user_permissions', 'permissions'
  add_foreign_key 'user_permissions', 'users'
end
