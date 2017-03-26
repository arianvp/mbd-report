#Latex is a magical creature. it might be wrong about report.pdf
# needing an update. hence phony
.PHONY: report.pdf all install clean

src ?= .
out ?= .

report.pdf: 
	latexmk -use-make -pdf -shell-escape 

all:
	report.pdf

install:
	mkdir -p ${out}
	mv report.pdf ${out}/report.pdf

clean:
	latexmk -CA
