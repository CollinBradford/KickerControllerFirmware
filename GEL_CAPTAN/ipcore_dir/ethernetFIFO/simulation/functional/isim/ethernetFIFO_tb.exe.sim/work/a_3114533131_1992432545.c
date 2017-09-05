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
static const char *ng0 = "D:/cbradford/WorkingExampleCollinDebug/GPS_ADC_/GEL_CAPTAN/ipcore_dir/ethernetFIFO/simulation/ethernetFIFO_dgen.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_0017514958;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_0017514958_sub_2737647089_1861681735(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_3114533131_1992432545_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(101, ng0);

LAB3:    t1 = (t0 + 5576U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 12072);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 11928);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3114533131_1992432545_p_1(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(102, ng0);

LAB3:    t1 = (100 * 1000LL);
    t2 = (t0 + 6536U);
    t3 = *((char **)t2);
    t2 = (t0 + 12136);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 32U);
    xsi_driver_first_trans_delta(t2, 0U, 32U, t1);
    t8 = (t0 + 12136);
    xsi_driver_intertial_reject(t8, t1, t1);

LAB2:    t9 = (t0 + 11944);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3114533131_1992432545_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(121, ng0);

LAB3:    t1 = (t0 + 6696U);
    t2 = *((char **)t1);
    t1 = (t0 + 23884U);
    t3 = ieee_p_0017514958_sub_2737647089_1861681735(IEEE_P_0017514958, t2, t1);
    t4 = (t0 + 5576U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t3, t6);
    t4 = (t0 + 5736U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t9);
    t11 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t7, t10);
    t4 = (t0 + 12200);
    t12 = (t4 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t11;
    xsi_driver_first_trans_fast(t4);

LAB2:    t16 = (t0 + 11960);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3114533131_1992432545_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    int t6;
    int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    int t20;
    int t21;
    int t22;
    int t23;
    char *t24;
    char *t25;
    int t26;
    int t27;
    int t28;
    int t29;
    int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned char t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;

LAB0:    xsi_set_current_line(122, ng0);

LAB3:    t1 = (t0 + 6376U);
    t2 = *((char **)t1);
    t1 = (t0 + 6696U);
    t3 = *((char **)t1);
    t1 = (t0 + 23884U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t1);
    t5 = (32 * t4);
    t6 = (128 - t5);
    t7 = (t6 - 1);
    t8 = (127 - t7);
    t9 = (t0 + 6696U);
    t10 = *((char **)t9);
    t9 = (t0 + 23884U);
    t11 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t10, t9);
    t12 = (t11 + 1);
    t13 = (32 * t12);
    t14 = (128 - t13);
    xsi_vhdl_check_range_of_slice(127, 0, -1, t7, t14, -1);
    t15 = (t8 * 1U);
    t16 = (0 + t15);
    t17 = (t2 + t16);
    t18 = (t0 + 6696U);
    t19 = *((char **)t18);
    t18 = (t0 + 23884U);
    t20 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t19, t18);
    t21 = (32 * t20);
    t22 = (128 - t21);
    t23 = (t22 - 1);
    t24 = (t0 + 6696U);
    t25 = *((char **)t24);
    t24 = (t0 + 23884U);
    t26 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t25, t24);
    t27 = (t26 + 1);
    t28 = (32 * t27);
    t29 = (128 - t28);
    t30 = (t29 - t23);
    t31 = (t30 * -1);
    t31 = (t31 + 1);
    t32 = (1U * t31);
    t33 = (32U != t32);
    if (t33 == 1)
        goto LAB5;

LAB6:    t34 = (t0 + 12264);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    memcpy(t38, t17, 32U);
    xsi_driver_first_trans_fast(t34);

LAB2:    t39 = (t0 + 11976);
    *((int *)t39) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t32, 0);
    goto LAB6;

}

static void work_a_3114533131_1992432545_p_4(char *t0)
{
    char t18[16];
    char t19[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    char *t20;
    char *t21;
    int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned char t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(126, ng0);
    t1 = (t0 + 5256U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 5376U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 11992);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(127, ng0);
    t1 = xsi_get_transient_memory(2U);
    memset(t1, 0, 2U);
    t5 = t1;
    memset(t5, (unsigned char)2, 2U);
    t6 = (t0 + 12328);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 5736U);
    t6 = *((char **)t2);
    t14 = *((unsigned char *)t6);
    t15 = (t14 == (unsigned char)2);
    if (t15 == 1)
        goto LAB13;

LAB14:    t13 = (unsigned char)0;

LAB15:    if (t13 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 5416U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 6696U);
    t8 = *((char **)t2);
    t2 = (t0 + 23884U);
    t9 = (t0 + 24164);
    t20 = (t19 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 0;
    t21 = (t20 + 4U);
    *((int *)t21) = 0;
    t21 = (t20 + 8U);
    *((int *)t21) = 1;
    t22 = (0 - 0);
    t23 = (t22 * 1);
    t23 = (t23 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t23;
    t21 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t18, t8, t2, t9, t19);
    t24 = (t18 + 12U);
    t23 = *((unsigned int *)t24);
    t25 = (1U * t23);
    t26 = (2U != t25);
    if (t26 == 1)
        goto LAB16;

LAB17:    t27 = (t0 + 12328);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t21, 2U);
    xsi_driver_first_trans_fast(t27);
    goto LAB11;

LAB13:    t2 = (t0 + 5576U);
    t7 = *((char **)t2);
    t16 = *((unsigned char *)t7);
    t17 = (t16 == (unsigned char)3);
    t13 = t17;
    goto LAB15;

LAB16:    xsi_size_not_matching(2U, t25, 0);
    goto LAB17;

}


extern void work_a_3114533131_1992432545_init()
{
	static char *pe[] = {(void *)work_a_3114533131_1992432545_p_0,(void *)work_a_3114533131_1992432545_p_1,(void *)work_a_3114533131_1992432545_p_2,(void *)work_a_3114533131_1992432545_p_3,(void *)work_a_3114533131_1992432545_p_4};
	xsi_register_didat("work_a_3114533131_1992432545", "isim/ethernetFIFO_tb.exe.sim/work/a_3114533131_1992432545.didat");
	xsi_register_executes(pe);
}
