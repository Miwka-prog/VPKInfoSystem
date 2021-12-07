require 'rails_helper'
require 'support/spec_test_helper'

RSpec.describe '/enterprises', type: :request do
  include SpecTestHelper
  let!(:user) { create(:user) }
  let(:valid_attributes) do
    {
      title: 'Title',
      description: 'Description',
      headquaters: 'Ukraine',
      user: user
    }
  end

  let(:invalid_attributes) do
    {
      title: '',
      description: '',
      headquaters: ''
    }
  end

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Enterprise.create! valid_attributes
      get enterprises_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      enterprise = Enterprise.create! valid_attributes
      get enterprise_url(enterprise)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_enterprise_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      enterprise = Enterprise.create! valid_attributes
      get edit_enterprise_url(enterprise)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Enterprise' do
        expect do
          post enterprises_url, params: { enterprise: valid_attributes }
        end.to change(Enterprise, :count).by(1)
      end

      it 'redirects to the created enterprise' do
        post enterprises_url, params: { enterprise: valid_attributes }
        expect(response).to redirect_to(enterprise_url(Enterprise.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Enterprise' do
        expect do
          post enterprises_url, params: { enterprise: invalid_attributes }
        end.to change(Enterprise, :count).by(0)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          title: 'New Title',
          description: 'New Description',
          headquaters: 'New Ukraine',
          user: user
        }
      end

      it 'updates the requested enterprise' do
        enterprise = Enterprise.create! valid_attributes
        patch enterprise_url(enterprise), params: { enterprise: new_attributes }
        enterprise.reload
        expect(enterprise.title).to eq new_attributes[:title]
      end

      it 'redirects to the enterprise' do
        enterprise = Enterprise.create! valid_attributes
        patch enterprise_url(enterprise), params: { enterprise: new_attributes }
        enterprise.reload
        expect(response).to redirect_to(enterprise_url(enterprise))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested enterprise' do
      enterprise = Enterprise.create! valid_attributes
      expect do
        delete enterprise_url(enterprise)
      end.to change(Enterprise, :count).by(-1)
    end

    it 'redirects to the enterprises list' do
      enterprise = Enterprise.create! valid_attributes
      delete enterprise_url(enterprise)
      expect(response).to redirect_to(enterprises_url)
    end
  end
end
