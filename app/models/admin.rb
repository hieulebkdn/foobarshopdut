class Admin < ApplicationRecord
	attr_accessor :remember_token
	# has_many :Product, dependent: :destroy

	validates :name, presence: true, length: { maximum: 80 }
	VALID_PHONE_REGEX = /\A[0]{1}[19]{1}[0-9]{8,9}\z/
	validates :phone, presence: true, length: { maximum: 15 }, format: { with: VALID_PHONE_REGEX }, uniqueness: { case_sensitive: false }

	validates :company, presence: true, length: { maximum: 50 }

	validates :address, presence: true

	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":styles/admin.gif"
		validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	# Returns the hash digest of the given string.
	def Admin.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST
		:
		BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def Admin.new_token
		SecureRandom.urlsafe_base64
	end

	# Remembers a user in the database for use in persistent sessions.
	def remember
		self.remember_token = Admin.new_token
		update_attribute(:remember_digest, Admin.digest(remember_token))
	end
	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

end
