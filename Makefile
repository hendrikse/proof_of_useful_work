#################################################################
# I'm the Makefile: CHANGE ME IF YOU DARE... 
#################################################################
# Hier koennen gerne Aenderungen angebracht werden (wenn man
# 'make' beherrscht!). Die Datei dient gleichzeitig
# als Beispiel fuer die meisten Befehle, die nuetzlich sind.
#################################################################
# 'make' ohne Parameter laesst 'latex' einmal laufen.
#################################################################

FILE	= template

$(FILE):
	latex $(FILE)

bib:
	bibtex $(FILE)

all:
	latex $(FILE)
	-bibtex $(FILE)
	latex $(FILE)
	latex $(FILE)

ps: 	all
	dvips -K -t a4 -o $(FILE).ps $(FILE).dvi

pdf: 	all
	dvipdfm $(FILE).dvi	

gv:     ps
	ghostview $(FILE).ps &

clean: 
	echo "Removing: *.aux *.log *.blg *.bbl *.dvi"
	rm -f *.aux *.log *.blg *.bbl *.dvi *.out
