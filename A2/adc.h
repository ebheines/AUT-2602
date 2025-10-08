#ifndef ADC_H
#define ADC_H

#include <avr/io.h>
#include <stdint.h>

void adc_init_general(void);
void adc_set_channel(uint8_t channel);
void adc_start_conversion(void);
uint8_t adc_is_conversion_complete(void);
uint16_t adc_get_result(void);
uint16_t adc_read_single_blocking(uint8_t channel);

void adc_init_temperature_sensor(void);
uint16_t adc_read_temperature_raw(void);
float adc_convert_to_celsius(uint16_t raw_adc_value);
int16_t adc_convert_to_celsius_int(uint16_t raw_adc_value);

void adc_enable_free_running_mode(void);
void adc_disable_free_running_mode(void);

void adc_enable_result_interrupt(void);
void adc_disable_result_interrupt(void);
uint8_t adc_start_conversion_async(uint8_t channel);
uint8_t adc_get_result_async(uint16_t* result);

#endif // ADC_H