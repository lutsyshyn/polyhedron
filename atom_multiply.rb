class AtomMultiply

  def self.generate(atoms, symmetry)

	  multiplied_atoms = []

	  atoms.each do |atom|
	    symmetry.symetry_operations.each do |symmetry_operation|
		    multiplied_atoms << symmetry_operation.multiply_atom(atom)
	    end
	  end

	  atoms_27 = []

	  multiplied_atoms.uniq { |elem| [elem.x, elem.y, elem.z, elem.label] }.each do |atom|
	    [atom.x-1, atom.x, atom.x+1].each do |x|
		    [atom.y-1, atom.y, atom.y+1].each do |y|
		      [atom.z-1, atom.z, atom.z+1].each do |z|
		        atoms_27 << Atom.new(atom.label, atom.type, x, y, z)
          end
        end
	    end
    end

    atoms_27
  end
end
