# �� �������� � 10 ��� ���� �� ����� ���� � ���. ����� ����� ���� 2.530 � �.�.
# Se	AgI	0.2530
# Se	AgI	0.2530	
# Se	AgIII	0.2779	
# Se	AgIII	0.2889
# Se	AgIII	0.2923
# Se	AgI	0.2986	
# Se	AgII	0.3065	
# Se	AgII	0.3068

require "./atom.rb"
require "./symmetry.rb"
require "./symmetry_operation.rb"
require "./cell_parameters.rb"
require "./atom_multiply.rb"
require "./distances.rb"


atoms = [Atom.new("Se", "Se", 0.202, 0.275, 0.522),
          Atom.new("Ag1", "Ag", 0.379, 0.225, 0.022),
          Atom.new("Ag2", "Ag", 0.122, 0.5, 0.0),
          Atom.new("Ag3", "Ag", 0.107, 0.0, 0.0)]

symmetry = Symmetry.new("P222(1)", 17, [
    SymmetryOperation.new('x', 'y', 'z'),
    SymmetryOperation.new('1-x', '1-y', '0.5+z'),
    SymmetryOperation.new('1-x', 'y', '0.5-z'),
    SymmetryOperation.new('x', '1-y', '1-z')
])

cell_parameters = CellParameters.new(0.705, 0.785, 0.433, 90, 90, 90)

atoms_27 = AtomMultiply.generate(atoms, symmetry)

puts "atoms_27.size = #{atoms_27.size}"

distances = Distances.new(atoms, atoms_27, cell_parameters)
distances.generate
grouped_distances = distances.group

puts "grouped_distances.size = #{grouped_distances.size}"
puts grouped_distances.sort {|a1, a2| a1[:distance] <=> a2[:distance] }.first(20)