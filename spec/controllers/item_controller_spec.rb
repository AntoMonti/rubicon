require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let!(:items) { create_list :item, 10 }

  context 'GET #index' do
    before { get :index }
    it 'returns fakers items' do
      is_expected.to render_template :index
      expect(assigns(:items)).to match_array items
    end
  end
end
