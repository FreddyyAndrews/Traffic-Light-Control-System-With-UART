LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;

ENTITY TxComponent IS
    PORT (
        Global_Reset : IN STD_LOGIC;
        Clock : IN STD_LOGIC;
        Input_TDRE : IN STD_LOGIC;
        Read_Write : IN STD_LOGIC;
        Address_Bus : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        Data_Bus : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        Sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        Transmit_Data : OUT STD_LOGIC;
        Done_Transmit : OUT STD_LOGIC;
        Output_TDRE : OUT STD_LOGIC
    );
END TxComponent;

ARCHITECTURE bdf_type OF TxComponent IS

    COMPONENT tx_controller
        PORT (
            Global_Reset : IN STD_LOGIC;
            Clock : IN STD_LOGIC;
            Start_Transmit : IN STD_LOGIC;
            Counter_3 : IN STD_LOGIC;
            TDRE : OUT STD_LOGIC;
            Reset_DFF : OUT STD_LOGIC;
            Load_TSR : OUT STD_LOGIC;
            Shift_TSR : OUT STD_LOGIC;
            Enable_FF : OUT STD_LOGIC;
            Increment_Counter : OUT STD_LOGIC;
            Reset_Counter : OUT STD_LOGIC;
            Done_Transmit : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT four_bit_register_reset_increment
        PORT (
            Clock : IN STD_LOGIC;
            Reset : IN STD_LOGIC;
            Increment : IN STD_LOGIC;
            Counter_3 : OUT STD_LOGIC;
            Data_Out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT endff_2
        PORT (
            Input_Reset : IN STD_LOGIC;
            Input_Data : IN STD_LOGIC;
            Input_Enable : IN STD_LOGIC;
            Input_Clock : IN STD_LOGIC;
            Output_Q : OUT STD_LOGIC;
            Output_QBar : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT eightbitregister
        PORT (
            Input_Reset : IN STD_LOGIC;
            Input_Load : IN STD_LOGIC;
            Input_Clock : IN STD_LOGIC;
            Input_Value : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            Output_Value : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT eight_bit_right_shift_register
        PORT (
            Load : IN STD_LOGIC;
            Serial_Input : IN STD_LOGIC;
            Shift_Right : IN STD_LOGIC;
            Clock : IN STD_LOGIC;
            Parallel_Input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            Right_Output : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL Counter_Output : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Start_Transmit : STD_LOGIC;
    SIGNAL Reset_DFF : STD_LOGIC;
    SIGNAL Load_TSR : STD_LOGIC;
    SIGNAL Shift_TSR : STD_LOGIC;
    SIGNAL Enable_FF : STD_LOGIC;
    SIGNAL Increment_Counter : STD_LOGIC;
    SIGNAL Reset_Counter : STD_LOGIC;
    SIGNAL Done_Transmit2 : STD_LOGIC;
    SIGNAL Not_Read_Write : STD_LOGIC;
    SIGNAL Not_AddressBit1 : STD_LOGIC;
    SIGNAL Not_AddressBit0 : STD_LOGIC;
    SIGNAL Condition_Check : STD_LOGIC;
    SIGNAL Register_Load : STD_LOGIC;
    SIGNAL Shift_Input : STD_LOGIC;
    SIGNAL Shift_Right : STD_LOGIC;
    SIGNAL Shift_Output : STD_LOGIC;
    SIGNAL Transmit_Enable : STD_LOGIC;
    SIGNAL Reset_EndFF2 : STD_LOGIC;
    SIGNAL Shift_Reset : STD_LOGIC;
    SIGNAL Transmit_Data_Buffer : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL EndFF2_Output : STD_LOGIC;
    SIGNAL Start_Enable : STD_LOGIC;
    SIGNAL Reset_Start : STD_LOGIC;

BEGIN

    Done_Transmit2 <= EndFF2_Output;
    Start_Enable <= '1';

    b2v_inst : tx_controller
        PORT MAP (
            Global_Reset => Global_Reset,
            Clock => Clock,
            Start_Transmit => Start_Transmit,
            Counter_3 => Counter_Output(3),
            TDRE => Output_TDRE,
            Reset_DFF => Reset_EndFF2,
            Load_TSR => Load_TSR,
            Shift_TSR => Shift_Reset,
            Enable_FF => Enable_FF,
            Increment_Counter => Increment_Counter,
            Reset_Counter => Reset_Start,
            Done_Transmit => EndFF2_Output
        );

    b2v_inst1 : four_bit_register_reset_increment
        PORT MAP (
            Clock => Clock,
            Reset => Reset_Start,
            Increment => Increment_Counter,
            Data_Out => Counter_Output
        );

    Condition_Check <= NOT(Read_Write);

    b2v_inst13 : endff_2
        PORT MAP (
            Input_Reset => Reset_DFF,
            Input_Data => Shift_Input,
            Input_Enable => Enable_FF,
            Input_Clock => Clock,
            Output_Q => Transmit_Data
        );

    Not_AddressBit1 <= NOT(Address_Bus(1));
    Not_AddressBit0 <= NOT(Address_Bus(0));

    Register_Load <= Not_AddressBit0 AND Not_AddressBit1 AND Sel(1) AND Condition_Check;

    b2v_inst4 : eightbitregister
        PORT MAP (
            Input_Reset => Global_Reset,
            Input_Load => Register_Load,
            Input_Clock => Clock,
            Input_Value => Data_Bus,
            Output_Value => Transmit_Data_Buffer
        );

    b2v_inst5 : eight_bit_right_shift_register
        PORT MAP (
            Load => Load_TSR,
            Serial_Input => Start_Enable,
            Shift_Right => Shift_Reset,
            Clock => Clock,
            Parallel_Input => Transmit_Data_Buffer,
            Right_Output => Shift_Output
        );

    Shift_Input <= Transmit_Data OR Shift_Output;

    Start_Transmit <= Register_Load AND Input_TDRE;

    Reset_DFF <= NOT(Reset_EndFF2);

END bdf_type;
