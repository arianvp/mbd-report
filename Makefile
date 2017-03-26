# Latex is a magical creature. it might be wrong about report.pdf
# needing an update. hence phony
.PHONY: report.pdf install clean

report.pdf:
	latexmk ${src}/report.tex  -use-make -pdf
install:
	mkdir -p ${out}
	mv report.pdf ${out}/report.pdf
clean:
	latexmk -CA
