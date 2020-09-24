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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862C7C2D0E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 13:45:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E181E23741
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 13:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtlvbpXF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E181E23741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A30162E12D;
	Thu, 24 Sep 2020 13:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0I-0DewtyrGR; Thu, 24 Sep 2020 13:45:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ED4B92E13F;
	Thu, 24 Sep 2020 13:45:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D856EC1AD5;
	Thu, 24 Sep 2020 13:45:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A3A2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6962486C2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OzGpJuEdosIA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:45:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9117F86C5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 13:45:04 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id k8so1947574pfk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 06:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZXp4SMdhtGATfhHsl/+G06GlWj8IVOPfotDaVzkM7uw=;
 b=OtlvbpXF/ECfXRYBaiRcIpx2pOm3Z1RMgW1qGBA/sQ1DL0+a0Bcli09oIxL3wSwJXu
 oSwn2lwketEYcopnYRPPuESf9U4i+NbtjyozQIBtW06rGmd0TJj2rexyS6SAXoz33UmT
 M90QkLUoDK+GT2kzIQSQnQ6UG25KQ6ssQL6D3rdTVY1ltRb4YRsAW8hp0hJa8f6diefB
 MG3hFfcLuCzwBAU32ALcd0WPYXetuLK9FbXq27Fxj1p+WOJxwSMLNYT2gV5/QJL47JAT
 9D46CSzYubZW8Ho5DfCqEbZ1M24UF7xVaP6RW9dOA1c79qjSEKboPvHj64Rg+Gcc1j3G
 E/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXp4SMdhtGATfhHsl/+G06GlWj8IVOPfotDaVzkM7uw=;
 b=sgKIZf18OeUsRHFK+Q7pqwQPU3VnoNWPt/FYgGYVC+RZU6VmxbLWmfcqQl+EIjegHG
 GT94legAgMRNHOwWv9/ltQpXoCG2id0U4GYuMpByk4uMbaUNUQMWTGWtmrvgCROu/AMo
 vpcPpUo0X3Oz5gWq82oRDjg+xvEs6CI6JhbwMcFof0PodZxww73U2hJwj+JcJ52/5JiV
 qL/k/TvADOpwfrkE7yEsA9rSmrVr/LRr+lB5ThFtG4HlaFpMnwXqOJjgxIB8c0fkxezB
 kYOJO1GQOTEdTJt3XUNQ3TlikJlVWze2TRFRHr0vROr8kW4ElEcQFJTnyO+hCoJPZHl2
 ydFw==
X-Gm-Message-State: AOAM532E1FekLEET0bow+b6NTAHpKHkmS4wx5ku/V66slzhD5/rF6mcN
 hAhIBYBOOJFGTY4ZdvPXgw==
X-Google-Smtp-Source: ABdhPJzXYqCs3PJDgKW5fdZ3Dh5AiaT47Pde38vaglC/Rl/0Pmj57uGXtxvq7ubpnQ73YLUxLhiy0A==
X-Received: by 2002:a63:a26:: with SMTP id 38mr1299965pgk.118.1600955104158;
 Thu, 24 Sep 2020 06:45:04 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id o5sm2534926pjs.13.2020.09.24.06.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 06:45:03 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Thu, 24 Sep 2020 09:43:48 -0400
Message-Id: <b34544687a1a09d6de630659eb7a773f4953238b.1600953813.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ef18af00c35fb3cc826048a5f70924ed6ddce95b.1600953813.git.yepeilin.cs@gmail.com>
References: <cover.1600953813.git.yepeilin.cs@gmail.com>
 <7fb8bc9b0abc676ada6b7ac0e0bd443499357267.1600953813.git.yepeilin.cs@gmail.com>
 <ef18af00c35fb3cc826048a5f70924ed6ddce95b.1600953813.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 3/3] fbcon: Fix global-out-of-bounds
	read in fbcon_get_font()
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

fbcon_get_font() is reading out-of-bounds. A malicious user may resize
`vc->vc_font.height` to a large value, causing fbcon_get_font() to
read out of `fontdata`.

fbcon_get_font() handles both built-in and user-provided fonts.
Fortunately, recently we have added FONT_EXTRA_WORDS support for built-in
fonts, so fix it by adding range checks using FNTSIZE(). 

This patch depends on patch "fbdev, newport_con: Move FONT_EXTRA_WORDS
macros into linux/font.h", and patch "Fonts: Support FONT_EXTRA_WORDS
macros for built-in fonts".

Cc: stable@vger.kernel.org
Reported-and-tested-by: syzbot+29d4ed7f3bdedf2aa2fd@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=08b8be45afea11888776f897895aef9ad1c3ecfd
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 66167830fefd..bda24c64e646 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2492,6 +2492,9 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font)
 
 	if (font->width <= 8) {
 		j = vc->vc_font.height;
+		if (font->charcount * j > FNTSIZE(fontdata))
+			return -EINVAL;
+
 		for (i = 0; i < font->charcount; i++) {
 			memcpy(data, fontdata, j);
 			memset(data + j, 0, 32 - j);
@@ -2500,6 +2503,9 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font)
 		}
 	} else if (font->width <= 16) {
 		j = vc->vc_font.height * 2;
+		if (font->charcount * j > FNTSIZE(fontdata))
+			return -EINVAL;
+
 		for (i = 0; i < font->charcount; i++) {
 			memcpy(data, fontdata, j);
 			memset(data + j, 0, 64 - j);
@@ -2507,6 +2513,9 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font)
 			fontdata += j;
 		}
 	} else if (font->width <= 24) {
+		if (font->charcount * (vc->vc_font.height * sizeof(u32)) > FNTSIZE(fontdata))
+			return -EINVAL;
+
 		for (i = 0; i < font->charcount; i++) {
 			for (j = 0; j < vc->vc_font.height; j++) {
 				*data++ = fontdata[0];
@@ -2519,6 +2528,9 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font)
 		}
 	} else {
 		j = vc->vc_font.height * 4;
+		if (font->charcount * j > FNTSIZE(fontdata))
+			return -EINVAL;
+
 		for (i = 0; i < font->charcount; i++) {
 			memcpy(data, fontdata, j);
 			memset(data + j, 0, 128 - j);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
