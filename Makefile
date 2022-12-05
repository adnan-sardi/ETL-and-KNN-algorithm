CC=g++
INCLUDE_DIR := $(LTNDS_EXAM_ROOT)/include
SRC := $(LTNDS_EXAM_ROOT)/src
CFLAGS := -std=c++11 -g
CXXFLAGS = -Wall -W -pedantic
LIB_DATA := libdata.so

all : $(LIB_DATA)

$(LIB_DATA) : libdir objdir obj/data_handler.o obj/data.o
	$(CC) $(CFLAGS) $(CXXFLAGS) -o $(LTNDS_EXAM_ROOT)/lib/$(LIB_DATA) obj/*.o
	rm -r $(LTNDS_EXAM_ROOT)/obj

libdir :
	mkdir -p $(LTNDS_EXAM_ROOT)/lib

objdir :
	mkdir -p $(LTNDS_EXAM_ROOT)/obj

obj/data_handler.o : $(SRC)/data_handler.cc
	$(CC) -fPIC $(CFLAGS) $(CXXFLAGS) -o obj/data_handler.o -I$(INCLUDE_DIR) -c $(SRC)/data_handler.cc

obj/data.o : $(SRC)/data.cc
	$(CC) -fPIC $(CFLAGS) $(CXXFLAGS) -o obj/data.o -I$(INCLUDE_DIR) -c $(SRC)/data.cc

clean:
	rm -r $(LTNDS_EXAM_ROOT)/lib
	rm -r $(LTNDS_EXAM_ROOT)/obj