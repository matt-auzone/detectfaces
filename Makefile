OBJS := detectfaces.o
LIBS := -lvaal

%.o : %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) 

detectfaces: $(OBJS)
	dpkg -L libvaal
	$(CC) -o $@ $^ $(LDFLAGS) $(LIBS)


install: detectfaces
	mkdir -p $(WORKDIR)
	cp detectfaces $(WORKDIR)/


clean:
	rm -f *.o
	rm -f detectfaces
