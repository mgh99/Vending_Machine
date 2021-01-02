library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD;

entity vendingMachine is 
    port (CLK, RST: in STD_LOGIC;
         coin_in : in STD_LOGIC_VECTOR(2 downto 0);
         lata: buffer STD_LOGIC;
         coin_out : out std_logic_vector(2 downto 0)
     );
end vendingMachine;

architecture Behavioral of vendingMachine is

    type state_type is (S0, S1);
    signal current_state, next_state: state_type;
begin

    process (CLK) --Process sincrono para controlar el estado inicial y el estado siguiente
        begin
            if(rising_edge(CLK)) then
                if (RST = '1') then 
                    current_state <= S0;
                 else
                     current_state <= next_state;
                    end if;
             end if;
    end process;
    
    process (current_state, coin_in) begin
      
            case current_state is
                when S0 =>
                 if(coin_in <= "001") then 
                 ---llega un euro
                        next_state <= S1;
                        lata <= '0';
                        coin_out<="000";
                 elsif ( coin_in <="010") then 
                        -- llega dos euros
                        next_state <= S0;
                        lata <= '1';
                        coin_out <= "000";
                 elsif (coin_in <= "101") then
                   -- me llegan 5 euros
                       next_state <= S0;
                       lata <='1';
                       coin_out <= "011"; -- cambio tres euros
                 else 
                      next_state <=S0;
                      lata <= '0';
                      coin_out <="000";
                      end if;
               when S1 =>
                    if(coin_in <= "001") then 
                    --total 2 euros
                       lata <='1';
                       coin_out <= "000";
                       next_state <= S0;
                     elsif ( coin_in <="010") then 
                        -- total tres euros
                        next_state <= S0;
                        lata <= '1';
                        coin_out <= "001";
                  elsif (coin_in <= "101") then
                   -- total seis euros
                       next_state <= S0;
                       lata <='1';
                       coin_out <= "100";     
                    else 
                      next_state <=S0;
                      lata <= '0';
                      coin_out <="000";
                      end if;
                   when others => 
                       next_state <=S0;
                       coin_out <= "000";
                       lata <= '0';
                       end case;
                        
                       end process;
                      
end Behavioral;
