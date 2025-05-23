###
### Makefile
###

CC      ?= gcc
CFLAGS  += -I$(INCLUDE)
LDFLAGS += -pthread -lz
TARGET  ?= rng
INSTALL ?= /usr/bin/install -c

INCLUDE = include
SOURCES = src
TOOLS   = tools

CSFILES = $(wildcard $(SOURCES)/*.c)
OBFILES = $(patsubst %.c,%.o,$(CSFILES))

.PHONY: all $(TARGET) clean install uninstall

all: $(TARGET)

$(TARGET): $(CSFILES)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	@cd $(TOOLS) && ./clean.sh

install:
	@cd $(TOOLS) && ./install.sh

uninstall:
	@cd $(TOOLS) && ./uninstall.sh
