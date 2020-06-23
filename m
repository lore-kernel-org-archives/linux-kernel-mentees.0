Return-Path: <SRS0=UFn2=AE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E70C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Jun 2020 09:50:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C766206C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Jun 2020 09:50:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuBEuDbB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C766206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5234A226AF;
	Tue, 23 Jun 2020 09:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1F2-gILvL4dq; Tue, 23 Jun 2020 09:50:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 68A70204AC;
	Tue, 23 Jun 2020 09:50:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E52CC0890;
	Tue, 23 Jun 2020 09:50:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D68BAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 09:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C56C986C29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 09:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lVzwmhOKFmLt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 09:50:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5080086B57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 09:50:32 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z63so9857400pfb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 02:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jl0lu1/umPSlDnwGccZKV/GaH2q8rWZ4EaouhX1DScY=;
 b=iuBEuDbB1DHqwmV1vge/NENE3R99S9vwOVvQQ3fOdzTYmtKfD5Q9oGKhsbhtoHm2Jn
 hN3HwwaJB9XvOJS6bQlY0IuAPiYK5IjWIYNoxAOpEvHhvxTuTGMacfHdpng2EutbJYDa
 Ow3KeOimDcMBFKiZrxn4BfyXftS9n7Vozd+/z//XYW+IYDm16MDYopweSRVPfdKo8unx
 7hceDHtMxqtxPip7Mmb/Kq6ZPhP+iDNWUPiAyBn1e2cnpFOgYABHaSfcBV6piAY35s/v
 LmHAaRP1z2LULYrczM4+QafxEuRVoSLJFXryYfpaUKWw9WslIlzixR68iunjla7BQA2G
 aoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jl0lu1/umPSlDnwGccZKV/GaH2q8rWZ4EaouhX1DScY=;
 b=YUtJGTIOW0QnOuyf++YaxWPTRUxWso9h5UqzKNFbTBJ9paz+fYyppHoMDlnSwqlXLC
 uxqdhzS5+oJEHhqi+8KSIshd0DSzoQ+oYdGXb/q2A+dL/VwqB3abBdKzB/AtGqwoSFkn
 mTS0a1+oH4DxYzYNkldQGqphkZD3zP8h4dYQh5sV9qSI986pTR4/GYIdAOldomAf9wCP
 Misl6W1x8m9EVv74yxyO6D3wPHCh3rOk3yh3Q+Bxk4tTd5wl6NxLBNSNKmC7xORFKKd1
 8v0At5u3m9UjgecmXQaYik/nqjONYStPOYXn1w1RI9GcYLJOAeXiQ1vceJy0F3iTMeIu
 HMCQ==
X-Gm-Message-State: AOAM531tFk3F2rFoQUMiawuBui9LqxMiJRIDd0esZvncJR5rtBC85F9j
 zo4Jh9txIYqPYXCVFwACqlU=
X-Google-Smtp-Source: ABdhPJzBdJYLuEq00Wou+a0GFVR6oS+94o32Fgj/lybeWbqQ8xQ+4sRLmQ4/0OHOgy/QoYkiZsv4GQ==
X-Received: by 2002:a65:51c1:: with SMTP id i1mr16378293pgq.272.1592905831788; 
 Tue, 23 Jun 2020 02:50:31 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id x17sm1949293pjr.29.2020.06.23.02.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 02:50:31 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Jakub Kicinski <kuba@kernel.org>
Date: Tue, 23 Jun 2020 15:14:55 +0530
Message-Id: <20200623094454.12427-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1] rtl818x_pci: use generic power
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

Earlier, drivers had to manage the device's power states, and related
operations, themselves. With the generic approach, these are done by PCI
core.

The only driver-specific jobs, .suspend() and .resume() doing were invoking
PCI helper functions pci_save/restore_state() and
pci_set_power_state(). This is not recommeneded as PCI core takes care of
that. Hence they became empty-body functions, thus define them NULL.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 .../wireless/realtek/rtl818x/rtl8180/dev.c    | 23 ++++---------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c b/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c
index d5f65372356b..ba3286f732cc 100644
--- a/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c
+++ b/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c
@@ -1966,32 +1966,17 @@ static void rtl8180_remove(struct pci_dev *pdev)
 	ieee80211_free_hw(dev);
 }
 
-#ifdef CONFIG_PM
-static int rtl8180_suspend(struct pci_dev *pdev, pm_message_t state)
-{
-	pci_save_state(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-	return 0;
-}
-
-static int rtl8180_resume(struct pci_dev *pdev)
-{
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	return 0;
-}
+#define rtl8180_suspend NULL
+#define rtl8180_resume NULL
 
-#endif /* CONFIG_PM */
+static SIMPLE_DEV_PM_OPS(rtl8180_pm_ops, rtl8180_suspend, rtl8180_resume);
 
 static struct pci_driver rtl8180_driver = {
 	.name		= KBUILD_MODNAME,
 	.id_table	= rtl8180_table,
 	.probe		= rtl8180_probe,
 	.remove		= rtl8180_remove,
-#ifdef CONFIG_PM
-	.suspend	= rtl8180_suspend,
-	.resume		= rtl8180_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= &rtl8180_pm_ops,
 };
 
 module_pci_driver(rtl8180_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
