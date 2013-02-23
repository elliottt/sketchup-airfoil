require 'sketchup'

extension = SketchupExtension.new("Airfoil Importer", "airfoil/importer.rb")
extension.description = "Importer for the UIUC Airfoil format"
extension.creator     = "Trevor Elliott"
extension.copyright   = "2013, Trevor Elliott"

Sketchup.register_extension(extension, true)
