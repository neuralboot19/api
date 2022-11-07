class Customer < User
  include Closeable

  validates :first_name, :last_name, presence: true

  enum status: [:approved, :declined, :banned, :closed]
end
