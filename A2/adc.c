#include "adc.h"
#include "system_config.h"
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

// Static variables for interrupt-driven operation
static volatile uint8_t adc_conversion_complete = 0;
static volatile uint16_t adc_result = 0;

void adc_init_general(void) {
    VREF.ADC0REF = VREF_REFSEL_VDD_gc;
    _delay_us(25);  
    
    ADC0.CTRLA = ADC_RESSEL_12BIT_gc;  
    ADC0.CTRLC = ADC_PRESCALER_FOR_250KHZ;
    ADC0.CTRLD = ADC_INITDLY_DLY16_gc;  
    ADC0.CTRLA |= ADC_ENABLE_bm;
}

void adc_set_channel(uint8_t channel) {
    if (channel <= 0x15) {
        ADC0.MUXPOS = channel;
    }
}

void adc_start_conversion(void) {
    ADC0.INTFLAGS = ADC_RESRDY_bm;
    ADC0.COMMAND = ADC_STCONV_bm;
}

uint8_t adc_is_conversion_complete(void) {
    return (ADC0.INTFLAGS & ADC_RESRDY_bm) ? 1 : 0;
}

uint16_t adc_get_result(void) {
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm));
    ADC0.INTFLAGS = ADC_RESRDY_bm;
    return ADC0.RES;
}

uint16_t adc_read_single_blocking(uint8_t channel) {
    adc_set_channel(channel);
    adc_start_conversion();
    return adc_get_result();
}

void adc_init_temperature_sensor(void) {
    VREF.ADC0REF = VREF_REFSEL_2V048_gc;
    _delay_us(25);  // Allow reference to stabilize

    ADC0.CTRLA = ADC_RESSEL_12BIT_gc | ADC_FREERUN_bm;            
    ADC0.CTRLC = ADC_PRESCALER_FOR_250KHZ;
    ADC0.CTRLD = ADC_INITDLY_DLY32_gc | (ADC_TEMP_SAMPLEN_CYCLES & 0x0F); 
    ADC0.SAMPCTRL = ADC_TEMP_SAMPLEN_CYCLES;
    ADC0.MUXPOS = ADC_MUXPOS_TEMPSENSE_gc; 
    ADC0.CTRLA |= ADC_ENABLE_bm;
    ADC0.COMMAND = ADC_STCONV_bm;
}

uint16_t adc_read_temperature_raw(void) {
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm));
    
    ADC0.INTFLAGS = ADC_RESRDY_bm;

    return ADC0.RES;
}

float adc_convert_to_celsius(uint16_t raw_adc_value) {

    uint16_t sigrow_offset = SIGROW.TEMPSENSE1;
    uint16_t sigrow_slope = SIGROW.TEMPSENSE0; 
    uint32_t temp;
    

    if (sigrow_offset >= raw_adc_value) {
        temp = sigrow_offset - raw_adc_value;
    } else {
        return -273.15f;
    }

    temp *= sigrow_slope;
    temp += TEMP_SCALING_FACTOR / 2;
    temp /= TEMP_SCALING_FACTOR;
    
    int16_t temperature_celsius = (int16_t)temp - TEMP_KELVIN_TO_CELSIUS;
    
    return (float)temperature_celsius;
}

int16_t adc_convert_to_celsius_int(uint16_t raw_adc_value) {
    uint16_t sigrow_offset = SIGROW.TEMPSENSE1;
    uint16_t sigrow_slope = SIGROW.TEMPSENSE0;
    uint32_t temp;
    
    if (sigrow_offset >= raw_adc_value) {
        temp = sigrow_offset - raw_adc_value;
    } else {
        return -2730;
    }
    
    temp *= sigrow_slope;
    temp *= 10;
    temp += TEMP_SCALING_FACTOR / 2;
    temp /= TEMP_SCALING_FACTOR;

    int16_t temperature_celsius_tenths = (int16_t)temp - (TEMP_KELVIN_TO_CELSIUS * 10);
    
    return temperature_celsius_tenths;
}

void adc_enable_free_running_mode(void) {
    ADC0.CTRLA |= ADC_FREERUN_bm;
    if (ADC0.CTRLA & ADC_ENABLE_bm) {
        ADC0.COMMAND = ADC_STCONV_bm;
    }
}

void adc_disable_free_running_mode(void) {
    ADC0.CTRLA &= ~ADC_FREERUN_bm;
}

void adc_enable_result_interrupt(void) {
    ADC0.INTCTRL = ADC_RESRDY_bm; 
}

void adc_disable_result_interrupt(void) {
    ADC0.INTCTRL = 0x00;  
}

ISR(ADC0_RESRDY_vect) {
    adc_result = ADC0.RES;
    adc_conversion_complete = 1;
}

uint8_t adc_start_conversion_async(uint8_t channel) {
    if (adc_conversion_complete || !(ADC0.CTRLA & ADC_FREERUN_bm)) {
        adc_conversion_complete = 0;
        adc_set_channel(channel);
        adc_start_conversion();
        return 1; 
    }
    return 0; 
}

uint8_t adc_get_result_async(uint16_t* result) {
    if (adc_conversion_complete) {
        *result = adc_result;
        adc_conversion_complete = 0;
        return 1; 
    }
    return 0; 
}