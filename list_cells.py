import yaml
import pprint
from allensdk.api.queries.cell_types_api import CellTypesApi

pp = pprint.PrettyPrinter(indent=4)

ct = CellTypesApi()

# a list of dictionaries containing metadata for cells with reconstructions
cells = ct.list_cells(require_reconstruction=True)

#print yaml.dump(cells)
pp.pprint(cells)
