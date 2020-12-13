--megafunction wizard: %Altera SOPC Builder%
--GENERATION: STANDARD
--VERSION: WM1.0


--Legal Notice: (C)2020 Altera Corporation. All rights reserved.  Your
--use of Altera Corporation's design tools, logic functions and other
--software and tools, and its AMPP partner logic functions, and any
--output files any of the foregoing (including device programming or
--simulation files), and any associated documentation or information are
--expressly subject to the terms and conditions of the Altera Program
--License Subscription Agreement or other applicable license agreement,
--including, without limitation, that your use is for the sole purpose
--of programming logic devices manufactured by Altera and sold by Altera
--or its authorized distributors.  Please refer to the applicable
--agreement for further details.


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Avalon_F7_0_avalon_slave_0_arbitrator is 
        port (
              -- inputs:
                 signal Avalon_F7_0_avalon_slave_0_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal Avalon_F7_0_avalon_slave_0_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal Avalon_F7_0_avalon_slave_0_chipselect : OUT STD_LOGIC;
                 signal Avalon_F7_0_avalon_slave_0_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal Avalon_F7_0_avalon_slave_0_reset_n : OUT STD_LOGIC;
                 signal Avalon_F7_0_avalon_slave_0_write_n : OUT STD_LOGIC;
                 signal Avalon_F7_0_avalon_slave_0_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_Avalon_F7_0_avalon_slave_0 : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0 : OUT STD_LOGIC;
                 signal d1_Avalon_F7_0_avalon_slave_0_end_xfer : OUT STD_LOGIC
              );
end entity Avalon_F7_0_avalon_slave_0_arbitrator;


architecture europa of Avalon_F7_0_avalon_slave_0_arbitrator is
                signal Avalon_F7_0_avalon_slave_0_allgrants :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_allow_new_arb_cycle :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_any_bursting_master_saved_grant :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_any_continuerequest :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_arb_counter_enable :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_arb_share_counter :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_arb_share_counter_next_value :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_arb_share_set_values :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_beginbursttransfer_internal :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_begins_xfer :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_end_xfer :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_firsttransfer :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_grant_vector :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_in_a_read_cycle :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_in_a_write_cycle :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_master_qreq_vector :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_non_bursting_master_requests :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_reg_firsttransfer :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_slavearbiterlockenable :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_slavearbiterlockenable2 :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_unreg_firsttransfer :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_waits_for_read :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_waits_for_write :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_Avalon_F7_0_avalon_slave_0 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_Avalon_F7_0_avalon_slave_0 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0 :  STD_LOGIC;
                signal shifted_address_to_Avalon_F7_0_avalon_slave_0_from_cpu_0_data_master :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal wait_for_Avalon_F7_0_avalon_slave_0_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT Avalon_F7_0_avalon_slave_0_end_xfer;
    end if;

  end process;

  Avalon_F7_0_avalon_slave_0_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0);
  --assign Avalon_F7_0_avalon_slave_0_readdata_from_sa = Avalon_F7_0_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  Avalon_F7_0_avalon_slave_0_readdata_from_sa <= Avalon_F7_0_avalon_slave_0_readdata;
  internal_cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0 <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(16 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("10001000001000000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --Avalon_F7_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  Avalon_F7_0_avalon_slave_0_arb_share_set_values <= std_logic'('1');
  --Avalon_F7_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  Avalon_F7_0_avalon_slave_0_non_bursting_master_requests <= internal_cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0;
  --Avalon_F7_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  Avalon_F7_0_avalon_slave_0_any_bursting_master_saved_grant <= std_logic'('0');
  --Avalon_F7_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  Avalon_F7_0_avalon_slave_0_arb_share_counter_next_value <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(Avalon_F7_0_avalon_slave_0_firsttransfer) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(Avalon_F7_0_avalon_slave_0_arb_share_set_values))) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(Avalon_F7_0_avalon_slave_0_arb_share_counter) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(Avalon_F7_0_avalon_slave_0_arb_share_counter))) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))));
  --Avalon_F7_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  Avalon_F7_0_avalon_slave_0_allgrants <= Avalon_F7_0_avalon_slave_0_grant_vector;
  --Avalon_F7_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  Avalon_F7_0_avalon_slave_0_end_xfer <= NOT ((Avalon_F7_0_avalon_slave_0_waits_for_read OR Avalon_F7_0_avalon_slave_0_waits_for_write));
  --end_xfer_arb_share_counter_term_Avalon_F7_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_Avalon_F7_0_avalon_slave_0 <= Avalon_F7_0_avalon_slave_0_end_xfer AND (((NOT Avalon_F7_0_avalon_slave_0_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --Avalon_F7_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  Avalon_F7_0_avalon_slave_0_arb_counter_enable <= ((end_xfer_arb_share_counter_term_Avalon_F7_0_avalon_slave_0 AND Avalon_F7_0_avalon_slave_0_allgrants)) OR ((end_xfer_arb_share_counter_term_Avalon_F7_0_avalon_slave_0 AND NOT Avalon_F7_0_avalon_slave_0_non_bursting_master_requests));
  --Avalon_F7_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      Avalon_F7_0_avalon_slave_0_arb_share_counter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(Avalon_F7_0_avalon_slave_0_arb_counter_enable) = '1' then 
        Avalon_F7_0_avalon_slave_0_arb_share_counter <= Avalon_F7_0_avalon_slave_0_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --Avalon_F7_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      Avalon_F7_0_avalon_slave_0_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((Avalon_F7_0_avalon_slave_0_master_qreq_vector AND end_xfer_arb_share_counter_term_Avalon_F7_0_avalon_slave_0)) OR ((end_xfer_arb_share_counter_term_Avalon_F7_0_avalon_slave_0 AND NOT Avalon_F7_0_avalon_slave_0_non_bursting_master_requests)))) = '1' then 
        Avalon_F7_0_avalon_slave_0_slavearbiterlockenable <= Avalon_F7_0_avalon_slave_0_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --cpu_0/data_master Avalon_F7_0/avalon_slave_0 arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= Avalon_F7_0_avalon_slave_0_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --Avalon_F7_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  Avalon_F7_0_avalon_slave_0_slavearbiterlockenable2 <= Avalon_F7_0_avalon_slave_0_arb_share_counter_next_value;
  --cpu_0/data_master Avalon_F7_0/avalon_slave_0 arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= Avalon_F7_0_avalon_slave_0_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --Avalon_F7_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  Avalon_F7_0_avalon_slave_0_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 <= internal_cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0 AND NOT (((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write));
  --Avalon_F7_0_avalon_slave_0_writedata mux, which is an e_mux
  Avalon_F7_0_avalon_slave_0_writedata <= cpu_0_data_master_writedata;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 <= internal_cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0;
  --cpu_0/data_master saved-grant Avalon_F7_0/avalon_slave_0, which is an e_assign
  cpu_0_data_master_saved_grant_Avalon_F7_0_avalon_slave_0 <= internal_cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0;
  --allow new arb cycle for Avalon_F7_0/avalon_slave_0, which is an e_assign
  Avalon_F7_0_avalon_slave_0_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  Avalon_F7_0_avalon_slave_0_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  Avalon_F7_0_avalon_slave_0_master_qreq_vector <= std_logic'('1');
  --Avalon_F7_0_avalon_slave_0_reset_n assignment, which is an e_assign
  Avalon_F7_0_avalon_slave_0_reset_n <= reset_n;
  Avalon_F7_0_avalon_slave_0_chipselect <= internal_cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0;
  --Avalon_F7_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  Avalon_F7_0_avalon_slave_0_firsttransfer <= A_WE_StdLogic((std_logic'(Avalon_F7_0_avalon_slave_0_begins_xfer) = '1'), Avalon_F7_0_avalon_slave_0_unreg_firsttransfer, Avalon_F7_0_avalon_slave_0_reg_firsttransfer);
  --Avalon_F7_0_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  Avalon_F7_0_avalon_slave_0_unreg_firsttransfer <= NOT ((Avalon_F7_0_avalon_slave_0_slavearbiterlockenable AND Avalon_F7_0_avalon_slave_0_any_continuerequest));
  --Avalon_F7_0_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      Avalon_F7_0_avalon_slave_0_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(Avalon_F7_0_avalon_slave_0_begins_xfer) = '1' then 
        Avalon_F7_0_avalon_slave_0_reg_firsttransfer <= Avalon_F7_0_avalon_slave_0_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --Avalon_F7_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  Avalon_F7_0_avalon_slave_0_beginbursttransfer_internal <= Avalon_F7_0_avalon_slave_0_begins_xfer;
  --~Avalon_F7_0_avalon_slave_0_write_n assignment, which is an e_mux
  Avalon_F7_0_avalon_slave_0_write_n <= NOT ((internal_cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 AND cpu_0_data_master_write));
  shifted_address_to_Avalon_F7_0_avalon_slave_0_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --Avalon_F7_0_avalon_slave_0_address mux, which is an e_mux
  Avalon_F7_0_avalon_slave_0_address <= A_EXT (A_SRL(shifted_address_to_Avalon_F7_0_avalon_slave_0_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_Avalon_F7_0_avalon_slave_0_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_Avalon_F7_0_avalon_slave_0_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_Avalon_F7_0_avalon_slave_0_end_xfer <= Avalon_F7_0_avalon_slave_0_end_xfer;
    end if;

  end process;

  --Avalon_F7_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  Avalon_F7_0_avalon_slave_0_waits_for_read <= Avalon_F7_0_avalon_slave_0_in_a_read_cycle AND Avalon_F7_0_avalon_slave_0_begins_xfer;
  --Avalon_F7_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  Avalon_F7_0_avalon_slave_0_in_a_read_cycle <= internal_cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= Avalon_F7_0_avalon_slave_0_in_a_read_cycle;
  --Avalon_F7_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  Avalon_F7_0_avalon_slave_0_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(Avalon_F7_0_avalon_slave_0_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --Avalon_F7_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  Avalon_F7_0_avalon_slave_0_in_a_write_cycle <= internal_cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= Avalon_F7_0_avalon_slave_0_in_a_write_cycle;
  wait_for_Avalon_F7_0_avalon_slave_0_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 <= internal_cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 <= internal_cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0 <= internal_cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0;
--synthesis translate_off
    --Avalon_F7_0/avalon_slave_0 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Boutons_s1_arbitrator is 
        port (
              -- inputs:
                 signal Boutons_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal Boutons_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal Boutons_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal Boutons_s1_reset_n : OUT STD_LOGIC;
                 signal cpu_0_data_master_granted_Boutons_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_Boutons_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_Boutons_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_Boutons_s1 : OUT STD_LOGIC;
                 signal d1_Boutons_s1_end_xfer : OUT STD_LOGIC
              );
end entity Boutons_s1_arbitrator;


architecture europa of Boutons_s1_arbitrator is
                signal Boutons_s1_allgrants :  STD_LOGIC;
                signal Boutons_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal Boutons_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal Boutons_s1_any_continuerequest :  STD_LOGIC;
                signal Boutons_s1_arb_counter_enable :  STD_LOGIC;
                signal Boutons_s1_arb_share_counter :  STD_LOGIC;
                signal Boutons_s1_arb_share_counter_next_value :  STD_LOGIC;
                signal Boutons_s1_arb_share_set_values :  STD_LOGIC;
                signal Boutons_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal Boutons_s1_begins_xfer :  STD_LOGIC;
                signal Boutons_s1_end_xfer :  STD_LOGIC;
                signal Boutons_s1_firsttransfer :  STD_LOGIC;
                signal Boutons_s1_grant_vector :  STD_LOGIC;
                signal Boutons_s1_in_a_read_cycle :  STD_LOGIC;
                signal Boutons_s1_in_a_write_cycle :  STD_LOGIC;
                signal Boutons_s1_master_qreq_vector :  STD_LOGIC;
                signal Boutons_s1_non_bursting_master_requests :  STD_LOGIC;
                signal Boutons_s1_reg_firsttransfer :  STD_LOGIC;
                signal Boutons_s1_slavearbiterlockenable :  STD_LOGIC;
                signal Boutons_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal Boutons_s1_unreg_firsttransfer :  STD_LOGIC;
                signal Boutons_s1_waits_for_read :  STD_LOGIC;
                signal Boutons_s1_waits_for_write :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_Boutons_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_Boutons_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_Boutons_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_Boutons_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_Boutons_s1 :  STD_LOGIC;
                signal shifted_address_to_Boutons_s1_from_cpu_0_data_master :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal wait_for_Boutons_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT Boutons_s1_end_xfer;
    end if;

  end process;

  Boutons_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_Boutons_s1);
  --assign Boutons_s1_readdata_from_sa = Boutons_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  Boutons_s1_readdata_from_sa <= Boutons_s1_readdata;
  internal_cpu_0_data_master_requests_Boutons_s1 <= ((to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(16 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("10001000000000000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write)))) AND cpu_0_data_master_read;
  --Boutons_s1_arb_share_counter set values, which is an e_mux
  Boutons_s1_arb_share_set_values <= std_logic'('1');
  --Boutons_s1_non_bursting_master_requests mux, which is an e_mux
  Boutons_s1_non_bursting_master_requests <= internal_cpu_0_data_master_requests_Boutons_s1;
  --Boutons_s1_any_bursting_master_saved_grant mux, which is an e_mux
  Boutons_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --Boutons_s1_arb_share_counter_next_value assignment, which is an e_assign
  Boutons_s1_arb_share_counter_next_value <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(Boutons_s1_firsttransfer) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(Boutons_s1_arb_share_set_values))) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(Boutons_s1_arb_share_counter) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(Boutons_s1_arb_share_counter))) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))));
  --Boutons_s1_allgrants all slave grants, which is an e_mux
  Boutons_s1_allgrants <= Boutons_s1_grant_vector;
  --Boutons_s1_end_xfer assignment, which is an e_assign
  Boutons_s1_end_xfer <= NOT ((Boutons_s1_waits_for_read OR Boutons_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_Boutons_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_Boutons_s1 <= Boutons_s1_end_xfer AND (((NOT Boutons_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --Boutons_s1_arb_share_counter arbitration counter enable, which is an e_assign
  Boutons_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_Boutons_s1 AND Boutons_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_Boutons_s1 AND NOT Boutons_s1_non_bursting_master_requests));
  --Boutons_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      Boutons_s1_arb_share_counter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(Boutons_s1_arb_counter_enable) = '1' then 
        Boutons_s1_arb_share_counter <= Boutons_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --Boutons_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      Boutons_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((Boutons_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_Boutons_s1)) OR ((end_xfer_arb_share_counter_term_Boutons_s1 AND NOT Boutons_s1_non_bursting_master_requests)))) = '1' then 
        Boutons_s1_slavearbiterlockenable <= Boutons_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --cpu_0/data_master Boutons/s1 arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= Boutons_s1_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --Boutons_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  Boutons_s1_slavearbiterlockenable2 <= Boutons_s1_arb_share_counter_next_value;
  --cpu_0/data_master Boutons/s1 arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= Boutons_s1_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --Boutons_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  Boutons_s1_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_Boutons_s1 <= internal_cpu_0_data_master_requests_Boutons_s1;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_Boutons_s1 <= internal_cpu_0_data_master_qualified_request_Boutons_s1;
  --cpu_0/data_master saved-grant Boutons/s1, which is an e_assign
  cpu_0_data_master_saved_grant_Boutons_s1 <= internal_cpu_0_data_master_requests_Boutons_s1;
  --allow new arb cycle for Boutons/s1, which is an e_assign
  Boutons_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  Boutons_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  Boutons_s1_master_qreq_vector <= std_logic'('1');
  --Boutons_s1_reset_n assignment, which is an e_assign
  Boutons_s1_reset_n <= reset_n;
  --Boutons_s1_firsttransfer first transaction, which is an e_assign
  Boutons_s1_firsttransfer <= A_WE_StdLogic((std_logic'(Boutons_s1_begins_xfer) = '1'), Boutons_s1_unreg_firsttransfer, Boutons_s1_reg_firsttransfer);
  --Boutons_s1_unreg_firsttransfer first transaction, which is an e_assign
  Boutons_s1_unreg_firsttransfer <= NOT ((Boutons_s1_slavearbiterlockenable AND Boutons_s1_any_continuerequest));
  --Boutons_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      Boutons_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(Boutons_s1_begins_xfer) = '1' then 
        Boutons_s1_reg_firsttransfer <= Boutons_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --Boutons_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  Boutons_s1_beginbursttransfer_internal <= Boutons_s1_begins_xfer;
  shifted_address_to_Boutons_s1_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --Boutons_s1_address mux, which is an e_mux
  Boutons_s1_address <= A_EXT (A_SRL(shifted_address_to_Boutons_s1_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_Boutons_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_Boutons_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_Boutons_s1_end_xfer <= Boutons_s1_end_xfer;
    end if;

  end process;

  --Boutons_s1_waits_for_read in a cycle, which is an e_mux
  Boutons_s1_waits_for_read <= Boutons_s1_in_a_read_cycle AND Boutons_s1_begins_xfer;
  --Boutons_s1_in_a_read_cycle assignment, which is an e_assign
  Boutons_s1_in_a_read_cycle <= internal_cpu_0_data_master_granted_Boutons_s1 AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= Boutons_s1_in_a_read_cycle;
  --Boutons_s1_waits_for_write in a cycle, which is an e_mux
  Boutons_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(Boutons_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --Boutons_s1_in_a_write_cycle assignment, which is an e_assign
  Boutons_s1_in_a_write_cycle <= internal_cpu_0_data_master_granted_Boutons_s1 AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= Boutons_s1_in_a_write_cycle;
  wait_for_Boutons_s1_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_Boutons_s1 <= internal_cpu_0_data_master_granted_Boutons_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_Boutons_s1 <= internal_cpu_0_data_master_qualified_request_Boutons_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_Boutons_s1 <= internal_cpu_0_data_master_requests_Boutons_s1;
--synthesis translate_off
    --Boutons/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity LEDs_s1_arbitrator is 
        port (
              -- inputs:
                 signal LEDs_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal LEDs_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal LEDs_s1_chipselect : OUT STD_LOGIC;
                 signal LEDs_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal LEDs_s1_reset_n : OUT STD_LOGIC;
                 signal LEDs_s1_write_n : OUT STD_LOGIC;
                 signal LEDs_s1_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_data_master_granted_LEDs_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_LEDs_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_LEDs_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_LEDs_s1 : OUT STD_LOGIC;
                 signal d1_LEDs_s1_end_xfer : OUT STD_LOGIC
              );
end entity LEDs_s1_arbitrator;


architecture europa of LEDs_s1_arbitrator is
                signal LEDs_s1_allgrants :  STD_LOGIC;
                signal LEDs_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal LEDs_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal LEDs_s1_any_continuerequest :  STD_LOGIC;
                signal LEDs_s1_arb_counter_enable :  STD_LOGIC;
                signal LEDs_s1_arb_share_counter :  STD_LOGIC;
                signal LEDs_s1_arb_share_counter_next_value :  STD_LOGIC;
                signal LEDs_s1_arb_share_set_values :  STD_LOGIC;
                signal LEDs_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal LEDs_s1_begins_xfer :  STD_LOGIC;
                signal LEDs_s1_end_xfer :  STD_LOGIC;
                signal LEDs_s1_firsttransfer :  STD_LOGIC;
                signal LEDs_s1_grant_vector :  STD_LOGIC;
                signal LEDs_s1_in_a_read_cycle :  STD_LOGIC;
                signal LEDs_s1_in_a_write_cycle :  STD_LOGIC;
                signal LEDs_s1_master_qreq_vector :  STD_LOGIC;
                signal LEDs_s1_non_bursting_master_requests :  STD_LOGIC;
                signal LEDs_s1_reg_firsttransfer :  STD_LOGIC;
                signal LEDs_s1_slavearbiterlockenable :  STD_LOGIC;
                signal LEDs_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal LEDs_s1_unreg_firsttransfer :  STD_LOGIC;
                signal LEDs_s1_waits_for_read :  STD_LOGIC;
                signal LEDs_s1_waits_for_write :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_LEDs_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_LEDs_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_LEDs_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_LEDs_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_LEDs_s1 :  STD_LOGIC;
                signal shifted_address_to_LEDs_s1_from_cpu_0_data_master :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal wait_for_LEDs_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT LEDs_s1_end_xfer;
    end if;

  end process;

  LEDs_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_LEDs_s1);
  --assign LEDs_s1_readdata_from_sa = LEDs_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  LEDs_s1_readdata_from_sa <= LEDs_s1_readdata;
  internal_cpu_0_data_master_requests_LEDs_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(16 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("10001000000010000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --LEDs_s1_arb_share_counter set values, which is an e_mux
  LEDs_s1_arb_share_set_values <= std_logic'('1');
  --LEDs_s1_non_bursting_master_requests mux, which is an e_mux
  LEDs_s1_non_bursting_master_requests <= internal_cpu_0_data_master_requests_LEDs_s1;
  --LEDs_s1_any_bursting_master_saved_grant mux, which is an e_mux
  LEDs_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --LEDs_s1_arb_share_counter_next_value assignment, which is an e_assign
  LEDs_s1_arb_share_counter_next_value <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(LEDs_s1_firsttransfer) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(LEDs_s1_arb_share_set_values))) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(LEDs_s1_arb_share_counter) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(LEDs_s1_arb_share_counter))) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))));
  --LEDs_s1_allgrants all slave grants, which is an e_mux
  LEDs_s1_allgrants <= LEDs_s1_grant_vector;
  --LEDs_s1_end_xfer assignment, which is an e_assign
  LEDs_s1_end_xfer <= NOT ((LEDs_s1_waits_for_read OR LEDs_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_LEDs_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_LEDs_s1 <= LEDs_s1_end_xfer AND (((NOT LEDs_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --LEDs_s1_arb_share_counter arbitration counter enable, which is an e_assign
  LEDs_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_LEDs_s1 AND LEDs_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_LEDs_s1 AND NOT LEDs_s1_non_bursting_master_requests));
  --LEDs_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      LEDs_s1_arb_share_counter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(LEDs_s1_arb_counter_enable) = '1' then 
        LEDs_s1_arb_share_counter <= LEDs_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --LEDs_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      LEDs_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((LEDs_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_LEDs_s1)) OR ((end_xfer_arb_share_counter_term_LEDs_s1 AND NOT LEDs_s1_non_bursting_master_requests)))) = '1' then 
        LEDs_s1_slavearbiterlockenable <= LEDs_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --cpu_0/data_master LEDs/s1 arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= LEDs_s1_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --LEDs_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  LEDs_s1_slavearbiterlockenable2 <= LEDs_s1_arb_share_counter_next_value;
  --cpu_0/data_master LEDs/s1 arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= LEDs_s1_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --LEDs_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  LEDs_s1_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_LEDs_s1 <= internal_cpu_0_data_master_requests_LEDs_s1 AND NOT (((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write));
  --LEDs_s1_writedata mux, which is an e_mux
  LEDs_s1_writedata <= cpu_0_data_master_writedata;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_LEDs_s1 <= internal_cpu_0_data_master_qualified_request_LEDs_s1;
  --cpu_0/data_master saved-grant LEDs/s1, which is an e_assign
  cpu_0_data_master_saved_grant_LEDs_s1 <= internal_cpu_0_data_master_requests_LEDs_s1;
  --allow new arb cycle for LEDs/s1, which is an e_assign
  LEDs_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  LEDs_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  LEDs_s1_master_qreq_vector <= std_logic'('1');
  --LEDs_s1_reset_n assignment, which is an e_assign
  LEDs_s1_reset_n <= reset_n;
  LEDs_s1_chipselect <= internal_cpu_0_data_master_granted_LEDs_s1;
  --LEDs_s1_firsttransfer first transaction, which is an e_assign
  LEDs_s1_firsttransfer <= A_WE_StdLogic((std_logic'(LEDs_s1_begins_xfer) = '1'), LEDs_s1_unreg_firsttransfer, LEDs_s1_reg_firsttransfer);
  --LEDs_s1_unreg_firsttransfer first transaction, which is an e_assign
  LEDs_s1_unreg_firsttransfer <= NOT ((LEDs_s1_slavearbiterlockenable AND LEDs_s1_any_continuerequest));
  --LEDs_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      LEDs_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(LEDs_s1_begins_xfer) = '1' then 
        LEDs_s1_reg_firsttransfer <= LEDs_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --LEDs_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  LEDs_s1_beginbursttransfer_internal <= LEDs_s1_begins_xfer;
  --~LEDs_s1_write_n assignment, which is an e_mux
  LEDs_s1_write_n <= NOT ((internal_cpu_0_data_master_granted_LEDs_s1 AND cpu_0_data_master_write));
  shifted_address_to_LEDs_s1_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --LEDs_s1_address mux, which is an e_mux
  LEDs_s1_address <= A_EXT (A_SRL(shifted_address_to_LEDs_s1_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_LEDs_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_LEDs_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_LEDs_s1_end_xfer <= LEDs_s1_end_xfer;
    end if;

  end process;

  --LEDs_s1_waits_for_read in a cycle, which is an e_mux
  LEDs_s1_waits_for_read <= LEDs_s1_in_a_read_cycle AND LEDs_s1_begins_xfer;
  --LEDs_s1_in_a_read_cycle assignment, which is an e_assign
  LEDs_s1_in_a_read_cycle <= internal_cpu_0_data_master_granted_LEDs_s1 AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= LEDs_s1_in_a_read_cycle;
  --LEDs_s1_waits_for_write in a cycle, which is an e_mux
  LEDs_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(LEDs_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --LEDs_s1_in_a_write_cycle assignment, which is an e_assign
  LEDs_s1_in_a_write_cycle <= internal_cpu_0_data_master_granted_LEDs_s1 AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= LEDs_s1_in_a_write_cycle;
  wait_for_LEDs_s1_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_LEDs_s1 <= internal_cpu_0_data_master_granted_LEDs_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_LEDs_s1 <= internal_cpu_0_data_master_qualified_request_LEDs_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_LEDs_s1 <= internal_cpu_0_data_master_requests_LEDs_s1;
--synthesis translate_off
    --LEDs/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity avalon_anemo_0_avalon_slave_0_arbitrator is 
        port (
              -- inputs:
                 signal avalon_anemo_0_avalon_slave_0_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal avalon_anemo_0_avalon_slave_0_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal avalon_anemo_0_avalon_slave_0_chipselect : OUT STD_LOGIC;
                 signal avalon_anemo_0_avalon_slave_0_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal avalon_anemo_0_avalon_slave_0_reset_n : OUT STD_LOGIC;
                 signal avalon_anemo_0_avalon_slave_0_write_n : OUT STD_LOGIC;
                 signal avalon_anemo_0_avalon_slave_0_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_avalon_anemo_0_avalon_slave_0 : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0 : OUT STD_LOGIC;
                 signal d1_avalon_anemo_0_avalon_slave_0_end_xfer : OUT STD_LOGIC
              );
end entity avalon_anemo_0_avalon_slave_0_arbitrator;


architecture europa of avalon_anemo_0_avalon_slave_0_arbitrator is
                signal avalon_anemo_0_avalon_slave_0_allgrants :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_allow_new_arb_cycle :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_any_bursting_master_saved_grant :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_any_continuerequest :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_arb_counter_enable :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_arb_share_counter :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_arb_share_counter_next_value :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_arb_share_set_values :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_beginbursttransfer_internal :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_begins_xfer :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_end_xfer :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_firsttransfer :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_grant_vector :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_in_a_read_cycle :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_in_a_write_cycle :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_master_qreq_vector :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_non_bursting_master_requests :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_reg_firsttransfer :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_slavearbiterlockenable :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_slavearbiterlockenable2 :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_unreg_firsttransfer :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_waits_for_read :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_waits_for_write :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_avalon_anemo_0_avalon_slave_0 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_avalon_anemo_0_avalon_slave_0 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0 :  STD_LOGIC;
                signal shifted_address_to_avalon_anemo_0_avalon_slave_0_from_cpu_0_data_master :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal wait_for_avalon_anemo_0_avalon_slave_0_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT avalon_anemo_0_avalon_slave_0_end_xfer;
    end if;

  end process;

  avalon_anemo_0_avalon_slave_0_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0);
  --assign avalon_anemo_0_avalon_slave_0_readdata_from_sa = avalon_anemo_0_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  avalon_anemo_0_avalon_slave_0_readdata_from_sa <= avalon_anemo_0_avalon_slave_0_readdata;
  internal_cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0 <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(16 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("10001000000110000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --avalon_anemo_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  avalon_anemo_0_avalon_slave_0_arb_share_set_values <= std_logic'('1');
  --avalon_anemo_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  avalon_anemo_0_avalon_slave_0_non_bursting_master_requests <= internal_cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0;
  --avalon_anemo_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  avalon_anemo_0_avalon_slave_0_any_bursting_master_saved_grant <= std_logic'('0');
  --avalon_anemo_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  avalon_anemo_0_avalon_slave_0_arb_share_counter_next_value <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(avalon_anemo_0_avalon_slave_0_firsttransfer) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(avalon_anemo_0_avalon_slave_0_arb_share_set_values))) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(avalon_anemo_0_avalon_slave_0_arb_share_counter) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(avalon_anemo_0_avalon_slave_0_arb_share_counter))) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))));
  --avalon_anemo_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  avalon_anemo_0_avalon_slave_0_allgrants <= avalon_anemo_0_avalon_slave_0_grant_vector;
  --avalon_anemo_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  avalon_anemo_0_avalon_slave_0_end_xfer <= NOT ((avalon_anemo_0_avalon_slave_0_waits_for_read OR avalon_anemo_0_avalon_slave_0_waits_for_write));
  --end_xfer_arb_share_counter_term_avalon_anemo_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_avalon_anemo_0_avalon_slave_0 <= avalon_anemo_0_avalon_slave_0_end_xfer AND (((NOT avalon_anemo_0_avalon_slave_0_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --avalon_anemo_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  avalon_anemo_0_avalon_slave_0_arb_counter_enable <= ((end_xfer_arb_share_counter_term_avalon_anemo_0_avalon_slave_0 AND avalon_anemo_0_avalon_slave_0_allgrants)) OR ((end_xfer_arb_share_counter_term_avalon_anemo_0_avalon_slave_0 AND NOT avalon_anemo_0_avalon_slave_0_non_bursting_master_requests));
  --avalon_anemo_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      avalon_anemo_0_avalon_slave_0_arb_share_counter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(avalon_anemo_0_avalon_slave_0_arb_counter_enable) = '1' then 
        avalon_anemo_0_avalon_slave_0_arb_share_counter <= avalon_anemo_0_avalon_slave_0_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --avalon_anemo_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      avalon_anemo_0_avalon_slave_0_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((avalon_anemo_0_avalon_slave_0_master_qreq_vector AND end_xfer_arb_share_counter_term_avalon_anemo_0_avalon_slave_0)) OR ((end_xfer_arb_share_counter_term_avalon_anemo_0_avalon_slave_0 AND NOT avalon_anemo_0_avalon_slave_0_non_bursting_master_requests)))) = '1' then 
        avalon_anemo_0_avalon_slave_0_slavearbiterlockenable <= avalon_anemo_0_avalon_slave_0_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --cpu_0/data_master avalon_anemo_0/avalon_slave_0 arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= avalon_anemo_0_avalon_slave_0_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --avalon_anemo_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  avalon_anemo_0_avalon_slave_0_slavearbiterlockenable2 <= avalon_anemo_0_avalon_slave_0_arb_share_counter_next_value;
  --cpu_0/data_master avalon_anemo_0/avalon_slave_0 arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= avalon_anemo_0_avalon_slave_0_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --avalon_anemo_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  avalon_anemo_0_avalon_slave_0_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 <= internal_cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0 AND NOT (((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write));
  --avalon_anemo_0_avalon_slave_0_writedata mux, which is an e_mux
  avalon_anemo_0_avalon_slave_0_writedata <= cpu_0_data_master_writedata;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 <= internal_cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0;
  --cpu_0/data_master saved-grant avalon_anemo_0/avalon_slave_0, which is an e_assign
  cpu_0_data_master_saved_grant_avalon_anemo_0_avalon_slave_0 <= internal_cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0;
  --allow new arb cycle for avalon_anemo_0/avalon_slave_0, which is an e_assign
  avalon_anemo_0_avalon_slave_0_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  avalon_anemo_0_avalon_slave_0_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  avalon_anemo_0_avalon_slave_0_master_qreq_vector <= std_logic'('1');
  --avalon_anemo_0_avalon_slave_0_reset_n assignment, which is an e_assign
  avalon_anemo_0_avalon_slave_0_reset_n <= reset_n;
  avalon_anemo_0_avalon_slave_0_chipselect <= internal_cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0;
  --avalon_anemo_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  avalon_anemo_0_avalon_slave_0_firsttransfer <= A_WE_StdLogic((std_logic'(avalon_anemo_0_avalon_slave_0_begins_xfer) = '1'), avalon_anemo_0_avalon_slave_0_unreg_firsttransfer, avalon_anemo_0_avalon_slave_0_reg_firsttransfer);
  --avalon_anemo_0_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  avalon_anemo_0_avalon_slave_0_unreg_firsttransfer <= NOT ((avalon_anemo_0_avalon_slave_0_slavearbiterlockenable AND avalon_anemo_0_avalon_slave_0_any_continuerequest));
  --avalon_anemo_0_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      avalon_anemo_0_avalon_slave_0_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(avalon_anemo_0_avalon_slave_0_begins_xfer) = '1' then 
        avalon_anemo_0_avalon_slave_0_reg_firsttransfer <= avalon_anemo_0_avalon_slave_0_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --avalon_anemo_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  avalon_anemo_0_avalon_slave_0_beginbursttransfer_internal <= avalon_anemo_0_avalon_slave_0_begins_xfer;
  --~avalon_anemo_0_avalon_slave_0_write_n assignment, which is an e_mux
  avalon_anemo_0_avalon_slave_0_write_n <= NOT ((internal_cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 AND cpu_0_data_master_write));
  shifted_address_to_avalon_anemo_0_avalon_slave_0_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --avalon_anemo_0_avalon_slave_0_address mux, which is an e_mux
  avalon_anemo_0_avalon_slave_0_address <= A_EXT (A_SRL(shifted_address_to_avalon_anemo_0_avalon_slave_0_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_avalon_anemo_0_avalon_slave_0_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_avalon_anemo_0_avalon_slave_0_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_avalon_anemo_0_avalon_slave_0_end_xfer <= avalon_anemo_0_avalon_slave_0_end_xfer;
    end if;

  end process;

  --avalon_anemo_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  avalon_anemo_0_avalon_slave_0_waits_for_read <= avalon_anemo_0_avalon_slave_0_in_a_read_cycle AND avalon_anemo_0_avalon_slave_0_begins_xfer;
  --avalon_anemo_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  avalon_anemo_0_avalon_slave_0_in_a_read_cycle <= internal_cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= avalon_anemo_0_avalon_slave_0_in_a_read_cycle;
  --avalon_anemo_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  avalon_anemo_0_avalon_slave_0_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(avalon_anemo_0_avalon_slave_0_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --avalon_anemo_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  avalon_anemo_0_avalon_slave_0_in_a_write_cycle <= internal_cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= avalon_anemo_0_avalon_slave_0_in_a_write_cycle;
  wait_for_avalon_anemo_0_avalon_slave_0_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 <= internal_cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 <= internal_cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0 <= internal_cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0;
--synthesis translate_off
    --avalon_anemo_0/avalon_slave_0 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity avalon_pwm_0_avalon_slave_0_arbitrator is 
        port (
              -- inputs:
                 signal avalon_pwm_0_avalon_slave_0_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal avalon_pwm_0_avalon_slave_0_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal avalon_pwm_0_avalon_slave_0_chipselect : OUT STD_LOGIC;
                 signal avalon_pwm_0_avalon_slave_0_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal avalon_pwm_0_avalon_slave_0_reset_n : OUT STD_LOGIC;
                 signal avalon_pwm_0_avalon_slave_0_write_n : OUT STD_LOGIC;
                 signal avalon_pwm_0_avalon_slave_0_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_avalon_pwm_0_avalon_slave_0 : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0 : OUT STD_LOGIC;
                 signal d1_avalon_pwm_0_avalon_slave_0_end_xfer : OUT STD_LOGIC
              );
end entity avalon_pwm_0_avalon_slave_0_arbitrator;


architecture europa of avalon_pwm_0_avalon_slave_0_arbitrator is
                signal avalon_pwm_0_avalon_slave_0_allgrants :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_allow_new_arb_cycle :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_any_bursting_master_saved_grant :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_any_continuerequest :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_arb_counter_enable :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_arb_share_counter :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_arb_share_counter_next_value :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_arb_share_set_values :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_beginbursttransfer_internal :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_begins_xfer :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_end_xfer :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_firsttransfer :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_grant_vector :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_in_a_read_cycle :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_in_a_write_cycle :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_master_qreq_vector :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_non_bursting_master_requests :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_reg_firsttransfer :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_slavearbiterlockenable :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_slavearbiterlockenable2 :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_unreg_firsttransfer :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_waits_for_read :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_waits_for_write :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_avalon_pwm_0_avalon_slave_0 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_avalon_pwm_0_avalon_slave_0 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0 :  STD_LOGIC;
                signal shifted_address_to_avalon_pwm_0_avalon_slave_0_from_cpu_0_data_master :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal wait_for_avalon_pwm_0_avalon_slave_0_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT avalon_pwm_0_avalon_slave_0_end_xfer;
    end if;

  end process;

  avalon_pwm_0_avalon_slave_0_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0);
  --assign avalon_pwm_0_avalon_slave_0_readdata_from_sa = avalon_pwm_0_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  avalon_pwm_0_avalon_slave_0_readdata_from_sa <= avalon_pwm_0_avalon_slave_0_readdata;
  internal_cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0 <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(16 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("10001000000100000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --avalon_pwm_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  avalon_pwm_0_avalon_slave_0_arb_share_set_values <= std_logic'('1');
  --avalon_pwm_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  avalon_pwm_0_avalon_slave_0_non_bursting_master_requests <= internal_cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0;
  --avalon_pwm_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  avalon_pwm_0_avalon_slave_0_any_bursting_master_saved_grant <= std_logic'('0');
  --avalon_pwm_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  avalon_pwm_0_avalon_slave_0_arb_share_counter_next_value <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(avalon_pwm_0_avalon_slave_0_firsttransfer) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(avalon_pwm_0_avalon_slave_0_arb_share_set_values))) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(avalon_pwm_0_avalon_slave_0_arb_share_counter) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(avalon_pwm_0_avalon_slave_0_arb_share_counter))) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))));
  --avalon_pwm_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  avalon_pwm_0_avalon_slave_0_allgrants <= avalon_pwm_0_avalon_slave_0_grant_vector;
  --avalon_pwm_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  avalon_pwm_0_avalon_slave_0_end_xfer <= NOT ((avalon_pwm_0_avalon_slave_0_waits_for_read OR avalon_pwm_0_avalon_slave_0_waits_for_write));
  --end_xfer_arb_share_counter_term_avalon_pwm_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_avalon_pwm_0_avalon_slave_0 <= avalon_pwm_0_avalon_slave_0_end_xfer AND (((NOT avalon_pwm_0_avalon_slave_0_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --avalon_pwm_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  avalon_pwm_0_avalon_slave_0_arb_counter_enable <= ((end_xfer_arb_share_counter_term_avalon_pwm_0_avalon_slave_0 AND avalon_pwm_0_avalon_slave_0_allgrants)) OR ((end_xfer_arb_share_counter_term_avalon_pwm_0_avalon_slave_0 AND NOT avalon_pwm_0_avalon_slave_0_non_bursting_master_requests));
  --avalon_pwm_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      avalon_pwm_0_avalon_slave_0_arb_share_counter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(avalon_pwm_0_avalon_slave_0_arb_counter_enable) = '1' then 
        avalon_pwm_0_avalon_slave_0_arb_share_counter <= avalon_pwm_0_avalon_slave_0_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --avalon_pwm_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      avalon_pwm_0_avalon_slave_0_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((avalon_pwm_0_avalon_slave_0_master_qreq_vector AND end_xfer_arb_share_counter_term_avalon_pwm_0_avalon_slave_0)) OR ((end_xfer_arb_share_counter_term_avalon_pwm_0_avalon_slave_0 AND NOT avalon_pwm_0_avalon_slave_0_non_bursting_master_requests)))) = '1' then 
        avalon_pwm_0_avalon_slave_0_slavearbiterlockenable <= avalon_pwm_0_avalon_slave_0_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --cpu_0/data_master avalon_pwm_0/avalon_slave_0 arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= avalon_pwm_0_avalon_slave_0_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --avalon_pwm_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  avalon_pwm_0_avalon_slave_0_slavearbiterlockenable2 <= avalon_pwm_0_avalon_slave_0_arb_share_counter_next_value;
  --cpu_0/data_master avalon_pwm_0/avalon_slave_0 arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= avalon_pwm_0_avalon_slave_0_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --avalon_pwm_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  avalon_pwm_0_avalon_slave_0_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 <= internal_cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0 AND NOT (((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write));
  --avalon_pwm_0_avalon_slave_0_writedata mux, which is an e_mux
  avalon_pwm_0_avalon_slave_0_writedata <= cpu_0_data_master_writedata;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 <= internal_cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0;
  --cpu_0/data_master saved-grant avalon_pwm_0/avalon_slave_0, which is an e_assign
  cpu_0_data_master_saved_grant_avalon_pwm_0_avalon_slave_0 <= internal_cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0;
  --allow new arb cycle for avalon_pwm_0/avalon_slave_0, which is an e_assign
  avalon_pwm_0_avalon_slave_0_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  avalon_pwm_0_avalon_slave_0_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  avalon_pwm_0_avalon_slave_0_master_qreq_vector <= std_logic'('1');
  --avalon_pwm_0_avalon_slave_0_reset_n assignment, which is an e_assign
  avalon_pwm_0_avalon_slave_0_reset_n <= reset_n;
  avalon_pwm_0_avalon_slave_0_chipselect <= internal_cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0;
  --avalon_pwm_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  avalon_pwm_0_avalon_slave_0_firsttransfer <= A_WE_StdLogic((std_logic'(avalon_pwm_0_avalon_slave_0_begins_xfer) = '1'), avalon_pwm_0_avalon_slave_0_unreg_firsttransfer, avalon_pwm_0_avalon_slave_0_reg_firsttransfer);
  --avalon_pwm_0_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  avalon_pwm_0_avalon_slave_0_unreg_firsttransfer <= NOT ((avalon_pwm_0_avalon_slave_0_slavearbiterlockenable AND avalon_pwm_0_avalon_slave_0_any_continuerequest));
  --avalon_pwm_0_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      avalon_pwm_0_avalon_slave_0_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(avalon_pwm_0_avalon_slave_0_begins_xfer) = '1' then 
        avalon_pwm_0_avalon_slave_0_reg_firsttransfer <= avalon_pwm_0_avalon_slave_0_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --avalon_pwm_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  avalon_pwm_0_avalon_slave_0_beginbursttransfer_internal <= avalon_pwm_0_avalon_slave_0_begins_xfer;
  --~avalon_pwm_0_avalon_slave_0_write_n assignment, which is an e_mux
  avalon_pwm_0_avalon_slave_0_write_n <= NOT ((internal_cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 AND cpu_0_data_master_write));
  shifted_address_to_avalon_pwm_0_avalon_slave_0_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --avalon_pwm_0_avalon_slave_0_address mux, which is an e_mux
  avalon_pwm_0_avalon_slave_0_address <= A_EXT (A_SRL(shifted_address_to_avalon_pwm_0_avalon_slave_0_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_avalon_pwm_0_avalon_slave_0_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_avalon_pwm_0_avalon_slave_0_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_avalon_pwm_0_avalon_slave_0_end_xfer <= avalon_pwm_0_avalon_slave_0_end_xfer;
    end if;

  end process;

  --avalon_pwm_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  avalon_pwm_0_avalon_slave_0_waits_for_read <= avalon_pwm_0_avalon_slave_0_in_a_read_cycle AND avalon_pwm_0_avalon_slave_0_begins_xfer;
  --avalon_pwm_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  avalon_pwm_0_avalon_slave_0_in_a_read_cycle <= internal_cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= avalon_pwm_0_avalon_slave_0_in_a_read_cycle;
  --avalon_pwm_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  avalon_pwm_0_avalon_slave_0_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(avalon_pwm_0_avalon_slave_0_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --avalon_pwm_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  avalon_pwm_0_avalon_slave_0_in_a_write_cycle <= internal_cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= avalon_pwm_0_avalon_slave_0_in_a_write_cycle;
  wait_for_avalon_pwm_0_avalon_slave_0_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 <= internal_cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 <= internal_cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0 <= internal_cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0;
--synthesis translate_off
    --avalon_pwm_0/avalon_slave_0 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity cpu_0_jtag_debug_module_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_0_data_master_debugaccess : IN STD_LOGIC;
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_instruction_master_read : IN STD_LOGIC;
                 signal cpu_0_jtag_debug_module_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_jtag_debug_module_resetrequest : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_0_data_master_granted_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_granted_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_requests_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_address : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
                 signal cpu_0_jtag_debug_module_begintransfer : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_0_jtag_debug_module_chipselect : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_debugaccess : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_jtag_debug_module_reset_n : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_resetrequest_from_sa : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_write : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d1_cpu_0_jtag_debug_module_end_xfer : OUT STD_LOGIC
              );
end entity cpu_0_jtag_debug_module_arbitrator;


architecture europa of cpu_0_jtag_debug_module_arbitrator is
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_instruction_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_instruction_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_instruction_master_continuerequest :  STD_LOGIC;
                signal cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_allgrants :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_allow_new_arb_cycle :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_any_bursting_master_saved_grant :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_any_continuerequest :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_arb_addend :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_jtag_debug_module_arb_counter_enable :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_arb_share_counter :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_arb_share_counter_next_value :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_arb_share_set_values :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_arb_winner :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_jtag_debug_module_arbitration_holdoff_internal :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_beginbursttransfer_internal :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_begins_xfer :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_chosen_master_double_vector :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal cpu_0_jtag_debug_module_chosen_master_rot_left :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_jtag_debug_module_end_xfer :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_firsttransfer :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_grant_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_jtag_debug_module_in_a_read_cycle :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_in_a_write_cycle :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_master_qreq_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_jtag_debug_module_non_bursting_master_requests :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_reg_firsttransfer :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_saved_chosen_master_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_jtag_debug_module_slavearbiterlockenable :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_slavearbiterlockenable2 :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_unreg_firsttransfer :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_waits_for_read :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_waits_for_write :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_granted_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal wait_for_cpu_0_jtag_debug_module_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT cpu_0_jtag_debug_module_end_xfer;
    end if;

  end process;

  cpu_0_jtag_debug_module_begins_xfer <= NOT d1_reasons_to_wait AND ((internal_cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module OR internal_cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module));
  --assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  cpu_0_jtag_debug_module_readdata_from_sa <= cpu_0_jtag_debug_module_readdata;
  internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(16 DOWNTO 11) & std_logic_vector'("00000000000")) = std_logic_vector'("10000100000000000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --cpu_0_jtag_debug_module_arb_share_counter set values, which is an e_mux
  cpu_0_jtag_debug_module_arb_share_set_values <= std_logic'('1');
  --cpu_0_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  cpu_0_jtag_debug_module_non_bursting_master_requests <= ((internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module OR internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) OR internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module) OR internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  --cpu_0_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  cpu_0_jtag_debug_module_any_bursting_master_saved_grant <= std_logic'('0');
  --cpu_0_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  cpu_0_jtag_debug_module_arb_share_counter_next_value <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_0_jtag_debug_module_firsttransfer) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_jtag_debug_module_arb_share_set_values))) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(cpu_0_jtag_debug_module_arb_share_counter) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_jtag_debug_module_arb_share_counter))) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))));
  --cpu_0_jtag_debug_module_allgrants all slave grants, which is an e_mux
  cpu_0_jtag_debug_module_allgrants <= (((or_reduce(cpu_0_jtag_debug_module_grant_vector)) OR (or_reduce(cpu_0_jtag_debug_module_grant_vector))) OR (or_reduce(cpu_0_jtag_debug_module_grant_vector))) OR (or_reduce(cpu_0_jtag_debug_module_grant_vector));
  --cpu_0_jtag_debug_module_end_xfer assignment, which is an e_assign
  cpu_0_jtag_debug_module_end_xfer <= NOT ((cpu_0_jtag_debug_module_waits_for_read OR cpu_0_jtag_debug_module_waits_for_write));
  --end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module <= cpu_0_jtag_debug_module_end_xfer AND (((NOT cpu_0_jtag_debug_module_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --cpu_0_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  cpu_0_jtag_debug_module_arb_counter_enable <= ((end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module AND cpu_0_jtag_debug_module_allgrants)) OR ((end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module AND NOT cpu_0_jtag_debug_module_non_bursting_master_requests));
  --cpu_0_jtag_debug_module_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_0_jtag_debug_module_arb_share_counter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(cpu_0_jtag_debug_module_arb_counter_enable) = '1' then 
        cpu_0_jtag_debug_module_arb_share_counter <= cpu_0_jtag_debug_module_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --cpu_0_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_0_jtag_debug_module_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((or_reduce(cpu_0_jtag_debug_module_master_qreq_vector) AND end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module)) OR ((end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module AND NOT cpu_0_jtag_debug_module_non_bursting_master_requests)))) = '1' then 
        cpu_0_jtag_debug_module_slavearbiterlockenable <= cpu_0_jtag_debug_module_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --cpu_0/data_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= cpu_0_jtag_debug_module_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --cpu_0_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  cpu_0_jtag_debug_module_slavearbiterlockenable2 <= cpu_0_jtag_debug_module_arb_share_counter_next_value;
  --cpu_0/data_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= cpu_0_jtag_debug_module_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  cpu_0_instruction_master_arbiterlock <= cpu_0_jtag_debug_module_slavearbiterlockenable AND cpu_0_instruction_master_continuerequest;
  --cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  cpu_0_instruction_master_arbiterlock2 <= cpu_0_jtag_debug_module_slavearbiterlockenable2 AND cpu_0_instruction_master_continuerequest;
  --cpu_0/instruction_master granted cpu_0/jtag_debug_module last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((cpu_0_jtag_debug_module_arbitration_holdoff_internal OR NOT internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module))))));
    end if;

  end process;

  --cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  cpu_0_instruction_master_continuerequest <= last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module AND internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  --cpu_0_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  cpu_0_jtag_debug_module_any_continuerequest <= cpu_0_instruction_master_continuerequest OR cpu_0_data_master_continuerequest;
  internal_cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module <= internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module AND NOT (((((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write)) OR cpu_0_instruction_master_arbiterlock));
  --cpu_0_jtag_debug_module_writedata mux, which is an e_mux
  cpu_0_jtag_debug_module_writedata <= cpu_0_data_master_writedata;
  internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module <= ((to_std_logic(((Std_Logic_Vector'(cpu_0_instruction_master_address_to_slave(16 DOWNTO 11) & std_logic_vector'("00000000000")) = std_logic_vector'("10000100000000000")))) AND (cpu_0_instruction_master_read))) AND cpu_0_instruction_master_read;
  --cpu_0/data_master granted cpu_0/jtag_debug_module last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((cpu_0_jtag_debug_module_arbitration_holdoff_internal OR NOT internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module))))));
    end if;

  end process;

  --cpu_0_data_master_continuerequest continued request, which is an e_mux
  cpu_0_data_master_continuerequest <= last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module AND internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  internal_cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module <= internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module AND NOT (cpu_0_data_master_arbiterlock);
  --allow new arb cycle for cpu_0/jtag_debug_module, which is an e_assign
  cpu_0_jtag_debug_module_allow_new_arb_cycle <= NOT cpu_0_data_master_arbiterlock AND NOT cpu_0_instruction_master_arbiterlock;
  --cpu_0/instruction_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  cpu_0_jtag_debug_module_master_qreq_vector(0) <= internal_cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  --cpu_0/instruction_master grant cpu_0/jtag_debug_module, which is an e_assign
  internal_cpu_0_instruction_master_granted_cpu_0_jtag_debug_module <= cpu_0_jtag_debug_module_grant_vector(0);
  --cpu_0/instruction_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module <= cpu_0_jtag_debug_module_arb_winner(0) AND internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  --cpu_0/data_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  cpu_0_jtag_debug_module_master_qreq_vector(1) <= internal_cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  --cpu_0/data_master grant cpu_0/jtag_debug_module, which is an e_assign
  internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module <= cpu_0_jtag_debug_module_grant_vector(1);
  --cpu_0/data_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module <= cpu_0_jtag_debug_module_arb_winner(1) AND internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  --cpu_0/jtag_debug_module chosen-master double-vector, which is an e_assign
  cpu_0_jtag_debug_module_chosen_master_double_vector <= A_EXT (((std_logic_vector'("0") & ((cpu_0_jtag_debug_module_master_qreq_vector & cpu_0_jtag_debug_module_master_qreq_vector))) AND (((std_logic_vector'("0") & (Std_Logic_Vector'(NOT cpu_0_jtag_debug_module_master_qreq_vector & NOT cpu_0_jtag_debug_module_master_qreq_vector))) + (std_logic_vector'("000") & (cpu_0_jtag_debug_module_arb_addend))))), 4);
  --stable onehot encoding of arb winner
  cpu_0_jtag_debug_module_arb_winner <= A_WE_StdLogicVector((std_logic'(((cpu_0_jtag_debug_module_allow_new_arb_cycle AND or_reduce(cpu_0_jtag_debug_module_grant_vector)))) = '1'), cpu_0_jtag_debug_module_grant_vector, cpu_0_jtag_debug_module_saved_chosen_master_vector);
  --saved cpu_0_jtag_debug_module_grant_vector, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_0_jtag_debug_module_saved_chosen_master_vector <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      if std_logic'(cpu_0_jtag_debug_module_allow_new_arb_cycle) = '1' then 
        cpu_0_jtag_debug_module_saved_chosen_master_vector <= A_WE_StdLogicVector((std_logic'(or_reduce(cpu_0_jtag_debug_module_grant_vector)) = '1'), cpu_0_jtag_debug_module_grant_vector, cpu_0_jtag_debug_module_saved_chosen_master_vector);
      end if;
    end if;

  end process;

  --onehot encoding of chosen master
  cpu_0_jtag_debug_module_grant_vector <= Std_Logic_Vector'(A_ToStdLogicVector(((cpu_0_jtag_debug_module_chosen_master_double_vector(1) OR cpu_0_jtag_debug_module_chosen_master_double_vector(3)))) & A_ToStdLogicVector(((cpu_0_jtag_debug_module_chosen_master_double_vector(0) OR cpu_0_jtag_debug_module_chosen_master_double_vector(2)))));
  --cpu_0/jtag_debug_module chosen master rotated left, which is an e_assign
  cpu_0_jtag_debug_module_chosen_master_rot_left <= A_EXT (A_WE_StdLogicVector((((A_SLL(cpu_0_jtag_debug_module_arb_winner,std_logic_vector'("00000000000000000000000000000001")))) /= std_logic_vector'("00")), (std_logic_vector'("000000000000000000000000000000") & ((A_SLL(cpu_0_jtag_debug_module_arb_winner,std_logic_vector'("00000000000000000000000000000001"))))), std_logic_vector'("00000000000000000000000000000001")), 2);
  --cpu_0/jtag_debug_module's addend for next-master-grant
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_0_jtag_debug_module_arb_addend <= std_logic_vector'("01");
    elsif clk'event and clk = '1' then
      if std_logic'(or_reduce(cpu_0_jtag_debug_module_grant_vector)) = '1' then 
        cpu_0_jtag_debug_module_arb_addend <= A_WE_StdLogicVector((std_logic'(cpu_0_jtag_debug_module_end_xfer) = '1'), cpu_0_jtag_debug_module_chosen_master_rot_left, cpu_0_jtag_debug_module_grant_vector);
      end if;
    end if;

  end process;

  cpu_0_jtag_debug_module_begintransfer <= cpu_0_jtag_debug_module_begins_xfer;
  --cpu_0_jtag_debug_module_reset_n assignment, which is an e_assign
  cpu_0_jtag_debug_module_reset_n <= reset_n;
  --assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  cpu_0_jtag_debug_module_resetrequest_from_sa <= cpu_0_jtag_debug_module_resetrequest;
  cpu_0_jtag_debug_module_chipselect <= internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module OR internal_cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  --cpu_0_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  cpu_0_jtag_debug_module_firsttransfer <= A_WE_StdLogic((std_logic'(cpu_0_jtag_debug_module_begins_xfer) = '1'), cpu_0_jtag_debug_module_unreg_firsttransfer, cpu_0_jtag_debug_module_reg_firsttransfer);
  --cpu_0_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  cpu_0_jtag_debug_module_unreg_firsttransfer <= NOT ((cpu_0_jtag_debug_module_slavearbiterlockenable AND cpu_0_jtag_debug_module_any_continuerequest));
  --cpu_0_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_0_jtag_debug_module_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(cpu_0_jtag_debug_module_begins_xfer) = '1' then 
        cpu_0_jtag_debug_module_reg_firsttransfer <= cpu_0_jtag_debug_module_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --cpu_0_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  cpu_0_jtag_debug_module_beginbursttransfer_internal <= cpu_0_jtag_debug_module_begins_xfer;
  --cpu_0_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  cpu_0_jtag_debug_module_arbitration_holdoff_internal <= cpu_0_jtag_debug_module_begins_xfer AND cpu_0_jtag_debug_module_firsttransfer;
  --cpu_0_jtag_debug_module_write assignment, which is an e_mux
  cpu_0_jtag_debug_module_write <= internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module AND cpu_0_data_master_write;
  shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --cpu_0_jtag_debug_module_address mux, which is an e_mux
  cpu_0_jtag_debug_module_address <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module)) = '1'), (A_SRL(shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010"))), (A_SRL(shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master,std_logic_vector'("00000000000000000000000000000010")))), 9);
  shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master <= cpu_0_instruction_master_address_to_slave;
  --d1_cpu_0_jtag_debug_module_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_cpu_0_jtag_debug_module_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_cpu_0_jtag_debug_module_end_xfer <= cpu_0_jtag_debug_module_end_xfer;
    end if;

  end process;

  --cpu_0_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  cpu_0_jtag_debug_module_waits_for_read <= cpu_0_jtag_debug_module_in_a_read_cycle AND cpu_0_jtag_debug_module_begins_xfer;
  --cpu_0_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  cpu_0_jtag_debug_module_in_a_read_cycle <= ((internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module AND cpu_0_data_master_read)) OR ((internal_cpu_0_instruction_master_granted_cpu_0_jtag_debug_module AND cpu_0_instruction_master_read));
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= cpu_0_jtag_debug_module_in_a_read_cycle;
  --cpu_0_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  cpu_0_jtag_debug_module_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_jtag_debug_module_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --cpu_0_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  cpu_0_jtag_debug_module_in_a_write_cycle <= internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= cpu_0_jtag_debug_module_in_a_write_cycle;
  wait_for_cpu_0_jtag_debug_module_counter <= std_logic'('0');
  --cpu_0_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  cpu_0_jtag_debug_module_byteenable <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_0_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))), 4);
  --debugaccess mux, which is an e_mux
  cpu_0_jtag_debug_module_debugaccess <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module)) = '1'), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_debugaccess))), std_logic_vector'("00000000000000000000000000000000")));
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_cpu_0_jtag_debug_module <= internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module <= internal_cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_cpu_0_jtag_debug_module <= internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_granted_cpu_0_jtag_debug_module <= internal_cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module <= internal_cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_requests_cpu_0_jtag_debug_module <= internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
--synthesis translate_off
    --cpu_0/jtag_debug_module enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

    --grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_0_instruction_master_granted_cpu_0_jtag_debug_module))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line, now);
          write(write_line, string'(": "));
          write(write_line, string'("> 1 of grant signals are active simultaneously"));
          write(output, write_line.all);
          deallocate (write_line);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --saved_grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line1 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line1, now);
          write(write_line1, string'(": "));
          write(write_line1, string'("> 1 of saved_grant signals are active simultaneously"));
          write(output, write_line1.all);
          deallocate (write_line1);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_data_master_arbitrator is 
        port (
              -- inputs:
                 signal Avalon_F7_0_avalon_slave_0_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal Boutons_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal LEDs_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal avalon_anemo_0_avalon_slave_0_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal avalon_pwm_0_avalon_slave_0_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_Boutons_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_LEDs_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_onchip_memory2_0_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_sysid_0_control_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_Boutons_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_LEDs_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_onchip_memory2_0_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_sysid_0_control_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_Avalon_F7_0_avalon_slave_0 : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_Boutons_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_LEDs_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_avalon_anemo_0_avalon_slave_0 : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_avalon_pwm_0_avalon_slave_0 : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_sysid_0_control_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0 : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_Boutons_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_LEDs_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0 : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0 : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_onchip_memory2_0_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_sysid_0_control_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_jtag_debug_module_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d1_Avalon_F7_0_avalon_slave_0_end_xfer : IN STD_LOGIC;
                 signal d1_Boutons_s1_end_xfer : IN STD_LOGIC;
                 signal d1_LEDs_s1_end_xfer : IN STD_LOGIC;
                 signal d1_avalon_anemo_0_avalon_slave_0_end_xfer : IN STD_LOGIC;
                 signal d1_avalon_pwm_0_avalon_slave_0_end_xfer : IN STD_LOGIC;
                 signal d1_cpu_0_jtag_debug_module_end_xfer : IN STD_LOGIC;
                 signal d1_jtag_uart_0_avalon_jtag_slave_end_xfer : IN STD_LOGIC;
                 signal d1_onchip_memory2_0_s1_end_xfer : IN STD_LOGIC;
                 signal d1_sysid_0_control_slave_end_xfer : IN STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_irq_from_sa : IN STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa : IN STD_LOGIC;
                 signal onchip_memory2_0_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sysid_0_control_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

              -- outputs:
                 signal cpu_0_data_master_address_to_slave : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_data_master_irq : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_data_master_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_data_master_waitrequest : OUT STD_LOGIC
              );
end entity cpu_0_data_master_arbitrator;


architecture europa of cpu_0_data_master_arbitrator is
                signal cpu_0_data_master_run :  STD_LOGIC;
                signal internal_cpu_0_data_master_address_to_slave :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal internal_cpu_0_data_master_waitrequest :  STD_LOGIC;
                signal p1_registered_cpu_0_data_master_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal r_0 :  STD_LOGIC;
                signal r_1 :  STD_LOGIC;
                signal registered_cpu_0_data_master_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);

begin

  --r_0 master_run cascaded wait assignment, which is an e_assign
  r_0 <= Vector_To_Std_Logic((((((((((((((((((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 OR NOT cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_Boutons_s1 OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_Boutons_s1 OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_qualified_request_LEDs_s1 OR NOT cpu_0_data_master_requests_LEDs_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_LEDs_s1 OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_LEDs_s1 OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 OR NOT cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 OR NOT cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")));
  --cascaded wait assignment, which is an e_assign
  cpu_0_data_master_run <= r_0 AND r_1;
  --r_1 master_run cascaded wait assignment, which is an e_assign
  r_1 <= Vector_To_Std_Logic((((((((((((((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module OR NOT cpu_0_data_master_requests_cpu_0_jtag_debug_module)) AND ((cpu_0_data_master_granted_cpu_0_jtag_debug_module OR NOT cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave OR NOT cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave OR NOT ((cpu_0_data_master_read OR cpu_0_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_read OR cpu_0_data_master_write)))))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave OR NOT ((cpu_0_data_master_read OR cpu_0_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_read OR cpu_0_data_master_write)))))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((cpu_0_data_master_qualified_request_onchip_memory2_0_s1 OR registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1) OR NOT cpu_0_data_master_requests_onchip_memory2_0_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_granted_onchip_memory2_0_s1 OR NOT cpu_0_data_master_qualified_request_onchip_memory2_0_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((NOT cpu_0_data_master_qualified_request_onchip_memory2_0_s1 OR NOT cpu_0_data_master_read) OR ((registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 AND cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_onchip_memory2_0_s1 OR NOT ((cpu_0_data_master_read OR cpu_0_data_master_write)))))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_read OR cpu_0_data_master_write)))))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_sysid_0_control_slave OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_sysid_0_control_slave OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))));
  --optimize select-logic by passing only those address bits which matter.
  internal_cpu_0_data_master_address_to_slave <= cpu_0_data_master_address(16 DOWNTO 0);
  --cpu_0/data_master readdata mux, which is an e_mux
  cpu_0_data_master_readdata <= (((((((((A_REP(NOT cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0, 32) OR Avalon_F7_0_avalon_slave_0_readdata_from_sa)) AND ((A_REP(NOT cpu_0_data_master_requests_Boutons_s1, 32) OR Boutons_s1_readdata_from_sa))) AND ((A_REP(NOT cpu_0_data_master_requests_LEDs_s1, 32) OR LEDs_s1_readdata_from_sa))) AND ((A_REP(NOT cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0, 32) OR avalon_anemo_0_avalon_slave_0_readdata_from_sa))) AND ((A_REP(NOT cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0, 32) OR avalon_pwm_0_avalon_slave_0_readdata_from_sa))) AND ((A_REP(NOT cpu_0_data_master_requests_cpu_0_jtag_debug_module, 32) OR cpu_0_jtag_debug_module_readdata_from_sa))) AND ((A_REP(NOT cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave, 32) OR registered_cpu_0_data_master_readdata))) AND ((A_REP(NOT cpu_0_data_master_requests_onchip_memory2_0_s1, 32) OR onchip_memory2_0_s1_readdata_from_sa))) AND ((A_REP(NOT cpu_0_data_master_requests_sysid_0_control_slave, 32) OR sysid_0_control_slave_readdata_from_sa));
  --actual waitrequest port, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_cpu_0_data_master_waitrequest <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '1' then
      internal_cpu_0_data_master_waitrequest <= Vector_To_Std_Logic(NOT (A_WE_StdLogicVector((std_logic'((NOT ((cpu_0_data_master_read OR cpu_0_data_master_write)))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_run AND internal_cpu_0_data_master_waitrequest))))))));
    end if;

  end process;

  --unpredictable registered wait state incoming data, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      registered_cpu_0_data_master_readdata <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      registered_cpu_0_data_master_readdata <= p1_registered_cpu_0_data_master_readdata;
    end if;

  end process;

  --registered readdata mux, which is an e_mux
  p1_registered_cpu_0_data_master_readdata <= A_REP(NOT cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave, 32) OR jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  --irq assign, which is an e_assign
  cpu_0_data_master_irq <= Std_Logic_Vector'(A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(jtag_uart_0_avalon_jtag_slave_irq_from_sa) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')));
  --vhdl renameroo for output signals
  cpu_0_data_master_address_to_slave <= internal_cpu_0_data_master_address_to_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_waitrequest <= internal_cpu_0_data_master_waitrequest;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity cpu_0_instruction_master_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_instruction_master_address : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_instruction_master_granted_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_instruction_master_granted_onchip_memory2_0_s1 : IN STD_LOGIC;
                 signal cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 : IN STD_LOGIC;
                 signal cpu_0_instruction_master_read : IN STD_LOGIC;
                 signal cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 : IN STD_LOGIC;
                 signal cpu_0_instruction_master_requests_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_instruction_master_requests_onchip_memory2_0_s1 : IN STD_LOGIC;
                 signal cpu_0_jtag_debug_module_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d1_cpu_0_jtag_debug_module_end_xfer : IN STD_LOGIC;
                 signal d1_onchip_memory2_0_s1_end_xfer : IN STD_LOGIC;
                 signal onchip_memory2_0_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_0_instruction_master_address_to_slave : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_instruction_master_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_instruction_master_waitrequest : OUT STD_LOGIC
              );
end entity cpu_0_instruction_master_arbitrator;


architecture europa of cpu_0_instruction_master_arbitrator is
                signal active_and_waiting_last_time :  STD_LOGIC;
                signal cpu_0_instruction_master_address_last_time :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal cpu_0_instruction_master_read_last_time :  STD_LOGIC;
                signal cpu_0_instruction_master_run :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_address_to_slave :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal internal_cpu_0_instruction_master_waitrequest :  STD_LOGIC;
                signal r_1 :  STD_LOGIC;

begin

  --r_1 master_run cascaded wait assignment, which is an e_assign
  r_1 <= Vector_To_Std_Logic((((((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module OR NOT cpu_0_instruction_master_requests_cpu_0_jtag_debug_module)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_instruction_master_granted_cpu_0_jtag_debug_module OR NOT cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module OR NOT cpu_0_instruction_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT d1_cpu_0_jtag_debug_module_end_xfer)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_instruction_master_read)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 OR cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1) OR NOT cpu_0_instruction_master_requests_onchip_memory2_0_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_instruction_master_granted_onchip_memory2_0_s1 OR NOT cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((NOT cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 OR NOT cpu_0_instruction_master_read) OR ((cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 AND cpu_0_instruction_master_read)))))))));
  --cascaded wait assignment, which is an e_assign
  cpu_0_instruction_master_run <= r_1;
  --optimize select-logic by passing only those address bits which matter.
  internal_cpu_0_instruction_master_address_to_slave <= cpu_0_instruction_master_address(16 DOWNTO 0);
  --cpu_0/instruction_master readdata mux, which is an e_mux
  cpu_0_instruction_master_readdata <= ((A_REP(NOT cpu_0_instruction_master_requests_cpu_0_jtag_debug_module, 32) OR cpu_0_jtag_debug_module_readdata_from_sa)) AND ((A_REP(NOT cpu_0_instruction_master_requests_onchip_memory2_0_s1, 32) OR onchip_memory2_0_s1_readdata_from_sa));
  --actual waitrequest port, which is an e_assign
  internal_cpu_0_instruction_master_waitrequest <= NOT cpu_0_instruction_master_run;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_address_to_slave <= internal_cpu_0_instruction_master_address_to_slave;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_waitrequest <= internal_cpu_0_instruction_master_waitrequest;
--synthesis translate_off
    --cpu_0_instruction_master_address check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        cpu_0_instruction_master_address_last_time <= std_logic_vector'("00000000000000000");
      elsif clk'event and clk = '1' then
        cpu_0_instruction_master_address_last_time <= cpu_0_instruction_master_address;
      end if;

    end process;

    --cpu_0/instruction_master waited last time, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        active_and_waiting_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        active_and_waiting_last_time <= internal_cpu_0_instruction_master_waitrequest AND (cpu_0_instruction_master_read);
      end if;

    end process;

    --cpu_0_instruction_master_address matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line2 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((cpu_0_instruction_master_address /= cpu_0_instruction_master_address_last_time))))) = '1' then 
          write(write_line2, now);
          write(write_line2, string'(": "));
          write(write_line2, string'("cpu_0_instruction_master_address did not heed wait!!!"));
          write(output, write_line2.all);
          deallocate (write_line2);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --cpu_0_instruction_master_read check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        cpu_0_instruction_master_read_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        cpu_0_instruction_master_read_last_time <= cpu_0_instruction_master_read;
      end if;

    end process;

    --cpu_0_instruction_master_read matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line3 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((std_logic'(cpu_0_instruction_master_read) /= std_logic'(cpu_0_instruction_master_read_last_time)))))) = '1' then 
          write(write_line3, now);
          write(write_line3, string'(": "));
          write(write_line3, string'("cpu_0_instruction_master_read did not heed wait!!!"));
          write(output, write_line3.all);
          deallocate (write_line3);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity jtag_uart_0_avalon_jtag_slave_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_uart_0_avalon_jtag_slave_dataavailable : IN STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_irq : IN STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_uart_0_avalon_jtag_slave_readyfordata : IN STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_waitrequest : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                 signal d1_jtag_uart_0_avalon_jtag_slave_end_xfer : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_address : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_chipselect : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_irq_from_sa : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_read_n : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_reset_n : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_write_n : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity jtag_uart_0_avalon_jtag_slave_arbitrator;


architecture europa of jtag_uart_0_avalon_jtag_slave_arbitrator is
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal internal_jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_allgrants :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_any_continuerequest :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_arb_counter_enable :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_arb_share_counter :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_arb_share_set_values :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_begins_xfer :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_end_xfer :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_firsttransfer :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_grant_vector :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_in_a_read_cycle :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_in_a_write_cycle :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_master_qreq_vector :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_reg_firsttransfer :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_waits_for_read :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_waits_for_write :  STD_LOGIC;
                signal shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal wait_for_jtag_uart_0_avalon_jtag_slave_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT jtag_uart_0_avalon_jtag_slave_end_xfer;
    end if;

  end process;

  jtag_uart_0_avalon_jtag_slave_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave);
  --assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_readdata_from_sa <= jtag_uart_0_avalon_jtag_slave_readdata;
  internal_cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(16 DOWNTO 3) & std_logic_vector'("000")) = std_logic_vector'("10001000001010000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa <= jtag_uart_0_avalon_jtag_slave_dataavailable;
  --assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa <= jtag_uart_0_avalon_jtag_slave_readyfordata;
  --assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  internal_jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa <= jtag_uart_0_avalon_jtag_slave_waitrequest;
  --jtag_uart_0_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_arb_share_set_values <= std_logic'('1');
  --jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests <= internal_cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  --jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant <= std_logic'('0');
  --jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(jtag_uart_0_avalon_jtag_slave_firsttransfer) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(jtag_uart_0_avalon_jtag_slave_arb_share_set_values))) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(jtag_uart_0_avalon_jtag_slave_arb_share_counter) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(jtag_uart_0_avalon_jtag_slave_arb_share_counter))) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))));
  --jtag_uart_0_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_allgrants <= jtag_uart_0_avalon_jtag_slave_grant_vector;
  --jtag_uart_0_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_end_xfer <= NOT ((jtag_uart_0_avalon_jtag_slave_waits_for_read OR jtag_uart_0_avalon_jtag_slave_waits_for_write));
  --end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave <= jtag_uart_0_avalon_jtag_slave_end_xfer AND (((NOT jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --jtag_uart_0_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_arb_counter_enable <= ((end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave AND jtag_uart_0_avalon_jtag_slave_allgrants)) OR ((end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave AND NOT jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests));
  --jtag_uart_0_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      jtag_uart_0_avalon_jtag_slave_arb_share_counter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(jtag_uart_0_avalon_jtag_slave_arb_counter_enable) = '1' then 
        jtag_uart_0_avalon_jtag_slave_arb_share_counter <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((jtag_uart_0_avalon_jtag_slave_master_qreq_vector AND end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave)) OR ((end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave AND NOT jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests)))) = '1' then 
        jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
  --cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --jtag_uart_0_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave <= internal_cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave AND NOT ((((cpu_0_data_master_read AND (NOT cpu_0_data_master_waitrequest))) OR (((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write))));
  --jtag_uart_0_avalon_jtag_slave_writedata mux, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_writedata <= cpu_0_data_master_writedata;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave <= internal_cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  --cpu_0/data_master saved-grant jtag_uart_0/avalon_jtag_slave, which is an e_assign
  cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave <= internal_cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  --allow new arb cycle for jtag_uart_0/avalon_jtag_slave, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  jtag_uart_0_avalon_jtag_slave_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  jtag_uart_0_avalon_jtag_slave_master_qreq_vector <= std_logic'('1');
  --jtag_uart_0_avalon_jtag_slave_reset_n assignment, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_reset_n <= reset_n;
  jtag_uart_0_avalon_jtag_slave_chipselect <= internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  --jtag_uart_0_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_firsttransfer <= A_WE_StdLogic((std_logic'(jtag_uart_0_avalon_jtag_slave_begins_xfer) = '1'), jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer, jtag_uart_0_avalon_jtag_slave_reg_firsttransfer);
  --jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer <= NOT ((jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable AND jtag_uart_0_avalon_jtag_slave_any_continuerequest));
  --jtag_uart_0_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(jtag_uart_0_avalon_jtag_slave_begins_xfer) = '1' then 
        jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal <= jtag_uart_0_avalon_jtag_slave_begins_xfer;
  --~jtag_uart_0_avalon_jtag_slave_read_n assignment, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_read_n <= NOT ((internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave AND cpu_0_data_master_read));
  --~jtag_uart_0_avalon_jtag_slave_write_n assignment, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_write_n <= NOT ((internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave AND cpu_0_data_master_write));
  shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --jtag_uart_0_avalon_jtag_slave_address mux, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_address <= Vector_To_Std_Logic(A_SRL(shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")));
  --d1_jtag_uart_0_avalon_jtag_slave_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= jtag_uart_0_avalon_jtag_slave_end_xfer;
    end if;

  end process;

  --jtag_uart_0_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_waits_for_read <= jtag_uart_0_avalon_jtag_slave_in_a_read_cycle AND internal_jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  --jtag_uart_0_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_in_a_read_cycle <= internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;
  --jtag_uart_0_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_waits_for_write <= jtag_uart_0_avalon_jtag_slave_in_a_write_cycle AND internal_jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  --jtag_uart_0_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_in_a_write_cycle <= internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;
  wait_for_jtag_uart_0_avalon_jtag_slave_counter <= std_logic'('0');
  --assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_irq_from_sa <= jtag_uart_0_avalon_jtag_slave_irq;
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave <= internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave <= internal_cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave <= internal_cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  --vhdl renameroo for output signals
  jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa <= internal_jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
--synthesis translate_off
    --jtag_uart_0/avalon_jtag_slave enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity onchip_memory2_0_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_instruction_master_read : IN STD_LOGIC;
                 signal onchip_memory2_0_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_0_data_master_granted_onchip_memory2_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_onchip_memory2_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_onchip_memory2_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_granted_onchip_memory2_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_requests_onchip_memory2_0_s1 : OUT STD_LOGIC;
                 signal d1_onchip_memory2_0_s1_end_xfer : OUT STD_LOGIC;
                 signal onchip_memory2_0_s1_address : OUT STD_LOGIC_VECTOR (12 DOWNTO 0);
                 signal onchip_memory2_0_s1_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal onchip_memory2_0_s1_chipselect : OUT STD_LOGIC;
                 signal onchip_memory2_0_s1_clken : OUT STD_LOGIC;
                 signal onchip_memory2_0_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal onchip_memory2_0_s1_reset : OUT STD_LOGIC;
                 signal onchip_memory2_0_s1_write : OUT STD_LOGIC;
                 signal onchip_memory2_0_s1_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 : OUT STD_LOGIC
              );
end entity onchip_memory2_0_s1_arbitrator;


architecture europa of onchip_memory2_0_s1_arbitrator is
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_onchip_memory2_0_s1 :  STD_LOGIC;
                signal cpu_0_instruction_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_instruction_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_instruction_master_continuerequest :  STD_LOGIC;
                signal cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register :  STD_LOGIC;
                signal cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register_in :  STD_LOGIC;
                signal cpu_0_instruction_master_saved_grant_onchip_memory2_0_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_onchip_memory2_0_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_onchip_memory2_0_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_onchip_memory2_0_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_onchip_memory2_0_s1 :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_granted_onchip_memory2_0_s1 :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_requests_onchip_memory2_0_s1 :  STD_LOGIC;
                signal last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1 :  STD_LOGIC;
                signal last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1 :  STD_LOGIC;
                signal onchip_memory2_0_s1_allgrants :  STD_LOGIC;
                signal onchip_memory2_0_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal onchip_memory2_0_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal onchip_memory2_0_s1_any_continuerequest :  STD_LOGIC;
                signal onchip_memory2_0_s1_arb_addend :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal onchip_memory2_0_s1_arb_counter_enable :  STD_LOGIC;
                signal onchip_memory2_0_s1_arb_share_counter :  STD_LOGIC;
                signal onchip_memory2_0_s1_arb_share_counter_next_value :  STD_LOGIC;
                signal onchip_memory2_0_s1_arb_share_set_values :  STD_LOGIC;
                signal onchip_memory2_0_s1_arb_winner :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal onchip_memory2_0_s1_arbitration_holdoff_internal :  STD_LOGIC;
                signal onchip_memory2_0_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal onchip_memory2_0_s1_begins_xfer :  STD_LOGIC;
                signal onchip_memory2_0_s1_chosen_master_double_vector :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal onchip_memory2_0_s1_chosen_master_rot_left :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal onchip_memory2_0_s1_end_xfer :  STD_LOGIC;
                signal onchip_memory2_0_s1_firsttransfer :  STD_LOGIC;
                signal onchip_memory2_0_s1_grant_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal onchip_memory2_0_s1_in_a_read_cycle :  STD_LOGIC;
                signal onchip_memory2_0_s1_in_a_write_cycle :  STD_LOGIC;
                signal onchip_memory2_0_s1_master_qreq_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal onchip_memory2_0_s1_non_bursting_master_requests :  STD_LOGIC;
                signal onchip_memory2_0_s1_reg_firsttransfer :  STD_LOGIC;
                signal onchip_memory2_0_s1_saved_chosen_master_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal onchip_memory2_0_s1_slavearbiterlockenable :  STD_LOGIC;
                signal onchip_memory2_0_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal onchip_memory2_0_s1_unreg_firsttransfer :  STD_LOGIC;
                signal onchip_memory2_0_s1_waits_for_read :  STD_LOGIC;
                signal onchip_memory2_0_s1_waits_for_write :  STD_LOGIC;
                signal p1_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register :  STD_LOGIC;
                signal p1_cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register :  STD_LOGIC;
                signal shifted_address_to_onchip_memory2_0_s1_from_cpu_0_data_master :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal shifted_address_to_onchip_memory2_0_s1_from_cpu_0_instruction_master :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal wait_for_onchip_memory2_0_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT onchip_memory2_0_s1_end_xfer;
    end if;

  end process;

  onchip_memory2_0_s1_begins_xfer <= NOT d1_reasons_to_wait AND ((internal_cpu_0_data_master_qualified_request_onchip_memory2_0_s1 OR internal_cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1));
  --assign onchip_memory2_0_s1_readdata_from_sa = onchip_memory2_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  onchip_memory2_0_s1_readdata_from_sa <= onchip_memory2_0_s1_readdata;
  internal_cpu_0_data_master_requests_onchip_memory2_0_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(16 DOWNTO 15) & std_logic_vector'("000000000000000")) = std_logic_vector'("01000000000000000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --registered rdv signal_name registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 assignment, which is an e_assign
  registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 <= cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in;
  --onchip_memory2_0_s1_arb_share_counter set values, which is an e_mux
  onchip_memory2_0_s1_arb_share_set_values <= std_logic'('1');
  --onchip_memory2_0_s1_non_bursting_master_requests mux, which is an e_mux
  onchip_memory2_0_s1_non_bursting_master_requests <= ((internal_cpu_0_data_master_requests_onchip_memory2_0_s1 OR internal_cpu_0_instruction_master_requests_onchip_memory2_0_s1) OR internal_cpu_0_data_master_requests_onchip_memory2_0_s1) OR internal_cpu_0_instruction_master_requests_onchip_memory2_0_s1;
  --onchip_memory2_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  onchip_memory2_0_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --onchip_memory2_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  onchip_memory2_0_s1_arb_share_counter_next_value <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(onchip_memory2_0_s1_firsttransfer) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(onchip_memory2_0_s1_arb_share_set_values))) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(onchip_memory2_0_s1_arb_share_counter) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(onchip_memory2_0_s1_arb_share_counter))) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))));
  --onchip_memory2_0_s1_allgrants all slave grants, which is an e_mux
  onchip_memory2_0_s1_allgrants <= (((or_reduce(onchip_memory2_0_s1_grant_vector)) OR (or_reduce(onchip_memory2_0_s1_grant_vector))) OR (or_reduce(onchip_memory2_0_s1_grant_vector))) OR (or_reduce(onchip_memory2_0_s1_grant_vector));
  --onchip_memory2_0_s1_end_xfer assignment, which is an e_assign
  onchip_memory2_0_s1_end_xfer <= NOT ((onchip_memory2_0_s1_waits_for_read OR onchip_memory2_0_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_onchip_memory2_0_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_onchip_memory2_0_s1 <= onchip_memory2_0_s1_end_xfer AND (((NOT onchip_memory2_0_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --onchip_memory2_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  onchip_memory2_0_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_onchip_memory2_0_s1 AND onchip_memory2_0_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_onchip_memory2_0_s1 AND NOT onchip_memory2_0_s1_non_bursting_master_requests));
  --onchip_memory2_0_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      onchip_memory2_0_s1_arb_share_counter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(onchip_memory2_0_s1_arb_counter_enable) = '1' then 
        onchip_memory2_0_s1_arb_share_counter <= onchip_memory2_0_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --onchip_memory2_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      onchip_memory2_0_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((or_reduce(onchip_memory2_0_s1_master_qreq_vector) AND end_xfer_arb_share_counter_term_onchip_memory2_0_s1)) OR ((end_xfer_arb_share_counter_term_onchip_memory2_0_s1 AND NOT onchip_memory2_0_s1_non_bursting_master_requests)))) = '1' then 
        onchip_memory2_0_s1_slavearbiterlockenable <= onchip_memory2_0_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --cpu_0/data_master onchip_memory2_0/s1 arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= onchip_memory2_0_s1_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --onchip_memory2_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  onchip_memory2_0_s1_slavearbiterlockenable2 <= onchip_memory2_0_s1_arb_share_counter_next_value;
  --cpu_0/data_master onchip_memory2_0/s1 arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= onchip_memory2_0_s1_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --cpu_0/instruction_master onchip_memory2_0/s1 arbiterlock, which is an e_assign
  cpu_0_instruction_master_arbiterlock <= onchip_memory2_0_s1_slavearbiterlockenable AND cpu_0_instruction_master_continuerequest;
  --cpu_0/instruction_master onchip_memory2_0/s1 arbiterlock2, which is an e_assign
  cpu_0_instruction_master_arbiterlock2 <= onchip_memory2_0_s1_slavearbiterlockenable2 AND cpu_0_instruction_master_continuerequest;
  --cpu_0/instruction_master granted onchip_memory2_0/s1 last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_0_instruction_master_saved_grant_onchip_memory2_0_s1) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((onchip_memory2_0_s1_arbitration_holdoff_internal OR NOT internal_cpu_0_instruction_master_requests_onchip_memory2_0_s1))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1))))));
    end if;

  end process;

  --cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  cpu_0_instruction_master_continuerequest <= last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1 AND internal_cpu_0_instruction_master_requests_onchip_memory2_0_s1;
  --onchip_memory2_0_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  onchip_memory2_0_s1_any_continuerequest <= cpu_0_instruction_master_continuerequest OR cpu_0_data_master_continuerequest;
  internal_cpu_0_data_master_qualified_request_onchip_memory2_0_s1 <= internal_cpu_0_data_master_requests_onchip_memory2_0_s1 AND NOT (((((cpu_0_data_master_read AND (cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register))) OR (((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write))) OR cpu_0_instruction_master_arbiterlock));
  --cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in <= ((internal_cpu_0_data_master_granted_onchip_memory2_0_s1 AND cpu_0_data_master_read) AND NOT onchip_memory2_0_s1_waits_for_read) AND NOT (cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register);
  --shift register p1 cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  p1_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register <= Vector_To_Std_Logic(Std_Logic_Vector'(A_ToStdLogicVector(cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register) & A_ToStdLogicVector(cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in)));
  --cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register <= std_logic'('0');
    elsif clk'event and clk = '1' then
      cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register;
    end if;

  end process;

  --local readdatavalid cpu_0_data_master_read_data_valid_onchip_memory2_0_s1, which is an e_mux
  cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 <= cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register;
  --onchip_memory2_0_s1_writedata mux, which is an e_mux
  onchip_memory2_0_s1_writedata <= cpu_0_data_master_writedata;
  --mux onchip_memory2_0_s1_clken, which is an e_mux
  onchip_memory2_0_s1_clken <= std_logic'('1');
  internal_cpu_0_instruction_master_requests_onchip_memory2_0_s1 <= ((to_std_logic(((Std_Logic_Vector'(cpu_0_instruction_master_address_to_slave(16 DOWNTO 15) & std_logic_vector'("000000000000000")) = std_logic_vector'("01000000000000000")))) AND (cpu_0_instruction_master_read))) AND cpu_0_instruction_master_read;
  --cpu_0/data_master granted onchip_memory2_0/s1 last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_0_data_master_saved_grant_onchip_memory2_0_s1) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((onchip_memory2_0_s1_arbitration_holdoff_internal OR NOT internal_cpu_0_data_master_requests_onchip_memory2_0_s1))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1))))));
    end if;

  end process;

  --cpu_0_data_master_continuerequest continued request, which is an e_mux
  cpu_0_data_master_continuerequest <= last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1 AND internal_cpu_0_data_master_requests_onchip_memory2_0_s1;
  internal_cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 <= internal_cpu_0_instruction_master_requests_onchip_memory2_0_s1 AND NOT ((((cpu_0_instruction_master_read AND (cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register))) OR cpu_0_data_master_arbiterlock));
  --cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register_in <= ((internal_cpu_0_instruction_master_granted_onchip_memory2_0_s1 AND cpu_0_instruction_master_read) AND NOT onchip_memory2_0_s1_waits_for_read) AND NOT (cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register);
  --shift register p1 cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  p1_cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register <= Vector_To_Std_Logic(Std_Logic_Vector'(A_ToStdLogicVector(cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register) & A_ToStdLogicVector(cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register_in)));
  --cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register <= std_logic'('0');
    elsif clk'event and clk = '1' then
      cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register;
    end if;

  end process;

  --local readdatavalid cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1, which is an e_mux
  cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 <= cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register;
  --allow new arb cycle for onchip_memory2_0/s1, which is an e_assign
  onchip_memory2_0_s1_allow_new_arb_cycle <= NOT cpu_0_data_master_arbiterlock AND NOT cpu_0_instruction_master_arbiterlock;
  --cpu_0/instruction_master assignment into master qualified-requests vector for onchip_memory2_0/s1, which is an e_assign
  onchip_memory2_0_s1_master_qreq_vector(0) <= internal_cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1;
  --cpu_0/instruction_master grant onchip_memory2_0/s1, which is an e_assign
  internal_cpu_0_instruction_master_granted_onchip_memory2_0_s1 <= onchip_memory2_0_s1_grant_vector(0);
  --cpu_0/instruction_master saved-grant onchip_memory2_0/s1, which is an e_assign
  cpu_0_instruction_master_saved_grant_onchip_memory2_0_s1 <= onchip_memory2_0_s1_arb_winner(0) AND internal_cpu_0_instruction_master_requests_onchip_memory2_0_s1;
  --cpu_0/data_master assignment into master qualified-requests vector for onchip_memory2_0/s1, which is an e_assign
  onchip_memory2_0_s1_master_qreq_vector(1) <= internal_cpu_0_data_master_qualified_request_onchip_memory2_0_s1;
  --cpu_0/data_master grant onchip_memory2_0/s1, which is an e_assign
  internal_cpu_0_data_master_granted_onchip_memory2_0_s1 <= onchip_memory2_0_s1_grant_vector(1);
  --cpu_0/data_master saved-grant onchip_memory2_0/s1, which is an e_assign
  cpu_0_data_master_saved_grant_onchip_memory2_0_s1 <= onchip_memory2_0_s1_arb_winner(1) AND internal_cpu_0_data_master_requests_onchip_memory2_0_s1;
  --onchip_memory2_0/s1 chosen-master double-vector, which is an e_assign
  onchip_memory2_0_s1_chosen_master_double_vector <= A_EXT (((std_logic_vector'("0") & ((onchip_memory2_0_s1_master_qreq_vector & onchip_memory2_0_s1_master_qreq_vector))) AND (((std_logic_vector'("0") & (Std_Logic_Vector'(NOT onchip_memory2_0_s1_master_qreq_vector & NOT onchip_memory2_0_s1_master_qreq_vector))) + (std_logic_vector'("000") & (onchip_memory2_0_s1_arb_addend))))), 4);
  --stable onehot encoding of arb winner
  onchip_memory2_0_s1_arb_winner <= A_WE_StdLogicVector((std_logic'(((onchip_memory2_0_s1_allow_new_arb_cycle AND or_reduce(onchip_memory2_0_s1_grant_vector)))) = '1'), onchip_memory2_0_s1_grant_vector, onchip_memory2_0_s1_saved_chosen_master_vector);
  --saved onchip_memory2_0_s1_grant_vector, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      onchip_memory2_0_s1_saved_chosen_master_vector <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      if std_logic'(onchip_memory2_0_s1_allow_new_arb_cycle) = '1' then 
        onchip_memory2_0_s1_saved_chosen_master_vector <= A_WE_StdLogicVector((std_logic'(or_reduce(onchip_memory2_0_s1_grant_vector)) = '1'), onchip_memory2_0_s1_grant_vector, onchip_memory2_0_s1_saved_chosen_master_vector);
      end if;
    end if;

  end process;

  --onehot encoding of chosen master
  onchip_memory2_0_s1_grant_vector <= Std_Logic_Vector'(A_ToStdLogicVector(((onchip_memory2_0_s1_chosen_master_double_vector(1) OR onchip_memory2_0_s1_chosen_master_double_vector(3)))) & A_ToStdLogicVector(((onchip_memory2_0_s1_chosen_master_double_vector(0) OR onchip_memory2_0_s1_chosen_master_double_vector(2)))));
  --onchip_memory2_0/s1 chosen master rotated left, which is an e_assign
  onchip_memory2_0_s1_chosen_master_rot_left <= A_EXT (A_WE_StdLogicVector((((A_SLL(onchip_memory2_0_s1_arb_winner,std_logic_vector'("00000000000000000000000000000001")))) /= std_logic_vector'("00")), (std_logic_vector'("000000000000000000000000000000") & ((A_SLL(onchip_memory2_0_s1_arb_winner,std_logic_vector'("00000000000000000000000000000001"))))), std_logic_vector'("00000000000000000000000000000001")), 2);
  --onchip_memory2_0/s1's addend for next-master-grant
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      onchip_memory2_0_s1_arb_addend <= std_logic_vector'("01");
    elsif clk'event and clk = '1' then
      if std_logic'(or_reduce(onchip_memory2_0_s1_grant_vector)) = '1' then 
        onchip_memory2_0_s1_arb_addend <= A_WE_StdLogicVector((std_logic'(onchip_memory2_0_s1_end_xfer) = '1'), onchip_memory2_0_s1_chosen_master_rot_left, onchip_memory2_0_s1_grant_vector);
      end if;
    end if;

  end process;

  --~onchip_memory2_0_s1_reset assignment, which is an e_assign
  onchip_memory2_0_s1_reset <= NOT reset_n;
  onchip_memory2_0_s1_chipselect <= internal_cpu_0_data_master_granted_onchip_memory2_0_s1 OR internal_cpu_0_instruction_master_granted_onchip_memory2_0_s1;
  --onchip_memory2_0_s1_firsttransfer first transaction, which is an e_assign
  onchip_memory2_0_s1_firsttransfer <= A_WE_StdLogic((std_logic'(onchip_memory2_0_s1_begins_xfer) = '1'), onchip_memory2_0_s1_unreg_firsttransfer, onchip_memory2_0_s1_reg_firsttransfer);
  --onchip_memory2_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  onchip_memory2_0_s1_unreg_firsttransfer <= NOT ((onchip_memory2_0_s1_slavearbiterlockenable AND onchip_memory2_0_s1_any_continuerequest));
  --onchip_memory2_0_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      onchip_memory2_0_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(onchip_memory2_0_s1_begins_xfer) = '1' then 
        onchip_memory2_0_s1_reg_firsttransfer <= onchip_memory2_0_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --onchip_memory2_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  onchip_memory2_0_s1_beginbursttransfer_internal <= onchip_memory2_0_s1_begins_xfer;
  --onchip_memory2_0_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  onchip_memory2_0_s1_arbitration_holdoff_internal <= onchip_memory2_0_s1_begins_xfer AND onchip_memory2_0_s1_firsttransfer;
  --onchip_memory2_0_s1_write assignment, which is an e_mux
  onchip_memory2_0_s1_write <= internal_cpu_0_data_master_granted_onchip_memory2_0_s1 AND cpu_0_data_master_write;
  shifted_address_to_onchip_memory2_0_s1_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --onchip_memory2_0_s1_address mux, which is an e_mux
  onchip_memory2_0_s1_address <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_onchip_memory2_0_s1)) = '1'), (A_SRL(shifted_address_to_onchip_memory2_0_s1_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010"))), (A_SRL(shifted_address_to_onchip_memory2_0_s1_from_cpu_0_instruction_master,std_logic_vector'("00000000000000000000000000000010")))), 13);
  shifted_address_to_onchip_memory2_0_s1_from_cpu_0_instruction_master <= cpu_0_instruction_master_address_to_slave;
  --d1_onchip_memory2_0_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_onchip_memory2_0_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_onchip_memory2_0_s1_end_xfer <= onchip_memory2_0_s1_end_xfer;
    end if;

  end process;

  --onchip_memory2_0_s1_waits_for_read in a cycle, which is an e_mux
  onchip_memory2_0_s1_waits_for_read <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(onchip_memory2_0_s1_in_a_read_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --onchip_memory2_0_s1_in_a_read_cycle assignment, which is an e_assign
  onchip_memory2_0_s1_in_a_read_cycle <= ((internal_cpu_0_data_master_granted_onchip_memory2_0_s1 AND cpu_0_data_master_read)) OR ((internal_cpu_0_instruction_master_granted_onchip_memory2_0_s1 AND cpu_0_instruction_master_read));
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= onchip_memory2_0_s1_in_a_read_cycle;
  --onchip_memory2_0_s1_waits_for_write in a cycle, which is an e_mux
  onchip_memory2_0_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(onchip_memory2_0_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --onchip_memory2_0_s1_in_a_write_cycle assignment, which is an e_assign
  onchip_memory2_0_s1_in_a_write_cycle <= internal_cpu_0_data_master_granted_onchip_memory2_0_s1 AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= onchip_memory2_0_s1_in_a_write_cycle;
  wait_for_onchip_memory2_0_s1_counter <= std_logic'('0');
  --onchip_memory2_0_s1_byteenable byte enable port mux, which is an e_mux
  onchip_memory2_0_s1_byteenable <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_onchip_memory2_0_s1)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_0_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))), 4);
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_onchip_memory2_0_s1 <= internal_cpu_0_data_master_granted_onchip_memory2_0_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_onchip_memory2_0_s1 <= internal_cpu_0_data_master_qualified_request_onchip_memory2_0_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_onchip_memory2_0_s1 <= internal_cpu_0_data_master_requests_onchip_memory2_0_s1;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_granted_onchip_memory2_0_s1 <= internal_cpu_0_instruction_master_granted_onchip_memory2_0_s1;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 <= internal_cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_requests_onchip_memory2_0_s1 <= internal_cpu_0_instruction_master_requests_onchip_memory2_0_s1;
--synthesis translate_off
    --onchip_memory2_0/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

    --grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line4 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_0_data_master_granted_onchip_memory2_0_s1))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_0_instruction_master_granted_onchip_memory2_0_s1))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line4, now);
          write(write_line4, string'(": "));
          write(write_line4, string'("> 1 of grant signals are active simultaneously"));
          write(output, write_line4.all);
          deallocate (write_line4);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --saved_grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line5 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_saved_grant_onchip_memory2_0_s1))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_0_instruction_master_saved_grant_onchip_memory2_0_s1))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line5, now);
          write(write_line5, string'(": "));
          write(write_line5, string'("> 1 of saved_grant signals are active simultaneously"));
          write(output, write_line5.all);
          deallocate (write_line5);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sysid_0_control_slave_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sysid_0_control_slave_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

              -- outputs:
                 signal cpu_0_data_master_granted_sysid_0_control_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_sysid_0_control_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_sysid_0_control_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_sysid_0_control_slave : OUT STD_LOGIC;
                 signal d1_sysid_0_control_slave_end_xfer : OUT STD_LOGIC;
                 signal sysid_0_control_slave_address : OUT STD_LOGIC;
                 signal sysid_0_control_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal sysid_0_control_slave_reset_n : OUT STD_LOGIC
              );
end entity sysid_0_control_slave_arbitrator;


architecture europa of sysid_0_control_slave_arbitrator is
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_sysid_0_control_slave :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_sysid_0_control_slave :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_sysid_0_control_slave :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_sysid_0_control_slave :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_sysid_0_control_slave :  STD_LOGIC;
                signal shifted_address_to_sysid_0_control_slave_from_cpu_0_data_master :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal sysid_0_control_slave_allgrants :  STD_LOGIC;
                signal sysid_0_control_slave_allow_new_arb_cycle :  STD_LOGIC;
                signal sysid_0_control_slave_any_bursting_master_saved_grant :  STD_LOGIC;
                signal sysid_0_control_slave_any_continuerequest :  STD_LOGIC;
                signal sysid_0_control_slave_arb_counter_enable :  STD_LOGIC;
                signal sysid_0_control_slave_arb_share_counter :  STD_LOGIC;
                signal sysid_0_control_slave_arb_share_counter_next_value :  STD_LOGIC;
                signal sysid_0_control_slave_arb_share_set_values :  STD_LOGIC;
                signal sysid_0_control_slave_beginbursttransfer_internal :  STD_LOGIC;
                signal sysid_0_control_slave_begins_xfer :  STD_LOGIC;
                signal sysid_0_control_slave_end_xfer :  STD_LOGIC;
                signal sysid_0_control_slave_firsttransfer :  STD_LOGIC;
                signal sysid_0_control_slave_grant_vector :  STD_LOGIC;
                signal sysid_0_control_slave_in_a_read_cycle :  STD_LOGIC;
                signal sysid_0_control_slave_in_a_write_cycle :  STD_LOGIC;
                signal sysid_0_control_slave_master_qreq_vector :  STD_LOGIC;
                signal sysid_0_control_slave_non_bursting_master_requests :  STD_LOGIC;
                signal sysid_0_control_slave_reg_firsttransfer :  STD_LOGIC;
                signal sysid_0_control_slave_slavearbiterlockenable :  STD_LOGIC;
                signal sysid_0_control_slave_slavearbiterlockenable2 :  STD_LOGIC;
                signal sysid_0_control_slave_unreg_firsttransfer :  STD_LOGIC;
                signal sysid_0_control_slave_waits_for_read :  STD_LOGIC;
                signal sysid_0_control_slave_waits_for_write :  STD_LOGIC;
                signal wait_for_sysid_0_control_slave_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT sysid_0_control_slave_end_xfer;
    end if;

  end process;

  sysid_0_control_slave_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_sysid_0_control_slave);
  --assign sysid_0_control_slave_readdata_from_sa = sysid_0_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  sysid_0_control_slave_readdata_from_sa <= sysid_0_control_slave_readdata;
  internal_cpu_0_data_master_requests_sysid_0_control_slave <= ((to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(16 DOWNTO 3) & std_logic_vector'("000")) = std_logic_vector'("10001000001011000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write)))) AND cpu_0_data_master_read;
  --sysid_0_control_slave_arb_share_counter set values, which is an e_mux
  sysid_0_control_slave_arb_share_set_values <= std_logic'('1');
  --sysid_0_control_slave_non_bursting_master_requests mux, which is an e_mux
  sysid_0_control_slave_non_bursting_master_requests <= internal_cpu_0_data_master_requests_sysid_0_control_slave;
  --sysid_0_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  sysid_0_control_slave_any_bursting_master_saved_grant <= std_logic'('0');
  --sysid_0_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  sysid_0_control_slave_arb_share_counter_next_value <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(sysid_0_control_slave_firsttransfer) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(sysid_0_control_slave_arb_share_set_values))) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(sysid_0_control_slave_arb_share_counter) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(sysid_0_control_slave_arb_share_counter))) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))));
  --sysid_0_control_slave_allgrants all slave grants, which is an e_mux
  sysid_0_control_slave_allgrants <= sysid_0_control_slave_grant_vector;
  --sysid_0_control_slave_end_xfer assignment, which is an e_assign
  sysid_0_control_slave_end_xfer <= NOT ((sysid_0_control_slave_waits_for_read OR sysid_0_control_slave_waits_for_write));
  --end_xfer_arb_share_counter_term_sysid_0_control_slave arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_sysid_0_control_slave <= sysid_0_control_slave_end_xfer AND (((NOT sysid_0_control_slave_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --sysid_0_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  sysid_0_control_slave_arb_counter_enable <= ((end_xfer_arb_share_counter_term_sysid_0_control_slave AND sysid_0_control_slave_allgrants)) OR ((end_xfer_arb_share_counter_term_sysid_0_control_slave AND NOT sysid_0_control_slave_non_bursting_master_requests));
  --sysid_0_control_slave_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sysid_0_control_slave_arb_share_counter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(sysid_0_control_slave_arb_counter_enable) = '1' then 
        sysid_0_control_slave_arb_share_counter <= sysid_0_control_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --sysid_0_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sysid_0_control_slave_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((sysid_0_control_slave_master_qreq_vector AND end_xfer_arb_share_counter_term_sysid_0_control_slave)) OR ((end_xfer_arb_share_counter_term_sysid_0_control_slave AND NOT sysid_0_control_slave_non_bursting_master_requests)))) = '1' then 
        sysid_0_control_slave_slavearbiterlockenable <= sysid_0_control_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --cpu_0/data_master sysid_0/control_slave arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= sysid_0_control_slave_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --sysid_0_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  sysid_0_control_slave_slavearbiterlockenable2 <= sysid_0_control_slave_arb_share_counter_next_value;
  --cpu_0/data_master sysid_0/control_slave arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= sysid_0_control_slave_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --sysid_0_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  sysid_0_control_slave_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_sysid_0_control_slave <= internal_cpu_0_data_master_requests_sysid_0_control_slave;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_sysid_0_control_slave <= internal_cpu_0_data_master_qualified_request_sysid_0_control_slave;
  --cpu_0/data_master saved-grant sysid_0/control_slave, which is an e_assign
  cpu_0_data_master_saved_grant_sysid_0_control_slave <= internal_cpu_0_data_master_requests_sysid_0_control_slave;
  --allow new arb cycle for sysid_0/control_slave, which is an e_assign
  sysid_0_control_slave_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  sysid_0_control_slave_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  sysid_0_control_slave_master_qreq_vector <= std_logic'('1');
  --sysid_0_control_slave_reset_n assignment, which is an e_assign
  sysid_0_control_slave_reset_n <= reset_n;
  --sysid_0_control_slave_firsttransfer first transaction, which is an e_assign
  sysid_0_control_slave_firsttransfer <= A_WE_StdLogic((std_logic'(sysid_0_control_slave_begins_xfer) = '1'), sysid_0_control_slave_unreg_firsttransfer, sysid_0_control_slave_reg_firsttransfer);
  --sysid_0_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  sysid_0_control_slave_unreg_firsttransfer <= NOT ((sysid_0_control_slave_slavearbiterlockenable AND sysid_0_control_slave_any_continuerequest));
  --sysid_0_control_slave_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sysid_0_control_slave_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(sysid_0_control_slave_begins_xfer) = '1' then 
        sysid_0_control_slave_reg_firsttransfer <= sysid_0_control_slave_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --sysid_0_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  sysid_0_control_slave_beginbursttransfer_internal <= sysid_0_control_slave_begins_xfer;
  shifted_address_to_sysid_0_control_slave_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --sysid_0_control_slave_address mux, which is an e_mux
  sysid_0_control_slave_address <= Vector_To_Std_Logic(A_SRL(shifted_address_to_sysid_0_control_slave_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")));
  --d1_sysid_0_control_slave_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_sysid_0_control_slave_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_sysid_0_control_slave_end_xfer <= sysid_0_control_slave_end_xfer;
    end if;

  end process;

  --sysid_0_control_slave_waits_for_read in a cycle, which is an e_mux
  sysid_0_control_slave_waits_for_read <= sysid_0_control_slave_in_a_read_cycle AND sysid_0_control_slave_begins_xfer;
  --sysid_0_control_slave_in_a_read_cycle assignment, which is an e_assign
  sysid_0_control_slave_in_a_read_cycle <= internal_cpu_0_data_master_granted_sysid_0_control_slave AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= sysid_0_control_slave_in_a_read_cycle;
  --sysid_0_control_slave_waits_for_write in a cycle, which is an e_mux
  sysid_0_control_slave_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(sysid_0_control_slave_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --sysid_0_control_slave_in_a_write_cycle assignment, which is an e_assign
  sysid_0_control_slave_in_a_write_cycle <= internal_cpu_0_data_master_granted_sysid_0_control_slave AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= sysid_0_control_slave_in_a_write_cycle;
  wait_for_sysid_0_control_slave_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_sysid_0_control_slave <= internal_cpu_0_data_master_granted_sysid_0_control_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_sysid_0_control_slave <= internal_cpu_0_data_master_qualified_request_sysid_0_control_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_sysid_0_control_slave <= internal_cpu_0_data_master_requests_sysid_0_control_slave;
--synthesis translate_off
    --sysid_0/control_slave enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mon_sopc_reset_clk_0_domain_synch_module is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal data_in : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal data_out : OUT STD_LOGIC
              );
end entity mon_sopc_reset_clk_0_domain_synch_module;


architecture europa of mon_sopc_reset_clk_0_domain_synch_module is
                signal data_in_d1 :  STD_LOGIC;
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of data_in_d1 : signal is "{-from ""*""} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of data_out : signal is "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101";

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      data_in_d1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      data_in_d1 <= data_in;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      data_out <= std_logic'('0');
    elsif clk'event and clk = '1' then
      data_out <= data_in_d1;
    end if;

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mon_sopc is 
        port (
              -- 1) global signals:
                 signal clk_0 : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- the_Avalon_F7_0
                 signal BP_Barbord_to_the_Avalon_F7_0 : IN STD_LOGIC;
                 signal BP_STBY_to_the_Avalon_F7_0 : IN STD_LOGIC;
                 signal BP_Tribord_to_the_Avalon_F7_0 : IN STD_LOGIC;
                 signal led_Babord_from_the_Avalon_F7_0 : OUT STD_LOGIC;
                 signal led_STBY_from_the_Avalon_F7_0 : OUT STD_LOGIC;
                 signal led_Tribord_from_the_Avalon_F7_0 : OUT STD_LOGIC;
                 signal led_appuis_from_the_Avalon_F7_0 : OUT STD_LOGIC;
                 signal out_bip_from_the_Avalon_F7_0 : OUT STD_LOGIC;
                 signal reset_to_the_Avalon_F7_0 : IN STD_LOGIC;

              -- the_Boutons
                 signal in_port_to_the_Boutons : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

              -- the_LEDs
                 signal out_port_from_the_LEDs : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);

              -- the_avalon_anemo_0
                 signal in_fred_anemometre_to_the_avalon_anemo_0 : IN STD_LOGIC;

              -- the_avalon_pwm_0
                 signal out_pwm_from_the_avalon_pwm_0 : OUT STD_LOGIC
              );
end entity mon_sopc;


architecture europa of mon_sopc is
component Avalon_F7_0_avalon_slave_0_arbitrator is 
           port (
                 -- inputs:
                    signal Avalon_F7_0_avalon_slave_0_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal Avalon_F7_0_avalon_slave_0_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal Avalon_F7_0_avalon_slave_0_chipselect : OUT STD_LOGIC;
                    signal Avalon_F7_0_avalon_slave_0_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal Avalon_F7_0_avalon_slave_0_reset_n : OUT STD_LOGIC;
                    signal Avalon_F7_0_avalon_slave_0_write_n : OUT STD_LOGIC;
                    signal Avalon_F7_0_avalon_slave_0_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_Avalon_F7_0_avalon_slave_0 : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0 : OUT STD_LOGIC;
                    signal d1_Avalon_F7_0_avalon_slave_0_end_xfer : OUT STD_LOGIC
                 );
end component Avalon_F7_0_avalon_slave_0_arbitrator;

component Avalon_F7_0 is 
           port (
                 -- inputs:
                    signal BP_Barbord : IN STD_LOGIC;
                    signal BP_STBY : IN STD_LOGIC;
                    signal BP_Tribord : IN STD_LOGIC;
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal led_Babord : OUT STD_LOGIC;
                    signal led_STBY : OUT STD_LOGIC;
                    signal led_Tribord : OUT STD_LOGIC;
                    signal led_appuis : OUT STD_LOGIC;
                    signal out_bip : OUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component Avalon_F7_0;

component Boutons_s1_arbitrator is 
           port (
                 -- inputs:
                    signal Boutons_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal Boutons_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal Boutons_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal Boutons_s1_reset_n : OUT STD_LOGIC;
                    signal cpu_0_data_master_granted_Boutons_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_Boutons_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_Boutons_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_Boutons_s1 : OUT STD_LOGIC;
                    signal d1_Boutons_s1_end_xfer : OUT STD_LOGIC
                 );
end component Boutons_s1_arbitrator;

component Boutons is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal in_port : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component Boutons;

component LEDs_s1_arbitrator is 
           port (
                 -- inputs:
                    signal LEDs_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal LEDs_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal LEDs_s1_chipselect : OUT STD_LOGIC;
                    signal LEDs_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal LEDs_s1_reset_n : OUT STD_LOGIC;
                    signal LEDs_s1_write_n : OUT STD_LOGIC;
                    signal LEDs_s1_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_data_master_granted_LEDs_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_LEDs_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_LEDs_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_LEDs_s1 : OUT STD_LOGIC;
                    signal d1_LEDs_s1_end_xfer : OUT STD_LOGIC
                 );
end component LEDs_s1_arbitrator;

component LEDs is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal out_port : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component LEDs;

component avalon_anemo_0_avalon_slave_0_arbitrator is 
           port (
                 -- inputs:
                    signal avalon_anemo_0_avalon_slave_0_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal avalon_anemo_0_avalon_slave_0_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal avalon_anemo_0_avalon_slave_0_chipselect : OUT STD_LOGIC;
                    signal avalon_anemo_0_avalon_slave_0_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal avalon_anemo_0_avalon_slave_0_reset_n : OUT STD_LOGIC;
                    signal avalon_anemo_0_avalon_slave_0_write_n : OUT STD_LOGIC;
                    signal avalon_anemo_0_avalon_slave_0_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_avalon_anemo_0_avalon_slave_0 : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0 : OUT STD_LOGIC;
                    signal d1_avalon_anemo_0_avalon_slave_0_end_xfer : OUT STD_LOGIC
                 );
end component avalon_anemo_0_avalon_slave_0_arbitrator;

component avalon_anemo_0 is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal in_fred_anemometre : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component avalon_anemo_0;

component avalon_pwm_0_avalon_slave_0_arbitrator is 
           port (
                 -- inputs:
                    signal avalon_pwm_0_avalon_slave_0_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal avalon_pwm_0_avalon_slave_0_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal avalon_pwm_0_avalon_slave_0_chipselect : OUT STD_LOGIC;
                    signal avalon_pwm_0_avalon_slave_0_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal avalon_pwm_0_avalon_slave_0_reset_n : OUT STD_LOGIC;
                    signal avalon_pwm_0_avalon_slave_0_write_n : OUT STD_LOGIC;
                    signal avalon_pwm_0_avalon_slave_0_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_avalon_pwm_0_avalon_slave_0 : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0 : OUT STD_LOGIC;
                    signal d1_avalon_pwm_0_avalon_slave_0_end_xfer : OUT STD_LOGIC
                 );
end component avalon_pwm_0_avalon_slave_0_arbitrator;

component avalon_pwm_0 is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal out_pwm : OUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component avalon_pwm_0;

component cpu_0_jtag_debug_module_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_0_data_master_debugaccess : IN STD_LOGIC;
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_instruction_master_read : IN STD_LOGIC;
                    signal cpu_0_jtag_debug_module_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_jtag_debug_module_resetrequest : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_0_data_master_granted_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_granted_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_requests_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_address : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal cpu_0_jtag_debug_module_begintransfer : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_0_jtag_debug_module_chipselect : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_debugaccess : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_jtag_debug_module_reset_n : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_resetrequest_from_sa : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_write : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d1_cpu_0_jtag_debug_module_end_xfer : OUT STD_LOGIC
                 );
end component cpu_0_jtag_debug_module_arbitrator;

component cpu_0_data_master_arbitrator is 
           port (
                 -- inputs:
                    signal Avalon_F7_0_avalon_slave_0_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal Boutons_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal LEDs_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal avalon_anemo_0_avalon_slave_0_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal avalon_pwm_0_avalon_slave_0_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_Boutons_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_LEDs_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_onchip_memory2_0_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_sysid_0_control_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_Boutons_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_LEDs_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_onchip_memory2_0_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_sysid_0_control_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_Avalon_F7_0_avalon_slave_0 : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_Boutons_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_LEDs_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_avalon_anemo_0_avalon_slave_0 : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_avalon_pwm_0_avalon_slave_0 : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_sysid_0_control_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0 : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_Boutons_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_LEDs_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0 : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0 : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_onchip_memory2_0_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_sysid_0_control_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_jtag_debug_module_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d1_Avalon_F7_0_avalon_slave_0_end_xfer : IN STD_LOGIC;
                    signal d1_Boutons_s1_end_xfer : IN STD_LOGIC;
                    signal d1_LEDs_s1_end_xfer : IN STD_LOGIC;
                    signal d1_avalon_anemo_0_avalon_slave_0_end_xfer : IN STD_LOGIC;
                    signal d1_avalon_pwm_0_avalon_slave_0_end_xfer : IN STD_LOGIC;
                    signal d1_cpu_0_jtag_debug_module_end_xfer : IN STD_LOGIC;
                    signal d1_jtag_uart_0_avalon_jtag_slave_end_xfer : IN STD_LOGIC;
                    signal d1_onchip_memory2_0_s1_end_xfer : IN STD_LOGIC;
                    signal d1_sysid_0_control_slave_end_xfer : IN STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_irq_from_sa : IN STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa : IN STD_LOGIC;
                    signal onchip_memory2_0_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sysid_0_control_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal cpu_0_data_master_address_to_slave : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_data_master_irq : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_data_master_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_data_master_waitrequest : OUT STD_LOGIC
                 );
end component cpu_0_data_master_arbitrator;

component cpu_0_instruction_master_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_instruction_master_address : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_instruction_master_granted_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_instruction_master_granted_onchip_memory2_0_s1 : IN STD_LOGIC;
                    signal cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 : IN STD_LOGIC;
                    signal cpu_0_instruction_master_read : IN STD_LOGIC;
                    signal cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 : IN STD_LOGIC;
                    signal cpu_0_instruction_master_requests_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_instruction_master_requests_onchip_memory2_0_s1 : IN STD_LOGIC;
                    signal cpu_0_jtag_debug_module_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d1_cpu_0_jtag_debug_module_end_xfer : IN STD_LOGIC;
                    signal d1_onchip_memory2_0_s1_end_xfer : IN STD_LOGIC;
                    signal onchip_memory2_0_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_0_instruction_master_address_to_slave : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_instruction_master_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_instruction_master_waitrequest : OUT STD_LOGIC
                 );
end component cpu_0_instruction_master_arbitrator;

component cpu_0 is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal d_irq : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d_waitrequest : IN STD_LOGIC;
                    signal i_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal i_waitrequest : IN STD_LOGIC;
                    signal jtag_debug_module_address : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal jtag_debug_module_begintransfer : IN STD_LOGIC;
                    signal jtag_debug_module_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal jtag_debug_module_debugaccess : IN STD_LOGIC;
                    signal jtag_debug_module_select : IN STD_LOGIC;
                    signal jtag_debug_module_write : IN STD_LOGIC;
                    signal jtag_debug_module_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal d_address : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal d_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal d_read : OUT STD_LOGIC;
                    signal d_write : OUT STD_LOGIC;
                    signal d_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal i_address : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal i_read : OUT STD_LOGIC;
                    signal jtag_debug_module_debugaccess_to_roms : OUT STD_LOGIC;
                    signal jtag_debug_module_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_debug_module_resetrequest : OUT STD_LOGIC
                 );
end component cpu_0;

component jtag_uart_0_avalon_jtag_slave_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_uart_0_avalon_jtag_slave_dataavailable : IN STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_irq : IN STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_uart_0_avalon_jtag_slave_readyfordata : IN STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_waitrequest : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                    signal d1_jtag_uart_0_avalon_jtag_slave_end_xfer : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_address : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_chipselect : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_irq_from_sa : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_read_n : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_reset_n : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_write_n : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component jtag_uart_0_avalon_jtag_slave_arbitrator;

component jtag_uart_0 is 
           port (
                 -- inputs:
                    signal av_address : IN STD_LOGIC;
                    signal av_chipselect : IN STD_LOGIC;
                    signal av_read_n : IN STD_LOGIC;
                    signal av_write_n : IN STD_LOGIC;
                    signal av_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal rst_n : IN STD_LOGIC;

                 -- outputs:
                    signal av_irq : OUT STD_LOGIC;
                    signal av_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal av_waitrequest : OUT STD_LOGIC;
                    signal dataavailable : OUT STD_LOGIC;
                    signal readyfordata : OUT STD_LOGIC
                 );
end component jtag_uart_0;

component onchip_memory2_0_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_instruction_master_read : IN STD_LOGIC;
                    signal onchip_memory2_0_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_0_data_master_granted_onchip_memory2_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_onchip_memory2_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_onchip_memory2_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_granted_onchip_memory2_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_requests_onchip_memory2_0_s1 : OUT STD_LOGIC;
                    signal d1_onchip_memory2_0_s1_end_xfer : OUT STD_LOGIC;
                    signal onchip_memory2_0_s1_address : OUT STD_LOGIC_VECTOR (12 DOWNTO 0);
                    signal onchip_memory2_0_s1_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal onchip_memory2_0_s1_chipselect : OUT STD_LOGIC;
                    signal onchip_memory2_0_s1_clken : OUT STD_LOGIC;
                    signal onchip_memory2_0_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal onchip_memory2_0_s1_reset : OUT STD_LOGIC;
                    signal onchip_memory2_0_s1_write : OUT STD_LOGIC;
                    signal onchip_memory2_0_s1_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 : OUT STD_LOGIC
                 );
end component onchip_memory2_0_s1_arbitrator;

component onchip_memory2_0 is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (12 DOWNTO 0);
                    signal byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal clken : IN STD_LOGIC;
                    signal reset : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component onchip_memory2_0;

component sysid_0_control_slave_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (16 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sysid_0_control_slave_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal cpu_0_data_master_granted_sysid_0_control_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_sysid_0_control_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_sysid_0_control_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_sysid_0_control_slave : OUT STD_LOGIC;
                    signal d1_sysid_0_control_slave_end_xfer : OUT STD_LOGIC;
                    signal sysid_0_control_slave_address : OUT STD_LOGIC;
                    signal sysid_0_control_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal sysid_0_control_slave_reset_n : OUT STD_LOGIC
                 );
end component sysid_0_control_slave_arbitrator;

component sysid_0 is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC;
                    signal clock : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component sysid_0;

component mon_sopc_reset_clk_0_domain_synch_module is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal data_in : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal data_out : OUT STD_LOGIC
                 );
end component mon_sopc_reset_clk_0_domain_synch_module;

                signal Avalon_F7_0_avalon_slave_0_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal Avalon_F7_0_avalon_slave_0_chipselect :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal Avalon_F7_0_avalon_slave_0_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal Avalon_F7_0_avalon_slave_0_reset_n :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_write_n :  STD_LOGIC;
                signal Avalon_F7_0_avalon_slave_0_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal Boutons_s1_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal Boutons_s1_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal Boutons_s1_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal Boutons_s1_reset_n :  STD_LOGIC;
                signal LEDs_s1_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal LEDs_s1_chipselect :  STD_LOGIC;
                signal LEDs_s1_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal LEDs_s1_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal LEDs_s1_reset_n :  STD_LOGIC;
                signal LEDs_s1_write_n :  STD_LOGIC;
                signal LEDs_s1_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal avalon_anemo_0_avalon_slave_0_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal avalon_anemo_0_avalon_slave_0_chipselect :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal avalon_anemo_0_avalon_slave_0_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal avalon_anemo_0_avalon_slave_0_reset_n :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_write_n :  STD_LOGIC;
                signal avalon_anemo_0_avalon_slave_0_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal avalon_pwm_0_avalon_slave_0_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal avalon_pwm_0_avalon_slave_0_chipselect :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal avalon_pwm_0_avalon_slave_0_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal avalon_pwm_0_avalon_slave_0_reset_n :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_write_n :  STD_LOGIC;
                signal avalon_pwm_0_avalon_slave_0_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal clk_0_reset_n :  STD_LOGIC;
                signal cpu_0_data_master_address :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal cpu_0_data_master_address_to_slave :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal cpu_0_data_master_byteenable :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal cpu_0_data_master_debugaccess :  STD_LOGIC;
                signal cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 :  STD_LOGIC;
                signal cpu_0_data_master_granted_Boutons_s1 :  STD_LOGIC;
                signal cpu_0_data_master_granted_LEDs_s1 :  STD_LOGIC;
                signal cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 :  STD_LOGIC;
                signal cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 :  STD_LOGIC;
                signal cpu_0_data_master_granted_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal cpu_0_data_master_granted_onchip_memory2_0_s1 :  STD_LOGIC;
                signal cpu_0_data_master_granted_sysid_0_control_slave :  STD_LOGIC;
                signal cpu_0_data_master_irq :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_Boutons_s1 :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_LEDs_s1 :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_onchip_memory2_0_s1 :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_sysid_0_control_slave :  STD_LOGIC;
                signal cpu_0_data_master_read :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_Avalon_F7_0_avalon_slave_0 :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_Boutons_s1 :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_LEDs_s1 :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_avalon_anemo_0_avalon_slave_0 :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_avalon_pwm_0_avalon_slave_0 :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_sysid_0_control_slave :  STD_LOGIC;
                signal cpu_0_data_master_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0 :  STD_LOGIC;
                signal cpu_0_data_master_requests_Boutons_s1 :  STD_LOGIC;
                signal cpu_0_data_master_requests_LEDs_s1 :  STD_LOGIC;
                signal cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0 :  STD_LOGIC;
                signal cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0 :  STD_LOGIC;
                signal cpu_0_data_master_requests_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal cpu_0_data_master_requests_onchip_memory2_0_s1 :  STD_LOGIC;
                signal cpu_0_data_master_requests_sysid_0_control_slave :  STD_LOGIC;
                signal cpu_0_data_master_waitrequest :  STD_LOGIC;
                signal cpu_0_data_master_write :  STD_LOGIC;
                signal cpu_0_data_master_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_0_instruction_master_address :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal cpu_0_instruction_master_address_to_slave :  STD_LOGIC_VECTOR (16 DOWNTO 0);
                signal cpu_0_instruction_master_granted_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_instruction_master_granted_onchip_memory2_0_s1 :  STD_LOGIC;
                signal cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 :  STD_LOGIC;
                signal cpu_0_instruction_master_read :  STD_LOGIC;
                signal cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 :  STD_LOGIC;
                signal cpu_0_instruction_master_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_0_instruction_master_requests_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_instruction_master_requests_onchip_memory2_0_s1 :  STD_LOGIC;
                signal cpu_0_instruction_master_waitrequest :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_address :  STD_LOGIC_VECTOR (8 DOWNTO 0);
                signal cpu_0_jtag_debug_module_begintransfer :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_byteenable :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal cpu_0_jtag_debug_module_chipselect :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_debugaccess :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_0_jtag_debug_module_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_0_jtag_debug_module_reset_n :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_resetrequest :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_resetrequest_from_sa :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_write :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal d1_Avalon_F7_0_avalon_slave_0_end_xfer :  STD_LOGIC;
                signal d1_Boutons_s1_end_xfer :  STD_LOGIC;
                signal d1_LEDs_s1_end_xfer :  STD_LOGIC;
                signal d1_avalon_anemo_0_avalon_slave_0_end_xfer :  STD_LOGIC;
                signal d1_avalon_pwm_0_avalon_slave_0_end_xfer :  STD_LOGIC;
                signal d1_cpu_0_jtag_debug_module_end_xfer :  STD_LOGIC;
                signal d1_jtag_uart_0_avalon_jtag_slave_end_xfer :  STD_LOGIC;
                signal d1_onchip_memory2_0_s1_end_xfer :  STD_LOGIC;
                signal d1_sysid_0_control_slave_end_xfer :  STD_LOGIC;
                signal internal_led_Babord_from_the_Avalon_F7_0 :  STD_LOGIC;
                signal internal_led_STBY_from_the_Avalon_F7_0 :  STD_LOGIC;
                signal internal_led_Tribord_from_the_Avalon_F7_0 :  STD_LOGIC;
                signal internal_led_appuis_from_the_Avalon_F7_0 :  STD_LOGIC;
                signal internal_out_bip_from_the_Avalon_F7_0 :  STD_LOGIC;
                signal internal_out_port_from_the_LEDs :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal internal_out_pwm_from_the_avalon_pwm_0 :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_address :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_chipselect :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_dataavailable :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_irq :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_irq_from_sa :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_read_n :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal jtag_uart_0_avalon_jtag_slave_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal jtag_uart_0_avalon_jtag_slave_readyfordata :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_reset_n :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_waitrequest :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_write_n :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal module_input :  STD_LOGIC;
                signal onchip_memory2_0_s1_address :  STD_LOGIC_VECTOR (12 DOWNTO 0);
                signal onchip_memory2_0_s1_byteenable :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal onchip_memory2_0_s1_chipselect :  STD_LOGIC;
                signal onchip_memory2_0_s1_clken :  STD_LOGIC;
                signal onchip_memory2_0_s1_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal onchip_memory2_0_s1_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal onchip_memory2_0_s1_reset :  STD_LOGIC;
                signal onchip_memory2_0_s1_write :  STD_LOGIC;
                signal onchip_memory2_0_s1_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 :  STD_LOGIC;
                signal reset_n_sources :  STD_LOGIC;
                signal sysid_0_control_slave_address :  STD_LOGIC;
                signal sysid_0_control_slave_clock :  STD_LOGIC;
                signal sysid_0_control_slave_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal sysid_0_control_slave_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal sysid_0_control_slave_reset_n :  STD_LOGIC;

begin

  --the_Avalon_F7_0_avalon_slave_0, which is an e_instance
  the_Avalon_F7_0_avalon_slave_0 : Avalon_F7_0_avalon_slave_0_arbitrator
    port map(
      Avalon_F7_0_avalon_slave_0_address => Avalon_F7_0_avalon_slave_0_address,
      Avalon_F7_0_avalon_slave_0_chipselect => Avalon_F7_0_avalon_slave_0_chipselect,
      Avalon_F7_0_avalon_slave_0_readdata_from_sa => Avalon_F7_0_avalon_slave_0_readdata_from_sa,
      Avalon_F7_0_avalon_slave_0_reset_n => Avalon_F7_0_avalon_slave_0_reset_n,
      Avalon_F7_0_avalon_slave_0_write_n => Avalon_F7_0_avalon_slave_0_write_n,
      Avalon_F7_0_avalon_slave_0_writedata => Avalon_F7_0_avalon_slave_0_writedata,
      cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 => cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0,
      cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 => cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0,
      cpu_0_data_master_read_data_valid_Avalon_F7_0_avalon_slave_0 => cpu_0_data_master_read_data_valid_Avalon_F7_0_avalon_slave_0,
      cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0 => cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0,
      d1_Avalon_F7_0_avalon_slave_0_end_xfer => d1_Avalon_F7_0_avalon_slave_0_end_xfer,
      Avalon_F7_0_avalon_slave_0_readdata => Avalon_F7_0_avalon_slave_0_readdata,
      clk => clk_0,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      reset_n => clk_0_reset_n
    );


  --the_Avalon_F7_0, which is an e_ptf_instance
  the_Avalon_F7_0 : Avalon_F7_0
    port map(
      led_Babord => internal_led_Babord_from_the_Avalon_F7_0,
      led_STBY => internal_led_STBY_from_the_Avalon_F7_0,
      led_Tribord => internal_led_Tribord_from_the_Avalon_F7_0,
      led_appuis => internal_led_appuis_from_the_Avalon_F7_0,
      out_bip => internal_out_bip_from_the_Avalon_F7_0,
      readdata => Avalon_F7_0_avalon_slave_0_readdata,
      BP_Barbord => BP_Barbord_to_the_Avalon_F7_0,
      BP_STBY => BP_STBY_to_the_Avalon_F7_0,
      BP_Tribord => BP_Tribord_to_the_Avalon_F7_0,
      address => Avalon_F7_0_avalon_slave_0_address,
      chipselect => Avalon_F7_0_avalon_slave_0_chipselect,
      clk => clk_0,
      reset => reset_to_the_Avalon_F7_0,
      reset_n => Avalon_F7_0_avalon_slave_0_reset_n,
      write_n => Avalon_F7_0_avalon_slave_0_write_n,
      writedata => Avalon_F7_0_avalon_slave_0_writedata
    );


  --the_Boutons_s1, which is an e_instance
  the_Boutons_s1 : Boutons_s1_arbitrator
    port map(
      Boutons_s1_address => Boutons_s1_address,
      Boutons_s1_readdata_from_sa => Boutons_s1_readdata_from_sa,
      Boutons_s1_reset_n => Boutons_s1_reset_n,
      cpu_0_data_master_granted_Boutons_s1 => cpu_0_data_master_granted_Boutons_s1,
      cpu_0_data_master_qualified_request_Boutons_s1 => cpu_0_data_master_qualified_request_Boutons_s1,
      cpu_0_data_master_read_data_valid_Boutons_s1 => cpu_0_data_master_read_data_valid_Boutons_s1,
      cpu_0_data_master_requests_Boutons_s1 => cpu_0_data_master_requests_Boutons_s1,
      d1_Boutons_s1_end_xfer => d1_Boutons_s1_end_xfer,
      Boutons_s1_readdata => Boutons_s1_readdata,
      clk => clk_0,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_write => cpu_0_data_master_write,
      reset_n => clk_0_reset_n
    );


  --the_Boutons, which is an e_ptf_instance
  the_Boutons : Boutons
    port map(
      readdata => Boutons_s1_readdata,
      address => Boutons_s1_address,
      clk => clk_0,
      in_port => in_port_to_the_Boutons,
      reset_n => Boutons_s1_reset_n
    );


  --the_LEDs_s1, which is an e_instance
  the_LEDs_s1 : LEDs_s1_arbitrator
    port map(
      LEDs_s1_address => LEDs_s1_address,
      LEDs_s1_chipselect => LEDs_s1_chipselect,
      LEDs_s1_readdata_from_sa => LEDs_s1_readdata_from_sa,
      LEDs_s1_reset_n => LEDs_s1_reset_n,
      LEDs_s1_write_n => LEDs_s1_write_n,
      LEDs_s1_writedata => LEDs_s1_writedata,
      cpu_0_data_master_granted_LEDs_s1 => cpu_0_data_master_granted_LEDs_s1,
      cpu_0_data_master_qualified_request_LEDs_s1 => cpu_0_data_master_qualified_request_LEDs_s1,
      cpu_0_data_master_read_data_valid_LEDs_s1 => cpu_0_data_master_read_data_valid_LEDs_s1,
      cpu_0_data_master_requests_LEDs_s1 => cpu_0_data_master_requests_LEDs_s1,
      d1_LEDs_s1_end_xfer => d1_LEDs_s1_end_xfer,
      LEDs_s1_readdata => LEDs_s1_readdata,
      clk => clk_0,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      reset_n => clk_0_reset_n
    );


  --the_LEDs, which is an e_ptf_instance
  the_LEDs : LEDs
    port map(
      out_port => internal_out_port_from_the_LEDs,
      readdata => LEDs_s1_readdata,
      address => LEDs_s1_address,
      chipselect => LEDs_s1_chipselect,
      clk => clk_0,
      reset_n => LEDs_s1_reset_n,
      write_n => LEDs_s1_write_n,
      writedata => LEDs_s1_writedata
    );


  --the_avalon_anemo_0_avalon_slave_0, which is an e_instance
  the_avalon_anemo_0_avalon_slave_0 : avalon_anemo_0_avalon_slave_0_arbitrator
    port map(
      avalon_anemo_0_avalon_slave_0_address => avalon_anemo_0_avalon_slave_0_address,
      avalon_anemo_0_avalon_slave_0_chipselect => avalon_anemo_0_avalon_slave_0_chipselect,
      avalon_anemo_0_avalon_slave_0_readdata_from_sa => avalon_anemo_0_avalon_slave_0_readdata_from_sa,
      avalon_anemo_0_avalon_slave_0_reset_n => avalon_anemo_0_avalon_slave_0_reset_n,
      avalon_anemo_0_avalon_slave_0_write_n => avalon_anemo_0_avalon_slave_0_write_n,
      avalon_anemo_0_avalon_slave_0_writedata => avalon_anemo_0_avalon_slave_0_writedata,
      cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 => cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0,
      cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 => cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0,
      cpu_0_data_master_read_data_valid_avalon_anemo_0_avalon_slave_0 => cpu_0_data_master_read_data_valid_avalon_anemo_0_avalon_slave_0,
      cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0 => cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0,
      d1_avalon_anemo_0_avalon_slave_0_end_xfer => d1_avalon_anemo_0_avalon_slave_0_end_xfer,
      avalon_anemo_0_avalon_slave_0_readdata => avalon_anemo_0_avalon_slave_0_readdata,
      clk => clk_0,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      reset_n => clk_0_reset_n
    );


  --the_avalon_anemo_0, which is an e_ptf_instance
  the_avalon_anemo_0 : avalon_anemo_0
    port map(
      readdata => avalon_anemo_0_avalon_slave_0_readdata,
      address => avalon_anemo_0_avalon_slave_0_address,
      chipselect => avalon_anemo_0_avalon_slave_0_chipselect,
      clk => clk_0,
      in_fred_anemometre => in_fred_anemometre_to_the_avalon_anemo_0,
      reset_n => avalon_anemo_0_avalon_slave_0_reset_n,
      write_n => avalon_anemo_0_avalon_slave_0_write_n,
      writedata => avalon_anemo_0_avalon_slave_0_writedata
    );


  --the_avalon_pwm_0_avalon_slave_0, which is an e_instance
  the_avalon_pwm_0_avalon_slave_0 : avalon_pwm_0_avalon_slave_0_arbitrator
    port map(
      avalon_pwm_0_avalon_slave_0_address => avalon_pwm_0_avalon_slave_0_address,
      avalon_pwm_0_avalon_slave_0_chipselect => avalon_pwm_0_avalon_slave_0_chipselect,
      avalon_pwm_0_avalon_slave_0_readdata_from_sa => avalon_pwm_0_avalon_slave_0_readdata_from_sa,
      avalon_pwm_0_avalon_slave_0_reset_n => avalon_pwm_0_avalon_slave_0_reset_n,
      avalon_pwm_0_avalon_slave_0_write_n => avalon_pwm_0_avalon_slave_0_write_n,
      avalon_pwm_0_avalon_slave_0_writedata => avalon_pwm_0_avalon_slave_0_writedata,
      cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 => cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0,
      cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 => cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0,
      cpu_0_data_master_read_data_valid_avalon_pwm_0_avalon_slave_0 => cpu_0_data_master_read_data_valid_avalon_pwm_0_avalon_slave_0,
      cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0 => cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0,
      d1_avalon_pwm_0_avalon_slave_0_end_xfer => d1_avalon_pwm_0_avalon_slave_0_end_xfer,
      avalon_pwm_0_avalon_slave_0_readdata => avalon_pwm_0_avalon_slave_0_readdata,
      clk => clk_0,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      reset_n => clk_0_reset_n
    );


  --the_avalon_pwm_0, which is an e_ptf_instance
  the_avalon_pwm_0 : avalon_pwm_0
    port map(
      out_pwm => internal_out_pwm_from_the_avalon_pwm_0,
      readdata => avalon_pwm_0_avalon_slave_0_readdata,
      address => avalon_pwm_0_avalon_slave_0_address,
      chipselect => avalon_pwm_0_avalon_slave_0_chipselect,
      clk => clk_0,
      reset_n => avalon_pwm_0_avalon_slave_0_reset_n,
      write_n => avalon_pwm_0_avalon_slave_0_write_n,
      writedata => avalon_pwm_0_avalon_slave_0_writedata
    );


  --the_cpu_0_jtag_debug_module, which is an e_instance
  the_cpu_0_jtag_debug_module : cpu_0_jtag_debug_module_arbitrator
    port map(
      cpu_0_data_master_granted_cpu_0_jtag_debug_module => cpu_0_data_master_granted_cpu_0_jtag_debug_module,
      cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module => cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
      cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module => cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
      cpu_0_data_master_requests_cpu_0_jtag_debug_module => cpu_0_data_master_requests_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_granted_cpu_0_jtag_debug_module => cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module => cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module => cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_requests_cpu_0_jtag_debug_module => cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
      cpu_0_jtag_debug_module_address => cpu_0_jtag_debug_module_address,
      cpu_0_jtag_debug_module_begintransfer => cpu_0_jtag_debug_module_begintransfer,
      cpu_0_jtag_debug_module_byteenable => cpu_0_jtag_debug_module_byteenable,
      cpu_0_jtag_debug_module_chipselect => cpu_0_jtag_debug_module_chipselect,
      cpu_0_jtag_debug_module_debugaccess => cpu_0_jtag_debug_module_debugaccess,
      cpu_0_jtag_debug_module_readdata_from_sa => cpu_0_jtag_debug_module_readdata_from_sa,
      cpu_0_jtag_debug_module_reset_n => cpu_0_jtag_debug_module_reset_n,
      cpu_0_jtag_debug_module_resetrequest_from_sa => cpu_0_jtag_debug_module_resetrequest_from_sa,
      cpu_0_jtag_debug_module_write => cpu_0_jtag_debug_module_write,
      cpu_0_jtag_debug_module_writedata => cpu_0_jtag_debug_module_writedata,
      d1_cpu_0_jtag_debug_module_end_xfer => d1_cpu_0_jtag_debug_module_end_xfer,
      clk => clk_0,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_byteenable => cpu_0_data_master_byteenable,
      cpu_0_data_master_debugaccess => cpu_0_data_master_debugaccess,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      cpu_0_instruction_master_address_to_slave => cpu_0_instruction_master_address_to_slave,
      cpu_0_instruction_master_read => cpu_0_instruction_master_read,
      cpu_0_jtag_debug_module_readdata => cpu_0_jtag_debug_module_readdata,
      cpu_0_jtag_debug_module_resetrequest => cpu_0_jtag_debug_module_resetrequest,
      reset_n => clk_0_reset_n
    );


  --the_cpu_0_data_master, which is an e_instance
  the_cpu_0_data_master : cpu_0_data_master_arbitrator
    port map(
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_irq => cpu_0_data_master_irq,
      cpu_0_data_master_readdata => cpu_0_data_master_readdata,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      Avalon_F7_0_avalon_slave_0_readdata_from_sa => Avalon_F7_0_avalon_slave_0_readdata_from_sa,
      Boutons_s1_readdata_from_sa => Boutons_s1_readdata_from_sa,
      LEDs_s1_readdata_from_sa => LEDs_s1_readdata_from_sa,
      avalon_anemo_0_avalon_slave_0_readdata_from_sa => avalon_anemo_0_avalon_slave_0_readdata_from_sa,
      avalon_pwm_0_avalon_slave_0_readdata_from_sa => avalon_pwm_0_avalon_slave_0_readdata_from_sa,
      clk => clk_0,
      cpu_0_data_master_address => cpu_0_data_master_address,
      cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0 => cpu_0_data_master_granted_Avalon_F7_0_avalon_slave_0,
      cpu_0_data_master_granted_Boutons_s1 => cpu_0_data_master_granted_Boutons_s1,
      cpu_0_data_master_granted_LEDs_s1 => cpu_0_data_master_granted_LEDs_s1,
      cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0 => cpu_0_data_master_granted_avalon_anemo_0_avalon_slave_0,
      cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0 => cpu_0_data_master_granted_avalon_pwm_0_avalon_slave_0,
      cpu_0_data_master_granted_cpu_0_jtag_debug_module => cpu_0_data_master_granted_cpu_0_jtag_debug_module,
      cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_granted_onchip_memory2_0_s1 => cpu_0_data_master_granted_onchip_memory2_0_s1,
      cpu_0_data_master_granted_sysid_0_control_slave => cpu_0_data_master_granted_sysid_0_control_slave,
      cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0 => cpu_0_data_master_qualified_request_Avalon_F7_0_avalon_slave_0,
      cpu_0_data_master_qualified_request_Boutons_s1 => cpu_0_data_master_qualified_request_Boutons_s1,
      cpu_0_data_master_qualified_request_LEDs_s1 => cpu_0_data_master_qualified_request_LEDs_s1,
      cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0 => cpu_0_data_master_qualified_request_avalon_anemo_0_avalon_slave_0,
      cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0 => cpu_0_data_master_qualified_request_avalon_pwm_0_avalon_slave_0,
      cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module => cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
      cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_qualified_request_onchip_memory2_0_s1 => cpu_0_data_master_qualified_request_onchip_memory2_0_s1,
      cpu_0_data_master_qualified_request_sysid_0_control_slave => cpu_0_data_master_qualified_request_sysid_0_control_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_read_data_valid_Avalon_F7_0_avalon_slave_0 => cpu_0_data_master_read_data_valid_Avalon_F7_0_avalon_slave_0,
      cpu_0_data_master_read_data_valid_Boutons_s1 => cpu_0_data_master_read_data_valid_Boutons_s1,
      cpu_0_data_master_read_data_valid_LEDs_s1 => cpu_0_data_master_read_data_valid_LEDs_s1,
      cpu_0_data_master_read_data_valid_avalon_anemo_0_avalon_slave_0 => cpu_0_data_master_read_data_valid_avalon_anemo_0_avalon_slave_0,
      cpu_0_data_master_read_data_valid_avalon_pwm_0_avalon_slave_0 => cpu_0_data_master_read_data_valid_avalon_pwm_0_avalon_slave_0,
      cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module => cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
      cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 => cpu_0_data_master_read_data_valid_onchip_memory2_0_s1,
      cpu_0_data_master_read_data_valid_sysid_0_control_slave => cpu_0_data_master_read_data_valid_sysid_0_control_slave,
      cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0 => cpu_0_data_master_requests_Avalon_F7_0_avalon_slave_0,
      cpu_0_data_master_requests_Boutons_s1 => cpu_0_data_master_requests_Boutons_s1,
      cpu_0_data_master_requests_LEDs_s1 => cpu_0_data_master_requests_LEDs_s1,
      cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0 => cpu_0_data_master_requests_avalon_anemo_0_avalon_slave_0,
      cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0 => cpu_0_data_master_requests_avalon_pwm_0_avalon_slave_0,
      cpu_0_data_master_requests_cpu_0_jtag_debug_module => cpu_0_data_master_requests_cpu_0_jtag_debug_module,
      cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_requests_onchip_memory2_0_s1 => cpu_0_data_master_requests_onchip_memory2_0_s1,
      cpu_0_data_master_requests_sysid_0_control_slave => cpu_0_data_master_requests_sysid_0_control_slave,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_jtag_debug_module_readdata_from_sa => cpu_0_jtag_debug_module_readdata_from_sa,
      d1_Avalon_F7_0_avalon_slave_0_end_xfer => d1_Avalon_F7_0_avalon_slave_0_end_xfer,
      d1_Boutons_s1_end_xfer => d1_Boutons_s1_end_xfer,
      d1_LEDs_s1_end_xfer => d1_LEDs_s1_end_xfer,
      d1_avalon_anemo_0_avalon_slave_0_end_xfer => d1_avalon_anemo_0_avalon_slave_0_end_xfer,
      d1_avalon_pwm_0_avalon_slave_0_end_xfer => d1_avalon_pwm_0_avalon_slave_0_end_xfer,
      d1_cpu_0_jtag_debug_module_end_xfer => d1_cpu_0_jtag_debug_module_end_xfer,
      d1_jtag_uart_0_avalon_jtag_slave_end_xfer => d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
      d1_onchip_memory2_0_s1_end_xfer => d1_onchip_memory2_0_s1_end_xfer,
      d1_sysid_0_control_slave_end_xfer => d1_sysid_0_control_slave_end_xfer,
      jtag_uart_0_avalon_jtag_slave_irq_from_sa => jtag_uart_0_avalon_jtag_slave_irq_from_sa,
      jtag_uart_0_avalon_jtag_slave_readdata_from_sa => jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
      jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa => jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
      onchip_memory2_0_s1_readdata_from_sa => onchip_memory2_0_s1_readdata_from_sa,
      registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 => registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1,
      reset_n => clk_0_reset_n,
      sysid_0_control_slave_readdata_from_sa => sysid_0_control_slave_readdata_from_sa
    );


  --the_cpu_0_instruction_master, which is an e_instance
  the_cpu_0_instruction_master : cpu_0_instruction_master_arbitrator
    port map(
      cpu_0_instruction_master_address_to_slave => cpu_0_instruction_master_address_to_slave,
      cpu_0_instruction_master_readdata => cpu_0_instruction_master_readdata,
      cpu_0_instruction_master_waitrequest => cpu_0_instruction_master_waitrequest,
      clk => clk_0,
      cpu_0_instruction_master_address => cpu_0_instruction_master_address,
      cpu_0_instruction_master_granted_cpu_0_jtag_debug_module => cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_granted_onchip_memory2_0_s1 => cpu_0_instruction_master_granted_onchip_memory2_0_s1,
      cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module => cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 => cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1,
      cpu_0_instruction_master_read => cpu_0_instruction_master_read,
      cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module => cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 => cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1,
      cpu_0_instruction_master_requests_cpu_0_jtag_debug_module => cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_requests_onchip_memory2_0_s1 => cpu_0_instruction_master_requests_onchip_memory2_0_s1,
      cpu_0_jtag_debug_module_readdata_from_sa => cpu_0_jtag_debug_module_readdata_from_sa,
      d1_cpu_0_jtag_debug_module_end_xfer => d1_cpu_0_jtag_debug_module_end_xfer,
      d1_onchip_memory2_0_s1_end_xfer => d1_onchip_memory2_0_s1_end_xfer,
      onchip_memory2_0_s1_readdata_from_sa => onchip_memory2_0_s1_readdata_from_sa,
      reset_n => clk_0_reset_n
    );


  --the_cpu_0, which is an e_ptf_instance
  the_cpu_0 : cpu_0
    port map(
      d_address => cpu_0_data_master_address,
      d_byteenable => cpu_0_data_master_byteenable,
      d_read => cpu_0_data_master_read,
      d_write => cpu_0_data_master_write,
      d_writedata => cpu_0_data_master_writedata,
      i_address => cpu_0_instruction_master_address,
      i_read => cpu_0_instruction_master_read,
      jtag_debug_module_debugaccess_to_roms => cpu_0_data_master_debugaccess,
      jtag_debug_module_readdata => cpu_0_jtag_debug_module_readdata,
      jtag_debug_module_resetrequest => cpu_0_jtag_debug_module_resetrequest,
      clk => clk_0,
      d_irq => cpu_0_data_master_irq,
      d_readdata => cpu_0_data_master_readdata,
      d_waitrequest => cpu_0_data_master_waitrequest,
      i_readdata => cpu_0_instruction_master_readdata,
      i_waitrequest => cpu_0_instruction_master_waitrequest,
      jtag_debug_module_address => cpu_0_jtag_debug_module_address,
      jtag_debug_module_begintransfer => cpu_0_jtag_debug_module_begintransfer,
      jtag_debug_module_byteenable => cpu_0_jtag_debug_module_byteenable,
      jtag_debug_module_debugaccess => cpu_0_jtag_debug_module_debugaccess,
      jtag_debug_module_select => cpu_0_jtag_debug_module_chipselect,
      jtag_debug_module_write => cpu_0_jtag_debug_module_write,
      jtag_debug_module_writedata => cpu_0_jtag_debug_module_writedata,
      reset_n => cpu_0_jtag_debug_module_reset_n
    );


  --the_jtag_uart_0_avalon_jtag_slave, which is an e_instance
  the_jtag_uart_0_avalon_jtag_slave : jtag_uart_0_avalon_jtag_slave_arbitrator
    port map(
      cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
      d1_jtag_uart_0_avalon_jtag_slave_end_xfer => d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
      jtag_uart_0_avalon_jtag_slave_address => jtag_uart_0_avalon_jtag_slave_address,
      jtag_uart_0_avalon_jtag_slave_chipselect => jtag_uart_0_avalon_jtag_slave_chipselect,
      jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa => jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa,
      jtag_uart_0_avalon_jtag_slave_irq_from_sa => jtag_uart_0_avalon_jtag_slave_irq_from_sa,
      jtag_uart_0_avalon_jtag_slave_read_n => jtag_uart_0_avalon_jtag_slave_read_n,
      jtag_uart_0_avalon_jtag_slave_readdata_from_sa => jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
      jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa => jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa,
      jtag_uart_0_avalon_jtag_slave_reset_n => jtag_uart_0_avalon_jtag_slave_reset_n,
      jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa => jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
      jtag_uart_0_avalon_jtag_slave_write_n => jtag_uart_0_avalon_jtag_slave_write_n,
      jtag_uart_0_avalon_jtag_slave_writedata => jtag_uart_0_avalon_jtag_slave_writedata,
      clk => clk_0,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      jtag_uart_0_avalon_jtag_slave_dataavailable => jtag_uart_0_avalon_jtag_slave_dataavailable,
      jtag_uart_0_avalon_jtag_slave_irq => jtag_uart_0_avalon_jtag_slave_irq,
      jtag_uart_0_avalon_jtag_slave_readdata => jtag_uart_0_avalon_jtag_slave_readdata,
      jtag_uart_0_avalon_jtag_slave_readyfordata => jtag_uart_0_avalon_jtag_slave_readyfordata,
      jtag_uart_0_avalon_jtag_slave_waitrequest => jtag_uart_0_avalon_jtag_slave_waitrequest,
      reset_n => clk_0_reset_n
    );


  --the_jtag_uart_0, which is an e_ptf_instance
  the_jtag_uart_0 : jtag_uart_0
    port map(
      av_irq => jtag_uart_0_avalon_jtag_slave_irq,
      av_readdata => jtag_uart_0_avalon_jtag_slave_readdata,
      av_waitrequest => jtag_uart_0_avalon_jtag_slave_waitrequest,
      dataavailable => jtag_uart_0_avalon_jtag_slave_dataavailable,
      readyfordata => jtag_uart_0_avalon_jtag_slave_readyfordata,
      av_address => jtag_uart_0_avalon_jtag_slave_address,
      av_chipselect => jtag_uart_0_avalon_jtag_slave_chipselect,
      av_read_n => jtag_uart_0_avalon_jtag_slave_read_n,
      av_write_n => jtag_uart_0_avalon_jtag_slave_write_n,
      av_writedata => jtag_uart_0_avalon_jtag_slave_writedata,
      clk => clk_0,
      rst_n => jtag_uart_0_avalon_jtag_slave_reset_n
    );


  --the_onchip_memory2_0_s1, which is an e_instance
  the_onchip_memory2_0_s1 : onchip_memory2_0_s1_arbitrator
    port map(
      cpu_0_data_master_granted_onchip_memory2_0_s1 => cpu_0_data_master_granted_onchip_memory2_0_s1,
      cpu_0_data_master_qualified_request_onchip_memory2_0_s1 => cpu_0_data_master_qualified_request_onchip_memory2_0_s1,
      cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 => cpu_0_data_master_read_data_valid_onchip_memory2_0_s1,
      cpu_0_data_master_requests_onchip_memory2_0_s1 => cpu_0_data_master_requests_onchip_memory2_0_s1,
      cpu_0_instruction_master_granted_onchip_memory2_0_s1 => cpu_0_instruction_master_granted_onchip_memory2_0_s1,
      cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 => cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1,
      cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 => cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1,
      cpu_0_instruction_master_requests_onchip_memory2_0_s1 => cpu_0_instruction_master_requests_onchip_memory2_0_s1,
      d1_onchip_memory2_0_s1_end_xfer => d1_onchip_memory2_0_s1_end_xfer,
      onchip_memory2_0_s1_address => onchip_memory2_0_s1_address,
      onchip_memory2_0_s1_byteenable => onchip_memory2_0_s1_byteenable,
      onchip_memory2_0_s1_chipselect => onchip_memory2_0_s1_chipselect,
      onchip_memory2_0_s1_clken => onchip_memory2_0_s1_clken,
      onchip_memory2_0_s1_readdata_from_sa => onchip_memory2_0_s1_readdata_from_sa,
      onchip_memory2_0_s1_reset => onchip_memory2_0_s1_reset,
      onchip_memory2_0_s1_write => onchip_memory2_0_s1_write,
      onchip_memory2_0_s1_writedata => onchip_memory2_0_s1_writedata,
      registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 => registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1,
      clk => clk_0,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_byteenable => cpu_0_data_master_byteenable,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      cpu_0_instruction_master_address_to_slave => cpu_0_instruction_master_address_to_slave,
      cpu_0_instruction_master_read => cpu_0_instruction_master_read,
      onchip_memory2_0_s1_readdata => onchip_memory2_0_s1_readdata,
      reset_n => clk_0_reset_n
    );


  --the_onchip_memory2_0, which is an e_ptf_instance
  the_onchip_memory2_0 : onchip_memory2_0
    port map(
      readdata => onchip_memory2_0_s1_readdata,
      address => onchip_memory2_0_s1_address,
      byteenable => onchip_memory2_0_s1_byteenable,
      chipselect => onchip_memory2_0_s1_chipselect,
      clk => clk_0,
      clken => onchip_memory2_0_s1_clken,
      reset => onchip_memory2_0_s1_reset,
      write => onchip_memory2_0_s1_write,
      writedata => onchip_memory2_0_s1_writedata
    );


  --the_sysid_0_control_slave, which is an e_instance
  the_sysid_0_control_slave : sysid_0_control_slave_arbitrator
    port map(
      cpu_0_data_master_granted_sysid_0_control_slave => cpu_0_data_master_granted_sysid_0_control_slave,
      cpu_0_data_master_qualified_request_sysid_0_control_slave => cpu_0_data_master_qualified_request_sysid_0_control_slave,
      cpu_0_data_master_read_data_valid_sysid_0_control_slave => cpu_0_data_master_read_data_valid_sysid_0_control_slave,
      cpu_0_data_master_requests_sysid_0_control_slave => cpu_0_data_master_requests_sysid_0_control_slave,
      d1_sysid_0_control_slave_end_xfer => d1_sysid_0_control_slave_end_xfer,
      sysid_0_control_slave_address => sysid_0_control_slave_address,
      sysid_0_control_slave_readdata_from_sa => sysid_0_control_slave_readdata_from_sa,
      sysid_0_control_slave_reset_n => sysid_0_control_slave_reset_n,
      clk => clk_0,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_write => cpu_0_data_master_write,
      reset_n => clk_0_reset_n,
      sysid_0_control_slave_readdata => sysid_0_control_slave_readdata
    );


  --the_sysid_0, which is an e_ptf_instance
  the_sysid_0 : sysid_0
    port map(
      readdata => sysid_0_control_slave_readdata,
      address => sysid_0_control_slave_address,
      clock => sysid_0_control_slave_clock,
      reset_n => sysid_0_control_slave_reset_n
    );


  --reset is asserted asynchronously and deasserted synchronously
  mon_sopc_reset_clk_0_domain_synch : mon_sopc_reset_clk_0_domain_synch_module
    port map(
      data_out => clk_0_reset_n,
      clk => clk_0,
      data_in => module_input,
      reset_n => reset_n_sources
    );

  module_input <= std_logic'('1');

  --reset sources mux, which is an e_mux
  reset_n_sources <= Vector_To_Std_Logic(NOT (((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT reset_n))) OR std_logic_vector'("00000000000000000000000000000000")) OR (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_jtag_debug_module_resetrequest_from_sa)))) OR (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_jtag_debug_module_resetrequest_from_sa))))));
  --sysid_0_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  sysid_0_control_slave_clock <= std_logic'('0');
  --vhdl renameroo for output signals
  led_Babord_from_the_Avalon_F7_0 <= internal_led_Babord_from_the_Avalon_F7_0;
  --vhdl renameroo for output signals
  led_STBY_from_the_Avalon_F7_0 <= internal_led_STBY_from_the_Avalon_F7_0;
  --vhdl renameroo for output signals
  led_Tribord_from_the_Avalon_F7_0 <= internal_led_Tribord_from_the_Avalon_F7_0;
  --vhdl renameroo for output signals
  led_appuis_from_the_Avalon_F7_0 <= internal_led_appuis_from_the_Avalon_F7_0;
  --vhdl renameroo for output signals
  out_bip_from_the_Avalon_F7_0 <= internal_out_bip_from_the_Avalon_F7_0;
  --vhdl renameroo for output signals
  out_port_from_the_LEDs <= internal_out_port_from_the_LEDs;
  --vhdl renameroo for output signals
  out_pwm_from_the_avalon_pwm_0 <= internal_out_pwm_from_the_avalon_pwm_0;

end europa;


--synthesis translate_off

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



-- <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
--add your libraries here
-- AND HERE WILL BE PRESERVED </ALTERA_NOTE>

entity test_bench is 
end entity test_bench;


architecture europa of test_bench is
component mon_sopc is 
           port (
                 -- 1) global signals:
                    signal clk_0 : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- the_Avalon_F7_0
                    signal BP_Barbord_to_the_Avalon_F7_0 : IN STD_LOGIC;
                    signal BP_STBY_to_the_Avalon_F7_0 : IN STD_LOGIC;
                    signal BP_Tribord_to_the_Avalon_F7_0 : IN STD_LOGIC;
                    signal led_Babord_from_the_Avalon_F7_0 : OUT STD_LOGIC;
                    signal led_STBY_from_the_Avalon_F7_0 : OUT STD_LOGIC;
                    signal led_Tribord_from_the_Avalon_F7_0 : OUT STD_LOGIC;
                    signal led_appuis_from_the_Avalon_F7_0 : OUT STD_LOGIC;
                    signal out_bip_from_the_Avalon_F7_0 : OUT STD_LOGIC;
                    signal reset_to_the_Avalon_F7_0 : IN STD_LOGIC;

                 -- the_Boutons
                    signal in_port_to_the_Boutons : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

                 -- the_LEDs
                    signal out_port_from_the_LEDs : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);

                 -- the_avalon_anemo_0
                    signal in_fred_anemometre_to_the_avalon_anemo_0 : IN STD_LOGIC;

                 -- the_avalon_pwm_0
                    signal out_pwm_from_the_avalon_pwm_0 : OUT STD_LOGIC
                 );
end component mon_sopc;

                signal BP_Barbord_to_the_Avalon_F7_0 :  STD_LOGIC;
                signal BP_STBY_to_the_Avalon_F7_0 :  STD_LOGIC;
                signal BP_Tribord_to_the_Avalon_F7_0 :  STD_LOGIC;
                signal clk :  STD_LOGIC;
                signal clk_0 :  STD_LOGIC;
                signal in_fred_anemometre_to_the_avalon_anemo_0 :  STD_LOGIC;
                signal in_port_to_the_Boutons :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa :  STD_LOGIC;
                signal led_Babord_from_the_Avalon_F7_0 :  STD_LOGIC;
                signal led_STBY_from_the_Avalon_F7_0 :  STD_LOGIC;
                signal led_Tribord_from_the_Avalon_F7_0 :  STD_LOGIC;
                signal led_appuis_from_the_Avalon_F7_0 :  STD_LOGIC;
                signal out_bip_from_the_Avalon_F7_0 :  STD_LOGIC;
                signal out_port_from_the_LEDs :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal out_pwm_from_the_avalon_pwm_0 :  STD_LOGIC;
                signal reset_n :  STD_LOGIC;
                signal reset_to_the_Avalon_F7_0 :  STD_LOGIC;
                signal sysid_0_control_slave_clock :  STD_LOGIC;


-- <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
--add your component and signal declaration here
-- AND HERE WILL BE PRESERVED </ALTERA_NOTE>


begin

  --Set us up the Dut
  DUT : mon_sopc
    port map(
      led_Babord_from_the_Avalon_F7_0 => led_Babord_from_the_Avalon_F7_0,
      led_STBY_from_the_Avalon_F7_0 => led_STBY_from_the_Avalon_F7_0,
      led_Tribord_from_the_Avalon_F7_0 => led_Tribord_from_the_Avalon_F7_0,
      led_appuis_from_the_Avalon_F7_0 => led_appuis_from_the_Avalon_F7_0,
      out_bip_from_the_Avalon_F7_0 => out_bip_from_the_Avalon_F7_0,
      out_port_from_the_LEDs => out_port_from_the_LEDs,
      out_pwm_from_the_avalon_pwm_0 => out_pwm_from_the_avalon_pwm_0,
      BP_Barbord_to_the_Avalon_F7_0 => BP_Barbord_to_the_Avalon_F7_0,
      BP_STBY_to_the_Avalon_F7_0 => BP_STBY_to_the_Avalon_F7_0,
      BP_Tribord_to_the_Avalon_F7_0 => BP_Tribord_to_the_Avalon_F7_0,
      clk_0 => clk_0,
      in_fred_anemometre_to_the_avalon_anemo_0 => in_fred_anemometre_to_the_avalon_anemo_0,
      in_port_to_the_Boutons => in_port_to_the_Boutons,
      reset_n => reset_n,
      reset_to_the_Avalon_F7_0 => reset_to_the_Avalon_F7_0
    );


  process
  begin
    clk_0 <= '0';
    loop
       wait for 10 ns;
       clk_0 <= not clk_0;
    end loop;
  end process;
  PROCESS
    BEGIN
       reset_n <= '0';
       wait for 200 ns;
       reset_n <= '1'; 
    WAIT;
  END PROCESS;


-- <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
--add additional architecture here
-- AND HERE WILL BE PRESERVED </ALTERA_NOTE>


end europa;



--synthesis translate_on
