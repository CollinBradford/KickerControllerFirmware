/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *STD_STANDARD;
char *IEEE_P_2592010699;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *SYNOPSYS_P_3308480207;
char *IEEE_P_0017514958;
char *IEEE_P_1242562249;
char *STD_TEXTIO;
char *IEEE_P_3564397177;
char *WORK_P_2318420936;
char *UNISIM_P_0947159679;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    synopsys_p_3308480207_init();
    ieee_p_0017514958_init();
    ieee_p_1242562249_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_p_2318420936_init();
    unisim_p_0947159679_init();
    work_a_0149863134_3367265570_init();
    work_a_0153932009_3367265570_init();
    work_a_0191524528_3367265570_init();
    work_a_0178783367_3367265570_init();
    work_a_0266801666_3367265570_init();
    work_a_0237336629_3367265570_init();
    work_a_0207865452_3367265570_init();
    work_a_0228699227_3367265570_init();
    work_a_0263897933_3367265570_init();
    work_a_0242788730_3367265570_init();
    work_a_0086306375_3367265570_init();
    work_a_0082216048_3367265570_init();
    work_a_0111163945_3367265570_init();
    work_a_0123883550_3367265570_init();
    work_a_0036521627_3367265570_init();
    work_a_0066006188_3367265570_init();
    work_a_3114533131_1992432545_init();
    work_a_0562365326_3192441503_init();
    work_a_3598191524_2126700906_init();
    unisim_a_1490675510_1976025627_init();
    xilinxcorelib_a_1187796907_3212880686_init();
    xilinxcorelib_a_1995120943_3212880686_init();
    xilinxcorelib_a_0209757386_3212880686_init();
    work_a_2290829330_1083906754_init();
    work_a_2583630262_0912031422_init();
    work_a_1416444588_3187800695_init();
    work_a_1490552078_3468965345_init();


    xsi_register_tops("work_a_1490552078_3468965345");

    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    SYNOPSYS_P_3308480207 = xsi_get_engine_memory("synopsys_p_3308480207");
    IEEE_P_0017514958 = xsi_get_engine_memory("ieee_p_0017514958");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    WORK_P_2318420936 = xsi_get_engine_memory("work_p_2318420936");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");

    return xsi_run_simulation(argc, argv);

}
