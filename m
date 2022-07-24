Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B19ECCA47C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jul 2022 21:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08B941732;
	Sun, 24 Jul 2022 21:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08B941732
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AYzHdSH4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkWJArGHjLJA; Sun, 24 Jul 2022 21:42:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 477AF41726;
	Sun, 24 Jul 2022 21:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 477AF41726
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C85EC0035;
	Sun, 24 Jul 2022 21:42:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9CADC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 21:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9252841728
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 21:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9252841728
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aa6p-mbpopBB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 21:42:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 159F041726
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 159F041726
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 21:42:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q18so3106149wrx.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 14:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cI0tq8ocLXnomSpbghiVV7RxzqLowQvyj0zeXfaGRkk=;
 b=AYzHdSH4LYYxwPAVebBYfedRYqP0Wr9Hh+iqf8pYEMndrZnQ7pqItSGqypWj9Qnbd1
 eXFRu/Z8JVzRtSo8s6deeiLjHab7rGabOhMO8B0V+NL7dz2Wy3sG7Yo9xumTpMYUhJNG
 8oM39zmisit/HM55TUiQKQhlPNxm4N/pWkQQAw/qoBCLw8nFRTAZ6dswBvznnNeng4Dj
 VUYOIUsSMCXBCowS+db3eVv3M+0NYPqK/JUSD0bxykZQD40rS51IB+KQnBXSds68nftM
 h2/N3gbn4fsonG5eZx+TXlmbU4RLGSy1veZXODAz1j1unSFHGyFaGiRv3He+fXr7HJJH
 mL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cI0tq8ocLXnomSpbghiVV7RxzqLowQvyj0zeXfaGRkk=;
 b=biV7ymNawFyohSn8cXQOKBSXlR5aW2CnSSyi+Uj80Qf7F5kxCTLfuCyJtFxxDxpX7S
 +uAzmkGddNjhVlmHYido/WQJ/JJYv9IdC3kT4j8jtFP/Y3KZqdVb35eMSZLzluFepZ4h
 t5spqUFXrq0MuzGsTG2d+uCxp9WWAJP6I7pTJTdyq/wurErekTqqU4+civQfNBErZeub
 pkgMFmHXzk3J0yKju/PBs4R9JampjlDysGcL18v4Xy/ajltG3Mmme0DkIsXWTJmgVZdy
 CtOoUAKKPo3MtByNIKcbXPce3oTEnRrbSacnDbbQvaj6ckArJmcIqAlhp9dNiAsn4JMt
 vJ7w==
X-Gm-Message-State: AJIora+I+9Qs7V+zrSo88v5IWA2cHK2FSevddqBGT6amGuDIHoxsfS8O
 Sam6vbTjvtaypnhBJXcbJAE=
X-Google-Smtp-Source: AGRyM1sSw/iFXQoSeyFqEEBVJH9oD0mhzGexSPkzEN8qhoy2RmTetkCyZv86IoZgtkp5+jXrDCDnXQ==
X-Received: by 2002:a05:6000:1545:b0:21e:6a2d:1e42 with SMTP id
 5-20020a056000154500b0021e6a2d1e42mr5782677wry.660.1658698951095; 
 Sun, 24 Jul 2022 14:42:31 -0700 (PDT)
Received: from localhost.localdomain ([84.255.184.16])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adffb04000000b0021db7b0162esm6322359wrr.105.2022.07.24.14.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 14:42:30 -0700 (PDT)
From: Mazin Al Haddad <mazinalhaddad05@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH v2] media: dvb-usb: fix memory leak in dvb_usb_adapter_init()
Date: Mon, 25 Jul 2022 00:41:02 +0300
Message-Id: <20220724214100.593287-1-mazinalhaddad05@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Cc: syzbot+f66dd31987e6740657be@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Mazin Al Haddad <mazinalhaddad05@gmail.com>
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

Fix a memory leak in dvb_usb_adapter_init() reported by syzkaller. The 
problem is due to the error path exiting before incrementing 
num_adapters_initalized, which is used as a reference counter to free 
adapter's private data. There are multiple error paths that 
dvb_usb_adapter_init() can exit from before incrementing the counter, 
which lead to a memory leak as the current iteration is not accounted for.
Fix this by freeing the current iteration's adap->priv in each of the 
error paths.

Syz Report:
BUG: memory leak
unreferenced object 0xffff8881172f1a00 (size 512):
  comm "kworker/0:2", pid 139, jiffies 4294994873 (age 10.960s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff844af012>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:75 [inline]
    [<ffffffff844af012>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:184 [inline]
    [<ffffffff844af012>] dvb_usb_device_init.cold+0x4e5/0x79e drivers/media/usb/dvb-usb/dvb-usb-init.c:308
    [<ffffffff830db21d>] dib0700_probe+0x8d/0x1b0 drivers/media/usb/dvb-usb/dib0700_core.c:883
    [<ffffffff82d3fdc7>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<ffffffff8274ab37>] call_driver_probe drivers/base/dd.c:542 [inline]
    [<ffffffff8274ab37>] really_probe.part.0+0xe7/0x310 drivers/base/dd.c:621
    [<ffffffff8274ae6c>] really_probe drivers/base/dd.c:583 [inline]
    [<ffffffff8274ae6c>] __driver_probe_device+0x10c/0x1e0 drivers/base/dd.c:752
    [<ffffffff8274af6a>] driver_probe_device+0x2a/0x120 drivers/base/dd.c:782
    [<ffffffff8274b786>] __device_attach_driver+0xf6/0x140 drivers/base/dd.c:899
    [<ffffffff82747c87>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:427
    [<ffffffff8274b352>] __device_attach+0x122/0x260 drivers/base/dd.c:970
    [<ffffffff827498f6>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:487
    [<ffffffff82745cdb>] device_add+0x5fb/0xdf0 drivers/base/core.c:3405
    [<ffffffff82d3d202>] usb_set_configuration+0x8f2/0xb80 drivers/usb/core/message.c:2170
    [<ffffffff82d4dbfc>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<ffffffff82d3f49c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<ffffffff8274ab37>] call_driver_probe drivers/base/dd.c:542 [inline]
    [<ffffffff8274ab37>] really_probe.part.0+0xe7/0x310 drivers/base/dd.c:621
    [<ffffffff8274ae6c>] really_probe drivers/base/dd.c:583 [inline]
    [<ffffffff8274ae6c>] __driver_probe_device+0x10c/0x1e0 drivers/base/dd.c:752

Link: https://syzkaller.appspot.com/bug?id=4d54f8bf7b98eecf6cd76ed5aaea883c5d9e502a
Reported-by: syzbot+f66dd31987e6740657be@syzkaller.appspotmail.com
Signed-off-by: Mazin Al Haddad <mazinalhaddad05@gmail.com>
---

Changes in v2:
- Remove variable that is used to refcount and instead free current
  iteration private data.

 drivers/media/usb/dvb-usb/dvb-usb-init.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index 61439c8f33ca..69520d7ca25d 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -80,16 +80,22 @@ static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
 		}
 
 		ret = dvb_usb_adapter_stream_init(adap);
-		if (ret)
+		if (ret) {
+			kfree(adap->priv);
 			return ret;
+		}
 
 		ret = dvb_usb_adapter_dvb_init(adap, adapter_nrs);
-		if (ret)
+		if (ret) {
+			kfree(adap->priv);
 			goto dvb_init_err;
+		}
 
 		ret = dvb_usb_adapter_frontend_init(adap);
-		if (ret)
+		if (ret) {
+			kfree(adap->priv);
 			goto frontend_init_err;
+		}
 
 		/* use exclusive FE lock if there is multiple shared FEs */
 		if (adap->fe_adap[1].fe)
@@ -112,6 +118,7 @@ static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
 
 frontend_init_err:
 	dvb_usb_adapter_dvb_exit(adap);
+	return ret;
 dvb_init_err:
 	dvb_usb_adapter_stream_exit(adap);
 	return ret;
-- 
2.37.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
