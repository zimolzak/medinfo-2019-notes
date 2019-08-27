PDFS = Readme.pdf

.PHONY: all clean
all: $(PDFS)

%.pdf: %.md
	pandoc -o $@ $<

clean:
	rm -f $(PDFS)
