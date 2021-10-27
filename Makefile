all : practical7.Rmd
	R -e 'rmarkdown::render("practical7.Rmd", "rmarkdown::md_document", "practical7.md", clean=FALSE)'
	pandoc practical7.knit.md -o docs/practical7.html
