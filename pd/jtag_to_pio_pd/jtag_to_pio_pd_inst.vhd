	component jtag_to_pio_pd is
		port (
			clk_i_clk       : in  std_logic                    := 'X'; -- clk
			pio_o_export    : out std_logic_vector(7 downto 0);        -- export
			reset_i_reset_n : in  std_logic                    := 'X'  -- reset_n
		);
	end component jtag_to_pio_pd;

	u0 : component jtag_to_pio_pd
		port map (
			clk_i_clk       => CONNECTED_TO_clk_i_clk,       --   clk_i.clk
			pio_o_export    => CONNECTED_TO_pio_o_export,    --   pio_o.export
			reset_i_reset_n => CONNECTED_TO_reset_i_reset_n  -- reset_i.reset_n
		);

