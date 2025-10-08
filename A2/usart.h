#ifndef USART_H
#define USART_H

#include <avr/io.h>
#include <stdint.h>

void usart3_init(void);
void usart3_transmit_char(char c);
char usart3_receive_char(void);
void usart3_transmit_string(const char* str);
void usart3_init_with_baudrate(uint32_t baudrate);
void usart3_send_temperature_celsius(float temperature);
void usart3_send_temperature_formatted(int16_t temperature_tenths);

#endif 