class Distances

  def initialize(atoms, atoms_27, cell_parameters)
    @atoms = atoms
    @atoms_27 = atoms_27
    @cell_parameters = cell_parameters
  end

  def generate
    @distances = []

    @atoms.each do |atom1|
      x1 = atom1.x * @cell_parameters.a
      y1 = atom1.y * @cell_parameters.b
      z1 = atom1.z * @cell_parameters.c
      @atoms_27.each do |atom2|
        next if atom1 == atom2
        x2 = atom2.x * @cell_parameters.a
        y2 = atom2.y * @cell_parameters.b
        z2 = atom2.z * @cell_parameters.c

        d = Math.sqrt(
            (x2 - x1)**2 + (y2 - y1)**2 + (z2 - z1)**2 +
                2*(x2 - x1)*(y2 - y1)*Math.cos(@cell_parameters.gamma* Math::PI / 180).round(10) +
                2*(x2 - x1)*(z2 - z1)*Math.cos(@cell_parameters.beta* Math::PI / 180).round(10) +
                2*(y2 - y1)*(z2 - z1)*Math.cos(@cell_parameters.alpha* Math::PI / 180).round(10)
        )
        @distances << {:label1 => atom1.label, :label2 => atom2.label, :distance => d.round(8)}
      end
    end

    @distances.delete_if { |x| x[:distance] > 0.7 }

    @distances
  end

  def group
    generate unless @distances

    grouped_distances = []
    @distances.map { |element| element[:distance] }.uniq.each do |distance|

      array_to_group = @distances.select {|element| element[:distance] == distance}

      grouped_distances += group_by_labels(array_to_group)
    end

    grouped_distances
  end

private

  def group_by_labels(array)
    grouped_array = []
    #TODO: is this #uniq correct?
    array.uniq.each do |element1|
      count = 0
      array.each do |element2|
        if element1 == element2
          count += 1
        end
      end
      grouped_array << element1.merge(:count => count)
    end

    grouped_array
  end

end