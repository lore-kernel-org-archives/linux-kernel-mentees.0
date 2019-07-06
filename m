From: shobhitkukreti@gmail.com (Shobhit Kukreti)
Date: Sat, 6 Jul 2019 10:41:03 -0700
Subject: [Linux-kernel-mentees] [PATCH] video: atmel_lcdc: Fix Shifting
 signed 32 bit value by 31 bits problem
Message-ID: <20190706174059.GA14822@t-1000>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190706174103.veEL60RBUgv9wz0_Lk78NT45v3xjr4m6xrjc_WGc8H0@z>

Fix ATMEL_LCDC_MEMOR and ATMEL_LCDC_MEMOR_LITTLE defines to use "U"
cast to avoid shifting signed 32 bit values by 31 bit problem. This
problem. This is not a problem for gcc built kernel.

However, this may be a problem since the header is part of pbulic API
which could be included for builds using compilers which do not handle
this condition safely resulting in undefined behavior

Signed-off-by: Shobhit Kukreti <shobhitkukreti at gmail.com>
---
 include/video/atmel_lcdc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/video/atmel_lcdc.h b/include/video/atmel_lcdc.h
index 43e497c..ac96b4f 100644
--- a/include/video/atmel_lcdc.h
+++ b/include/video/atmel_lcdc.h
@@ -103,9 +103,9 @@ struct atmel_lcdfb_pdata {
 #define	ATMEL_LCDC_CLKMOD	(1 << 15)
 #define		ATMEL_LCDC_CLKMOD_ACTIVEDISPLAY	(0 << 15)
 #define		ATMEL_LCDC_CLKMOD_ALWAYSACTIVE	(1 << 15)
-#define	ATMEL_LCDC_MEMOR	(1 << 31)
+#define	ATMEL_LCDC_MEMOR	(1U << 31)
 #define		ATMEL_LCDC_MEMOR_BIG		(0 << 31)
-#define		ATMEL_LCDC_MEMOR_LITTLE		(1 << 31)
+#define		ATMEL_LCDC_MEMOR_LITTLE		(1U << 31)
 
 #define ATMEL_LCDC_TIM1		0x0808
 #define	ATMEL_LCDC_VFP		(0xffU <<  0)
-- 
2.7.4
