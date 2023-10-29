require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:admin) { create(:user, is_admin: true, user_type: "admin") }

  describe "PATCH #update" do
    context "when user is logged in" do
      before { sign_in user }

      it "updates user attributes" do
        patch :update, params: { id: user.id, user: { first_name: "Jane" } }
        expect(user.reload.first_name).to eq("Jane")
      end

      it "does not allow a standard user to make themselves an admin" do
        patch :update, params: { id: user.id, user: { is_admin: true } }
        expect(user.reload.is_admin?).to be_falsey
      end
    end

    context "when admin is logged in" do
      before { sign_in admin }

      it "allows admin to update other user attributes" do
        patch :update, params: { id: user.id, user: { first_name: "Jane" } }
        expect(user.reload.first_name).to eq("Jane")
      end

      it "allows admin to make another user an admin" do
        patch :update, params: { id: user.id, user: { is_admin: true } }
        expect(user.reload.is_admin?).to be_truthy
      end
    end
  end

  describe "PATCH #set_admin" do
    context "when user is logged in" do
      before { sign_in user }

      it "does not allow a standard user to toggle admin status" do
        patch :set_admin, params: { id: admin.id }
        expect(admin.reload.is_admin?).to be_truthy
      end
    end

    context "when admin is logged in" do
      before { sign_in admin }

      it "allows admin to toggle another user's admin status" do
        patch :set_admin, params: { id: user.id }
        expect(user.reload.is_admin?).to be_truthy
      end
    end
  end

  describe "PATCH #set_user_type" do
    context "when user is logged in" do
      before { sign_in user }

      it "does not allow a standard user to set user_type" do
        patch :set_user_type, params: { id: user.id, type: "admin" }
        expect(user.reload.user_type).not_to eq("admin")
      end
    end

    context "when admin is logged in" do
      before { sign_in admin }

      it "allows admin to set another user's user_type" do
        patch :set_user_type, params: { id: user.id, type: "manager" }
        expect(user.reload.user_type).to eq("manager")
      end
    end
  end
end
