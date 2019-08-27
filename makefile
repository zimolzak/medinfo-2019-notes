PDFS = medinfo.pdf

.PHONY: all clean
all: $(PDFS)

%.pdf: %.txt
	pandoc -o $@ $<

clean:
	rm -f $(PDFS)
