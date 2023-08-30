# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                              :bigint           not null, primary key
#  email                           :string           not null
#  encrypted_password              :string           not null
#  reset_password_token            :string
#  reset_password_sent_at          :datetime
#  remember_created_at             :datetime
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  authentication_token            :text
#  authentication_token_created_at :datetime
#
class User < ApplicationRecord
  include Graphqll::Interface

  before_save :ensure_authentication_token

  devise :database_authenticatable, :token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
