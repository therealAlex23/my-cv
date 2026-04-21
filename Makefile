.PHONY: examples

CC = xelatex
RESUME_DIR = resume
COVER_DIR = coverletter
CV_DIR = cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex' ! -name 'resume.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex' ! -name 'cv.tex')
CV_DEST ?= CV.pdf

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume: $(RESUME_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(RESUME_DIR) $<

cv: $(CV_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(CV_DIR) $<

updatecv:
	cp $(CV_DIR)/cv.pdf	$(CV_DEST)

coverletter: $(COVER_DIR)/coverletter.tex
	$(CC) -output-directory=$(COVER_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf $(EXAMPLES_DIR)/*.aux $(EXAMPLES_DIR)/*.log
