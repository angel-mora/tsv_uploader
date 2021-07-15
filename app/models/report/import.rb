class Report::Import
  include ActiveModel::Model

  attr_accessor :file, :imported_count

  def process!
    @imported_count = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      report = Report.asign_from_row(row)
      if report.save
        @imported_count += 1
      else
        errors.add(:base, "Line #{$.} - #{report.errors.full_messages.join(',')}")
      end
    end
    counter
  end

  def save
    process!
    errors.none?
  end
end
