CC = g++
SRC = src
include $(SRC)/objlist
OBJS = main.o $(SRCOBJS)

test: $(OBJS)
	$(CC) $(OBJS) -o $@

clean:
	rm -f $(OBJS) test
