require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'import' do
    before :each do
      @file = fixture_file_upload('example.tsv', 'csv')
    end

    context 'when file is provided' do
      it 'imports products' do
        Report.import(@file)
        expect(Report.find_by(part_number: '0121G00047P').description)
          .to eq 'GALV x FAB x .026 x 29.88 x 17.56'
      end
    end
  end
end
