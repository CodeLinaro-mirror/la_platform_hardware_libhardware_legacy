LIBNAME=libhardware-legacy-headers.so.0

SRC = uevent.c
#CXXSRC = power.cpp

CFLAGS += -c
CXXFLAGS += -c -std=c++17
CPPFLAGS += -Iinclude
LDFLAGS += -shared -Wl,-soname,$(LIBNAME)

#CXXOBJECTS = $(CXXSRC:.cpp=.o)
COBJECTS = $(SRC:.c=.o)

$(LIBNAME): $(COBJECTS)
	$(CXX) $^ -o $@ $(LDFLAGS)

clean:
	rm -rf *.o *.so

$(CXXOBJECTS): %.o: %.cpp
	$(CXX) $< -o $@ $(CXXFLAGS) $(CPPFLAGS)

$(COBJECTS): %.o: %.c
	$(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
