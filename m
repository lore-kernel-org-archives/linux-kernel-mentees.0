From: suratiamol@gmail.com (Amol Surati)
Date: Sun, 7 Jul 2019 17:00:16 +0530
Subject: [Linux-kernel-mentees] [PATCH] cs5535: use BIT() macro for defining
	bit-flags
Message-ID: <20190707113016.GA30635@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190707113016.d_aBqP6RvaGo5QE1oqpnakxLsdLQ1117SGLt-OoWP9g@z>

The BIT() macro is available for defining the required bit-flags.

Since it operates on an unsigned value and expands to an unsigned result,
using it, instead of an expression like (1 << x), also fixes the problem
of shifting a signed 32-bit value by 31 bits. (e.g. 1 << 31. See
CS5536_GPIOM7_PME_FLAG and CS5536_GPIOM7_PME_EN).

Signed-off-by: Amol Surati <suratiamol at gmail.com>
---
 include/linux/cs5535.h | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/linux/cs5535.h b/include/linux/cs5535.h
index 2be1120174eb..7c403855b456 100644
--- a/include/linux/cs5535.h
+++ b/include/linux/cs5535.h
@@ -91,21 +91,21 @@ static inline int cs5535_pic_unreqz_select_high(unsigned int group,
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
@@ -197,14 +197,14 @@ void cs5535_gpio_setup_event(unsigned offset, int pair, int pme);
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
