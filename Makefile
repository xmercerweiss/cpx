
SDIR := src
TDIR := tests
BDIR := build

CPXPATH := $(SDIR)/cpx.c
DCPXPATH := $(SDIR)/dcpx.c
CPXOUTPUT := cpx.bin
DCPXOUTPUT := dcpx.bin
MPATH := $(CPXPATH) $(DCPXPATH)

UPATH := unity/unity.c
TPREF := test_

CC := gcc
CFLAGS := -Iinclude -I.
CFILES := $(filter-out $(MPATH), $(wildcard $(SDIR)/*.c))

all: cpx dcpx

cpx: $(CPXPATH) $(CFILES)
	@mkdir -p $(BDIR)
	$(CC) $(CFLAGS) $^ -o $(BDIR)/$(OUTPUT)

dcpx: $(DCPXPATH) $(CFILES)
	@mkdir -p $(BDIR)
	$(CC) $(CFLAGS) $^ -o $(BDIR)/$(OUTPUT)

test: testcompile
	@for testbin in $(BDIR)/$(TPREF)*.bin; do \
		echo ===$$testbin===; \
		./$$testbin; \
		echo; \
	done

testcompile:
	@mkdir -p $(BDIR)
	@for testfile in $(TDIR)/*; do \
		srcfile="$(SDIR)/$${testfile#$(TDIR)/$(TPREF)}"; \
		if [ -f $$srcfile ]; then \
			stripped="$${srcfile#$(SDIR)/}"; \
			outfile="$(BDIR)/$(TPREF)$${stripped%.c}.bin"; \
			$(CC) $(CFLAGS) $(CFILES) $(UPATH) $$testfile -o $$outfile; \
		fi; \
	done

