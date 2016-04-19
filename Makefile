COUNT_SCRIPT=wordcount.py
TXT_FILES=$(wildcard books/*.txt)
DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))

analysis.zip : $(DAT_FILES) $(COUNT_SCRIPT)
	zip $@ $^
# 	zip analysis.zip isles.dat abyss.dat last.dat

.PHONY : dats
dats : $(DAT_FILES)

.PHONY : variables
variables : 
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)


# count words
%.dat : books/%.txt $(COUNT_SCRIPT)
	python $(COUNT_SCRIPT) $< $*.dat


.PHONY : clean
clean : 
	rm -f $(DAT_FILES) 
	rm -f analysis.zip
