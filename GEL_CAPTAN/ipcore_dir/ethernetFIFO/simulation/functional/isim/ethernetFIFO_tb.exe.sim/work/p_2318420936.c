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
extern char *STD_STANDARD;
extern char *IEEE_P_2592010699;



int work_p_2318420936_sub_1315575287_3108146387(char *t1, int t2, int t3)
{
    char t4[128];
    char t5[16];
    char t9[8];
    int t0;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    unsigned char t17;
    int t18;
    int t19;

LAB0:    t6 = (t4 + 4U);
    t7 = ((STD_STANDARD) + 384);
    t8 = (t6 + 88U);
    *((char **)t8) = t7;
    t10 = (t6 + 56U);
    *((char **)t10) = t9;
    xsi_type_set_default_value(t7, t9, 0);
    t11 = (t6 + 80U);
    *((unsigned int *)t11) = 4U;
    t12 = (t5 + 4U);
    *((int *)t12) = t2;
    t13 = (t5 + 8U);
    *((int *)t13) = t3;
    t14 = (t2 / t3);
    t15 = (t6 + 56U);
    t16 = *((char **)t15);
    t15 = (t16 + 0);
    *((int *)t15) = t14;
    t14 = xsi_vhdl_mod(t2, t3);
    t17 = (t14 != 0);
    if (t17 != 0)
        goto LAB2;

LAB4:
LAB3:    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t14 = *((int *)t8);
    t0 = t14;

LAB1:    return t0;
LAB2:    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t18 = *((int *)t8);
    t19 = (t18 + 1);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    t7 = (t10 + 0);
    *((int *)t7) = t19;
    goto LAB3;

LAB5:;
}

int work_p_2318420936_sub_3672023036_3108146387(char *t1, unsigned char t2, int t3, int t4)
{
    char t5[128];
    char t6[16];
    char t10[8];
    int t0;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned char t16;
    char *t17;
    char *t18;
    int t19;

LAB0:    t7 = (t5 + 4U);
    t8 = ((STD_STANDARD) + 384);
    t9 = (t7 + 88U);
    *((char **)t9) = t8;
    t11 = (t7 + 56U);
    *((char **)t11) = t10;
    *((int *)t10) = 0;
    t12 = (t7 + 80U);
    *((unsigned int *)t12) = 4U;
    t13 = (t6 + 4U);
    *((unsigned char *)t13) = t2;
    t14 = (t6 + 5U);
    *((int *)t14) = t3;
    t15 = (t6 + 9U);
    *((int *)t15) = t4;
    t16 = (t2 == (unsigned char)0);
    if (t16 != 0)
        goto LAB2;

LAB4:    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    *((int *)t8) = t3;

LAB3:    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t19 = *((int *)t9);
    t0 = t19;

LAB1:    return t0;
LAB2:    t17 = (t7 + 56U);
    t18 = *((char **)t17);
    t17 = (t18 + 0);
    *((int *)t17) = t4;
    goto LAB3;

LAB5:;
}

unsigned char work_p_2318420936_sub_70260629_3108146387(char *t1, unsigned char t2, unsigned char t3, unsigned char t4)
{
    char t5[128];
    char t6[8];
    char t10[8];
    unsigned char t0;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned char t16;
    char *t17;
    char *t18;

LAB0:    t7 = (t5 + 4U);
    t8 = ((IEEE_P_2592010699) + 3320);
    t9 = (t7 + 88U);
    *((char **)t9) = t8;
    t11 = (t7 + 56U);
    *((char **)t11) = t10;
    *((unsigned char *)t10) = (unsigned char)2;
    t12 = (t7 + 80U);
    *((unsigned int *)t12) = 1U;
    t13 = (t6 + 4U);
    *((unsigned char *)t13) = t2;
    t14 = (t6 + 5U);
    *((unsigned char *)t14) = t3;
    t15 = (t6 + 6U);
    *((unsigned char *)t15) = t4;
    t16 = (t2 == (unsigned char)0);
    if (t16 != 0)
        goto LAB2;

LAB4:    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    *((unsigned char *)t8) = t3;

LAB3:    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t16 = *((unsigned char *)t9);
    t0 = t16;

LAB1:    return t0;
LAB2:    t17 = (t7 + 56U);
    t18 = *((char **)t17);
    t17 = (t18 + 0);
    *((unsigned char *)t17) = t4;
    goto LAB3;

LAB5:;
}

int64 work_p_2318420936_sub_1893995693_3108146387(char *t1, unsigned char t2, int64 t3, int64 t4)
{
    char t5[128];
    char t6[24];
    char t11[8];
    int64 t0;
    int64 t7;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned char t17;
    char *t18;
    char *t19;

LAB0:    t7 = (0 * 1LL);
    t8 = (t5 + 4U);
    t9 = ((STD_STANDARD) + 576);
    t10 = (t8 + 88U);
    *((char **)t10) = t9;
    t12 = (t8 + 56U);
    *((char **)t12) = t11;
    *((int64 *)t11) = t7;
    t13 = (t8 + 80U);
    *((unsigned int *)t13) = 8U;
    t14 = (t6 + 4U);
    *((unsigned char *)t14) = t2;
    t15 = (t6 + 5U);
    *((int64 *)t15) = t3;
    t16 = (t6 + 13U);
    *((int64 *)t16) = t4;
    t17 = (t2 == (unsigned char)0);
    if (t17 != 0)
        goto LAB2;

LAB4:    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    *((int64 *)t9) = t3;

LAB3:    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t7 = *((int64 *)t10);
    t0 = t7;

LAB1:    return t0;
LAB2:    t18 = (t8 + 56U);
    t19 = *((char **)t18);
    t18 = (t19 + 0);
    *((int64 *)t18) = t4;
    goto LAB3;

LAB5:;
}

int work_p_2318420936_sub_3070965584_3108146387(char *t1, int t2)
{
    char t3[248];
    char t4[8];
    char t8[8];
    char t14[8];
    int t0;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    unsigned char t18;
    char *t19;
    char *t20;
    int t21;
    int t22;
    int t23;

LAB0:    t5 = (t3 + 4U);
    t6 = ((STD_STANDARD) + 384);
    t7 = (t5 + 88U);
    *((char **)t7) = t6;
    t9 = (t5 + 56U);
    *((char **)t9) = t8;
    *((int *)t8) = 0;
    t10 = (t5 + 80U);
    *((unsigned int *)t10) = 4U;
    t11 = (t3 + 124U);
    t12 = ((STD_STANDARD) + 384);
    t13 = (t11 + 88U);
    *((char **)t13) = t12;
    t15 = (t11 + 56U);
    *((char **)t15) = t14;
    *((int *)t14) = 1;
    t16 = (t11 + 80U);
    *((unsigned int *)t16) = 4U;
    t17 = (t4 + 4U);
    *((int *)t17) = t2;
    t18 = (t2 <= 1);
    if (t18 != 0)
        goto LAB2;

LAB4:
LAB5:    t6 = (t11 + 56U);
    t7 = *((char **)t6);
    t21 = *((int *)t7);
    t18 = (t21 < t2);
    if (t18 != 0)
        goto LAB6;

LAB8:
LAB3:    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t21 = *((int *)t7);
    t0 = t21;

LAB1:    return t0;
LAB2:    t19 = (t5 + 56U);
    t20 = *((char **)t19);
    t19 = (t20 + 0);
    *((int *)t19) = 1;
    goto LAB3;

LAB6:    t6 = (t5 + 56U);
    t9 = *((char **)t6);
    t22 = *((int *)t9);
    t23 = (t22 + 1);
    t6 = (t5 + 56U);
    t10 = *((char **)t6);
    t6 = (t10 + 0);
    *((int *)t6) = t23;
    t6 = (t11 + 56U);
    t7 = *((char **)t6);
    t21 = *((int *)t7);
    t22 = (t21 * 2);
    t6 = (t11 + 56U);
    t9 = *((char **)t6);
    t6 = (t9 + 0);
    *((int *)t6) = t22;
    goto LAB5;

LAB7:;
LAB9:;
}

char *work_p_2318420936_sub_3703097363_3108146387(char *t1, char *t2, char *t3, char *t4, int t5)
{
    char t6[368];
    char t7[24];
    char t16[16];
    char t28[16];
    char t34[8];
    char t41[8];
    char *t0;
    int t8;
    int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    unsigned int t15;
    int t17;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t29;
    char *t30;
    int t31;
    char *t32;
    char *t33;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t42;
    char *t43;
    char *t44;
    unsigned char t45;
    char *t46;
    char *t47;
    char *t48;
    int t49;
    int t50;
    char *t51;
    int t52;
    char *t53;
    int t54;
    int t55;
    int t56;
    int t57;
    int t58;
    char *t59;
    int t60;
    char *t61;
    int t62;
    int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    unsigned char t67;
    char *t68;
    char *t69;
    unsigned int t70;
    char *t71;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    unsigned int t76;
    int t77;
    static char *nl0[] = {&&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB9, &&LAB10, &&LAB11, &&LAB12, &&LAB13, &&LAB14, &&LAB15, &&LAB16, &&LAB17, &&LAB18, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB19, &&LAB21, &&LAB23, &&LAB25, &&LAB27, &&LAB29, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB20, &&LAB22, &&LAB24, &&LAB26, &&LAB28, &&LAB30, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31, &&LAB31};

LAB0:    t8 = (t5 - 1);
    t9 = (0 - t8);
    t10 = (t9 * -1);
    t10 = (t10 + 1);
    t10 = (t10 * 1U);
    t11 = xsi_get_transient_memory(t10);
    memset(t11, 0, t10);
    t12 = t11;
    memset(t12, (unsigned char)2, t10);
    t13 = (t5 - 1);
    t14 = (0 - t13);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t15 = (t15 * 1U);
    t17 = (t5 - 1);
    t18 = (t16 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = t17;
    t19 = (t18 + 4U);
    *((int *)t19) = 0;
    t19 = (t18 + 8U);
    *((int *)t19) = -1;
    t20 = (0 - t17);
    t21 = (t20 * -1);
    t21 = (t21 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t21;
    t19 = (t6 + 4U);
    t22 = ((IEEE_P_2592010699) + 4024);
    t23 = (t19 + 88U);
    *((char **)t23) = t22;
    t24 = (char *)alloca(t15);
    t25 = (t19 + 56U);
    *((char **)t25) = t24;
    memcpy(t24, t11, t15);
    t26 = (t19 + 64U);
    *((char **)t26) = t16;
    t27 = (t19 + 80U);
    *((unsigned int *)t27) = t15;
    t29 = (t28 + 0U);
    t30 = (t29 + 0U);
    *((int *)t30) = 3;
    t30 = (t29 + 4U);
    *((int *)t30) = 0;
    t30 = (t29 + 8U);
    *((int *)t30) = -1;
    t31 = (0 - 3);
    t21 = (t31 * -1);
    t21 = (t21 + 1);
    t30 = (t29 + 12U);
    *((unsigned int *)t30) = t21;
    t30 = (t6 + 124U);
    t32 = ((IEEE_P_2592010699) + 4024);
    t33 = (t30 + 88U);
    *((char **)t33) = t32;
    t35 = (t30 + 56U);
    *((char **)t35) = t34;
    xsi_type_set_default_value(t32, t34, t28);
    t36 = (t30 + 64U);
    *((char **)t36) = t28;
    t37 = (t30 + 80U);
    *((unsigned int *)t37) = 4U;
    t38 = (t6 + 244U);
    t39 = ((STD_STANDARD) + 384);
    t40 = (t38 + 88U);
    *((char **)t40) = t39;
    t42 = (t38 + 56U);
    *((char **)t42) = t41;
    *((int *)t41) = 0;
    t43 = (t38 + 80U);
    *((unsigned int *)t43) = 4U;
    t44 = (t7 + 4U);
    t45 = (t3 != 0);
    if (t45 == 1)
        goto LAB3;

LAB2:    t46 = (t7 + 12U);
    *((char **)t46) = t4;
    t47 = (t7 + 20U);
    *((int *)t47) = t5;
    t48 = (t4 + 8U);
    t49 = *((int *)t48);
    t50 = (t49 * -1);
    t51 = (t4 + 0U);
    t52 = *((int *)t51);
    t53 = (t4 + 4U);
    t54 = *((int *)t53);
    t55 = t54;
    t56 = t52;

LAB4:    t57 = (t56 * t50);
    t58 = (t55 * t50);
    if (t58 <= t57)
        goto LAB5;

LAB7:    t11 = (t19 + 56U);
    t12 = *((char **)t11);
    t11 = (t16 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t0 = xsi_get_transient_memory(t10);
    memcpy(t0, t12, t10);
    t18 = (t16 + 0U);
    t8 = *((int *)t18);
    t22 = (t16 + 4U);
    t9 = *((int *)t22);
    t23 = (t16 + 8U);
    t13 = *((int *)t23);
    t25 = (t2 + 0U);
    t26 = (t25 + 0U);
    *((int *)t26) = t8;
    t26 = (t25 + 4U);
    *((int *)t26) = t9;
    t26 = (t25 + 8U);
    *((int *)t26) = t13;
    t14 = (t9 - t8);
    t15 = (t14 * t13);
    t15 = (t15 + 1);
    t26 = (t25 + 12U);
    *((unsigned int *)t26) = t15;

LAB1:    return t0;
LAB3:    *((char **)t44) = t3;
    goto LAB2;

LAB5:    t59 = (t4 + 0U);
    t60 = *((int *)t59);
    t61 = (t4 + 8U);
    t62 = *((int *)t61);
    t63 = (t55 - t60);
    t21 = (t63 * t62);
    t64 = (1U * t21);
    t65 = (0 + t64);
    t66 = (t3 + t65);
    t67 = *((unsigned char *)t66);
    t68 = (char *)((nl0) + t67);
    goto **((char **)t68);

LAB6:    if (t55 == t56)
        goto LAB7;

LAB45:    t8 = (t55 + t50);
    t55 = t8;
    goto LAB4;

LAB8:    t8 = 0;
    t9 = 3;

LAB37:    if (t8 <= t9)
        goto LAB38;

LAB40:    t11 = (t38 + 56U);
    t12 = *((char **)t11);
    t8 = *((int *)t12);
    t9 = (t8 + 1);
    t11 = (t38 + 56U);
    t18 = *((char **)t11);
    t11 = (t18 + 0);
    *((int *)t11) = t9;
    goto LAB6;

LAB9:    t69 = (t28 + 12U);
    t70 = *((unsigned int *)t69);
    t70 = (t70 * 1U);
    t71 = xsi_get_transient_memory(t70);
    memset(t71, 0, t70);
    t72 = t71;
    memset(t72, (unsigned char)2, t70);
    t73 = (t30 + 56U);
    t74 = *((char **)t73);
    t73 = (t74 + 0);
    t75 = (t28 + 12U);
    t76 = *((unsigned int *)t75);
    t76 = (t76 * 1U);
    memcpy(t73, t71, t76);
    goto LAB8;

LAB10:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)2, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (0 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)3;
    t26 = (t30 + 56U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    t29 = (t28 + 12U);
    t64 = *((unsigned int *)t29);
    t64 = (t64 * 1U);
    memcpy(t26, t12, t64);
    goto LAB8;

LAB11:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)2, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (1 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)3;
    t26 = (t30 + 56U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    t29 = (t28 + 12U);
    t64 = *((unsigned int *)t29);
    t64 = (t64 * 1U);
    memcpy(t26, t12, t64);
    goto LAB8;

LAB12:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)2, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (0 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)3;
    t14 = (1 - t8);
    t64 = (t14 * t9);
    t65 = (1U * t64);
    t26 = (t18 + t65);
    *((unsigned char *)t26) = (unsigned char)3;
    t27 = (t30 + 56U);
    t29 = *((char **)t27);
    t27 = (t29 + 0);
    t32 = (t28 + 12U);
    t70 = *((unsigned int *)t32);
    t70 = (t70 * 1U);
    memcpy(t27, t12, t70);
    goto LAB8;

LAB13:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)2, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (2 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)3;
    t26 = (t30 + 56U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    t29 = (t28 + 12U);
    t64 = *((unsigned int *)t29);
    t64 = (t64 * 1U);
    memcpy(t26, t12, t64);
    goto LAB8;

LAB14:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)2, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (0 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)3;
    t14 = (2 - t8);
    t64 = (t14 * t9);
    t65 = (1U * t64);
    t26 = (t18 + t65);
    *((unsigned char *)t26) = (unsigned char)3;
    t27 = (t30 + 56U);
    t29 = *((char **)t27);
    t27 = (t29 + 0);
    t32 = (t28 + 12U);
    t70 = *((unsigned int *)t32);
    t70 = (t70 * 1U);
    memcpy(t27, t12, t70);
    goto LAB8;

LAB15:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)2, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (1 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)3;
    t14 = (2 - t8);
    t64 = (t14 * t9);
    t65 = (1U * t64);
    t26 = (t18 + t65);
    *((unsigned char *)t26) = (unsigned char)3;
    t27 = (t30 + 56U);
    t29 = *((char **)t27);
    t27 = (t29 + 0);
    t32 = (t28 + 12U);
    t70 = *((unsigned int *)t32);
    t70 = (t70 * 1U);
    memcpy(t27, t12, t70);
    goto LAB8;

LAB16:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (3 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)2;
    t26 = (t30 + 56U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    t29 = (t28 + 12U);
    t64 = *((unsigned int *)t29);
    t64 = (t64 * 1U);
    memcpy(t26, t12, t64);
    goto LAB8;

LAB17:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)2, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (3 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)3;
    t26 = (t30 + 56U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    t29 = (t28 + 12U);
    t64 = *((unsigned int *)t29);
    t64 = (t64 * 1U);
    memcpy(t26, t12, t64);
    goto LAB8;

LAB18:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)2, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (0 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)3;
    t14 = (3 - t8);
    t64 = (t14 * t9);
    t65 = (1U * t64);
    t26 = (t18 + t65);
    *((unsigned char *)t26) = (unsigned char)3;
    t27 = (t30 + 56U);
    t29 = *((char **)t27);
    t27 = (t29 + 0);
    t32 = (t28 + 12U);
    t70 = *((unsigned int *)t32);
    t70 = (t70 * 1U);
    memcpy(t27, t12, t70);
    goto LAB8;

LAB19:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (0 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)2;
    t14 = (2 - t8);
    t64 = (t14 * t9);
    t65 = (1U * t64);
    t26 = (t18 + t65);
    *((unsigned char *)t26) = (unsigned char)2;
    t27 = (t30 + 56U);
    t29 = *((char **)t27);
    t27 = (t29 + 0);
    t32 = (t28 + 12U);
    t70 = *((unsigned int *)t32);
    t70 = (t70 * 1U);
    memcpy(t27, t12, t70);
    goto LAB8;

LAB20:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (0 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)2;
    t14 = (2 - t8);
    t64 = (t14 * t9);
    t65 = (1U * t64);
    t26 = (t18 + t65);
    *((unsigned char *)t26) = (unsigned char)2;
    t27 = (t30 + 56U);
    t29 = *((char **)t27);
    t27 = (t29 + 0);
    t32 = (t28 + 12U);
    t70 = *((unsigned int *)t32);
    t70 = (t70 * 1U);
    memcpy(t27, t12, t70);
    goto LAB8;

LAB21:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (2 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)2;
    t26 = (t30 + 56U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    t29 = (t28 + 12U);
    t64 = *((unsigned int *)t29);
    t64 = (t64 * 1U);
    memcpy(t26, t12, t64);
    goto LAB8;

LAB22:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (2 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)2;
    t26 = (t30 + 56U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    t29 = (t28 + 12U);
    t64 = *((unsigned int *)t29);
    t64 = (t64 * 1U);
    memcpy(t26, t12, t64);
    goto LAB8;

LAB23:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (0 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)2;
    t14 = (1 - t8);
    t64 = (t14 * t9);
    t65 = (1U * t64);
    t26 = (t18 + t65);
    *((unsigned char *)t26) = (unsigned char)2;
    t27 = (t30 + 56U);
    t29 = *((char **)t27);
    t27 = (t29 + 0);
    t32 = (t28 + 12U);
    t70 = *((unsigned int *)t32);
    t70 = (t70 * 1U);
    memcpy(t27, t12, t70);
    goto LAB8;

LAB24:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (0 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)2;
    t14 = (1 - t8);
    t64 = (t14 * t9);
    t65 = (1U * t64);
    t26 = (t18 + t65);
    *((unsigned char *)t26) = (unsigned char)2;
    t27 = (t30 + 56U);
    t29 = *((char **)t27);
    t27 = (t29 + 0);
    t32 = (t28 + 12U);
    t70 = *((unsigned int *)t32);
    t70 = (t70 * 1U);
    memcpy(t27, t12, t70);
    goto LAB8;

LAB25:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (1 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)2;
    t26 = (t30 + 56U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    t29 = (t28 + 12U);
    t64 = *((unsigned int *)t29);
    t64 = (t64 * 1U);
    memcpy(t26, t12, t64);
    goto LAB8;

LAB26:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (1 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)2;
    t26 = (t30 + 56U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    t29 = (t28 + 12U);
    t64 = *((unsigned int *)t29);
    t64 = (t64 * 1U);
    memcpy(t26, t12, t64);
    goto LAB8;

LAB27:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (0 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)2;
    t26 = (t30 + 56U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    t29 = (t28 + 12U);
    t64 = *((unsigned int *)t29);
    t64 = (t64 * 1U);
    memcpy(t26, t12, t64);
    goto LAB8;

LAB28:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t28 + 0U);
    t8 = *((int *)t22);
    t23 = (t28 + 8U);
    t9 = *((int *)t23);
    t13 = (0 - t8);
    t15 = (t13 * t9);
    t21 = (1U * t15);
    t25 = (t18 + t21);
    *((unsigned char *)t25) = (unsigned char)2;
    t26 = (t30 + 56U);
    t27 = *((char **)t26);
    t26 = (t27 + 0);
    t29 = (t28 + 12U);
    t64 = *((unsigned int *)t29);
    t64 = (t64 * 1U);
    memcpy(t26, t12, t64);
    goto LAB8;

LAB29:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t30 + 56U);
    t23 = *((char **)t22);
    t22 = (t23 + 0);
    t25 = (t28 + 12U);
    t15 = *((unsigned int *)t25);
    t15 = (t15 * 1U);
    memcpy(t22, t12, t15);
    goto LAB8;

LAB30:    t11 = (t28 + 12U);
    t10 = *((unsigned int *)t11);
    t10 = (t10 * 1U);
    t12 = xsi_get_transient_memory(t10);
    memset(t12, 0, t10);
    t18 = t12;
    memset(t18, (unsigned char)3, t10);
    t22 = (t30 + 56U);
    t23 = *((char **)t22);
    t22 = (t23 + 0);
    t25 = (t28 + 12U);
    t15 = *((unsigned int *)t25);
    t15 = (t15 * 1U);
    memcpy(t22, t12, t15);
    goto LAB8;

LAB31:    t8 = 0;
    t9 = 3;

LAB32:    if (t8 <= t9)
        goto LAB33;

LAB35:    goto LAB8;

LAB33:    t11 = (t30 + 56U);
    t12 = *((char **)t11);
    t11 = (t28 + 0U);
    t13 = *((int *)t11);
    t18 = (t28 + 8U);
    t14 = *((int *)t18);
    t17 = (t8 - t13);
    t10 = (t17 * t14);
    t22 = (t28 + 4U);
    t20 = *((int *)t22);
    xsi_vhdl_check_range_of_index(t13, t20, t14, t8);
    t15 = (1U * t10);
    t21 = (0 + t15);
    t23 = (t12 + t21);
    *((unsigned char *)t23) = (unsigned char)1;

LAB34:    if (t8 == t9)
        goto LAB35;

LAB36:    t13 = (t8 + 1);
    t8 = t13;
    goto LAB32;

LAB38:    t11 = (t38 + 56U);
    t12 = *((char **)t11);
    t13 = *((int *)t12);
    t14 = (t13 * 4);
    t17 = (t14 + t8);
    t45 = (t17 < t5);
    if (t45 != 0)
        goto LAB41;

LAB43:
LAB42:
LAB39:    if (t8 == t9)
        goto LAB40;

LAB44:    t13 = (t8 + 1);
    t8 = t13;
    goto LAB37;

LAB41:    t11 = (t30 + 56U);
    t18 = *((char **)t11);
    t11 = (t28 + 0U);
    t20 = *((int *)t11);
    t22 = (t28 + 8U);
    t31 = *((int *)t22);
    t49 = (t8 - t20);
    t10 = (t49 * t31);
    t23 = (t28 + 4U);
    t52 = *((int *)t23);
    xsi_vhdl_check_range_of_index(t20, t52, t31, t8);
    t15 = (1U * t10);
    t21 = (0 + t15);
    t25 = (t18 + t21);
    t67 = *((unsigned char *)t25);
    t26 = (t19 + 56U);
    t27 = *((char **)t26);
    t26 = (t38 + 56U);
    t29 = *((char **)t26);
    t54 = *((int *)t29);
    t57 = (t54 * 4);
    t58 = (t57 + t8);
    t26 = (t16 + 0U);
    t60 = *((int *)t26);
    t32 = (t16 + 8U);
    t62 = *((int *)t32);
    t63 = (t58 - t60);
    t64 = (t63 * t62);
    t33 = (t16 + 4U);
    t77 = *((int *)t33);
    xsi_vhdl_check_range_of_index(t60, t77, t62, t58);
    t65 = (1U * t64);
    t70 = (0 + t65);
    t35 = (t27 + t70);
    *((unsigned char *)t35) = t67;
    goto LAB42;

LAB46:;
}


extern void work_p_2318420936_init()
{
	static char *se[] = {(void *)work_p_2318420936_sub_1315575287_3108146387,(void *)work_p_2318420936_sub_3672023036_3108146387,(void *)work_p_2318420936_sub_70260629_3108146387,(void *)work_p_2318420936_sub_1893995693_3108146387,(void *)work_p_2318420936_sub_3070965584_3108146387,(void *)work_p_2318420936_sub_3703097363_3108146387};
	xsi_register_didat("work_p_2318420936", "isim/ethernetFIFO_tb.exe.sim/work/p_2318420936.didat");
	xsi_register_subprogram_executes(se);
}
