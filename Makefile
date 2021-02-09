all: build clean run

build:
	latexmk -xelatex \
	-synctex=1 main.tex
	
run:
	# Я использую evince для просмотра PDF
	evince main.pdf &
	
clean:
	rm -f *.aux \
	*.fdb_latexmk \
	*.fls \
	*.log \
	*.out \
	*.synctex.gz \
	*.toc \
	*.xdv
