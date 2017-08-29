#include "timer_test.h"
#include "plasma.h"
#include "uart.h"

#define MY_ADDR     2

int main(int argc, char const *argv[]) {

    setup_uart(CPU_SPEED, UART_BAUDRATE);
    uart_puts("Node started");
}
