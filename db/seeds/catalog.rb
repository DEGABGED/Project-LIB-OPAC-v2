require 'csv'

u = User.first
catalog = File.read(Rails.root.join('db', 'seeds', 'catalog.csv'))
csv = CSV.parse(catalog, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  b = Book.create!(row.to_hash.merge({last_editor: u.id}))
end
