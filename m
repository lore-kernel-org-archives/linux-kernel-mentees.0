Return-Path: <SRS0=D2Vm=BY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DF8C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Aug 2020 16:06:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9898A2078D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Aug 2020 16:06:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZIGW/jL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9898A2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C6C18888C;
	Fri, 14 Aug 2020 16:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4Za3U69abUb; Fri, 14 Aug 2020 16:06:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EEE6C88457;
	Fri, 14 Aug 2020 16:06:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6730C013C;
	Fri, 14 Aug 2020 16:06:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C8DBC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 16:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5C4E1875C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 16:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwFf7SW2hkBr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 16:06:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3A0A9875C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 16:06:21 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id v5so2218198plo.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 09:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SVVgujljZTtyJP6NnksQakHSy/XVCreM9mOqtMP8xFc=;
 b=ZZIGW/jLmpzk1d8NA4T7bUfo0j+jVcUhskU2RVTwoT5W3++oJCwv4kxx/pSVQhR2D2
 7bj0hFcWXTSgTQBNAKKv/wwS4sLjfq86l8EUsD6rVX7UopuQucjogCN1VsoXbPEM/2/N
 3gksrhGnVSSTjdJD6w5hTJua7m8ryaM1egfphkOk5RV6U5r6A1CS27UuXwYKlF4zy5ey
 bu04sjTeBTpesueoncTwVWJaBRtQF+CE488jmDuRstb2F0fPOrIYNHqWkSmY/iK5KytN
 8AAZuvEEKGnMA10TANHHXOYTay/MXnO5lf2UxZSE7XVMzGmyrcSfFNahn8DmgmQ305lV
 V70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SVVgujljZTtyJP6NnksQakHSy/XVCreM9mOqtMP8xFc=;
 b=nkXTBAJ6DhwSfGnbWElz2byfsxhEMVj07nSm9aYm2hp5dDtmaYDTjWThG/re8memA1
 25KO6TRlucwYlRwJSYow+mTQvFHGaSpEH0eR/nxYl4IBGPGcu36o03R4Soc6StCRP0LP
 V9ueEqb63omVrcVbwPH/+liz/nC9+B1ne2e76opfrip1aw/VF+06aogqS/Kc0rpK4rWx
 Cqm/2VrCTliqcbG/k1yp0mgdJ1Dr1Sr/RuYS0OhgUwgkTQJLPM3e9zJ/8hXWr9AJH4Ju
 rTko6t9g2XWHL7FNH3Fzuyq1B9qH1rl0rU5W8e6wyGBTvwPkLbQczErNKm3ptozrn7nq
 SG1Q==
X-Gm-Message-State: AOAM533GvON+bHLPuSjbcLYX403+rFOwzgaMJUhdKvthKqwpQ4vtsNJa
 7Enh6bwKT0jceESoo4k7itI=
X-Google-Smtp-Source: ABdhPJzaWHQZ9DlZxR8aScqhOBpp10HepOQyWepHBDjcHkVmyg0GkAryg0PXMwKwf4QZhhkhZUe54A==
X-Received: by 2002:a17:902:246:: with SMTP id 64mr2507754plc.70.1597421180418; 
 Fri, 14 Aug 2020 09:06:20 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id w130sm9834458pfd.104.2020.08.14.09.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 09:06:20 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: netdev@vger.kernel.org
Date: Sat, 15 Aug 2020 00:05:59 +0800
Message-Id: <20200814160601.901682-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814160601.901682-1-coiby.xu@gmail.com>
References: <20200814160601.901682-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Cc: Michal Kubecek <mkubecek@suse.cz>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 GR-Linux-NIC-Dev@marvell.com, Manish Chopra <manishc@marvell.com>,
 open list <linux-kernel@vger.kernel.org>,
 Benjamin Poirier <benjamin.poirier@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC 1/3] Initialize devlink health dump
	framework for the dlge driver
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

Initialize devlink health dump framework for the dlge driver so the
coredump could be done via devlink.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/staging/qlge/Makefile      |  2 +-
 drivers/staging/qlge/qlge.h        |  9 +++++++
 drivers/staging/qlge/qlge_health.c | 43 ++++++++++++++++++++++++++++++
 drivers/staging/qlge/qlge_health.h |  2 ++
 drivers/staging/qlge/qlge_main.c   | 21 +++++++++++++++
 5 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 drivers/staging/qlge/qlge_health.c
 create mode 100644 drivers/staging/qlge/qlge_health.h

diff --git a/drivers/staging/qlge/Makefile b/drivers/staging/qlge/Makefile
index 1dc2568e820c..0a1e4c8dd546 100644
--- a/drivers/staging/qlge/Makefile
+++ b/drivers/staging/qlge/Makefile
@@ -5,4 +5,4 @@
 
 obj-$(CONFIG_QLGE) += qlge.o
 
-qlge-objs := qlge_main.o qlge_dbg.o qlge_mpi.o qlge_ethtool.o
+qlge-objs := qlge_main.o qlge_dbg.o qlge_mpi.o qlge_ethtool.o qlge_health.o
diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
index fc8c5ca8935d..055ded6dab60 100644
--- a/drivers/staging/qlge/qlge.h
+++ b/drivers/staging/qlge/qlge.h
@@ -2061,6 +2061,14 @@ struct nic_operations {
 	int (*port_initialize) (struct ql_adapter *);
 };
 
+
+
+struct qlge_devlink {
+        struct ql_adapter *qdev;
+        struct net_device *ndev;
+        struct devlink_health_reporter *reporter;
+};
+
 /*
  * The main Adapter structure definition.
  * This structure has all fields relevant to the hardware.
@@ -2078,6 +2086,7 @@ struct ql_adapter {
 	struct pci_dev *pdev;
 	struct net_device *ndev;	/* Parent NET device */
 
+	struct qlge_devlink *devlink;
 	/* Hardware information */
 	u32 chip_rev_id;
 	u32 fw_rev_id;
diff --git a/drivers/staging/qlge/qlge_health.c b/drivers/staging/qlge/qlge_health.c
new file mode 100644
index 000000000000..292f6b1827e1
--- /dev/null
+++ b/drivers/staging/qlge/qlge_health.c
@@ -0,0 +1,43 @@
+#include "qlge.h"
+#include "qlge_health.h"
+
+static int
+qlge_reporter_coredump(struct devlink_health_reporter *reporter,
+			struct devlink_fmsg *fmsg, void *priv_ctx,
+			struct netlink_ext_ack *extack)
+{
+	return 0;
+}
+
+static const struct devlink_health_reporter_ops qlge_reporter_ops = {
+		.name = "dummy",
+		.dump = qlge_reporter_coredump,
+};
+
+int qlge_health_create_reporters(struct qlge_devlink *priv)
+{
+	int err;
+
+	struct devlink_health_reporter *reporter;
+	struct devlink *devlink;
+
+	devlink = priv_to_devlink(priv);
+	reporter =
+		devlink_health_reporter_create(devlink, &qlge_reporter_ops,
+					       0,
+					       priv);
+	if (IS_ERR(reporter)) {
+		netdev_warn(priv->ndev,
+			    "Failed to create reporter, err = %ld\n",
+			    PTR_ERR(reporter));
+		return PTR_ERR(reporter);
+	}
+	priv->reporter = reporter;
+
+	if (err)
+		return err;
+
+	return 0;
+}
+
+
diff --git a/drivers/staging/qlge/qlge_health.h b/drivers/staging/qlge/qlge_health.h
new file mode 100644
index 000000000000..07d3bafab845
--- /dev/null
+++ b/drivers/staging/qlge/qlge_health.h
@@ -0,0 +1,2 @@
+#include <net/devlink.h>
+int qlge_health_create_reporters(struct qlge_devlink *priv);
diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 1650de13842f..b2be7f4b7dd6 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -42,6 +42,7 @@
 #include <net/ip6_checksum.h>
 
 #include "qlge.h"
+#include "qlge_health.h"
 
 char qlge_driver_name[] = DRV_NAME;
 const char qlge_driver_version[] = DRV_VERSION;
@@ -4550,6 +4551,8 @@ static void ql_timer(struct timer_list *t)
 	mod_timer(&qdev->timer, jiffies + (5 * HZ));
 }
 
+static const struct devlink_ops qlge_devlink_ops;
+
 static int qlge_probe(struct pci_dev *pdev,
 		      const struct pci_device_id *pci_entry)
 {
@@ -4557,6 +4560,13 @@ static int qlge_probe(struct pci_dev *pdev,
 	struct ql_adapter *qdev = NULL;
 	static int cards_found;
 	int err = 0;
+	struct devlink *devlink;
+	struct qlge_devlink *qlge_dl;
+
+	devlink = devlink_alloc(&qlge_devlink_ops, sizeof(struct qlge_devlink));
+	if (!devlink)
+		return -ENOMEM;
+	qlge_dl = devlink_priv(devlink);
 
 	ndev = alloc_etherdev_mq(sizeof(struct ql_adapter),
 				 min(MAX_CPUS,
@@ -4615,6 +4625,15 @@ static int qlge_probe(struct pci_dev *pdev,
 		free_netdev(ndev);
 		return err;
 	}
+
+	err = devlink_register(devlink, &pdev->dev);
+	if (err)
+		devlink_free(devlink);
+
+	qlge_health_create_reporters(qlge_dl);
+	qlge_dl->qdev = qdev;
+	qlge_dl->ndev = ndev;
+	qdev->devlink = qlge_dl;
 	/* Start up the timer to trigger EEH if
 	 * the bus goes dead
 	 */
@@ -4647,6 +4666,8 @@ static void qlge_remove(struct pci_dev *pdev)
 	unregister_netdev(ndev);
 	ql_release_all(pdev);
 	pci_disable_device(pdev);
+	devlink_unregister(priv_to_devlink(qdev->devlink));
+	devlink_health_reporter_destroy(qdev->devlink->reporter);
 	free_netdev(ndev);
 }
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
