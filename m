Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4E8C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 03:53:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B98A20702
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 03:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u2R2A9TN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B98A20702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EFA94890C7;
	Mon, 29 Jun 2020 03:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mbbajApVyX4v; Mon, 29 Jun 2020 03:52:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 694AA890BF;
	Mon, 29 Jun 2020 03:52:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FC8CC07FF;
	Mon, 29 Jun 2020 03:52:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83D70C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 03:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 613CA221C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 03:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S+kp3aR0YJca
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 03:52:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id D222220450
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 03:52:57 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id a127so7295822pfa.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Jun 2020 20:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mMGxHvmMYl6KmBYcQsFExMxRkPUqi7/TV9d4rzWRr7k=;
 b=u2R2A9TNTrjVPaCWT+EtNeCfx976UM0/uvyxC3814IxJ3BmtNIBpFQ0ICCey/EcQGc
 C2eS5fpQk4UcCXH1AL8vjaVjN962La5SVUBbXE9DUXpkS2EulFeP7MKv0QrS30LgmQyA
 cQ2YIx5Dt2G8V0SVUKirabbIOS+ctzsLxrqbXTTe6FbjXEnT9K169K/WjAZx+6ZX270m
 k++SJlX43a5xXxXOD4YsBZgNqOf3YZSfrFwcvunodSnyOzYfknDpa3lYOFOoZY8PdBi8
 RgNZnFHUk+mC3uA38MgCHbsb3oJAcFv/T6tdXFqj0DgTQqEKKIGlhuti9b9huZHg99il
 aDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mMGxHvmMYl6KmBYcQsFExMxRkPUqi7/TV9d4rzWRr7k=;
 b=gj6duRtwWgx5EXgcwYqY75hs6PDPogSYFxmoggCNQgjgKMNTvj88V1M42BzShFEkGX
 XCERNzZodgQjithHdse1QAd59e07SPJwsY/wAFU8wJnjXrE6JAWO3DZiuPATuv4KPNhc
 O3e92y0KvHTyOoOMI07z7ulEYDdN/PGABOmn+WxqgyHFEhoB9nsHNQySntBopeyLfvpZ
 yE6kHP0WxmYcTcK0FHfbxF1CYWyH1IlU4oFz2a6Z5UvrZlLfAHMVqqtL5gZpk8TF7cR4
 aGtbwfPqd2RhDzPClqfmlEV4Kb71SpfOoVsnlY/dcCDLkWcGyRYxDa02zahhMxtj+BrE
 eMdg==
X-Gm-Message-State: AOAM532iS9k+58Gv26bfwu+yJE5BQLlB7NkPPF0Z7tz5MvcHPLOw1K4L
 MYyDSTp5+c3gHKI4/i1WnBQ=
X-Google-Smtp-Source: ABdhPJydbdI8co0v0o/sBZ2cRFoABhFdoGlHqU5hKHlqf4wT6H8b7R/olOtLPlXq7tzCb6hpIsCqjw==
X-Received: by 2002:a62:1716:: with SMTP id 22mr12030455pfx.99.1593402777406; 
 Sun, 28 Jun 2020 20:52:57 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id b191sm28757684pga.13.2020.06.28.20.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:52:56 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Mon, 29 Jun 2020 09:20:32 +0530
Message-Id: <20200629035031.169670-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1] adm8211: use generic power
	management
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

In the case of adm8211, after removing PCI helper functions, .suspend()
and .resume() became empty-body functions. Hence, define them NULL and
use dev_pm_ops.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/wireless/admtek/adm8211.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/admtek/adm8211.c b/drivers/net/wireless/admtek/adm8211.c
index ba326f6c1214..22f9f2f8af10 100644
--- a/drivers/net/wireless/admtek/adm8211.c
+++ b/drivers/net/wireless/admtek/adm8211.c
@@ -1976,35 +1976,20 @@ static void adm8211_remove(struct pci_dev *pdev)
 }
 
 
-#ifdef CONFIG_PM
-static int adm8211_suspend(struct pci_dev *pdev, pm_message_t state)
-{
-	pci_save_state(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-	return 0;
-}
-
-static int adm8211_resume(struct pci_dev *pdev)
-{
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	return 0;
-}
-#endif /* CONFIG_PM */
-
+#define adm8211_suspend NULL
+#define adm8211_resume NULL
 
 MODULE_DEVICE_TABLE(pci, adm8211_pci_id_table);
 
+static SIMPLE_DEV_PM_OPS(adm8211_pm_ops, adm8211_suspend, adm8211_resume);
+
 /* TODO: implement enable_wake */
 static struct pci_driver adm8211_driver = {
 	.name		= "adm8211",
 	.id_table	= adm8211_pci_id_table,
 	.probe		= adm8211_probe,
 	.remove		= adm8211_remove,
-#ifdef CONFIG_PM
-	.suspend	= adm8211_suspend,
-	.resume		= adm8211_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= &adm8211_pm_ops,
 };
 
 module_pci_driver(adm8211_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
