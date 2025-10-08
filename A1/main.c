/**
 * @file main.c
 * @author ebheines
 * @date 2025-08-25
 * @brief Main function
 */

 #include <avr/io.h>
#include <stdint.h>
 #define F_CPU 4000000UL
 #include <util/delay.h>



void counter(){
    PORTC.PINCONFIG = PORT_INVEN_bm;
    PORTC.PINCTRLSET = PIN3_bm | PIN2_bm | PIN1_bm | PIN0_bm;
    PORTC.DIRSET = 0xff;

    int8_t counter = 0;

    while(1){
        counter++;
        PORTC.OUT = counter%16;
        _delay_ms(800);
    }
}

void oppgave_a(){
    PORTC.DIRSET = PIN3_bm | PIN2_bm | PIN1_bm | PIN0_bm;
    
    while (1)
    {
        PORTC.OUTTGL = PIN3_bm;
        _delay_ms(100);
    
        PORTC.OUTTGL = PIN2_bm;
        _delay_ms(50);
        
        PORTC.OUTTGL = PIN1_bm;
        _delay_ms(25);
        
        PORTC.OUTTGL = PIN0_bm;
        _delay_ms(12);
    }
}

void oppgave_b1(){
    PORTC.PINCONFIG = PORT_INVEN_bm;
    PORTC.PINCTRLSET = PIN3_bm | PIN2_bm | PIN1_bm | PIN0_bm;    
    
    PORTC.DIRSET = PIN3_bm | PIN2_bm | PIN1_bm | PIN0_bm;

    int counter = 0;
        while(1){
            switch (counter)
            {
            case 0:
                PORTC.OUTTGL = PIN0_bm;
                _delay_ms(250);
                PORTC.OUTCLR = PIN0_bm;
                break;
            case 1:
                PORTC.OUTTGL = PIN1_bm;
                _delay_ms(250);
                PORTC.OUTCLR = PIN1_bm;
                break;
            case 2:
                PORTC.OUTTGL = PIN2_bm;
                _delay_ms(250);
                PORTC.OUTCLR = PIN2_bm;
                break;
            case 3:
                PORTC.OUTTGL = PIN3_bm;
                _delay_ms(250);
                PORTC.OUTCLR = PIN3_bm;
                break;
            }
            counter++;

            if(counter == 4){
                counter = 0;
            }
        }    
}


void oppgave_b2(){
    PORTC.PINCONFIG = PORT_INVEN_bm;
    PORTC.PINCTRLSET = PIN3_bm | PIN2_bm | PIN1_bm | PIN0_bm;    
    
    PORTC.DIRSET = PIN3_bm | PIN2_bm | PIN1_bm | PIN0_bm;

    int8_t counter;

    for(counter = 0; counter < 10; counter++){
        PORTC.OUTSET = 1<<counter;
        _delay_ms(100);
        PORTC.OUTCLR = 1<<counter;

        if(counter > 3){
            counter = -1;
        } 
    }
}

void oppgave_c(){
    PORTC.DIRSET = PIN3_bm | PIN2_bm | PIN1_bm | PIN0_bm;
    
    PORTD.PIN0CTRL = PORT_PULLUPEN_bm;
    PORTD.PIN1CTRL = PORT_PULLUPEN_bm;
    PORTD.PIN2CTRL = PORT_PULLUPEN_bm;


    while (1)
    {
        if(PORTD.IN & PIN0_bm){
            PORTC.OUTSET = PIN0_bm;
        } else PORTC.OUTCLR = PIN0_bm;
        
        if(PORTD.IN & PIN1_bm){
            PORTC.OUTSET = PIN1_bm;
        } else PORTC.OUTCLR = PIN1_bm;
        
        if(PORTD.IN & PIN2_bm){
            PORTC.OUTSET = PIN2_bm;
        } else PORTC.OUTCLR = PIN2_bm;
        
        PORTC.OUTTGL = PIN3_bm;
        _delay_ms(50);
    }
}

void oppgave_d(){
    PORTC.DIRSET = PIN3_bm | PIN2_bm | PIN1_bm | PIN0_bm;
    
    PORTD.PIN0CTRL = PORT_PULLUPEN_bm;
    PORTD.PIN1CTRL = PORT_PULLUPEN_bm;
    PORTD.PIN2CTRL = PORT_PULLUPEN_bm;

    int state = 0;

    while (1)
    {
        if(state == 0){
            if(PORTD.IN & PIN0_bm){
                PORTC.OUTTGL = PIN0_bm;
                state = 1;
            } 
        } else state = 0;
        
        if(state == 0){
            if(PORTD.IN & PIN0_bm){
                PORTC.OUTTGL = PIN0_bm;
                state = 1;
            } 
        } else state = 0;
        
        if(state == 0){
            if(PORTD.IN & PIN0_bm){
                PORTC.OUTTGL = PIN0_bm;
                state = 1;
            } 
        } else state = 0;
    }
}

int main(){

    oppgave_d();

    return 0;
}
