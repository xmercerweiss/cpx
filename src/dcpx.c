#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "utils.h"
#include "io.h"


static char inp_path[FPATH_SIZE];
static char out_path[FPATH_SIZE];


int main(int argc, char** argv) {
	if (argc < 2 || argc > 3) {
		ERROR("Usage: dcpx <input.cpx> [output.txt]");
	}
	strncpy(inp_path, argv[1], FPATH_SIZE);
	if (argc == 2) {
		snprintf(out_path, FPATH_SIZE, "%s.%s", inp_path, DCPX_EXT);
	}
	else {
		strncpy(out_path, argv[2], FPATH_SIZE);
	}

	exit(0);
}

