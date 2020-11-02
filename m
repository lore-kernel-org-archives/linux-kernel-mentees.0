Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055BAC00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:53:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1A2622258
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:53:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="To8S2jHL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1A2622258
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6BC8B872B0;
	Mon,  2 Nov 2020 16:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZv7LwDs-t5l; Mon,  2 Nov 2020 16:53:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D2C35872A3;
	Mon,  2 Nov 2020 16:53:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDC93C088B;
	Mon,  2 Nov 2020 16:53:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8C61C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C4C9686AB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uy9ZKPoe46QJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:53:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5360286A95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:53:08 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id a200so11592948pfa.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 08:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6EF8lQwOXO2Z8DiQbYXGCQ2159bXf7Ji78BoyHo/jeA=;
 b=To8S2jHLUsT+F/DtIpwDe+1nsQoZHhatxgqGT8Sxc9KuSJcRM3S8ryS3lDtBN5YMeC
 eShZMSTpM3aCVSG4nLzekO+XOUtDj7y1FgYmyOoflsoop1hjOytHUrxV2RaxdVt1uR2K
 MsYuRH9Cm4h6i8pQu10lgzPWUt+Es7x0imUyp5peUkZWoz88nNq3tKjWLVQXyeoy5Ul/
 z5pEcBNh47ZPnd7Kj8KAiwpTLOhaDKBFsZhXe+elVgnjgD1CuacyLxDuhKvU82nUQZGn
 tVYMZUv2X+pju79d8atKoU76RgvzTZQ64FLTcnhEqHIhg+OcbKdWCbaUTKMj13OhJ0Ia
 oasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6EF8lQwOXO2Z8DiQbYXGCQ2159bXf7Ji78BoyHo/jeA=;
 b=EoPbF/TwQo8+A4bO1ahvDEY62j2dkykhTD06m822R3Jw2EboWT9w8mSUr28jlRw0yW
 444NApFB8vdHedkkyk1vUfelJkm9hYo5bLoND5p5rpJS+8H/xW8MGwrR24NL5yLf3zBk
 GbyPxpQ+oksgBqU1vRKI02S8BmU4GybW7kKhc5pyG5xLKAP1P8i8p4CAKl5FSdMtfqOq
 8J7Xn/uPdFusrs/klf33nGcsNGfkT6iPLcnj2KCpFJmdAQNsgzN1ptEuFswvUwRTY5Lk
 r1R7j3vv7KNwwGpRoLMH9gXig3cEovNvdl+mNxQ3EvRTW/ZebdjvIujBE/CKnZklMYgj
 BN+w==
X-Gm-Message-State: AOAM5304TByRLEtKOCfTj0ME6FTtbcCTyBQLEtPLi+gFaCNst/SoP/RB
 HE+UcFIvkD8UAJWdNsYpb+4=
X-Google-Smtp-Source: ABdhPJw+WZ503yKFquawRt0K3fv1VZ0392lfMRA03Pm+y/b3nAXy5mhWcTDXFlgVjXkApI1klFFsZw==
X-Received: by 2002:a65:6819:: with SMTP id l25mr14077553pgt.111.1604335987979; 
 Mon, 02 Nov 2020 08:53:07 -0800 (PST)
Received: from varodek.localdomain ([223.179.149.110])
 by smtp.gmail.com with ESMTPSA id t74sm4953233pfc.47.2020.11.02.08.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 08:53:07 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Adam Radford <aradford@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 Hannes Reinecke <hare@suse.com>, Bradley Grove <linuxdrivers@attotech.com>,
 John Garry <john.garry@huawei.com>, Don Brace <don.brace@microsemi.com>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 Balsundar P <balsundar.p@microchip.com>
Date: Mon,  2 Nov 2020 22:17:15 +0530
Message-Id: <20201102164730.324035-15-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
References: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v4 14/29] scsi: hisi_sas_v3_hw:
	Remove extra function calls for runtime pm
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

Both runtime_suspend_v3_hw() and runtime_resume_v3_hw() do nothing else but
invoke suspend_v3_hw() and resume_v3_hw() respectively. This is the case of
unnecessary function calls. To use those functions for runtime pm as well,
simply use UNIVERSAL_DEV_PM_OPS.

make -j$(nproc) W=1, with CONFIG_PM disabled, throws '-Wunused-function'
warning for runtime_suspend_v3_hw() and runtime_resume_v3_hw(). After
dropping those function definitions, the warning was thrown for
suspend_v3_hw() and resume_v3_hw(). Hence, mark them as '__maybe_unused'.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
index dfeb86c865d3..9f0b4fe564cc 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
@@ -3502,7 +3502,7 @@ static int _resume_v3_hw(struct device *device)
 	return 0;
 }
 
-static int suspend_v3_hw(struct device *device)
+static int __maybe_unused suspend_v3_hw(struct device *device)
 {
 	struct pci_dev *pdev = to_pci_dev(device);
 	struct sas_ha_struct *sha = pci_get_drvdata(pdev);
@@ -3518,7 +3518,7 @@ static int suspend_v3_hw(struct device *device)
 	return rc;
 }
 
-static int resume_v3_hw(struct device *device)
+static int __maybe_unused resume_v3_hw(struct device *device)
 {
 	struct pci_dev *pdev = to_pci_dev(device);
 	struct sas_ha_struct *sha = pci_get_drvdata(pdev);
@@ -3541,21 +3541,10 @@ static const struct pci_error_handlers hisi_sas_err_handler = {
 	.reset_done	= hisi_sas_reset_done_v3_hw,
 };
 
-static int runtime_suspend_v3_hw(struct device *dev)
-{
-	return suspend_v3_hw(dev);
-}
-
-static int runtime_resume_v3_hw(struct device *dev)
-{
-	return resume_v3_hw(dev);
-}
-
-static const struct dev_pm_ops hisi_sas_v3_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(suspend_v3_hw, resume_v3_hw)
-	SET_RUNTIME_PM_OPS(runtime_suspend_v3_hw,
-			   runtime_resume_v3_hw, NULL)
-};
+static UNIVERSAL_DEV_PM_OPS(hisi_sas_v3_pm_ops,
+			    suspend_v3_hw,
+			    resume_v3_hw,
+			    NULL);
 
 static struct pci_driver sas_v3_pci_driver = {
 	.name		= DRV_NAME,
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
