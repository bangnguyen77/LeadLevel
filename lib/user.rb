class User < ActiveRecord::Base
  has_many(:results)
  has_and_belongs_to_many(:places)
  belongs_to(:contact)

  validates(:first_name, {:presence => true})
  validates(:last_name, {:presence => true})
  validates(:user_name, {:presence => true})
  validates(:password, {:presence => true})
  validates(:confirmation_password, {:presence => true})
  validates(:address_line1, {:presence => true})
  validates(:address_line2, {:presence => true})
  validates(:city, {:presence => true})
  validates(:zipcode, {:presence => true})
  validates(:state, {:presence => true})


  before_save(:capitalize_name)

private
  define_method(:capitalize_name) do
    self.name=(name().capitalize())
  end

end
