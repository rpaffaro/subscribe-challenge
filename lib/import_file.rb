require 'json'

class ImportFile
  def initialize(file_path)
    @file_path = file_path
  end

  def self.execute(file_path = './data/input.json')
    new(file_path).execute
  end

  def execute
    content = File.read(file_path)
    JSON.parse(content, symbolize_names: true)
  end

  private

  attr_reader :file_path
end
