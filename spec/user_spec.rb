require('spec_helper')


describe(User) do

  describe('#contact') do
    it("belongs to a contact") do
      test_contact = Contact.create({:email_address => "Molly@gmail.com"})
      test_user = User.create({:first_name => "Molly", :last_name => "idk", :user_name => "mollymollymolly", :password => "string", :contact_id => test_contact.id()})
      expect(test_user.contact()).to(eq(test_contact))
    end
  end

  describe("#result") do
    it("has many results") do
      test_place = Place.create({:city => "Portland"})
      test_user = User.create({:first_name => "Molly", :last_name => "molly", :user_name => "matt", :password => "string"})
      test_result = Result.create({:place_id => test_place.id(), :user_id => test_user.id()})
      expect(test_user.results()).to(eq([test_result]))
    end
  end

  describe("#place") do
    it("has many places") do
      test_user = User.create({:first_name => "Molly"})
      test_place = Place.create({:city => ["Portland"]})
      test_user.places.push(test_place)
      expect(test_user.places()).to(eq([test_place]))
      expect(test_user.first_name()).to(eq("Molly"))
    end
  end



  # it("validates the presence of the first name") do
  #   test_first_name = User.new({:first_name => ""})
  #   expect(test_first_name.save()).to(eq(false))
  # end

  # it("validates the presence of the last name") do
  #   test_last_name = User.new({:last_name => ""})
  #   expect(test_last_name.save()).to(eq(false))
  # end

  it("validates the presence of the password") do
    test_password = User.new({:user_name => "bang", :password => nil})
    expect(test_password.save()).to(eq(false))
  end

  it("validates the presence of a username") do
    test_user = User.new({:user_name => nil, :password => "matt"})
    expect(test_user.save()).to(eq(false))
  end

  it("saves if you have an user name and password") do
    test_user = User.new({:user_name => "bole", :password => "password"})
    expect(test_user.save()).to(eq(true))
  end

  it("will not save if you enter in an user name thats already taken") do
    test_user = User.create({:user_name => "bole", :password => "password"})
    test_user1 = User.new({:user_name => "bole", :password => "123456"})
    expect(test_user1.save()).to(eq(false))
  end

  # it("validates the passwords are matched") do
  #   test_password = User.new({:password => "string", :password_confirmation => "string"})
  #   expect(confirm_password.save()).to(eq(test_password))
  # end

  # it("validates the presence of the address_line1") do
  #   test_address_line1 = User.new({:address_line1 => ""})
  #   expect(test_address_line1.save()).to(eq(false))
  # end
  #
  # it("validates the presence of the address_line2") do
  #   test_address_line1 = User.new({:address_line2 => ""})
  #   expect(test_address_line2.save()).to(eq(false))
  # end
  #
  # it("validates the presence of the city") do
  #   test_city = User.new({:city => ""})
  #   expect(test_city.save()).to(eq(false))
  # end
  #
  # it("validates the presence of the zipcode") do
  #   test_zipcode = User.new({:zipcode => ""})
  #   expect(test_zipcode.save()).to(eq(false))
  # end
  #
  # it("validates the presence of the state") do
  #   test_state = User.new({:state => ""})
  #   expect(test_state.save()).to(eq(false))
  # end
end
