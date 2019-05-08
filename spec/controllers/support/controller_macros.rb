module ControllerMacros
  def login_admin(admin)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in admin
  end

  def login_user(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user.confirm!
    sign_in user
  end
end


# module ControllerMacros
#   def login_admin
#     before(:each) do
#       @request.env["devise.mapping"] = Devise.mappings[:admin]
#       admin = FactoryBot.create(:admin)
#       # sign_in(scope, resource) if admin is nested in user at factory.
#       sign_in :user, admin
#     end
#   end

#   def login_user
#     before(:each) do
#       @request.env["devise.mapping"] = Devise.mappings[:user]
#       user = FactoryBot.create(:user)
#       sign_in user
#     end
#   end
# end
