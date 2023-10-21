require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  # For authentication, you might need to adjust this depending on your authentication setup.
  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }
  let!(:company) { create(:company) } # This company will be edited.

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new company' do
        expect {
          post :create, params: { company: attributes_for(:company) }
        }.to change(Company, :count).by(1)
      end
    end

    # Add more contexts for invalid attributes, etc.
  end

  describe 'DELETE #destroy' do
    let!(:company) { create(:company) }

    context 'as an admin user' do
      before { sign_in admin }

      it 'deletes the company' do
        expect {
          delete :destroy, params: { id: company.id }
        }.to change(Company, :count).by(-1)
      end
    end

    context 'as a non-admin user' do
      it 'does not delete the company' do
        expect {
          delete :destroy, params: { id: company.id }
        }.not_to change(Company, :count)
      end
    end
  end

  describe 'PUT /companies/:id' do
    before do
      sign_in user
    end

    context 'with valid attributes' do
      let(:valid_attributes) { { company: { name: 'Updated Company Name', plan: 'Updated Plan' } } }

      it 'updates the company and redirects to the company page' do
        put company_path(company), params: valid_attributes
        company.reload # Refresh the company attributes from the database

        expect(response).to redirect_to(company)
        expect(company.name).to eq('Updated Company Name')
        expect(company.plan).to eq('Updated Plan')
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { company: { name: '' } } } # Empty name as an example of invalid data

      it 'does not update the company' do
        expect {
          put company_path(company), params: invalid_attributes
        }.not_to change { company.reload.name } # The company name should not change
        expect(response.body).to include("Name can't be blank") # Assuming this validation error message.
      end
    end
  end
end
