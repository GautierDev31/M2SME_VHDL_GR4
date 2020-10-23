  --Example instantiation for system 'mon_sopc'
  mon_sopc_inst : mon_sopc
    port map(
      out_port_from_the_LEDs => out_port_from_the_LEDs,
      out_pwm_from_the_avalon_pwm_0 => out_pwm_from_the_avalon_pwm_0,
      clk_0 => clk_0,
      in_port_to_the_Boutons => in_port_to_the_Boutons,
      reset_n => reset_n
    );


