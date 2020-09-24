Return-Path: <SRS0=f0b9=DB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD455C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 13:42:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00BA42344C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 13:42:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irXCwpoS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00BA42344C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A6ACD86AE0;
	Thu, 24 Sep 2020 13:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBlz0qNRof3a; Thu, 24 Sep 2020 13:42:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 22E3086AD1;
	Thu, 24 Sep 2020 13:42:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AEA6C0889;
	Thu, 24 Sep 2020 13:42:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B59DBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9C2DE2E114
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cX3MvJImH3mv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:42:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id BF3F32E10B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:42:01 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id j7so1680316plk.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 06:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UhUT+o1t+AMJZcWvFy2i6GGXqhceBpLqREcEoG/PC2I=;
 b=irXCwpoSu4oXTb5oMuOufQPxPk+9Kn5lUT5vU83eEIXHtXr/kllNTZJS478wgiQqAG
 lxwU8/afP/v6KSEer0vX6yiS6jf9URmv8L+Yfuekm7MM4OUbV7y2/pw6jqELmA9MvueR
 US+zjhQrx05YxiuCzPsMqPeD85j+E+W1LsQ3E5KGFziMuiJHisVjkIpggRqrx9VBP/XP
 5esQNoMkU1djjt3l/vYCqsGXdoWGAqr/Yobg3c/zd4RDyHA+VRrIRZss/9vLknWN6eJ5
 CMdbr6e8FQWVrXG+/TqQR76CfQcg7+ZngMQ9oGYYiht9kV07RJGBjTibMDYDHR2nQNXf
 NP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UhUT+o1t+AMJZcWvFy2i6GGXqhceBpLqREcEoG/PC2I=;
 b=g3Q/SvUO3YfTO7Y0lsoDOIu8B7C4YtJaQBGHbGFziT1F+gD1piiFQ0CadBk/uSDEQU
 DVRCtyDpFY+QtOdB7xI0W81n29Pk5GsZQIRb1e171WCy2ucQxkgpOL6AR3+tn1Ln6LSA
 jDjoGHIfm6bv3Tzo1EnL9/7oOacIf/NDPhykvdw2y6wzrtCq5KlUlENTpkbMIYiUqOfo
 I4xaD4c4mzCzx2wbcBR5hCjSCix8uIjzMilb2wLdhg4W7NYChsaHmXBHtGh33ZwbAbLk
 upg0j1sExu/99d07Z1cUJ4/NquaxQ7uWQir996tb2+R4/USQF0hJOTRIufiO6OPO3mOM
 f+xg==
X-Gm-Message-State: AOAM533Hy1MOYQZJ0iPrp9j/OUl6DTaFR8KZ7FZG4S3IyiCKcnCq9JuR
 szNhQTUFQdOEqttrVo67Fw==
X-Google-Smtp-Source: ABdhPJwbSp22dl0/uGuIqOuYJe+1ZIMNoe26SQC8usmBFnufkGD6yDVP5qwYZlclOJS2wO7w9EIofw==
X-Received: by 2002:a17:90b:797:: with SMTP id
 l23mr4006542pjz.176.1600954921325; 
 Thu, 24 Sep 2020 06:42:01 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id j6sm3012588pfi.129.2020.09.24.06.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 06:42:00 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Thu, 24 Sep 2020 09:40:53 -0400
Message-Id: <7fb8bc9b0abc676ada6b7ac0e0bd443499357267.1600953813.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1600953813.git.yepeilin.cs@gmail.com>
References: <cover.1600953813.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/3] fbdev,
	newport_con: Move FONT_EXTRA_WORDS macros into linux/font.h
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

drivers/video/console/newport_con.c is borrowing FONT_EXTRA_WORDS macros
from drivers/video/fbdev/core/fbcon.h. To keep things simple, move all
definitions into <linux/font.h>.

Since newport_con now uses four extra words, initialize the fourth word in
newport_set_font() properly.

Cc: stable@vger.kernel.org
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/video/console/newport_con.c     | 7 +------
 drivers/video/fbdev/core/fbcon.h        | 7 -------
 drivers/video/fbdev/core/fbcon_rotate.c | 1 +
 drivers/video/fbdev/core/tileblit.c     | 1 +
 include/linux/font.h                    | 8 ++++++++
 5 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 72f146d047d9..cd51b7a17a21 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -35,12 +35,6 @@
 
 #define FONT_DATA ((unsigned char *)font_vga_8x16.data)
 
-/* borrowed from fbcon.c */
-#define REFCOUNT(fd)	(((int *)(fd))[-1])
-#define FNTSIZE(fd)	(((int *)(fd))[-2])
-#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
-#define FONT_EXTRA_WORDS 3
-
 static unsigned char *font_data[MAX_NR_CONSOLES];
 
 static struct newport_regs *npregs;
@@ -522,6 +516,7 @@ static int newport_set_font(int unit, struct console_font *op)
 	FNTSIZE(new_data) = size;
 	FNTCHARCNT(new_data) = op->charcount;
 	REFCOUNT(new_data) = 0;	/* usage counter */
+	FNTSUM(new_data) = 0;
 
 	p = new_data;
 	for (i = 0; i < op->charcount; i++) {
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 20dea853765f..5ee153ba977e 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -152,13 +152,6 @@ static inline int attr_col_ec(int shift, struct vc_data *vc,
 #define attr_bgcol_ec(bgshift, vc, info) attr_col_ec(bgshift, vc, info, 0)
 #define attr_fgcol_ec(fgshift, vc, info) attr_col_ec(fgshift, vc, info, 1)
 
-/* Font */
-#define REFCOUNT(fd)	(((int *)(fd))[-1])
-#define FNTSIZE(fd)	(((int *)(fd))[-2])
-#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
-#define FNTSUM(fd)	(((int *)(fd))[-4])
-#define FONT_EXTRA_WORDS 4
-
     /*
      *  Scroll Method
      */
diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
index c0d445294aa7..ac72d4f85f7d 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.c
+++ b/drivers/video/fbdev/core/fbcon_rotate.c
@@ -14,6 +14,7 @@
 #include <linux/fb.h>
 #include <linux/vt_kern.h>
 #include <linux/console.h>
+#include <linux/font.h>
 #include <asm/types.h>
 #include "fbcon.h"
 #include "fbcon_rotate.h"
diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
index 1dfaff0881fb..257e94feeeb6 100644
--- a/drivers/video/fbdev/core/tileblit.c
+++ b/drivers/video/fbdev/core/tileblit.c
@@ -13,6 +13,7 @@
 #include <linux/fb.h>
 #include <linux/vt_kern.h>
 #include <linux/console.h>
+#include <linux/font.h>
 #include <asm/types.h>
 #include "fbcon.h"
 
diff --git a/include/linux/font.h b/include/linux/font.h
index 51b91c8b69d5..40ed008d7dad 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -59,4 +59,12 @@ extern const struct font_desc *get_default_font(int xres, int yres,
 /* Max. length for the name of a predefined font */
 #define MAX_FONT_NAME	32
 
+/* Extra word getters */
+#define REFCOUNT(fd)	(((int *)(fd))[-1])
+#define FNTSIZE(fd)	(((int *)(fd))[-2])
+#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
+#define FNTSUM(fd)	(((int *)(fd))[-4])
+
+#define FONT_EXTRA_WORDS 4
+
 #endif /* _VIDEO_FONT_H */
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
