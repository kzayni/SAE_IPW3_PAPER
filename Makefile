MAIN := sae_paper
LATEXMK ?= latexmk
LATEXFLAGS ?= -pdf -interaction=nonstopmode -halt-on-error -file-line-error -synctex=1

.DEFAULT_GOAL := all
.PHONY: all clean distclean

# latexmk gere les dependances, la bibliographie et les passes necessaires.
all:
	$(LATEXMK) $(LATEXFLAGS) $(MAIN).tex
	$(MAKE) clean

# Nettoyage apres compilation reussie ; conserve le PDF.
clean:
	$(LATEXMK) -c $(MAIN).tex
	$(RM) $(MAIN).bbl $(MAIN).loc $(MAIN).soc $(MAIN).synctex.gz

# Supprime aussi le PDF courant.
distclean: clean
	$(RM) $(MAIN).pdf
