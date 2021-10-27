all : practical7.Rmd
	R -e 'rmarkdown::render("practical7.Rmd", "rmarkdown::md_document", "docs/practical7.md")'
	pandoc docs/practical7.md -o docs/practical7.html
