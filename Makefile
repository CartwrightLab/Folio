default: all

all:

.PHONY: default all

MATHY_MD=\
	markov-chains-dtmc.md \
	markov-chains-ctmc.md

all: $(MATHY_MD)

# Convert pandoc markdown to Github Markdown
# Use an R script in case system pandoc is old
%.md : src/%.pandoc.md
	Rscript --vanilla scripts/pandoc-gfm.R $< $@

