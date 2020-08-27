Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC7DC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 06:54:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFBE8207BC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 06:54:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLaHMikw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFBE8207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 81B4785DB1;
	Thu, 27 Aug 2020 06:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O58+PWvHKmyQ; Thu, 27 Aug 2020 06:54:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 46FB785B00;
	Thu, 27 Aug 2020 06:54:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3280BC016F;
	Thu, 27 Aug 2020 06:54:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 941AEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7ECB786CA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UUOMFMojY58r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:54:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0760786CA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:54:35 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id t9so2742277pfq.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Aug 2020 23:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BCoL4GC0gNjAzmmMRfC/gvKA1COigx1ubzs0rhx5Lso=;
 b=VLaHMikwWNRlOpknfV2L9wpgFm0GPiV2o5zjbJeBijU7IWF/iGoEDEtGbJ30Le5UJP
 NoqQ+oAZ1FPOvuYv3mdRXTebnPgvys7VyNehhUDcGw10vRx67egVgmkiMU3ixxBzEb0y
 qlHVOFlfp3X8UeIfVeaA+NDFD+PQhTi6kaWX7KXk5v1S5tKZYDb+bhEEUhN8xVPWpHcC
 5z7XBCqEi4IpxYh7u9+migwkB6amlkIj4SKK9+mGCYqX8Tu2VImrbFBQq05jI23dJhPB
 jrEUwfSL15fXZsi2Jg16d5kqgVDo4xTELNvBpdh4Mywl0I6sfHiRDR8rwOwy2lpvUacI
 r9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BCoL4GC0gNjAzmmMRfC/gvKA1COigx1ubzs0rhx5Lso=;
 b=EHjwCAF2g/fAmkjugwYB16LpN6PWI/Cx9oOh5qjBbff4PV9KYfCF+ymjmYDxTu9uD2
 qLiYfh3D3l8f/4mUcp4MLAcGsHYt5ScsgJjUINqw/3sRPs64iUOjq3QhE4B2p7rmsdd7
 7SxK5G5YkCr0STXls5NC4ENR6xuXuMfmaobe/uiSegpiEJAFHXOSlMz06fnChgI+KCZN
 41NbsFAIo4mwtZXoGBJbPSRrQ16mo6x4Bg/FxQM0cJKqvmSJ0h3JWMfYQxgUF3mxhj0n
 I7AzLdJpODCnLSu9QKs3/rro05CI/eZSVqleiYuQ9yp+12MiIiPMXXjs4ajXEiduWMc1
 JkbQ==
X-Gm-Message-State: AOAM530k1CrnkPlJ4YAFn8D4UWuIwIzwCo/5apFujqrBE2ar/vcTS5DK
 yHhfbvMzhRxJFl5p5Pptpas=
X-Google-Smtp-Source: ABdhPJx50mcT7++XwHrFN234jCQjWBTei+BiA76W2qY8K8ZVAoJvc/yUmoOJ7RUT03UT0V23iKGDeA==
X-Received: by 2002:a63:1b0b:: with SMTP id b11mr14028827pgb.447.1598511274585; 
 Wed, 26 Aug 2020 23:54:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:810b:d5b5:fcb1:360f:550f:6dac])
 by smtp.gmail.com with ESMTPSA id o2sm1162174pjh.4.2020.08.26.23.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 23:54:34 -0700 (PDT)
From: Himadri Pandya <himadrispandya@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org
Date: Thu, 27 Aug 2020 12:23:55 +0530
Message-Id: <20200827065355.15177-1-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Himadri Pandya <himadrispandya@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] net: usb: Fix uninit-was-stored
	issue in asix_read_phy_addr()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The buffer size is 2 Bytes and we expect to receive the same amount of
data. But sometimes we receive less data and run into uninit-was-stored
issue upon read. Hence modify the error check on the return value to match
with the buffer size as a prevention.

Reported-and-tested by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
---
 drivers/net/usb/asix_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
index e39f41efda3e..7bc6e8f856fe 100644
--- a/drivers/net/usb/asix_common.c
+++ b/drivers/net/usb/asix_common.c
@@ -296,7 +296,7 @@ int asix_read_phy_addr(struct usbnet *dev, int internal)
 
 	netdev_dbg(dev->net, "asix_get_phy_addr()\n");
 
-	if (ret < 0) {
+	if (ret < 2) {
 		netdev_err(dev->net, "Error reading PHYID register: %02x\n", ret);
 		goto out;
 	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
