#include "usart.h"
#include "system_config.h"
#include <avr/io.h>

#define BAUD_RATE(baud) ((uint16_t)((F_CPU * 64) / (16 * (baud))))

void usart3_init(void) {
    usart3_init_with_baudrate(USART_BAUDRATE);
}

void usart3_init_with_baudrate(uint32_t baudrate) {
    PORTB.DIRSET = PIN0_bm;
    USART3.BAUD = BAUD_RATE(baudrate);
    USART3.CTRLB = USART_RXEN_bm | USART_TXEN_bm;
    USART3.CTRLC = USART_CHSIZE_8BIT_gc;
}

void usart3_transmit_char(char c) {
    while (!(USART3.STATUS & USART_DREIF_bm));
    USART3.TXDATAL = c;
}

char usart3_receive_char(void) {
    while (!(USART3.STATUS & USART_RXCIF_bm));
    return USART3.RXDATAL;
}

void usart3_transmit_string(const char* str) {
    while (*str) {
        usart3_transmit_char(*str);
        str++;
    }
}

static void int_to_string(int16_t value, char* buffer) {
    uint8_t i = 0;
    uint8_t is_negative = 0;
    
    if (value < 0) {
        is_negative = 1;
        value = -value;
    }
    
    char temp[10];
    uint8_t temp_i = 0;
    
    do {
        temp[temp_i++] = '0' + (value % 10);
        value /= 10;
    } while (value > 0);
    
    if (is_negative) {
        buffer[i++] = '-';
    }
    
    while (temp_i > 0) {
        buffer[i++] = temp[--temp_i];
    }
    
    buffer[i] = '\0';
}

void usart3_send_temperature_celsius(float temperature) {
    int16_t temp_int = (int16_t)temperature;
    int16_t temp_decimal = (int16_t)((temperature - temp_int) * 10);
    
    if (temp_decimal < 0) temp_decimal = -temp_decimal;
    
    char buffer[8];
    int_to_string(temp_int, buffer);
    usart3_transmit_string(buffer);
    usart3_transmit_char('.');
    usart3_transmit_char('0' + temp_decimal);
    usart3_transmit_string("C\r\n");
}

void usart3_send_temperature_formatted(int16_t temperature_tenths) {
    int16_t whole = temperature_tenths / 10;
    int16_t decimal = temperature_tenths % 10;
    
    if (decimal < 0) decimal = -decimal;
    
    char buffer[8];
    int_to_string(whole, buffer);
    usart3_transmit_string(buffer);
    
    usart3_transmit_char('.');
    usart3_transmit_char('0' + decimal);
    usart3_transmit_string("C\r\n");
}