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
extern char *STD_TEXTIO;
extern char *IEEE_P_3564397177;
static const char *ng2 = "D:/cbradford/WorkingExampleCollinDebug/GPS_ADC_/GEL_CAPTAN/ipcore_dir/ethernetFIFO/simulation/ethernetFIFO_tb.vhd";
extern char *IEEE_P_3620187407;

void ieee_p_3564397177_sub_3205433008_91900896(char *, char *, char *, char *, char *, unsigned char , int );
unsigned char ieee_p_3620187407_sub_4042748798_3965413181(char *, char *, char *, char *, char *);


void work_a_1490552078_3468965345_sub_3023077566_2526344928(char *t0, char *t1, char *t2, char *t3)
{
    char t4[80];
    char t5[24];
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    unsigned int t16;
    char *t17;

LAB0:    t6 = (t4 + 4U);
    t7 = ((STD_TEXTIO) + 3280);
    t8 = (t6 + 56U);
    *((char **)t8) = t7;
    t9 = (t6 + 40U);
    *((char **)t9) = 0;
    t10 = (t6 + 64U);
    *((int *)t10) = 1;
    t11 = (t6 + 48U);
    *((char **)t11) = 0;
    t12 = (t5 + 4U);
    t13 = (t2 != 0);
    if (t13 == 1)
        goto LAB3;

LAB2:    t14 = (t5 + 12U);
    *((char **)t14) = t3;
    t15 = (t3 + 12U);
    t16 = *((unsigned int *)t15);
    t16 = (t16 * 1U);
    t17 = (char *)alloca(t16);
    memcpy(t17, t2, t16);
    std_textio_write7(STD_TEXTIO, t1, t6, t17, t3, (unsigned char)0, 0);
    t7 = ((STD_TEXTIO) + 1480U);
    std_textio_writeline(STD_TEXTIO, t1, t7, t6);

LAB1:    xsi_access_variable_delete(t6);
    return;
LAB3:    *((char **)t12) = t2;
    goto LAB2;

}

void work_a_1490552078_3468965345_sub_3123274857_2526344928(char *t0, char *t1, char *t2, unsigned int t3, unsigned int t4)
{
    char t5[80];
    char t7[16];
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    t8 = (t7 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 7;
    t9 = (t8 + 4U);
    *((int *)t9) = 0;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t10 = (0 - 7);
    t11 = (t10 * -1);
    t11 = (t11 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t11;
    t9 = (t5 + 4U);
    t12 = ((STD_TEXTIO) + 3280);
    t13 = (t9 + 56U);
    *((char **)t13) = t12;
    t14 = (t9 + 40U);
    *((char **)t14) = 0;
    t15 = (t9 + 64U);
    *((int *)t15) = 1;
    t16 = (t9 + 48U);
    *((char **)t16) = 0;
    t17 = (t2 + 40U);
    t18 = *((char **)t17);
    t17 = (t18 + t4);
    t18 = (t7 + 12U);
    t11 = *((unsigned int *)t18);
    t11 = (t11 * 1U);
    t19 = (char *)alloca(t11);
    memcpy(t19, t17, t11);
    ieee_p_3564397177_sub_3205433008_91900896(IEEE_P_3564397177, t1, t9, t19, t7, (unsigned char)0, 0);
    t8 = ((STD_TEXTIO) + 1480U);
    std_textio_writeline(STD_TEXTIO, t1, t8, t9);

LAB1:    xsi_access_variable_delete(t9);
    return;
}

static void work_a_1490552078_3468965345_p_0(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 3232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(109, ng2);
    t3 = (400 * 1000LL);
    t2 = (t0 + 3040);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(110, ng2);

LAB8:    t4 = (1 == 1);
    if (t4 != 0)
        goto LAB9;

LAB11:    goto LAB2;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB9:    xsi_set_current_line(111, ng2);
    t2 = (t0 + 4904);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(112, ng2);
    t2 = (t0 + 2128U);
    t5 = *((char **)t2);
    t3 = *((int64 *)t5);
    t2 = (t0 + 3040);
    xsi_process_wait(t2, t3);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB10:;
LAB12:    xsi_set_current_line(113, ng2);
    t2 = (t0 + 4904);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(114, ng2);
    t2 = (t0 + 2128U);
    t5 = *((char **)t2);
    t3 = *((int64 *)t5);
    t2 = (t0 + 3040);
    xsi_process_wait(t2, t3);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    goto LAB8;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

}

static void work_a_1490552078_3468965345_p_1(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 3480U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(119, ng2);
    t3 = (200 * 1000LL);
    t2 = (t0 + 3288);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(120, ng2);

LAB8:    t4 = (1 == 1);
    if (t4 != 0)
        goto LAB9;

LAB11:    goto LAB2;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB9:    xsi_set_current_line(121, ng2);
    t2 = (t0 + 4968);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(122, ng2);
    t2 = (t0 + 2248U);
    t5 = *((char **)t2);
    t3 = *((int64 *)t5);
    t2 = (t0 + 3288);
    xsi_process_wait(t2, t3);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB10:;
LAB12:    xsi_set_current_line(123, ng2);
    t2 = (t0 + 4968);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(124, ng2);
    t2 = (t0 + 2248U);
    t5 = *((char **)t2);
    t3 = *((int64 *)t5);
    t2 = (t0 + 3288);
    xsi_process_wait(t2, t3);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    goto LAB8;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

}

static void work_a_1490552078_3468965345_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;

LAB0:    t1 = (t0 + 3728U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(131, ng2);
    t2 = (t0 + 5032);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(132, ng2);
    t7 = (4200 * 1000LL);
    t2 = (t0 + 3536);
    xsi_process_wait(t2, t7);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(133, ng2);
    t2 = (t0 + 5032);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(134, ng2);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1490552078_3468965345_p_3(char *t0)
{
    char t6[16];
    char t15[16];
    char t22[16];
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    int t18;
    unsigned char t19;
    char *t20;
    char *t23;
    char *t24;
    int t25;
    unsigned int t26;
    unsigned int t27;

LAB0:    xsi_set_current_line(142, ng2);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8720U);
    t4 = (t0 + 8800);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t9 = (0 - 0);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t11 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t3, t2, t4, t6);
    if (t11 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(147, ng2);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t9 = (7 - 7);
    t10 = (t9 * -1);
    t26 = (1U * t10);
    t27 = (0 + t26);
    t2 = (t3 + t27);
    t1 = *((unsigned char *)t2);
    t11 = (t1 == (unsigned char)3);
    if (t11 != 0)
        goto LAB8;

LAB10:
LAB9:    xsi_set_current_line(153, ng2);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t9 = (1 - 7);
    t10 = (t9 * -1);
    t26 = (1U * t10);
    t27 = (0 + t26);
    t2 = (t3 + t27);
    t1 = *((unsigned char *)t2);
    t11 = (t1 == (unsigned char)3);
    if (t11 != 0)
        goto LAB13;

LAB15:
LAB14:    xsi_set_current_line(156, ng2);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t9 = (5 - 7);
    t10 = (t9 * -1);
    t26 = (1U * t10);
    t27 = (0 + t26);
    t2 = (t3 + t27);
    t1 = *((unsigned char *)t2);
    t11 = (t1 == (unsigned char)3);
    if (t11 != 0)
        goto LAB16;

LAB18:
LAB17:    xsi_set_current_line(162, ng2);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t9 = (6 - 7);
    t10 = (t9 * -1);
    t26 = (1U * t10);
    t27 = (0 + t26);
    t2 = (t3 + t27);
    t1 = *((unsigned char *)t2);
    t11 = (t1 == (unsigned char)3);
    if (t11 != 0)
        goto LAB21;

LAB23:
LAB22:    t2 = (t0 + 4792);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(143, ng2);
    t17 = (t0 + 3784);
    t20 = (t0 + 8802);
    t23 = (t22 + 0U);
    t24 = (t23 + 0U);
    *((int *)t24) = 1;
    t24 = (t23 + 4U);
    *((int *)t24) = 7;
    t24 = (t23 + 8U);
    *((int *)t24) = 1;
    t25 = (7 - 1);
    t10 = (t25 * 1);
    t10 = (t10 + 1);
    t24 = (t23 + 12U);
    *((unsigned int *)t24) = t10;
    work_a_1490552078_3468965345_sub_3023077566_2526344928(t0, t17, t20, t22);
    xsi_set_current_line(144, ng2);
    t2 = (t0 + 3784);
    t3 = (t0 + 992U);
    work_a_1490552078_3468965345_sub_3123274857_2526344928(t0, t2, t3, 0U, 0U);
    goto LAB3;

LAB5:    t8 = (t0 + 1032U);
    t12 = *((char **)t8);
    t8 = (t0 + 8720U);
    t13 = (t0 + 8801);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 0;
    t17 = (t16 + 4U);
    *((int *)t17) = 0;
    t17 = (t16 + 8U);
    *((int *)t17) = 1;
    t18 = (0 - 0);
    t10 = (t18 * 1);
    t10 = (t10 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t10;
    t19 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t12, t8, t13, t15);
    t1 = t19;
    goto LAB7;

LAB8:    xsi_set_current_line(148, ng2);
    if ((unsigned char)0 == 0)
        goto LAB11;

LAB12:    goto LAB9;

LAB11:    t4 = (t0 + 8809);
    xsi_report(t4, 19U, (unsigned char)2);
    goto LAB12;

LAB13:    goto LAB14;

LAB16:    xsi_set_current_line(157, ng2);
    if ((unsigned char)0 == 0)
        goto LAB19;

LAB20:    goto LAB17;

LAB19:    t4 = (t0 + 8828);
    xsi_report(t4, 27U, (unsigned char)2);
    goto LAB20;

LAB21:    xsi_set_current_line(163, ng2);
    if ((unsigned char)0 == 0)
        goto LAB24;

LAB25:    goto LAB22;

LAB24:    t4 = (t0 + 8855);
    xsi_report(t4, 26U, (unsigned char)2);
    goto LAB25;

}

static void work_a_1490552078_3468965345_p_4(char *t0)
{
    char t8[16];
    char t16[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t9;
    char *t10;
    int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t17;
    char *t18;
    int t19;
    unsigned char t20;

LAB0:    t1 = (t0 + 4224U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(172, ng2);

LAB6:    t2 = (t0 + 4824);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t3 = (t0 + 4824);
    *((int *)t3) = 0;
    xsi_set_current_line(173, ng2);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8720U);
    t4 = (t0 + 8881);
    t9 = (t8 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 0;
    t10 = (t9 + 4U);
    *((int *)t10) = 0;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t11 = (0 - 0);
    t12 = (t11 * 1);
    t12 = (t12 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t12;
    t6 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t3, t2, t4, t8);
    if (t6 == 1)
        goto LAB11;

LAB12:    t5 = (unsigned char)0;

LAB13:    if (t5 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(178, ng2);
    if ((unsigned char)0 == 0)
        goto LAB16;

LAB17:
LAB9:    goto LAB2;

LAB5:    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(174, ng2);
    if ((unsigned char)0 == 0)
        goto LAB14;

LAB15:    goto LAB9;

LAB11:    t10 = (t0 + 1032U);
    t13 = *((char **)t10);
    t10 = (t0 + 8720U);
    t14 = (t0 + 8882);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 0;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = 1;
    t19 = (0 - 0);
    t12 = (t19 * 1);
    t12 = (t12 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t12;
    t20 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t13, t10, t14, t16);
    t5 = t20;
    goto LAB13;

LAB14:    t18 = (t0 + 8883);
    xsi_report(t18, 17U, (unsigned char)3);
    goto LAB15;

LAB16:    t2 = (t0 + 8900);
    xsi_report(t2, 27U, (unsigned char)3);
    goto LAB17;

}

static void work_a_1490552078_3468965345_p_5(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;

LAB0:    t1 = (t0 + 4472U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(186, ng2);
    t3 = (400 * 1000000000LL);
    t2 = (t0 + 4280);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(187, ng2);
    if ((unsigned char)0 == 0)
        goto LAB8;

LAB9:    goto LAB2;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    t2 = (t0 + 8927);
    xsi_report(t2, 20U, (unsigned char)3);
    goto LAB9;

}


extern void work_a_1490552078_3468965345_init()
{
	static char *pe[] = {(void *)work_a_1490552078_3468965345_p_0,(void *)work_a_1490552078_3468965345_p_1,(void *)work_a_1490552078_3468965345_p_2,(void *)work_a_1490552078_3468965345_p_3,(void *)work_a_1490552078_3468965345_p_4,(void *)work_a_1490552078_3468965345_p_5};
	static char *se[] = {(void *)work_a_1490552078_3468965345_sub_3023077566_2526344928,(void *)work_a_1490552078_3468965345_sub_3123274857_2526344928};
	xsi_register_didat("work_a_1490552078_3468965345", "isim/ethernetFIFO_tb.exe.sim/work/a_1490552078_3468965345.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
