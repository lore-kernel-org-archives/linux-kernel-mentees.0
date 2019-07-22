From: shobhitkukreti at gmail.com (Shobhit Kukreti)
Date: Sun, 21 Jul 2019 17:42:40 -0700
Subject: [Linux-kernel-mentees] [PATCH v3] video: atmel_lcdc: Fix Shifting
	signed 32 bit value by 31 bits problem
In-Reply-To: <9c98fd20-5bc8-48a6-96ed-889a18d1a0c0@samsung.com>
References: <9c98fd20-5bc8-48a6-96ed-889a18d1a0c0@samsung.com>
Message-ID: <1563756160-29702-1-git-send-email-shobhitkukreti@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Fix ATMEL_LCDC_MEMOR and ATMEL_LCDC_MEMOR_LITTLE defines to use "U"
cast to avoid shifting signed 32 bit values by 31 bit problem. This
problem. This is not a problem for gcc built kernel.

However, this may be a problem since the header is part of pbulic API
which could be included for builds using compilers which do not handle
this condition safely resulting in undefined behavior

Signed-off-by: Shobhit Kukreti <shobhitkukreti at gmail.com>
---
Changes in v3:
	Replace Bit Shift Operations with BIT() macros

Changes in v2:
       Fixed spelling typo

 include/video/atmel_lcdc.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/video/atmel_lcdc.h b/include/video/atmel_lcdc.h
index 43e497c..985e2d6 100644
--- a/include/video/atmel_lcdc.h
+++ b/include/video/atmel_lcdc.h
@@ -85,27 +85,27 @@ struct atmel_lcdfb_pdata {
 #define		ATMEL_LCDC_PIXELSIZE_16		(4 << 5)
 #define		ATMEL_LCDC_PIXELSIZE_24		(5 << 5)
 #define		ATMEL_LCDC_PIXELSIZE_32		(6 << 5)
-#define	ATMEL_LCDC_INVVD	(1 << 8)
+#define	ATMEL_LCDC_INVVD	BIT(8)
 #define		ATMEL_LCDC_INVVD_NORMAL		(0 << 8)
-#define		ATMEL_LCDC_INVVD_INVERTED	(1 << 8)
-#define	ATMEL_LCDC_INVFRAME	(1 << 9 )
+#define		ATMEL_LCDC_INVVD_INVERTED	BIT(8)
+#define	ATMEL_LCDC_INVFRAME	BIT(9)
 #define		ATMEL_LCDC_INVFRAME_NORMAL	(0 << 9)
-#define		ATMEL_LCDC_INVFRAME_INVERTED	(1 << 9)
-#define	ATMEL_LCDC_INVLINE	(1 << 10)
+#define		ATMEL_LCDC_INVFRAME_INVERTED	BIT(9)
+#define	ATMEL_LCDC_INVLINE	BIT(10)
 #define		ATMEL_LCDC_INVLINE_NORMAL	(0 << 10)
-#define		ATMEL_LCDC_INVLINE_INVERTED	(1 << 10)
-#define	ATMEL_LCDC_INVCLK	(1 << 11)
+#define		ATMEL_LCDC_INVLINE_INVERTED	BIT(10)
+#define	ATMEL_LCDC_INVCLK	BIT(11)
 #define		ATMEL_LCDC_INVCLK_NORMAL	(0 << 11)
-#define		ATMEL_LCDC_INVCLK_INVERTED	(1 << 11)
-#define	ATMEL_LCDC_INVDVAL	(1 << 12)
+#define		ATMEL_LCDC_INVCLK_INVERTED	BIT(11)
+#define	ATMEL_LCDC_INVDVAL	BIT(12)
 #define		ATMEL_LCDC_INVDVAL_NORMAL	(0 << 12)
-#define		ATMEL_LCDC_INVDVAL_INVERTED	(1 << 12)
-#define	ATMEL_LCDC_CLKMOD	(1 << 15)
+#define		ATMEL_LCDC_INVDVAL_INVERTED	BIT(12)
+#define	ATMEL_LCDC_CLKMOD	BIT(15)
 #define		ATMEL_LCDC_CLKMOD_ACTIVEDISPLAY	(0 << 15)
-#define		ATMEL_LCDC_CLKMOD_ALWAYSACTIVE	(1 << 15)
-#define	ATMEL_LCDC_MEMOR	(1 << 31)
+#define		ATMEL_LCDC_CLKMOD_ALWAYSACTIVE	BIT(15)
+#define	ATMEL_LCDC_MEMOR	BIT(31)
 #define		ATMEL_LCDC_MEMOR_BIG		(0 << 31)
-#define		ATMEL_LCDC_MEMOR_LITTLE		(1 << 31)
+#define		ATMEL_LCDC_MEMOR_LITTLE		BIT(31)
 
 #define ATMEL_LCDC_TIM1		0x0808
 #define	ATMEL_LCDC_VFP		(0xffU <<  0)
-- 
2.7.4
