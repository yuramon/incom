class User < ApplicationRecord
  has_many :group_messages, class_name: 'Group::Message'
  has_and_belongs_to_many :group_conversations, class_name: 'Group::Conversation'
  has_many :private_messages, class_name: 'Private::Message'
  has_many :private_conversations,
            foreign_key: :sender_id,
            class_name: 'Private::Conversation'
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
