
require 'sketchup'

module Airfoil

  class Importer

    def description
      "Airfoil .dat format importer"
    end

    def id
      "awesomelyawesome@gmail.com/dat_importer"
    end

    def file_extension
      "dat"
    end

    def supports_options
      false
    end

    def load_file(path, status)
      verts = []

      model = Sketchup.active_model
      model.start_operation("Import Airfoil", true)

      File.open(path) { |handle|
        handle.each_line { |line|
          if /^\s+-?[0-9]/ =~ line
            vert = line.split
            verts.push [ vert[0].to_f, 0, vert[1].to_f ]
          end
        }
      }

      model.entities.add_curve(verts)
      model.commit_operation

      0
    end

  end # Importer

end # Airfoil

Sketchup.register_importer(Airfoil::Importer.new)
