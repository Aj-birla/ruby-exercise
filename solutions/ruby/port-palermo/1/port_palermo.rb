module Port
  # TODO: define the 'IDENTIFIER' constant
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city.slice(0, 4).upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    sliced_str = ship_identifier.slice(0, 3)
    if ["OIL", "GAS"].include?(sliced_str)
      :A
    else
      :B
    end
  end
end
