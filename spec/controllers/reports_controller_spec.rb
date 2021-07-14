require 'spec_helper'

describe ProductsController do
  describe 'POST #import' do
    it 'redirects to the home page' do
      allow(Hotel).to receive(:import).with('foo.txt')
      post :import, file: 'foo.txt'
      expect(response).to redirect_to root_url
    end

    it 'adds a flash notice' do
      allow(Hotel).to receive(:import).with('foo.txt')
      post :import, file: 'foo.txt'
      expect(flash[:notice]).to eq 'Product was successfully imported.'
    end

    it 'imports the hotel file' do
      expect(Hotel).to receive(:import).with('foo.txt')
      post :import, file: 'foo.txt'
    end
  end
end
