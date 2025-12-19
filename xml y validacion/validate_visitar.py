from lxml import etree
import sys

xml_file = "visitas.xml"
xsd_file = "visitas.xsd"

xml = etree.parse(xml_file)
with open(xsd_file, 'rb') as f:
    schema_doc = etree.XML(f.read())
schema = etree.XMLSchema(schema_doc)

is_valid = schema.validate(xml)
if is_valid:
    print(f"OK: '{xml_file}' valida contra '{xsd_file}'.")
else:
    print("ERRORES de validación:")
    for e in schema.error_log:
        print(f"- Line {e.line}: {e.message}")
    sys.exit(1)

# py -m pip install --user lxml
# py .\validate_visitas.py
