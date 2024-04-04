require 'csv'

class CSVFileReader
  def self.read_csv(filename)
    CSV.read(filename, headers: true)
  end

  def self.find_by(attribute, value)
    filename = "#{name.downcase}s.csv"
    data = read_csv(filename)
    row = data.find { |row| row[attribute.to_s] == value.to_s }
    return nil unless row

    obj = new
    obj.set_attributes(row.to_h)
    obj
  end

  def set_attributes(attributes)
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
      define_singleton_method(key) { instance_variable_get("@#{key}") }
      define_singleton_method("#{key}=") { |val| instance_variable_set("@#{key}", val) }
    end
  end

  def self.inherited(subclass)
    subclass.class_eval do
      create_accessors_from_headers
    end
  end

  def self.create_accessors_from_headers
    headers = read_csv("#{name.downcase}s.csv").headers
    headers.each do |header|
      attr_accessor header.downcase.gsub(/\s/, '_').to_sym
    end
  end
end



