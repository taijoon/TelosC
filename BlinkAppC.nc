// $Id: BlinkAppC.nc,v 1.6 2010-06-29 22:07:14 scipio Exp $

configuration BlinkAppC
{
}
implementation
{
  components MainC, BlinkC, LedsC;
  components new TimerMilliC() as Timer0;
  components new TimerMilliC() as Timer1;
  components new TimerMilliC() as Timer2;


  BlinkC -> MainC.Boot;

  BlinkC.Timer0 -> Timer0;
  BlinkC.Timer1 -> Timer1;
  BlinkC.Timer2 -> Timer2;
  BlinkC.Leds -> LedsC;

	components PlatformSerialC as UART;
	BlinkC.SerialControl -> UART.StdControl;
	BlinkC.UartStream -> UART.UartStream;

	components ActiveMessageC;
  BlinkC.RadioControl -> ActiveMessageC;
}

