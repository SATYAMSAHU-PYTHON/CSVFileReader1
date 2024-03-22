require 'csv'

class CSVFileReader
    attr_reader :data

  def initialize(file_path)
    @file_path = file_path
    @data = read_csv(file_path)
    define_accessors
  end

  def self.read(file_path, &block)
    data = CSV.read(file_path, headers: true)
    data.each(&block) if block_given?
  end

  def read_csv(file_path)
    CSV.read(file_path, headers: true)
  end

  def self.find_by(file_path, attribute, value)
    data = CSV.read(file_path, headers: true)
    data.find { |row| row[attribute.to_s] == value }
  end
  # def define_accessors
  #   headers = @data.headers.map(&:downcase)

  #   headers.each do |header|
  #     define_singleton_method("#{header}=") do |value|
  #       @data[header] = value
  #     end

  #     define_singleton_method(header) do
  #       @data[header]
  #     end
  #   end
  # end
  


  def define_accessors
    headers = @data.headers.map(&:downcase)

    headers.each do |header|
      define_singleton_method("#{header}=") do |value|
        @data[header] = value
      end

      define_singleton_method(header) do
        @data[header]
      end
    end
  end

end
