# Realtime Debuggable Traffic Light Control System with UART Receiver/Transmitter

<div  align="center"style="font-size:30px;">

![Cover Image](/Assets/Traffic-Lights.jpg)

</div>

---

The goal of this project is to combine the concepts of finite state machines and VHDL hardware description to add real-time debuggable capabilities to a traffic light control system. To achieve this, a UART was designed so that the circuit running on the FPGA could communicate with a PC through its RS-232 port. The final objective was to convert the state of the traffic light control system to a string of ASCII characters that would be displayed on the PC’s terminal. This project is important because it requires a strong understanding of UART design and of the outdated but still widely used RS-232 standard. Furthermore, multiple finite state machines are to be devised, resulting in an improved ability to solve digital problems algorithmically.

---

# Try it Yourself

Clone the project and open Project.qpf in Quartus II. Set projectDraft.bdf as top-level entity and compile. Pin assignments are intended for Altera DE2-115 FPGA so Pins may have to be reconfigured for your FPGA.

---

# Receiver (Designed by Frederick)

## Design Process

<div  align="center"style="font-size:30px;">

![Receiver Baud Rate](/Assets/receiver_baud_rate.png "Figure 1: The sampling for RxD with BClkx8")

</div>
In essence, the receiver remains in an idle state (state A) as long as RxD is high signaling a stop bit or idle bit. When RxD goes low the receiver enters a start bit counting state (state B) where it counts four clock pulses using counter C and returns to the idle state (state A) if RxD returns to high during this counting period. This was a design decision that allowed for more robustness since spurious pulses would be ignored. If four clock pulses occur with RxD low the start bit is acknowledged and the receiver enters the data bit counting state (state C). The role of this state is to time the data sampling so that data bits are shifted into a register near the middle of the bit. This greatly reduces the likelihood of error since the bits will not be sampled close to their change in value. This works because the receiver operates on a clock eight times faster than the Baud rate, meaning the four-clock cycle offset caused by the start bit counting state causes the bit sample to occur halfway through each bit. After eight clock cycles the receiver enters the sampling state (state D) where it shifts the value of RxD into a buffer register, resets the data bit counter (counter B), and increments the counter used to store the number of bits transferred (counter D). The receiver then returns to the data bit counting state (state C) where it continues to provide the timing requirements for sampling until counter D indicates that eight bits have been received. In this case, the receiver enters one of the two loading states (state F or state E) which indicates to the RDR register that the buffer register is full using the RDRF signal, and the values in the buffer register are loaded. State E occurs when no stop bit is detected at the end of the transmission and the framing error flag is set. The receiver then returns to its idle state where all its counters are reset and it waits for the next start bit. This behavior is described in Figure 2.
<div  align="center"style="font-size:30px;">

![Receiver Diagram](/Assets/receiver_diagram.png "Figure 2: State Diagram for Receiver")

</div>
To reduce complexity a one-hot encoding was used for the receiver removing the requirement of k-maps to implement design equations. In short, the input to each D Flip-Flop used for state representation is a combination of the previous state and the input signals. Figure 3 shows the design equations. For example, the input to D Flip-Flop 0 which represents state A is high when state A is the previous state and the idle bit is maintained or if state B is the previous state and the stop bit ends prematurely or if one of the loading states is the previous state. This corresponds to the state diagram.
<div  align="center"style="font-size:30px;">

![Receiver Design Equations](/Assets/receiver_equations.png "Figure 3: Design equations for receiver states")

</div>

## Simulation Results

<div  align="center"style="font-size:30px;">

![Receiver Waveform](/Assets/receiver_waveform.png "Figure 4: Waveform Simulation Results of Receiver ")

</div>
Figure 4 shows the working receiver receiving the byte 01101111. It begins in the idle state and then acknowledges the start bit after four clock pulses. It then shifts the value of RxD into the buffer register every eight clock cycles as is shown by the shift signal. After eight bits have been accepted the receiver signals that the buffer register is full with RDRF and the buffer register is loaded into the output register which is the signal RDR_out.

---

# Transmitter (Designed by Jad)

## Design Process

To implement the transmitter, a different approach was taken. The addition of a SelTxRx[0..1] bus was used, for more efficient communication between the Tx and the UART FSM. As shown in the figure below:

<div  align="center"style="font-size:30px;">

![Top Level Circuit](/Assets/top_level_circuit_with_bus_selector.jpg "Figure 5:  Top-Level Circuit with Bus Selector")

</div>

This new bus is a signal that is needed to trigger StartTx, the signal that starts transmitting the five character message. It triggers the transition from state A to state B in the Transmitter FSM shown below. There is also a counter in the Tx FSM, that is used to count up to eight, to transmit all eight bits (controlled by reset_counter and inc_counter as seen in figure). Also, the signals ResetDFF and enableDFF refer to the D flip-flop on the right of TSR, whose value will be the output TxD.

Using the logic in the project instructions, the following was implemented

<div  align="center"style="font-size:30px;">

![Databus Logic](/Assets/databus_logic.jpg "Figure 6: Databus Logic")

</div>

This logic was put in place by making a component called BusHandler. This controls the bus and changes it based on ADDR and R/W’.

This allows the following action logic to be used in the FSM.

<div  align="center"style="font-size:30px;">

![Transmitter Diagram](/Assets/Transmitter_state_diagram.jpg "Figure 7: Transmitter State Diagram")

</div>

At the start state 00, the Transmitter sends a signal called DoneTx that is communicated to the UART FSM. This signal is the 5th bit in SCSR. After receiving the following data:

StartTx = AddressBus=00 AND R/W’=0 AND SelTxRx[1]=1

the FSM transitions to state B, where the D flip-flop is reset, which signals the start bit for one clock cycle. On this transition, loadTDR is one, since loadTDR = AddressBus=00 AND R/W’=0 AND SelTxRx[1]=1. During this time, the TSR is loaded, and TDRE is set to 1. One clock cycle later, the transmitter transitions to C so the TSR starts shifting (shiftTSR=1), the D Flip-Flop is enabled so that the TSR shifts into it, therefore controlling the output. The counter increments until it hits 1000, meaning all the 8 bits have been sent. When this happens, the Tx transitions to state D, which will shift the TSR one last time, putting a ‘1’ into the D Flip-Flop which will represent the stop bits later on. Finally, it goes back to state A, where the counter will be reset, and the transmitter will be ready for the next transmission.

## Simulation Results

<div  align="center"style="font-size:30px;">

![Transmitter Waveform](/Assets/transmitter_waveform.png "Figure 8: Transmitter Waveform")

</div>

This waveform was the successful transmission of a random sequence of five 8-bit numbers. This simulation was done before connecting to the UART FSM,to assure the successful transmitting of five 8-bit using artificially generating input signals. The transmitter runs without any error when tested by itself and in conjunction with the whole system.

---

###### Citations:

[1] R. Keim, "UART Baud Rate: How Accurate Does It Need to Be?," All About Circuits, January 25, 2017. [Online]. Available: https://www.allaboutcircuits.com/technical-articles/the-uart-baud-rate-clock-how-accurate-does-it-need-to-be/. [Accessed: 29-11-2023].

[2] Terasic Technologies, "DE2-115 User Manual," V2.3, [Online]. Available: [https://www.terasic.com.tw/attachment/archive/502/DE2_115_User_manual.pdf]. [Accessed: 29-11-2023].

<div  align="center"style="font-size:30px;">

</div>
