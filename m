Return-Path: <SRS0=+n2V=LO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F09C49EA3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Jun 2021 20:23:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9678161026
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Jun 2021 20:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9678161026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 533096079A;
	Sun, 20 Jun 2021 20:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id huDw4EVKGRPz; Sun, 20 Jun 2021 20:23:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6AC8060586;
	Sun, 20 Jun 2021 20:23:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5689FC0010;
	Sun, 20 Jun 2021 20:23:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F410C000C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 20:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F350D40148
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 20:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95xohep0GvBH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 20:23:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28CAC400C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 20:23:22 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id r5so26600064lfr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 13:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SrBBo2xUqMg+tHTMzV3CujkK2QsqZ6Q4qMqTjzZFegg=;
 b=HlGF9uxQs68nba4LqCR2Bjp0sBHaVZwhQnhYZC0Lmf3oOA1MPmitB3j1yuDOEcaGK5
 ht4xiO9xiLu15evpkTFtM8VQ8CWGoavpJqX7RGU5r5hDWSlgLJuedCn6XfmS89mmOTGM
 zrTgdK6KPgHeG9La9U9TCl+C9z3s0MHA1+LxoCDZVtt8KenUeT09WGj92kl/yCC0yoWS
 nZ2yw8tE95/65wCeWaSKYt/vSr/rXabDCPTOmdYkzYY1vZxIHKPdSNfo+MKwmSPLXyl6
 1yys8+w9FPD8keqELQkdO2W3J+ZKlRPRfUCgW2SgztAhMdipNDHsaRAssDFJHbtRlNrt
 OOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SrBBo2xUqMg+tHTMzV3CujkK2QsqZ6Q4qMqTjzZFegg=;
 b=uKJzVzqxaS13GBhI0lEFqvzcp91eGWJTVds8dF888MXVqegzFnbd6sRsUw7U12FZAo
 Tq5XkKF5/ByNVPo0A3KhQzVsQQW8WlUkenEM4JrBQO/6czLrTGFZb/Eryd0PDokLIJRw
 1gg8FREiNvhsz4/6i8lyfWpVH7k1roTDDcHHpp+ccWApjGSq4xPZT0Wcn1SZajecGhOC
 mw9lzerghhL2qr29Nuwq5rNfCQjK1N4ofdd0/uM0c2acwJgIrrw7BpfDIrJ1X9/XjVB1
 FpmKm42o1shX4onYAJ6MqT39WeKSshvB/1JVkgjtnlrwxe7eEA26vt0gJ+ZViqbjWZfS
 ghrg==
X-Gm-Message-State: AOAM532sZVoF+0NvdFTf+s+rhzolZQhrVytTyOEap6tYPcSvxZd1/tFE
 0ccD2Dx3UfIJbN1EFL+mRKo=
X-Google-Smtp-Source: ABdhPJwAP9+SXSqKbrXAK8JnzRSD6FssxGxODNXRDurVODIrIXN00SPjSzpM7wOKrvqaNkpDJSMAgA==
X-Received: by 2002:a05:6512:3c83:: with SMTP id
 h3mr11553892lfv.80.1624220599915; 
 Sun, 20 Jun 2021 13:23:19 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
 by smtp.gmail.com with ESMTPSA id m18sm1880052ljg.105.2021.06.20.13.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 13:23:19 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: mchehab@kernel.org,
	tomimo@ncircle.nullnet.fi,
	thierry.merle@free.fr
Subject: [PATCH] media: dvb-usb: fix memory leak in cinergyt2_frontend_attach
Date: Sun, 20 Jun 2021 23:23:17 +0300
Message-Id: <20210620202317.4338-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

My local syzbot instance hit a memory leak in
cinergyt2_frontend_attach() [1].

The problem was in non-freed dvb_frontend in case of error.
If dvb_usb_generic_rw() call fails, an error will be returned from
cinergyt2_frontend_attach() [1] and num_adapters_initialized of
dvb_usb_device won't be incremented. That means dvb usb library
won't take care of freeing allocated frontend.

Fail log:
BUG: memory leak
unreferenced object 0xffff88801d9c6000 (size 2048):
  comm "kworker/1:3", pid 2960, jiffies 4295150569 (age 17.150s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 54 65 72 72 61 54 65 63  ........TerraTec
    2f 71 61 6e 75 20 55 53 42 32 2e 30 20 48 69 67  /qanu USB2.0 Hig
  backtrace:
    [<ffffffff85e169f0>] kmalloc include/linux/slab.h:556 [inline]
    [<ffffffff85e169f0>] kzalloc include/linux/slab.h:686 [inline]
    [<ffffffff85e169f0>] cinergyt2_fe_attach+0x40/0x110 drivers/media/usb/dvb-usb/cinergyT2-fe.c:271
    [<ffffffff85e15b31>] cinergyt2_frontend_attach+0x61/0x140 drivers/media/usb/dvb-usb/cinergyT2-core.c:74 [1]
    [<ffffffff85dcd71e>] dvb_usb_adapter_frontend_init+0x35e/0x5b0 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:290
    [<ffffffff88f98e83>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:90 [inline]
    [<ffffffff88f98e83>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:184 [inline]

Fixes: 986bd1e58b18 ("V4L/DVB (9107): Alternative version of Terratec Cinergy T2
driver")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/dvb-usb/cinergyT2-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/dvb-usb/cinergyT2-core.c b/drivers/media/usb/dvb-usb/cinergyT2-core.c
index 969a7ec71dff..fb60af097535 100644
--- a/drivers/media/usb/dvb-usb/cinergyT2-core.c
+++ b/drivers/media/usb/dvb-usb/cinergyT2-core.c
@@ -79,6 +79,7 @@ static int cinergyt2_frontend_attach(struct dvb_usb_adapter *adap)
 	ret = dvb_usb_generic_rw(d, st->data, 1, st->data, 3, 0);
 	if (ret < 0) {
 		deb_rc("cinergyt2_power_ctrl() Failed to retrieve sleep state info\n");
+		kfree(adap->fe_adap[0].fe);
 	}
 	mutex_unlock(&d->data_mutex);
 
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
