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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E1EC2D0E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 13:43:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B790723741
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 13:43:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fh5Pz1da"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B790723741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A2A684E2E;
	Thu, 24 Sep 2020 13:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4wZx8VHVmoZ; Thu, 24 Sep 2020 13:43:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8CDAB85074;
	Thu, 24 Sep 2020 13:43:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7928DC0889;
	Thu, 24 Sep 2020 13:43:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24C97C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1CA0A20133
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EgutlCjFexBK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:43:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id BFEB12000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:43:22 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id z19so1924093pfn.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IidaQPw1FdHOsl0YI4il9M8DFqyohlTPE0ZS3ex8T4M=;
 b=fh5Pz1da4ph82REI2BR2J6/uTQb4gGeRYFPXwbSHuDzDaDs+nvoDaLGWSANxMsqjym
 jIFD0afSU5O8FFpByTk6qrz1lxnp0g64S/REqKG9Miq2DdSqyQq02ON+A927DvDWAgwm
 0Vzi8yLCzvig8JwEyFI0Xdmgc2OAn52xHb9ky+avNJXOvL4eOKGXdGUV35kDSqrDC2KQ
 UuqpZdAzGERb3H5Gnb79679vKeT9GxLV331rne1USQ7r6EEYJoWNmUfnCdKHOsv/iK7d
 lo+AAm5hxGzLDpWQiI1O7EHHi+Ly+nSzmspD+Ni2zyh7mqm5JWrxQEYgowUiOYLClHuj
 THnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IidaQPw1FdHOsl0YI4il9M8DFqyohlTPE0ZS3ex8T4M=;
 b=ACjjT5FtJnT6UurffDmAYYckwqmoygwKckgE92u9gHsUQRxjvukwisJgm+RHo9zAuo
 lGfkW7iTMrINw9LJMOeWtVAEpK2jwFRYpC1p+KkophBoTJYGWFNK4CLLO5W5y7HtKWOI
 89bc/CbbCL++0RJ6c8rWvXqfe0LWemC/hFlyTngRWAIUSFC9w9SQm7S0E3szjXWwDVS4
 g32tVjtr8JOKX5lmoe+1sJAbfv5s7WxRv4RfP8Zt01jHEUDCXMC8jNIeuM70UyFd+IXa
 yrQ3p24JEJnne3G/DX29qiQBr7/IOZOpNO+1G1sRNqEvzOWG14X8ZpSHG6wqHc4IAGkx
 hV8g==
X-Gm-Message-State: AOAM530eWyAZj2V628QUY8M87E5Y4LZ4cCDHWoTecAuOLzKlvonGpN/h
 Q4RSVcd5UqP21P1/g+wmig==
X-Google-Smtp-Source: ABdhPJwbQ4wFlzIFP5VKimu8bdR/pKsIrTdoz5UNyLfqNFQkTzQtZrMUnL4y1bUF03J5zO5aRIDXOA==
X-Received: by 2002:a65:494e:: with SMTP id q14mr4104759pgs.281.1600955002176; 
 Thu, 24 Sep 2020 06:43:22 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id b15sm2977078pft.84.2020.09.24.06.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 06:43:21 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Thu, 24 Sep 2020 09:42:22 -0400
Message-Id: <ef18af00c35fb3cc826048a5f70924ed6ddce95b.1600953813.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <7fb8bc9b0abc676ada6b7ac0e0bd443499357267.1600953813.git.yepeilin.cs@gmail.com>
References: <cover.1600953813.git.yepeilin.cs@gmail.com>
 <7fb8bc9b0abc676ada6b7ac0e0bd443499357267.1600953813.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/3] Fonts: Support FONT_EXTRA_WORDS
	macros for built-in fonts
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

syzbot has reported an issue in the framebuffer layer, where a malicious
user may overflow our built-in font data buffers.

In order to perform a reliable range check, subsystems need to know
`FONTDATAMAX` for each built-in font. Unfortunately, our font descriptor,
`struct console_font` does not contain `FONTDATAMAX`, and is part of the
UAPI, making it infeasible to modify it.

For user-provided fonts, the framebuffer layer resolves this issue by
reserving four extra words at the beginning of data buffers. Later,
whenever a function needs to access them, it simply uses the following
macros:

#define REFCOUNT(fd)	(((int *)(fd))[-1])
#define FNTSIZE(fd)	(((int *)(fd))[-2])
#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
#define FNTSUM(fd)	(((int *)(fd))[-4])
#define FONT_EXTRA_WORDS 4

Recently we have gathered all the above macros to <linux/font.h>. Let us
do the same thing for built-in fonts, prepend four extra words (including
`FONTDATAMAX`) to their data buffers, so that subsystems can use these
macros for all fonts, no matter built-in or user-provided.

This patch depends on patch "fbdev, newport_con: Move FONT_EXTRA_WORDS
macros into linux/font.h".

Cc: stable@vger.kernel.org
Link: https://syzkaller.appspot.com/bug?id=08b8be45afea11888776f897895aef9ad1c3ecfd
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 include/linux/font.h       | 5 +++++
 lib/fonts/font_10x18.c     | 9 ++++-----
 lib/fonts/font_6x10.c      | 9 +++++----
 lib/fonts/font_6x11.c      | 9 ++++-----
 lib/fonts/font_7x14.c      | 9 ++++-----
 lib/fonts/font_8x16.c      | 9 ++++-----
 lib/fonts/font_8x8.c       | 9 ++++-----
 lib/fonts/font_acorn_8x8.c | 9 ++++++---
 lib/fonts/font_mini_4x6.c  | 8 ++++----
 lib/fonts/font_pearl_8x8.c | 9 ++++-----
 lib/fonts/font_sun12x22.c  | 9 ++++-----
 lib/fonts/font_sun8x16.c   | 7 ++++---
 lib/fonts/font_ter16x32.c  | 9 ++++-----
 13 files changed, 56 insertions(+), 54 deletions(-)

diff --git a/include/linux/font.h b/include/linux/font.h
index 40ed008d7dad..59faa80f586d 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -67,4 +67,9 @@ extern const struct font_desc *get_default_font(int xres, int yres,
 
 #define FONT_EXTRA_WORDS 4
 
+struct font_data {
+	unsigned int extra[FONT_EXTRA_WORDS];
+	const unsigned char data[];
+} __packed;
+
 #endif /* _VIDEO_FONT_H */
diff --git a/lib/fonts/font_10x18.c b/lib/fonts/font_10x18.c
index 532f0ff89a96..0e2deac97da0 100644
--- a/lib/fonts/font_10x18.c
+++ b/lib/fonts/font_10x18.c
@@ -8,8 +8,8 @@
 
 #define FONTDATAMAX 9216
 
-static const unsigned char fontdata_10x18[FONTDATAMAX] = {
-
+static struct font_data fontdata_10x18 = {
+	{ 0, 0, FONTDATAMAX, 0 }, {
 	/* 0 0x00 '^@' */
 	0x00, 0x00, /* 0000000000 */
 	0x00, 0x00, /* 0000000000 */
@@ -5129,8 +5129,7 @@ static const unsigned char fontdata_10x18[FONTDATAMAX] = {
 	0x00, 0x00, /* 0000000000 */
 	0x00, 0x00, /* 0000000000 */
 	0x00, 0x00, /* 0000000000 */
-
-};
+} };
 
 
 const struct font_desc font_10x18 = {
@@ -5138,7 +5137,7 @@ const struct font_desc font_10x18 = {
 	.name	= "10x18",
 	.width	= 10,
 	.height	= 18,
-	.data	= fontdata_10x18,
+	.data	= fontdata_10x18.data,
 #ifdef __sparc__
 	.pref	= 5,
 #else
diff --git a/lib/fonts/font_6x10.c b/lib/fonts/font_6x10.c
index 09b2cc03435b..87da8acd07db 100644
--- a/lib/fonts/font_6x10.c
+++ b/lib/fonts/font_6x10.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/font.h>
 
-static const unsigned char fontdata_6x10[] = {
+#define FONTDATAMAX 2560
 
+static struct font_data fontdata_6x10 = {
+	{ 0, 0, FONTDATAMAX, 0 }, {
 	/* 0 0x00 '^@' */
 	0x00, /* 00000000 */
 	0x00, /* 00000000 */
@@ -3074,14 +3076,13 @@ static const unsigned char fontdata_6x10[] = {
 	0x00, /* 00000000 */
 	0x00, /* 00000000 */
 	0x00, /* 00000000 */
-
-};
+} };
 
 const struct font_desc font_6x10 = {
 	.idx	= FONT6x10_IDX,
 	.name	= "6x10",
 	.width	= 6,
 	.height	= 10,
-	.data	= fontdata_6x10,
+	.data	= fontdata_6x10.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_6x11.c b/lib/fonts/font_6x11.c
index d7136c33f1f0..5e975dfa10a5 100644
--- a/lib/fonts/font_6x11.c
+++ b/lib/fonts/font_6x11.c
@@ -9,8 +9,8 @@
 
 #define FONTDATAMAX (11*256)
 
-static const unsigned char fontdata_6x11[FONTDATAMAX] = {
-
+static struct font_data fontdata_6x11 = {
+	{ 0, 0, FONTDATAMAX, 0 }, {
 	/* 0 0x00 '^@' */
 	0x00, /* 00000000 */
 	0x00, /* 00000000 */
@@ -3338,8 +3338,7 @@ static const unsigned char fontdata_6x11[FONTDATAMAX] = {
 	0x00, /* 00000000 */
 	0x00, /* 00000000 */
 	0x00, /* 00000000 */
-
-};
+} };
 
 
 const struct font_desc font_vga_6x11 = {
@@ -3347,7 +3346,7 @@ const struct font_desc font_vga_6x11 = {
 	.name	= "ProFont6x11",
 	.width	= 6,
 	.height	= 11,
-	.data	= fontdata_6x11,
+	.data	= fontdata_6x11.data,
 	/* Try avoiding this font if possible unless on MAC */
 	.pref	= -2000,
 };
diff --git a/lib/fonts/font_7x14.c b/lib/fonts/font_7x14.c
index 89752d0b23e8..86d298f38505 100644
--- a/lib/fonts/font_7x14.c
+++ b/lib/fonts/font_7x14.c
@@ -8,8 +8,8 @@
 
 #define FONTDATAMAX 3584
 
-static const unsigned char fontdata_7x14[FONTDATAMAX] = {
-
+static struct font_data fontdata_7x14 = {
+	{ 0, 0, FONTDATAMAX, 0 }, {
 	/* 0 0x00 '^@' */
 	0x00, /* 0000000 */
 	0x00, /* 0000000 */
@@ -4105,8 +4105,7 @@ static const unsigned char fontdata_7x14[FONTDATAMAX] = {
 	0x00, /* 0000000 */
 	0x00, /* 0000000 */
 	0x00, /* 0000000 */
-
-};
+} };
 
 
 const struct font_desc font_7x14 = {
@@ -4114,6 +4113,6 @@ const struct font_desc font_7x14 = {
 	.name	= "7x14",
 	.width	= 7,
 	.height	= 14,
-	.data	= fontdata_7x14,
+	.data	= fontdata_7x14.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_8x16.c b/lib/fonts/font_8x16.c
index b7ab1f5fbdb8..37cedd36ca5e 100644
--- a/lib/fonts/font_8x16.c
+++ b/lib/fonts/font_8x16.c
@@ -10,8 +10,8 @@
 
 #define FONTDATAMAX 4096
 
-static const unsigned char fontdata_8x16[FONTDATAMAX] = {
-
+static struct font_data fontdata_8x16 = {
+	{ 0, 0, FONTDATAMAX, 0 }, {
 	/* 0 0x00 '^@' */
 	0x00, /* 00000000 */
 	0x00, /* 00000000 */
@@ -4619,8 +4619,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
 	0x00, /* 00000000 */
 	0x00, /* 00000000 */
 	0x00, /* 00000000 */
-
-};
+} };
 
 
 const struct font_desc font_vga_8x16 = {
@@ -4628,7 +4627,7 @@ const struct font_desc font_vga_8x16 = {
 	.name	= "VGA8x16",
 	.width	= 8,
 	.height	= 16,
-	.data	= fontdata_8x16,
+	.data	= fontdata_8x16.data,
 	.pref	= 0,
 };
 EXPORT_SYMBOL(font_vga_8x16);
diff --git a/lib/fonts/font_8x8.c b/lib/fonts/font_8x8.c
index 2328ebc8bab5..8ab695538395 100644
--- a/lib/fonts/font_8x8.c
+++ b/lib/fonts/font_8x8.c
@@ -9,8 +9,8 @@
 
 #define FONTDATAMAX 2048
 
-static const unsigned char fontdata_8x8[FONTDATAMAX] = {
-
+static struct font_data fontdata_8x8 = {
+	{ 0, 0, FONTDATAMAX, 0 }, {
 	/* 0 0x00 '^@' */
 	0x00, /* 00000000 */
 	0x00, /* 00000000 */
@@ -2570,8 +2570,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
 	0x00, /* 00000000 */
 	0x00, /* 00000000 */
 	0x00, /* 00000000 */
-
-};
+} };
 
 
 const struct font_desc font_vga_8x8 = {
@@ -2579,6 +2578,6 @@ const struct font_desc font_vga_8x8 = {
 	.name	= "VGA8x8",
 	.width	= 8,
 	.height	= 8,
-	.data	= fontdata_8x8,
+	.data	= fontdata_8x8.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_acorn_8x8.c b/lib/fonts/font_acorn_8x8.c
index 0ff0e85d4481..069b3e80c434 100644
--- a/lib/fonts/font_acorn_8x8.c
+++ b/lib/fonts/font_acorn_8x8.c
@@ -3,7 +3,10 @@
 
 #include <linux/font.h>
 
-static const unsigned char acorndata_8x8[] = {
+#define FONTDATAMAX 2048
+
+static struct font_data acorndata_8x8 = {
+{ 0, 0, FONTDATAMAX, 0 }, {
 /* 00 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* ^@ */
 /* 01 */  0x7e, 0x81, 0xa5, 0x81, 0xbd, 0x99, 0x81, 0x7e, /* ^A */
 /* 02 */  0x7e, 0xff, 0xbd, 0xff, 0xc3, 0xe7, 0xff, 0x7e, /* ^B */
@@ -260,14 +263,14 @@ static const unsigned char acorndata_8x8[] = {
 /* FD */  0x38, 0x04, 0x18, 0x20, 0x3c, 0x00, 0x00, 0x00,
 /* FE */  0x00, 0x00, 0x3c, 0x3c, 0x3c, 0x3c, 0x00, 0x00,
 /* FF */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
-};
+} };
 
 const struct font_desc font_acorn_8x8 = {
 	.idx	= ACORN8x8_IDX,
 	.name	= "Acorn8x8",
 	.width	= 8,
 	.height	= 8,
-	.data	= acorndata_8x8,
+	.data	= acorndata_8x8.data,
 #ifdef CONFIG_ARCH_ACORN
 	.pref	= 20,
 #else
diff --git a/lib/fonts/font_mini_4x6.c b/lib/fonts/font_mini_4x6.c
index 838caa1cfef7..1449876c6a27 100644
--- a/lib/fonts/font_mini_4x6.c
+++ b/lib/fonts/font_mini_4x6.c
@@ -43,8 +43,8 @@ __END__;
 
 #define FONTDATAMAX 1536
 
-static const unsigned char fontdata_mini_4x6[FONTDATAMAX] = {
-
+static struct font_data fontdata_mini_4x6 = {
+	{ 0, 0, FONTDATAMAX, 0 }, {
 	/*{*/
 	  	/*   Char 0: ' '  */
 	0xee,	/*=  [*** ]       */
@@ -2145,14 +2145,14 @@ static const unsigned char fontdata_mini_4x6[FONTDATAMAX] = {
 	0xee,	/*=   [*** ]        */
 	0x00,	/*=   [    ]        */
 	/*}*/
-};
+} };
 
 const struct font_desc font_mini_4x6 = {
 	.idx	= MINI4x6_IDX,
 	.name	= "MINI4x6",
 	.width	= 4,
 	.height	= 6,
-	.data	= fontdata_mini_4x6,
+	.data	= fontdata_mini_4x6.data,
 	.pref	= 3,
 };
 
diff --git a/lib/fonts/font_pearl_8x8.c b/lib/fonts/font_pearl_8x8.c
index b15d3c342c5b..32d65551e7ed 100644
--- a/lib/fonts/font_pearl_8x8.c
+++ b/lib/fonts/font_pearl_8x8.c
@@ -14,8 +14,8 @@
 
 #define FONTDATAMAX 2048
 
-static const unsigned char fontdata_pearl8x8[FONTDATAMAX] = {
-
+static struct font_data fontdata_pearl8x8 = {
+   { 0, 0, FONTDATAMAX, 0 }, {
    /* 0 0x00 '^@' */
    0x00, /* 00000000 */
    0x00, /* 00000000 */
@@ -2575,14 +2575,13 @@ static const unsigned char fontdata_pearl8x8[FONTDATAMAX] = {
    0x00, /* 00000000 */
    0x00, /* 00000000 */
    0x00, /* 00000000 */
-
-};
+} };
 
 const struct font_desc font_pearl_8x8 = {
 	.idx	= PEARL8x8_IDX,
 	.name	= "PEARL8x8",
 	.width	= 8,
 	.height	= 8,
-	.data	= fontdata_pearl8x8,
+	.data	= fontdata_pearl8x8.data,
 	.pref	= 2,
 };
diff --git a/lib/fonts/font_sun12x22.c b/lib/fonts/font_sun12x22.c
index 955d6eee3959..641a6b4dca42 100644
--- a/lib/fonts/font_sun12x22.c
+++ b/lib/fonts/font_sun12x22.c
@@ -3,8 +3,8 @@
 
 #define FONTDATAMAX 11264
 
-static const unsigned char fontdata_sun12x22[FONTDATAMAX] = {
-
+static struct font_data fontdata_sun12x22 = {
+	{ 0, 0, FONTDATAMAX, 0 }, {
 	/* 0 0x00 '^@' */
 	0x00, 0x00, /* 000000000000 */
 	0x00, 0x00, /* 000000000000 */
@@ -6148,8 +6148,7 @@ static const unsigned char fontdata_sun12x22[FONTDATAMAX] = {
 	0x00, 0x00, /* 000000000000 */
 	0x00, 0x00, /* 000000000000 */
 	0x00, 0x00, /* 000000000000 */
-
-};
+} };
 
 
 const struct font_desc font_sun_12x22 = {
@@ -6157,7 +6156,7 @@ const struct font_desc font_sun_12x22 = {
 	.name	= "SUN12x22",
 	.width	= 12,
 	.height	= 22,
-	.data	= fontdata_sun12x22,
+	.data	= fontdata_sun12x22.data,
 #ifdef __sparc__
 	.pref	= 5,
 #else
diff --git a/lib/fonts/font_sun8x16.c b/lib/fonts/font_sun8x16.c
index 03d71e53954a..193fe6d988e0 100644
--- a/lib/fonts/font_sun8x16.c
+++ b/lib/fonts/font_sun8x16.c
@@ -3,7 +3,8 @@
 
 #define FONTDATAMAX 4096
 
-static const unsigned char fontdata_sun8x16[FONTDATAMAX] = {
+static struct font_data fontdata_sun8x16 = {
+{ 0, 0, FONTDATAMAX, 0 }, {
 /* */ 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
 /* */ 0x00,0x00,0x7e,0x81,0xa5,0x81,0x81,0xbd,0x99,0x81,0x81,0x7e,0x00,0x00,0x00,0x00,
 /* */ 0x00,0x00,0x7e,0xff,0xdb,0xff,0xff,0xc3,0xe7,0xff,0xff,0x7e,0x00,0x00,0x00,0x00,
@@ -260,14 +261,14 @@ static const unsigned char fontdata_sun8x16[FONTDATAMAX] = {
 /* */ 0x00,0x70,0xd8,0x30,0x60,0xc8,0xf8,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
 /* */ 0x00,0x00,0x00,0x00,0x7c,0x7c,0x7c,0x7c,0x7c,0x7c,0x7c,0x00,0x00,0x00,0x00,0x00,
 /* */ 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
-};
+} };
 
 const struct font_desc font_sun_8x16 = {
 	.idx	= SUN8x16_IDX,
 	.name	= "SUN8x16",
 	.width	= 8,
 	.height	= 16,
-	.data	= fontdata_sun8x16,
+	.data	= fontdata_sun8x16.data,
 #ifdef __sparc__
 	.pref	= 10,
 #else
diff --git a/lib/fonts/font_ter16x32.c b/lib/fonts/font_ter16x32.c
index 3f0cf1ccdf3a..91b9c283bd9c 100644
--- a/lib/fonts/font_ter16x32.c
+++ b/lib/fonts/font_ter16x32.c
@@ -4,8 +4,8 @@
 
 #define FONTDATAMAX 16384
 
-static const unsigned char fontdata_ter16x32[FONTDATAMAX] = {
-
+static struct font_data fontdata_ter16x32 = {
+	{ 0, 0, FONTDATAMAX, 0 }, {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x7f, 0xfc, 0x7f, 0xfc,
 	0x70, 0x1c, 0x70, 0x1c, 0x70, 0x1c, 0x70, 0x1c,
@@ -2054,8 +2054,7 @@ static const unsigned char fontdata_ter16x32[FONTDATAMAX] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	/* 255 */
-
-};
+} };
 
 
 const struct font_desc font_ter_16x32 = {
@@ -2063,7 +2062,7 @@ const struct font_desc font_ter_16x32 = {
 	.name	= "TER16x32",
 	.width	= 16,
 	.height = 32,
-	.data	= fontdata_ter16x32,
+	.data	= fontdata_ter16x32.data,
 #ifdef __sparc__
 	.pref	= 5,
 #else
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
