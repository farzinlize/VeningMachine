# Vending Machine with one fixed item
A Vending Machine is a automated seller that customers can buy its items with some coin and receive their changes. In this specific problem we are going to design and implement a Vending Machine with only one fixed price item and 3 different types of coin.

 - Coins are in 100, 200 and 500 unit
 - Vending Machine offers items worth 300 unit

## Input and outputs
We assume there is a 3 signal corresponding to each type of coins in names of `in100`, `in200` and `in500 ` that will be active (with logical value 1) one clock when user insert a coin and then it become deactivated. The output for this module consider only 2 type of coins because there is no way of having a 500 unit coin in changes when the price is fixed to 300 unit. There is another signal named `delivery` that indicate purchase is done and vending machine should deliver the item. We also consider that there is no need to keep delivery signal active for long time but for returning changes there is some slow actuator corresponding for 2 type of coin (100 and 200 unit) that needs at least *K* clock to remain active.

## Design 
The core of the design is a register named `sum` that holds current values of entered coins. Sum register will restarted with `done` signal (equivalent of delivery signal) to be ready for next purchase. At every positive edge of clock this register can change in two way corresponding to `mode` signal. Mode signal indicates machine two state of **1.** Accepting coin and **2.** returning changes. In the first mode the value of sum will accumulates with value of the inserted coin and in the second mode it will decreases by value of change.

### Control Unit
Even there is no separated module for control unit in this project but it can be seen in form of specific signals.

 - `alpha` and `beta`: these two signals are assigned to two comparison unit to determine that value sum is in which state.
	 - Sum is equivalent to price that will trigger `done` signal 
	 - Sum is equivalent to 400 unit that needs a 100 unit coin change and trigger `out100` signal.
	 - Sum is grater or equivalent to 500 unit that needs a 200 unit coin change for now and trigger `out200` signal.

> Value of sum never exceed 700 unit because machine will never accept more coin when sum is grater or equivalent to the price (300 unit) so if value of sum is grater than 500 unit we can be sure 200 unit coin is the greatest change possible.

Alpha an beta comparison:

	// Consider `4` and `5` means 400 and 500 unit value.
    assign alpha = (sum >= 4);
    assign beta = (sum >= 5);

Usage of alpha and beta (control unit output signals):

    assign done = (~(alpha | beta)) & mode;
    assign out100 = (alpha & (~beta)) & mode;
	assign out200 = (alpha & beta) & mode;

 - `mode` signal: as it mention before mode signal altered between two state of accepting coins and returning changes. value of this signal is stored in SR flip-flop with `full` signal as *set* and `done` signal as *reset* inputs. This signal works as **enable** signal of control unit to making `done`, `out100` or `out200` signals.

### WAIT Module
As mention before actuator corresponding to returning changes is very slow so each `out100` and `out200` must remain active for *K* clocks. In WAIT module there is a timer register that counts for *K* and when it reaches *K* output of the module will triggered to informing the top module that the timer reaches the desire value of k. Input signal that should be waited works as a reset signal for the inner register.

![enter image description here](https://lh3.googleusercontent.com/MLwbDEZS0Aqqi2DFvcEwhqxJtOD_hwUIhMyIIJOMZTaKflLkiL_bEN8dxov5AR4cxsxUDy2HRdIh "WAIT Module Design")

> This Report Written by Farzin Mohammdi with [StackEdit](https://stackedit.io/).
