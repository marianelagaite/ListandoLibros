class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, 
	     :recoverable, :rememberable, :trackable

 	has_many :reviews, dependent: :destroy
 	has_many :book_lists, dependent: :destroy

	attr_accessor :login

	validates :user_name, presence: true, length: {maximum: 100}, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "Solo puede contener letras y números." }
	
	def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["user_name = :value OR lower(email) = lower(:value)", { :value => login }]).first
	  else
	    where(conditions).first
	  end
	end
end		
