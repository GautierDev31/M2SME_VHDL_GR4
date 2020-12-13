  --Example instantiation for system 'mon_sopc'
  mon_sopc_inst : mon_sopc
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


