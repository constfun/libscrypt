CFLAGS=-g -O2 -Wall -Wextra -Iscrypt -Iscrypt/lib/crypto -Iscrypt/lib/scryptenc -Iscrypt/lib/util -DNDEBUG -DHAVE_CONFIG_H $(OPTFLAGS)

SOURCES=$(wildcard scrypt/lib/crypto/*.c scrypt/lib/scryptenc/*.c scrypt/lib/util/*.c)
OBJECTS=$(patsubst %.c,%.o,$(SOURCES))

TARGET=libscrypt.a

all: $(TARGET)

$(TARGET): CFLAGS += -fPIC
$(TARGET): $(OBJECTS)
	ar rcs $@ $(OBJECTS)
	ranlib $@

clean:
	rm -rf $(OBJECTS) $(TESTS)
	find . -name "*.gc*" -exec rm {} \;
	rm -rf `find . -name "*.dSYM" -print`
