BOARDCPPSRC =  $(BOARD_DIR)/board_configuration.cpp \
    $(BOARD_DIR)/firmware/pinouts.cpp \
    $(BOARD_DIR)/default_tune.cpp \


BOARDINC += $(BOARD_DIR)/generated/controllers/generated

# defines SHORT_BOARD_NAME
include $(BOARD_DIR)/meta-info.env
include $(PROJECT_DIR)/hw_layer/ports/stm32/2mb_flash.mk

# reduce memory usage monitoring
DDEFS += -DRAM_UNUSED_SIZE=100

# assign critical LED to a non-existent pin
DDEFS += -DLED_CRITICAL_ERROR_BRAIN_PIN=Gpio::I15

DDEFS += -DCH_CFG_USE_DYNAMIC=TRUE

# we do not have much Lua RAM, let's drop some fancy functions
# DDEFS += -DWITH_LUA_CONSUMPTION=FALSE
# DDEFS += -DWITH_LUA_PID=FALSE
# DDEFS += -DWITH_LUA_STOP_ENGINE=FALSE
