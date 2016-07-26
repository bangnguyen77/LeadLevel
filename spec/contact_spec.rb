require('spec_helper')

describe(Contact) do
  describe("#users") do
    it("blah") do
      test_contact = Contact.create({:email_address => "blah@hotmail.com"})
      test_user = User.create({:user_name => "Matt", :first_name => "matt", :last_name => "giem", :password => "string", :contact_id => test_contact.id()})
      expect(test_contact.users()).to(eq([test_user]))
    end
  end
end
