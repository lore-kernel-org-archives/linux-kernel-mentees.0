Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54754C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:59:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE182083B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:59:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn+ymFH5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DE182083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F15018761E;
	Wed, 19 Aug 2020 18:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljhNScN0oSGm; Wed, 19 Aug 2020 18:59:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 93FB485BCC;
	Wed, 19 Aug 2020 18:59:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82A94C07FF;
	Wed, 19 Aug 2020 18:59:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFF35C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AB07A8769B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jq6Sxbvx3B9s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4565685BCC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:59:50 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id nv17so1298926pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 11:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7pp7ILrXVpYWERUNp+y3FKEvGmfdJxafp13Cd61iIdo=;
 b=Mn+ymFH5Tc2xZr4mSSRBUl7CNfTA0DlesWU0Sq0Xu1T+OqneWcVq4ekASysyYI2ETT
 NOSB7C2Cedt19yXvJ2upXqZodaCRErUqHBJvXJ+y1AG0d1s3aeoXWgX4ydW1wonG1AQJ
 KyyYcwn0E1nHoVzOPWBujC3D3P2PPODBG13GhGBCib7jUZw+yShRX9TFZfqK5/8JvmIY
 Q9fAysRWcGK4QLyVjz9u8ryaERCmVOEyPJXSzbd+3ZARafIcqDvcV2dqniZXDul1xz43
 LQjdek9dXEkDQpvBHd7Ur9Oo/o0EtG2HR0sFPQG850ujw/PavQIQaX7UXDdE6ivpyEku
 Cp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pp7ILrXVpYWERUNp+y3FKEvGmfdJxafp13Cd61iIdo=;
 b=E9awOvUJVCUfRIJuR3bPE0m3PF828WoR5oP5tAZQtE9rjYcVMtvHMukCFDnEsTTvPX
 zRX70Y6JOmmHcNgMKlSCNBaWrQ1TXEDgoTZREpgjXE82E/j5nCdGKZHcYzhkF3htuCPx
 OJP3qcTiYmnQBTT5S040n39QSU3i9E/8RXwz5kYRpa1c4TJiUlGS8dpJ83uS/i/pj06+
 ZATyVjRhCULCrfO0Dc05wXEzThk9bR9TaN5jJIbr9Unm8n66cchvvHeo01SFyube2I2s
 EsCfz3NW0QZwjLOkujUKQCzIRZ+lRLmgCdMWlk7ZGlDx2fGWZj8WviGAaoZnxfQnJ7Tw
 T9+A==
X-Gm-Message-State: AOAM532oLBX5i1FloMiky/60fXnAHHmRVhDl9/M0qt2/1JVKTQAOSVRW
 QtfXkEuavZARl+ALbIqk2nM=
X-Google-Smtp-Source: ABdhPJyPQYzgR72iLGG6L45iOOLTCC87J2wjbMAQqVqpLvOesvLqGUTY8VuELv+F5IyITtz4hTGtcA==
X-Received: by 2002:a17:90a:498b:: with SMTP id
 d11mr5130955pjh.179.1597863589786; 
 Wed, 19 Aug 2020 11:59:49 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id o134sm29149305pfg.200.2020.08.19.11.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 11:59:49 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Thu, 20 Aug 2020 00:26:50 +0530
Message-Id: <20200819185654.151170-9-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
References: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v3 08/12] fbdev: cyber2000fb: use
	generic power management
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

Switch to the new generic framework by updating function signatures and
define a "struct dev_pm_ops" variable to bind PM callbacks. This way we can
remove the legacy .suspend & .resume bindings from "lxfb_driver".

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/cyber2000fb.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 42d37bed518a..d45355b9a58c 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1810,7 +1810,7 @@ static void cyberpro_pci_remove(struct pci_dev *dev)
 	}
 }
 
-static int cyberpro_pci_suspend(struct pci_dev *dev, pm_message_t state)
+static int __maybe_unused cyberpro_pci_suspend(struct device *dev)
 {
 	return 0;
 }
@@ -1818,9 +1818,9 @@ static int cyberpro_pci_suspend(struct pci_dev *dev, pm_message_t state)
 /*
  * Re-initialise the CyberPro hardware
  */
-static int cyberpro_pci_resume(struct pci_dev *dev)
+static int __maybe_unused cyberpro_pci_resume(struct device *dev)
 {
-	struct cfb_info *cfb = pci_get_drvdata(dev);
+	struct cfb_info *cfb = dev_get_drvdata(dev);
 
 	if (cfb) {
 		cyberpro_pci_enable_mmio(cfb);
@@ -1846,12 +1846,15 @@ static struct pci_device_id cyberpro_pci_table[] = {
 
 MODULE_DEVICE_TABLE(pci, cyberpro_pci_table);
 
+static SIMPLE_DEV_PM_OPS(cyberpro_pci_pm_ops,
+			 cyberpro_pci_suspend,
+			 cyberpro_pci_resume);
+
 static struct pci_driver cyberpro_driver = {
 	.name		= "CyberPro",
 	.probe		= cyberpro_pci_probe,
 	.remove		= cyberpro_pci_remove,
-	.suspend	= cyberpro_pci_suspend,
-	.resume		= cyberpro_pci_resume,
+	.driver.pm	= &cyberpro_pci_pm_ops,
 	.id_table	= cyberpro_pci_table
 };
 
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
