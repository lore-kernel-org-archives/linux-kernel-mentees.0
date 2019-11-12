Return-Path: <SRS0=D7LL=ZE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4857C17440
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 20:00:51 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98FA021925
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 20:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEyV0NAL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98FA021925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 73A29EB6;
	Tue, 12 Nov 2019 20:00:51 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A4696EB0
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 20:00:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3D237102
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 20:00:49 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 205so15651751qkk.1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 12:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3eav2bR35KwTZHUBuG2w5gTnEDz7MMKjoz09RrJ7+SM=;
	b=JEyV0NALWPyv/f1lnpLO+wyQkpn6fkzNkpHISiAfRX3RG07I9QS+eJo3DJtlx0J4tg
	BbDFi0QeaDKfLtSUwyXpI0+ym/cI4jHZdI+K7Iek5NCcntNQyNZczVo2CRKtABdbNR4C
	GP813+5D4J+RZ3CzVEEmiUrRtDSfi0NFsodOnUTHQb42kIBXeYHVrrQvNJ/AdQ6UmKqF
	xSSDxZt/IQAU2tq5O3jdl5qkBAlHgpKaera7mCWl4PocI/K3aRpeuvJ1s0rcbwES5Fep
	yMheCu/hHAls4nvjyFRoj5qyyS375VJt2iMqroSSd3pb9SYixvjkN7QO46lcvHEFl178
	MKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3eav2bR35KwTZHUBuG2w5gTnEDz7MMKjoz09RrJ7+SM=;
	b=Vk5FLrc05Tzk6XGLI9hL8Whd8FpRHtV3Y2tAWxsFoSSYqsiHF45DIBuoMrO1G3ZYVH
	N7/CCpGrkF1IRA3zMi4np+X9O/sGNWUyi217gA83eh2HeYzQw1HSX4S5ByvnSNM3FRbZ
	9x3pySvghw1EnZawcc8CUR+/XwZAvfBuTMCoRIVSq/7qmda1vI5bxW9ctVYvqp5DieVn
	Mv0PikUuL4/WpzELL9TVoN89daHmb725vfMaVpF3Rk03WEvZHyW3CzTbJHtgBKHbTiwi
	f9zByDeBkxuKDu4r0ofIVc7fgi8/EJ1Hz/67x5oKrOAxUacGw0zLCh2muNbQQa1/jgtf
	SYNQ==
X-Gm-Message-State: APjAAAV+RZ0FQ/iQveA24nKTiSEJLYjuPI/v1TxioYCXp60js1uTxN93
	enDhuNmDHchsWy24KtK6nvI=
X-Google-Smtp-Source: APXvYqz83Y6VLDKBuWgGbw82I2j3rhIqrC/DybzDOTm84a7MRr1bLPP/UwzTFUoGJRJp9o3VRqVSSw==
X-Received: by 2002:ae9:edc6:: with SMTP id
	c189mr17145597qkg.351.1573588847741; 
	Tue, 12 Nov 2019 12:00:47 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
	by smtp.gmail.com with ESMTPSA id
	g17sm11754955qte.89.2019.11.12.12.00.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 12:00:47 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: serjk@netup.ru, aospan@netup.ru, mchehab@kernel.org, ast@kernel.org,
	daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com
Date: Tue, 12 Nov 2019 16:53:21 -0300
Message-Id: <20191112195321.36297-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] media: ascot2e.c: fix checkpatch.pl
	error
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This patch fixes the following scripts/checkpatch.pl error:

ERROR: space required after that ',' (ctx:VxV)
+		dev_warn(&priv->i2c->dev,"wr reg=%04x: len=%d is too big!\n",

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/ascot2e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb-frontends/ascot2e.c
index 9b00b56230b6..bfb2d5cb6ce7 100644
--- a/drivers/media/dvb-frontends/ascot2e.c
+++ b/drivers/media/dvb-frontends/ascot2e.c
@@ -124,7 +124,7 @@ static int ascot2e_write_regs(struct ascot2e_priv *priv,
 	};
 
 	if (len + 1 > sizeof(buf)) {
-		dev_warn(&priv->i2c->dev,"wr reg=%04x: len=%d is too big!\n",
+		dev_warn(&priv->i2c->dev, "wr reg=%04x: len=%d is too big!\n",
 			 reg, len + 1);
 		return -E2BIG;
 	}
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
