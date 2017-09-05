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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/cbradford/WorkingExampleCollinDebug/GPS_ADC_/GEL_CAPTAN/ipcore_dir/ethernetFIFO/simulation/ethernetFIFO_dverif.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_0562365326_3192441503_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(106, ng0);

LAB3:    t1 = (t0 + 6800U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 13464);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 13288);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0562365326_3192441503_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(107, ng0);

LAB3:    t1 = (t0 + 7120U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 13528);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 13304);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0562365326_3192441503_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(108, ng0);

LAB3:    t1 = (t0 + 5840U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 13592);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);

LAB2:    t8 = (t0 + 13320);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0562365326_3192441503_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(117, ng0);
    t1 = (t0 + 5520U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 5640U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 13336);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(118, ng0);
    t1 = (t0 + 13656);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 6000U);
    t6 = *((char **)t2);
    t13 = *((unsigned char *)t6);
    t14 = (t13 == (unsigned char)2);
    if (t14 == 1)
        goto LAB16;

LAB17:    t12 = (unsigned char)0;

LAB18:    if (t12 == 1)
        goto LAB13;

LAB14:    t11 = (unsigned char)0;

LAB15:    if (t11 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 5680U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 13656);
    t19 = (t2 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB11;

LAB13:    t2 = (t0 + 7440U);
    t8 = *((char **)t2);
    t17 = *((unsigned char *)t8);
    t18 = (t17 == (unsigned char)2);
    t11 = t18;
    goto LAB15;

LAB16:    t2 = (t0 + 7120U);
    t7 = *((char **)t2);
    t15 = *((unsigned char *)t7);
    t16 = (t15 == (unsigned char)3);
    t12 = t16;
    goto LAB18;

}

static void work_a_0562365326_3192441503_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(126, ng0);

LAB3:    t1 = (t0 + 7120U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6000U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t5);
    t7 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t3, t6);
    t1 = (t0 + 7440U);
    t8 = *((char **)t1);
    t9 = *((unsigned char *)t8);
    t10 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t7, t9);
    t1 = (t0 + 13720);
    t11 = (t1 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast(t1);

LAB2:    t15 = (t0 + 13352);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0562365326_3192441503_p_5(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(127, ng0);

LAB3:    t1 = (t0 + 6960U);
    t2 = *((char **)t1);
    t3 = (128 - 1);
    t4 = (127 - t3);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = (t0 + 13784);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 128U);
    xsi_driver_first_trans_fast(t7);

LAB2:    t12 = (t0 + 13368);
    *((int *)t12) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0562365326_3192441503_p_6(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned char t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(145, ng0);
    t1 = (t0 + 5520U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 5640U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 13384);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(146, ng0);
    t1 = (t0 + 13848);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(148, ng0);
    t2 = (t0 + 6000U);
    t6 = *((char **)t2);
    t12 = *((unsigned char *)t6);
    t13 = (t12 == (unsigned char)2);
    if (t13 == 1)
        goto LAB13;

LAB14:    t11 = (unsigned char)0;

LAB15:    if (t11 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 5680U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(149, ng0);
    t2 = (t0 + 6160U);
    t19 = *((char **)t2);
    t2 = (t0 + 26416U);
    t20 = (t0 + 6640U);
    t21 = *((char **)t20);
    t20 = (t0 + 26432U);
    t22 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t19, t2, t21, t20);
    if (t22 != 0)
        goto LAB19;

LAB21:    xsi_set_current_line(152, ng0);
    t1 = (t0 + 13848);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB20:    goto LAB11;

LAB13:    t2 = (t0 + 7120U);
    t7 = *((char **)t2);
    t15 = *((unsigned char *)t7);
    t16 = (t15 == (unsigned char)3);
    if (t16 == 1)
        goto LAB16;

LAB17:    t14 = (unsigned char)0;

LAB18:    t11 = t14;
    goto LAB15;

LAB16:    t2 = (t0 + 7440U);
    t8 = *((char **)t2);
    t17 = *((unsigned char *)t8);
    t18 = (t17 == (unsigned char)3);
    t14 = t18;
    goto LAB18;

LAB19:    xsi_set_current_line(150, ng0);
    t23 = (t0 + 13848);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = (unsigned char)2;
    xsi_driver_first_trans_fast(t23);
    goto LAB20;

}


extern void work_a_0562365326_3192441503_init()
{
	static char *pe[] = {(void *)work_a_0562365326_3192441503_p_0,(void *)work_a_0562365326_3192441503_p_1,(void *)work_a_0562365326_3192441503_p_2,(void *)work_a_0562365326_3192441503_p_3,(void *)work_a_0562365326_3192441503_p_4,(void *)work_a_0562365326_3192441503_p_5,(void *)work_a_0562365326_3192441503_p_6};
	xsi_register_didat("work_a_0562365326_3192441503", "isim/ethernetFIFO_tb.exe.sim/work/a_0562365326_3192441503.didat");
	xsi_register_executes(pe);
}
