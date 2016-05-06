ALL = http://api.brain-map.org/api/v2/data/query.xml?criteria=model::Specimen,rma::criteria,[is_cell_specimen$$eq'true'],products[name$$eq'Mouse Cell Types'],rma::include,structure,donor(transgenic_lines),specimen_tags,cell_soma_locations,rma::options[num_rows$$eqall]

allen-cell.xml:
	wget $(ALL) -O $@

structs.txt:
	grep acronym allen-cell.xml  | sort -u | perl -npe 's@.*>(\S+)<.*@$1@'

cell-types.dump:
	python list_cells.py  > $@
