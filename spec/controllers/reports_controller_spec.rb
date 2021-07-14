require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe 'POST #import' do
    it 'redirects to the home page' do
      allow(User).to receive(:import).with('foo.txt')
      post :import, file: 'foo.txt'
      expect(response).to redirect_to root_url
    end

    it 'adds a flash notice' do
      allow(User).to receive(:import).with('foo.txt')
      post :import, file: 'foo.txt'
      expect(flash[:notice]).to eq 'Report was successfully imported.'
    end

    it 'imports the User file' do
      expect(User).to receive(:import).with('foo.txt')
      post :import, file: 'foo.txt'
    end
  end
end
