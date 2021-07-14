require 'csv'

namespace :import_from_tsv do
  desc 'Import tsv/csv file'
  task reports: :environment do
    #byebug
    filename = File.join(Rails.root, 'lib', 'assets', 'example.tsv')
    CSV.foreach(filename, { col_sep: '\t', headers: true }) do |row|
      p row
    end
  end
end
