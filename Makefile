all : practical7.Rmd
	R -e 'rmarkdown::render("practical7.Rmd", "rmarkdown::md_document", "practical7.md")'
	cp *.png docs/.
	pandoc practical7.md -o docs/practical7.html
