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
static const char *ng0 = "D:/cbradford/WorkingExampleCollinDebug/GPS_ADC_/GEL_CAPTAN/ipcore_dir/ethernetFIFO/simulation/ethernetFIFO_rng.vhd";
extern char *IEEE_P_3499444699;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_853553178_503743352(char *, unsigned char , unsigned char );
char *ieee_p_3499444699_sub_2213602152_3536714472(char *, char *, int , int );


static void work_a_0191524528_3367265570_p_0(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    int t21;
    int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned char t26;
    unsigned char t27;
    char *t28;
    char *t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned char t35;
    unsigned char t36;
    char *t37;
    char *t38;
    int t39;
    int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned char t44;
    unsigned char t45;
    char *t46;
    char *t47;

LAB0:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    xsi_set_current_line(96, ng0);
    t1 = (t0 + 2048U);
    t2 = *((char **)t1);
    t1 = (t0 + 3552);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t12 = (t7 + 56U);
    t19 = *((char **)t12);
    memcpy(t19, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 3472);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(86, ng0);
    t1 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t5, 15, 8);
    t6 = (t0 + 2048U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 8U);
    xsi_set_current_line(87, ng0);
    t1 = (t0 + 2168U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    goto LAB3;

LAB5:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 1352U);
    t7 = *((char **)t2);
    t10 = *((unsigned char *)t7);
    t11 = (t10 == (unsigned char)3);
    if (t11 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t6 = *((char **)t2);
    t8 = *((unsigned char *)t6);
    t9 = (t8 == (unsigned char)3);
    t3 = t9;
    goto LAB9;

LAB10:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2048U);
    t12 = *((char **)t2);
    t13 = (8 - 1);
    t14 = (t13 - 7);
    t15 = (t14 * -1);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t2 = (t12 + t17);
    t18 = *((unsigned char *)t2);
    t19 = (t0 + 2048U);
    t20 = *((char **)t19);
    t21 = (8 - 3);
    t22 = (t21 - 7);
    t23 = (t22 * -1);
    t24 = (1U * t23);
    t25 = (0 + t24);
    t19 = (t20 + t25);
    t26 = *((unsigned char *)t19);
    t27 = ieee_p_2592010699_sub_853553178_503743352(IEEE_P_2592010699, t18, t26);
    t28 = (t0 + 2048U);
    t29 = *((char **)t28);
    t30 = (8 - 4);
    t31 = (t30 - 7);
    t32 = (t31 * -1);
    t33 = (1U * t32);
    t34 = (0 + t33);
    t28 = (t29 + t34);
    t35 = *((unsigned char *)t28);
    t36 = ieee_p_2592010699_sub_853553178_503743352(IEEE_P_2592010699, t27, t35);
    t37 = (t0 + 2048U);
    t38 = *((char **)t37);
    t39 = (8 - 5);
    t40 = (t39 - 7);
    t41 = (t40 * -1);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t37 = (t38 + t43);
    t44 = *((unsigned char *)t37);
    t45 = ieee_p_2592010699_sub_853553178_503743352(IEEE_P_2592010699, t36, t44);
    t46 = (t0 + 2168U);
    t47 = *((char **)t46);
    t46 = (t47 + 0);
    *((unsigned char *)t46) = t45;
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 2048U);
    t2 = *((char **)t1);
    t13 = (8 - 2);
    t15 = (7 - t13);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t1 = (t2 + t17);
    t6 = xsi_get_transient_memory(7U);
    memcpy(t6, t1, 7U);
    t7 = (t0 + 2048U);
    t12 = *((char **)t7);
    t14 = (8 - 1);
    t23 = (7 - t14);
    t24 = (t23 * 1U);
    t25 = (0 + t24);
    t7 = (t12 + t25);
    memcpy(t7, t6, 7U);
    xsi_set_current_line(92, ng0);
    t1 = (t0 + 2168U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2048U);
    t6 = *((char **)t1);
    t13 = (0 - 7);
    t15 = (t13 * -1);
    t16 = (1U * t15);
    t17 = (0 + t16);
    t1 = (t6 + t17);
    *((unsigned char *)t1) = t3;
    goto LAB11;

}


extern void work_a_0191524528_3367265570_init()
{
	static char *pe[] = {(void *)work_a_0191524528_3367265570_p_0};
	xsi_register_didat("work_a_0191524528_3367265570", "isim/ethernetFIFO_tb.exe.sim/work/a_0191524528_3367265570.didat");
	xsi_register_executes(pe);
}
