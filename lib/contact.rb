class Contact < ActiveRecord::Base
  has_many(:users)

  #   validates(:address_line1, {:presence => true})
  #   validates(:address_line2, {:presence => true})
  #   validates(:city, {:presence => true})
  #   validates(:zipcode, {:presence => true})
  #   validates(:state, {:presence => true})
end
