Return-Path: <SRS0=f0b9=DB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23175C2D0E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 13:40:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9F2238E4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 13:40:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMmQQ6aO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9F2238E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 138C986C34;
	Thu, 24 Sep 2020 13:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6cxPrTCqyl6; Thu, 24 Sep 2020 13:40:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D181E86C2E;
	Thu, 24 Sep 2020 13:40:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA611C0889;
	Thu, 24 Sep 2020 13:40:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5878DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3D818873AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OxYLrzqcgnUL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:40:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E8648873A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:40:03 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b124so1899646pfg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 06:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2yfOuAbI9UUg6VrnUSeHXgk4nmP275+ivWKv7Dcy/q8=;
 b=PMmQQ6aOHZ+zTXVL+c9oRrZOqYrsOc2Cl/QsXZ6udk4Xk9kFPNuF6QdQu1S9eKKVMR
 oLTKhLfMNejwvYa5JDZFy9W23DstgXeGbBDY9ewFKSW2KDftKh3cqNIunrSxBgLzQ9vm
 g5zdpCrarDa4cg6nOaRoMdtLr78b0TfSuzuwcxTs1HuPR5c6GMBSRVDswl55Eylv3tN7
 ivh0GMHmT6cPtXwbKNzueQdpCshHtCAUXkm52oEYUzqHlamEKt0BBm18wJW+/0MspIqJ
 Q+j0H/wRF8TM3E9Zy7i40/pr1WcCqvwdckV0AF5aQHOUEDnQTsC06Oxh7i04xPqM/o8m
 R76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2yfOuAbI9UUg6VrnUSeHXgk4nmP275+ivWKv7Dcy/q8=;
 b=dCaNmpyOgV1jWNLEeNmLyO9+FDUF6YqEzTdNsgQzEtr4UWR2AhZx6nLkMfxsSQXU57
 9HCn1N6GCzdx1SKLu0g5jH5TsAu3Usau7K4czvPMDXvZCdNrcw83JxSjuN8TiUpNmCTe
 RbU9Hmg2AeNA093GcCIrhteoaGgp8I/ODNuh13cXVHce6toDYLfVAni2hLZInmeefqFG
 mMiu3WDpv33NKiQMeBVl01yz/QsRboy6RZTbulEAwFYXgKIeznplKPuAsiWI1c87J58m
 +WvjgQvYjdBeRMGElgdFIxsL8XqjxSK1F4tWT05dnDp62QUKFE/nZhlPUYoA+x6tpPhY
 plKA==
X-Gm-Message-State: AOAM533WNW19mk/iDxXcWXfcKURobjEZvxGolrMoTT2d9Aii3Yq3XBH9
 WHB8SyTPjZivjgvyWWH0Dw==
X-Google-Smtp-Source: ABdhPJyy7G4q8VNVUkrM4snz9Kk8FrXM/XKbi5D6uu4gFFKxLMUw8zdONA+NQ6GnVmTzabg2B5ALxA==
X-Received: by 2002:a65:580c:: with SMTP id g12mr4170995pgr.257.1600954803400; 
 Thu, 24 Sep 2020 06:40:03 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id d7sm3171827pgg.1.2020.09.24.06.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 06:40:02 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Thu, 24 Sep 2020 09:38:22 -0400
Message-Id: <cover.1600953813.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0000000000006b9e8d059952095e@google.com>
References: <0000000000006b9e8d059952095e@google.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 0/3] Prevent out-of-bounds access for
	built-in font data buffers
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

Hi all,

syzbot has reported [1] a global out-of-bounds read issue in
fbcon_get_font(). A malicious user may resize `vc_font.height` to a large
value in vt_ioctl(), causing fbcon_get_font() to overflow our built-in
font data buffers, declared in lib/fonts/font_*.c:

(e.g. lib/fonts/font_8x8.c)
#define FONTDATAMAX 2048

static const unsigned char fontdata_8x8[FONTDATAMAX] = {

        /* 0 0x00 '^@' */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        0x00, /* 00000000 */
        [...]

In order to perform a reliable range check, fbcon_get_font() needs to know
`FONTDATAMAX` for each built-in font under lib/fonts/. Unfortunately, we
do not keep that information in our font descriptor,
`struct console_font`:

(include/uapi/linux/kd.h)
struct console_font {
	unsigned int width, height;	/* font size */
	unsigned int charcount;
	unsigned char *data;	/* font data with height fixed to 32 */
};

To make things worse, `struct console_font` is part of the UAPI, so we
cannot add a new field to keep track of `FONTDATAMAX`.

Fortunately, the framebuffer layer itself gives us a hint of how to
resolve this issue without changing UAPI. When allocating a buffer for a
user-provided font, fbcon_set_font() reserves four "extra words" at the
beginning of the buffer:

(drivers/video/fbdev/core/fbcon.c)
	new_data = kmalloc(FONT_EXTRA_WORDS * sizeof(int) + size, GFP_USER);
        [...]
	new_data += FONT_EXTRA_WORDS * sizeof(int);
	FNTSIZE(new_data) = size;
	FNTCHARCNT(new_data) = charcount;
	REFCOUNT(new_data) = 0;	/* usage counter */
        [...]
	FNTSUM(new_data) = csum;

Later, to get the size of a data buffer, the framebuffer layer simply
calls FNTSIZE() on it:

(drivers/video/fbdev/core/fbcon.h)
	/* Font */
	#define REFCOUNT(fd)	(((int *)(fd))[-1])
	#define FNTSIZE(fd)	(((int *)(fd))[-2])
	#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
	#define FNTSUM(fd)	(((int *)(fd))[-4])
	#define FONT_EXTRA_WORDS 4

Currently, this is only done for user-provided fonts. Let us do the same
thing for built-in fonts, prepend these "extra words" (including
`FONTDATAMAX`) to their data buffers, so that other subsystems, like the
framebuffer layer, can use these macros on all fonts, no matter built-in
or user-provided. As an example, this series fixes the syzbot issue in
fbcon_get_font():

(drivers/video/fbdev/core/fbcon.c)
 	if (font->width <= 8) {
 		j = vc->vc_font.height;
+		if (font->charcount * j > FNTSIZE(fontdata))
+			return -EINVAL;
	[...]

Similarly, newport_con also use these macros. It only uses three of them:

(drivers/video/console/newport_con.c)
	/* borrowed from fbcon.c */
	#define REFCOUNT(fd)	(((int *)(fd))[-1])
	#define FNTSIZE(fd)	(((int *)(fd))[-2])
	#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
	#define FONT_EXTRA_WORDS 3

To keep things simple, move all these macro definitions to <linux/font.h>,
use four words instead of three, and initialize the fourth word in
newport_set_font() properly.

Many thanks to Greg Kroah-Hartman <gregkh@linuxfoundation.org>, who
reviewed and improved this series!

[1]: KASAN: global-out-of-bounds Read in fbcon_get_font
     https://syzkaller.appspot.com/bug?id=08b8be45afea11888776f897895aef9ad1c3ecfd

Peilin Ye (3):
  fbdev, newport_con: Move FONT_EXTRA_WORDS macros into linux/font.h
  Fonts: Support FONT_EXTRA_WORDS macros for built-in fonts
  fbcon: Fix global-out-of-bounds read in fbcon_get_font()

 drivers/video/console/newport_con.c     |  7 +------
 drivers/video/fbdev/core/fbcon.c        | 12 ++++++++++++
 drivers/video/fbdev/core/fbcon.h        |  7 -------
 drivers/video/fbdev/core/fbcon_rotate.c |  1 +
 drivers/video/fbdev/core/tileblit.c     |  1 +
 include/linux/font.h                    | 13 +++++++++++++
 lib/fonts/font_10x18.c                  |  9 ++++-----
 lib/fonts/font_6x10.c                   |  9 +++++----
 lib/fonts/font_6x11.c                   |  9 ++++-----
 lib/fonts/font_7x14.c                   |  9 ++++-----
 lib/fonts/font_8x16.c                   |  9 ++++-----
 lib/fonts/font_8x8.c                    |  9 ++++-----
 lib/fonts/font_acorn_8x8.c              |  9 ++++++---
 lib/fonts/font_mini_4x6.c               |  8 ++++----
 lib/fonts/font_pearl_8x8.c              |  9 ++++-----
 lib/fonts/font_sun12x22.c               |  9 ++++-----
 lib/fonts/font_sun8x16.c                |  7 ++++---
 lib/fonts/font_ter16x32.c               |  9 ++++-----
 18 files changed, 79 insertions(+), 67 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
