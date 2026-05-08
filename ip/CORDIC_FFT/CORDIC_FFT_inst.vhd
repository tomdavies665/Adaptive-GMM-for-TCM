	component CORDIC_FFT is
		port (
			areset : in  std_logic                     := 'X';             -- reset
			clk    : in  std_logic                     := 'X';             -- clk
			q      : out std_logic_vector(26 downto 0);                    -- q
			r      : out std_logic_vector(26 downto 0);                    -- r
			x      : in  std_logic_vector(25 downto 0) := (others => 'X'); -- x
			y      : in  std_logic_vector(25 downto 0) := (others => 'X')  -- y
		);
	end component CORDIC_FFT;

	u0 : component CORDIC_FFT
		port map (
			areset => CONNECTED_TO_areset, -- areset.reset
			clk    => CONNECTED_TO_clk,    --    clk.clk
			q      => CONNECTED_TO_q,      --      q.q
			r      => CONNECTED_TO_r,      --      r.r
			x      => CONNECTED_TO_x,      --      x.x
			y      => CONNECTED_TO_y       --      y.y
		);

