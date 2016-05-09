PUBDIR:=publish
BINDIR:=bin
MAINLUA:=main.lua
LOVEBINDIR:=$(BINDIR)/love-0.10.1-win64
LOVEEXE:=$(LOVEBINDIR)/love
ILMERGE:=$(BINDIR)/ILMerge

LOVEGAME:=mari0.love
LOVEGAMEEXE:=$(LOVEBINDIR)/mari0.exe
LOVEGAMEEXESTANDALONE:=$(BINDIR)/mari0-standalone.exe

EVERTHING:=$(wildcard *.* */*.* */*/*.* */*/*/*.* */*/*/*/*.*)
EVERTHING:=$(filter-out $(PUBDIR) $(PUBDIR)/% $(BINDIR) $(BINDIR)/% $(MAINLUA) $(LOVEGAME), $(EVERTHING))
EVERTHINGOUT:=$(addprefix $(PUBDIR)/, $(EVERTHING))

all: $(PUBDIR)/$(MAINLUA) $(EVERTHINGOUT) $(LOVEGAME)

clean:
	rm -rf $(LOVEGAME) $(LOVEGAMEEXE) $(LOVEGAMEEXESTANDALONE)
	rm -rf ./$(PUBDIR)/*

run:
	$(LOVEEXE) $(LOVEGAME)

pack: $(LOVEGAMEEXE)
$(LOVEGAMEEXE): $(LOVEGAME)
	cat $(LOVEEXE) $(LOVEGAME) > $(LOVEGAMEEXE)

packstandalone: $(LOVEGAMEEXESTANDALONE)
$(LOVEGAMEEXESTANDALONE): $(LOVEGAMEEXE)
	$(ILMERGE) -t:winexe -log:$(LOVEBINDIR)/love.dll $(LOVEGAMEEXE) -out:$(LOVEGAMEEXESTANDALONE)

$(PUBDIR)/%: %
	mkdir -p $(@D); cp $< $@

$(LOVEGAME): $(EVERTHINGOUT)
	cd $(PUBDIR) && zip -9 -q -r ../$(LOVEGAME) .
