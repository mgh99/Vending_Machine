library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_vendingMachine is
end tb_vendingMachine;

architecture Behavioral of tb_vendingMachine is
    component vendingMachine is
        Port (CLK, RST: in std_logic;
              coin_in : in std_logic_vector(2 downto 0);
              lata : buffer std_logic;
              coin_out : out std_logic_vector (2 downto 0)
        );
    end component;
    
    signal CLK, RST,lata: std_logic;
    signal coin_in: std_logic_vector(2 downto 0);
    signal  coin_out  :std_logic_vector(2 downto 0);
    
begin
    DUT: vendingMachine port map (CLK,RST,coin_in,lata,coin_out);

process begin
    CLK <= '0'; wait for 10ns;
    CLK <= '1'; wait for 15ns;
end process;

process begin 
    RST <= '0'; wait;
end process;

process begin 
    coin_in <= "000"; wait for 5 ns; --0
    coin_in <= "001"; wait for 10ns; --1
    coin_in <= "010"; wait for 8ns;  --2
    coin_in <= "101"; wait for 5ns;  --5
end process;

end Behavioral;
