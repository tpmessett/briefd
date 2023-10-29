require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  let(:company) { create(:company) }
  let(:user) { create(:user) }
  let(:admin_user) { create(:user, user_type: 'admin', is_admin: true) }
  let(:valid_attributes) { { name: 'Client ABC', compulsory_fields: 'Field Info', notes: 'Some Notes' } }
  let(:invalid_attributes) { { name: nil } }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { company_id: company.id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let!(:client) { create(:client, company: company) }

    it "returns a success response" do
      get :show, params: { id: client.id, company_id: company.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { company_id: company.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new client" do
        expect {
          post :create, params: { client: valid_attributes, company_id: company.id }
        }.to change(Client, :count).by(1)
      end

      it "redirects to the created client" do
        post :create, params: { client: valid_attributes, company_id: company.id }
        expect(response).to redirect_to([company, Client.last])
      end
    end

    context "with invalid attributes" do
      it "does not create a new client" do
        expect {
          post :create, params: { client: invalid_attributes, company_id: company.id }
        }.not_to change(Client, :count)
      end

      it "renders the 'new' template" do
        post :create, params: { client: invalid_attributes, company_id: company.id }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    let!(:client) { create(:client, company: company) }

    it "returns a success response" do
      get :edit, params: { id: client.id, company_id: company.id }
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    let!(:client) { create(:client, company: company) }

    context "with valid attributes" do

      it "updates the client" do
        put :update, params: { id: client.id, client: { "name"=>'Updated Client Name' }, company_id: company.id }
        client.reload
        expect(client.name).to eq('Updated Client Name')
      end

      it "redirects to the client" do
        put :update, params: { id: client.id, client: { "name"=>'Updated Client Name' }, company_id: company.id }
        expect(response).to redirect_to([company, client])
      end
    end

    context "with invalid attributes" do
      it "does not update the client" do
        put :update, params: { id: client.id, client: invalid_attributes, company_id: company.id }
        client.reload
        expect(client.name).not_to eq(nil)
      end

      it "renders the 'edit' template" do
        put :update, params: { id: client.id, client: invalid_attributes, company_id: company.id }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:client) { create(:client, company: company) }

    context "as admin user" do
      before do
        sign_in admin_user
      end

      it "deletes the client" do
        expect {
          delete :destroy, params: { id: client.id, company_id: company.id }
        }.to change(Client, :count).by(-1)
      end

      it "redirects to the clients list" do
        delete :destroy, params: { id: client.id, company_id: company.id }
        expect(response).to redirect_to(company_clients_url(company))
      end
    end

    context "as non-admin user" do
      it "does not delete the client" do
        expect {
          delete :destroy, params: { id: client.id, company_id: company.id }
        }.not_to change(Client, :count)
      end

      it "redirects to companies_url with an unauthorized message" do
        delete :destroy, params: { id: client.id, company_id: company.id }
        expect(response).to redirect_to(companies_url)
      end
    end
  end
end
