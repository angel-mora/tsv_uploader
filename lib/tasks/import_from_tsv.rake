namespace :import_from_tsv do
  desc 'Import tsv/csv file'
  task reports: :environment do
    filename = File.join(Rails.root, 'lib', 'assets', 'example.tsv')
    CSV.foreach(filename, { col_sep: '\t', headers: true, header_converters: :symbol }) do |row|
      p row
    end
  end
end
