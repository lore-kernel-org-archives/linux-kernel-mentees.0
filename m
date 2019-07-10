From: suratiamol@gmail.com (Amol Surati)
Date: Wed, 10 Jul 2019 14:09:52 +0530
Subject: [Linux-kernel-mentees] [PATCH v2] cs5535: use BIT() macro for
	defining bit-flags
In-Reply-To: <20190707113016.GA30635@arch>
References: <20190707113016.GA30635@arch>
Message-ID: <20190710083952.GA23299@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190710083952.LoA5vGqF9YhtITtP7QthYzFC-K7qdqjZvZbo1dbr8WM@z>

Inside cs5535.h, there are two definitions -
CS5536_GPIOM7_PME_FLAG and CS5536_GPIOM7_PME_EN
- which are defined as equal to (1 << 31), where 1 is expected to be of
width at least 32-bits. But, since 1 is also treated as signed, its width
reduces to 31-bits, a situation which invokes the undefined
behaviour (***).

These definitions aren't a problem for gcc; it allows them to be defined
and used safely. But other compilers may not, for instance, if such
definitions are pulled in, as part of public APIs, into code the
compilation of which may be carried out by a variety of compilers with
differing compliance levels.

The BIT() macro changes the type of integer 1 to unsigned, thus allowing
its shift by width-1.

Use the macro, to make the two definitions standards-compliant, and to
maintain consistency.

*** About bitwise shift operators, from the C standard:
"If the value of the right operand is negative or is greater than or
equal to the width of the promoted left operand, the behavior is
undefined".

Signed-off-by: Amol Surati <suratiamol at gmail.com>
---
v2: As suggested by Andy Shevchenko,
       - include <linux/bits.h>,
       - describe the problem in detail.
 
 include/linux/cs5535.h | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/linux/cs5535.h b/include/linux/cs5535.h
index 2be1120174eb..d6d062686dbf 100644
--- a/include/linux/cs5535.h
+++ b/include/linux/cs5535.h
@@ -8,6 +8,7 @@
 #ifndef _CS5535_H
 #define _CS5535_H
 
+#include <linux/bits.h>
 #include <asm/msr.h>
 
 /* MSRs */
@@ -91,21 +92,21 @@ static inline int cs5535_pic_unreqz_select_high(unsigned int group,
 #define CS5536_PM_GPE0_EN	0x1c
 
 /* CS5536_PM1_STS bits */
-#define CS5536_WAK_FLAG		(1 << 15)
-#define CS5536_RTC_FLAG		(1 << 10)
-#define CS5536_PWRBTN_FLAG	(1 << 8)
+#define CS5536_WAK_FLAG		BIT(15)
+#define CS5536_RTC_FLAG		BIT(10)
+#define CS5536_PWRBTN_FLAG	BIT(8)
 
 /* CS5536_PM1_EN bits */
-#define CS5536_PM_PWRBTN	(1 << 8)
-#define CS5536_PM_RTC		(1 << 10)
+#define CS5536_PM_PWRBTN	BIT(8)
+#define CS5536_PM_RTC		BIT(10)
 
 /* CS5536_PM_GPE0_STS bits */
-#define CS5536_GPIOM7_PME_FLAG	(1 << 31)
-#define CS5536_GPIOM6_PME_FLAG	(1 << 30)
+#define CS5536_GPIOM7_PME_FLAG	BIT(31)
+#define CS5536_GPIOM6_PME_FLAG	BIT(30)
 
 /* CS5536_PM_GPE0_EN bits */
-#define CS5536_GPIOM7_PME_EN	(1 << 31)
-#define CS5536_GPIOM6_PME_EN	(1 << 30)
+#define CS5536_GPIOM7_PME_EN	BIT(31)
+#define CS5536_GPIOM6_PME_EN	BIT(30)
 
 /* VSA2 magic values */
 #define VSA_VRC_INDEX		0xAC1C
@@ -197,14 +198,14 @@ void cs5535_gpio_setup_event(unsigned offset, int pair, int pme);
 #define MFGPT_REG_COUNTER	4
 #define MFGPT_REG_SETUP		6
 
-#define MFGPT_SETUP_CNTEN	(1 << 15)
-#define MFGPT_SETUP_CMP2	(1 << 14)
-#define MFGPT_SETUP_CMP1	(1 << 13)
-#define MFGPT_SETUP_SETUP	(1 << 12)
-#define MFGPT_SETUP_STOPEN	(1 << 11)
-#define MFGPT_SETUP_EXTEN	(1 << 10)
-#define MFGPT_SETUP_REVEN	(1 << 5)
-#define MFGPT_SETUP_CLKSEL	(1 << 4)
+#define MFGPT_SETUP_CNTEN	BIT(15)
+#define MFGPT_SETUP_CMP2	BIT(14)
+#define MFGPT_SETUP_CMP1	BIT(13)
+#define MFGPT_SETUP_SETUP	BIT(12)
+#define MFGPT_SETUP_STOPEN	BIT(11)
+#define MFGPT_SETUP_EXTEN	BIT(10)
+#define MFGPT_SETUP_REVEN	BIT(5)
+#define MFGPT_SETUP_CLKSEL	BIT(4)
 
 struct cs5535_mfgpt_timer;
 
-- 
2.22.0
