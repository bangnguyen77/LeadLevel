class User < ActiveRecord::Base
  has_many(:results)
  has_and_belongs_to_many(:places)
  belongs_to(:contact)

#   validates(:first_name, {:presence => true})
#   validates(:last_name, {:presence => true})
  validates(:user_name, {:presence => true})
  validates(:password, {:presence => true})

  validates_uniqueness_of :user_name

  # has_secure_password

  

  before_save(:capitalize_name)

private
  define_method(:capitalize_name) do
    if !self.first_name.nil?()
      self.first_name=(first_name().capitalize())
    end
    if !self.last_name.nil?()
      self.last_name=(last_name().capitalize())
    end
  end

end
