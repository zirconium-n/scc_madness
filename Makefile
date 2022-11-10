#
# Created by:   github.com/johnstef99
# Last updated: 2022-11-10
#

SRC_DIR  = ./src
OBJ_DIR  = ./obj
LIB_DIR  = ./libs

CC       = clang
CFILES   = $(wildcard $(SRC_DIR)/*.c)
LIBFILES   = $(wildcard $(LIB_DIR)/*.c)
OBJFILES = $(CFILES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o) $(LIBFILES:$(LIB_DIR)/%.c=$(OBJ_DIR)/%.o)
OUT      = ./bin/scc

CFLAGS = -Wall

$(OUT): $(OBJFILES)
	$(CC) -o $@ $^ 

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -g -c -o $@ $<

$(OBJ_DIR)/%.o: $(LIB_DIR)/%.c
	$(CC) $(CFLAGS) -g -c -o $@ $<

.PHONY: clean test run
run:
	./bin/scc assets

clean:
	rm -f $(OBJFILES) $(OUT)

test:
	echo $(OBJFILES)
