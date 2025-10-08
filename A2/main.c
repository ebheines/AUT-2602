#define F_CPU 4000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <avr/interrupt.h>
#include "usart.h"
#include "adc.h"
#include "system_config.h"

int main(void) {
    usart3_init();
    
    adc_init_temperature_sensor();
    
    _delay_ms(100);
    
    while (1) {
        uint16_t adc_raw = adc_read_temperature_raw();
        
        int16_t temperature_tenths = adc_convert_to_celsius_int(adc_raw);

        usart3_transmit_string("Temperature: ");
        usart3_send_temperature_formatted(temperature_tenths);

        _delay_ms(1000);
    }
    
    return 0;
}