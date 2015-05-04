PDFLATEX := pdflatex
BIBTEX   := bibtex

TARGET   := mt
OUTPUT_DIRECTORY  := tmp

all: pdf
	$(MAKE) -C . pdf
	$(MAKE) -C . bib
	$(MAKE) -C . pdf
	@echo -e "\033[0;33m"
	$(MAKE) -C . pdf
	@echo -e "\033[0m"

pdf: 
	mkdir $(OUTPUT_DIRECTORY) -p
	$(PDFLATEX) -output-directory $(OUTPUT_DIRECTORY) $(TARGET)
	cp $(OUTPUT_DIRECTORY)/$(TARGET).pdf ./

bib:
	mkdir $(OUTPUT_DIRECTORY) -p
	cp *.bib $(OUTPUT_DIRECTORY)/
	@echo -e "\033[0;32m"
	cd $(OUTPUT_DIRECTORY); $(BIBTEX) $(TARGET)
	@echo -e "\033[0m"

clean c:
	$(RM) -rv $(OUTPUT_DIRECTORY)/$(TARGET).bib $(OUTPUT_DIRECTORY)/$(TARGET).log $(OUTPUT_DIRECTORY)/$(TARGET).aux $(OUTPUT_DIRECTORY)/$(TARGET).toc $(OUTPUT_DIRECTORY)/$(TARGET).out $(OUTPUT_DIRECTORY)/$(TARGET).lof $(OUTPUT_DIRECTORY)/$(TARGET).lot $(OUTPUT_DIRECTORY)/$(TARGET).blg

cleanall ca: clean
	$(RM) -rv $(OUTPUT_DIRECTORY)/$(TARGET).pdf $(OUTPUT_DIRECTORY)/$(TARGET).bbl
	$(RM) -rf fig/.done
