// $Id: BlinkC.nc,v 1.6 2010-06-29 22:07:16 scipio Exp $

#include "Timer.h"

module BlinkC @safe()
{
  uses interface Timer<TMilli> as Timer0;
  uses interface Timer<TMilli> as Timer1;
  uses interface Timer<TMilli> as Timer2;
  uses interface Leds;
  uses interface Boot;

	uses interface StdControl as SerialControl;
	uses interface UartStream;

  uses interface SplitControl as RadioControl;
}
implementation
{ 
	uint8_t SEND[6] = "ABC\n\r";
	int cnt=0;
  event void Boot.booted()
  {
    call Timer0.startPeriodic( 512 );
		call SerialControl.start();
  }
 
  event void Timer0.fired()
  {
//		call Leds.set(cnt;
//		call Leds.led0Toggle();
//		call Leds.led1Toggle();
		call Leds.led2Toggle();
		call UartStream.send(SEND, 6);
		cnt++;
  }
  
  event void Timer1.fired()
  { 
  }
  
  event void Timer2.fired()
  {
  }

	async event void UartStream.receivedByte(uint8_t byte){
		call Leds.led0Toggle();
		if(byte == 'a') call Leds.led1Toggle();
	}
	async event void UartStream.sendDone(uint8_t* buf, uint16_t len, error_t error){
	}
	async event void UartStream.receiveDone(uint8_t* buf, uint16_t len, error_t error){
	}

  event void RadioControl.startDone(error_t error) {
  }

  event void RadioControl.stopDone(error_t error) {
  }

}
