class Symmetry
  attr_accessor :space_group_number,
                :space_group_name,
                :symetry_operations

  def initialize(space_group_name, space_group_number, symetry_operations = [])
    @space_group_name   = space_group_name
    @space_group_number = space_group_number
    @symetry_operations = symetry_operations
  end
end

