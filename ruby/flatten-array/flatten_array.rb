module FlattenArray
  def self.flatten(array)
    # array.flatten.reject { |element| element.nil? }
    array.flatten.reject(&:nil?)
  end
end
