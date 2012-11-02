class Statement < ActiveRecord::Base
  has_many :versions

  ATTRIBUTES = %w[name planned_date price]

  attr_accessible *ATTRIBUTES
  after_save :create_version

  validates_presence_of :name

  def destroy
    update_column :deleted_at, Time.current
  end

  def self.present(date = nil)
    if date
      where{(deleted_at == nil) | (deleted_at > date)}
    else
      where{deleted_at == nil}
    end
  end

  def self.for_date(date)
    return present unless date.present?
    date = Time.zone.parse(date)

    statements = present(date).where{created_at <= date}.includes(:versions)

    statements.each do |statement|
      versions      = statement.versions.sort_by(&:created_at).reverse
      last_version  = versions.find { |v| v.created_at <= date }

      if last_version
        statement.attributes = last_version.attributes.slice(*Statement::ATTRIBUTES)
      end
    end

    statements
  end

  private

  def version_changed?
    last = versions.order("created_at").last or return true
    attributes.slice(*ATTRIBUTES) != last.attributes.slice(*ATTRIBUTES)
  end

  def create_version
    versions.create!(attributes.slice(*ATTRIBUTES)) if version_changed?
  end
end
