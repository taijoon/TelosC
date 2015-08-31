COMPONENT=BlinkAppC

CFLAGS += -I./usci
CFLAGS += -I./timer
CFLAGS += -I./cc2420
CFLAGS += -I./telosc/cc2420

include $(MAKERULES)

