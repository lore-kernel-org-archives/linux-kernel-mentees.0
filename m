From: b.zolnierkie at samsung.com (Bartlomiej Zolnierkiewicz)
Date: Mon, 19 Aug 2019 16:33:59 +0200
Subject: [Linux-kernel-mentees] [PATCH v2] video: radeon.h Fix Shifting
 signed 32 bit value by 31 bits problem
In-Reply-To: <1563758072-898-1-git-send-email-shobhitkukreti@gmail.com>
References: <46c5dc00-eb00-e229-62af-6e171f9f2a40@samsung.com>
	<CGME20190722011449epcas2p1ddef0d4a3bc2d39d9d99c9a8e9c10dc7@epcas2p1.samsung.com>
	<1563758072-898-1-git-send-email-shobhitkukreti@gmail.com>
Message-ID: <85b130de-4e1b-3004-ae5a-3cda5d732bcb@samsung.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>


Hi,

On 7/22/19 3:14 AM, Shobhit Kukreti wrote:
> Fix RB2D_DC_BUSY and HORZ_AUTO_RATIO_INC defines to use "U" cast to
> avoid shifting signed 32 bit values by 31 bit problem. This is not a
> problem for gcc built kernel.
> 
> However, the header file being a public api, other compilers may not
> handle the condition safely resulting in undefined behavior.
> 
> Signed-off-by: Shobhit Kukreti <shobhitkukreti at gmail.com>
> ---
> Changes in v2:
> 	Replace bit shift operations with BIT() macro

1. Please update the patch summary & description to reflect that,
please see commit 13990cf8a180 for the reference:

commit 13990cf8a180cc070f0b1266140e799db8754289
Author: Amol Surati <suratiamol at gmail.com>
Date:   Sun Jul 7 14:27:29 2019 +0530

    ide: use BIT() macro for defining bit-flags
    
    The BIT() macro is available for defining the required bit-flags.
    
    Since it operates on an unsigned value and expands to an unsigned result,
    using it, instead of an expression like (1 << x), also fixes the problem
    of shifting a signed 32-bit value by 31 bits (e.g. 1 << 31).
    
    Signed-off-by: Amol Surati <suratiamol at gmail.com>
    Signed-off-by: David S. Miller <davem at davemloft.net>


2. Please use ./scripts/checkpatch.pl to check your patch and fix issue
reported by the script:

WARNING: please, no space before tabs
#147: FILE: include/video/radeon.h:458:
+#define FORCEON_MCLKB         ^I^I   ^I   BIT(17)$

WARNING: please, no space before tabs
#148: FILE: include/video/radeon.h:459:
+#define FORCEON_YCLKA         ^I    ^I   ^I   BIT(18)$

WARNING: please, no space before tabs
#149: FILE: include/video/radeon.h:460:
+#define FORCEON_YCLKB         ^I^I   ^I   BIT(19)$

WARNING: please, no space before tabs
#150: FILE: include/video/radeon.h:461:
+#define FORCEON_MC            ^I^I   ^I   BIT(20)$

WARNING: please, no space before tabs
#151: FILE: include/video/radeon.h:462:
+#define FORCEON_AIC           ^I^I   ^I   BIT(21)$

WARNING: please, no space before tabs
#219: FILE: include/video/radeon.h:544:
+#define CRTC_BYPASS_LUT_EN     ^I^I^I   BIT(14)$

WARNING: please, no space before tabs
#220: FILE: include/video/radeon.h:545:
+#define CRTC_EXT_DISP_EN      ^I^I^I   BIT(24)$

WARNING: please, no space before tabs
#453: FILE: include/video/radeon.h:740:
+#define SOFT_RESET_CP           ^I^I   BIT(0)$

WARNING: please, no space before tabs
#454: FILE: include/video/radeon.h:741:
+#define SOFT_RESET_HI           ^I^I   BIT(1)$

WARNING: please, no space before tabs
#455: FILE: include/video/radeon.h:742:
+#define SOFT_RESET_SE           ^I^I   BIT(2)$

WARNING: please, no space before tabs
#456: FILE: include/video/radeon.h:743:
+#define SOFT_RESET_RE           ^I^I   BIT(3)$

WARNING: please, no space before tabs
#457: FILE: include/video/radeon.h:744:
+#define SOFT_RESET_PP           ^I^I   BIT(4)$

WARNING: please, no space before tabs
#458: FILE: include/video/radeon.h:745:
+#define SOFT_RESET_E2           ^I^I   BIT(5)$

WARNING: please, no space before tabs
#459: FILE: include/video/radeon.h:746:
+#define SOFT_RESET_RB           ^I^I   BIT(6)$

WARNING: please, no space before tabs
#460: FILE: include/video/radeon.h:747:
+#define SOFT_RESET_HDP          ^I^I   BIT(7)$

WARNING: please, no space before tabs
#496: FILE: include/video/radeon.h:888:
+#define GMC_CLR_CMP_CNTL_DIS      ^I^I   BIT(28)$

total: 0 errors, 17 warnings, 0 checks, 502 lines checked


3. Please update Cc: list of your mail by all mailing lists returned by
./scripts/get_maintainer.pl:

$ ./scripts/get_maintainer.pl -f include/video/atmel_lcdc.h
Bartlomiej Zolnierkiewicz <b.zolnierkie at samsung.com> (maintainer:FRAMEBUFFER LAYER)
dri-devel at lists.freedesktop.org (open list:FRAMEBUFFER LAYER)
linux-fbdev at vger.kernel.org (open list:FRAMEBUFFER LAYER)
linux-kernel at vger.kernel.org (open list)

>  include/video/radeon.h | 338 ++++++++++++++++++++++++-------------------------
>  1 file changed, 169 insertions(+), 169 deletions(-)
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
