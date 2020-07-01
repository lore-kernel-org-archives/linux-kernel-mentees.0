Return-Path: <SRS0=WnLp=AM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79F6C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:02:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC45D20760
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdMhGiBH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC45D20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7193B2FDA8;
	Wed,  1 Jul 2020 13:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzOGuCGlR9yI; Wed,  1 Jul 2020 13:02:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 10DB52FCAA;
	Wed,  1 Jul 2020 13:02:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2745C0865;
	Wed,  1 Jul 2020 13:02:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6928C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D417189395
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dv041CHCZ2bx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BDC518938A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:40 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id j4so9896256plk.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZlRjk8zT4O+JvT0opsFaP8uu4DQA96Rwf9GDzwtwPpA=;
 b=VdMhGiBHDnabiz1ww0We+D9xZ9YmY5AgbsQKaGxp9X4Hm+abCnEeOrBoKe9mrC6FqR
 fd37KpKkysUAQZKj0HvlRzy/TKTaWWRJdNeU+gmE003f0d2NX0eeXVLmhdIS+1TBWYEG
 GCXU4tkesPB14EFk24cDw5pNcAjFXBb1+c7BIwnOiOvATlEljHlIUHHOhV11o3gbITdf
 8/Xn6tZuC5M9hXWrg/4XdKc4tgeEMJCKJonU236n/rFn5A+fPS4xogqADs63+ml2Wgx5
 8suHPkakVKL2fM3/0Y7sl1tqUE/T2gYYWyw4FexMnIbajICuyWfnAKEwc1EAP455rKsc
 3YNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZlRjk8zT4O+JvT0opsFaP8uu4DQA96Rwf9GDzwtwPpA=;
 b=jeg2npgJUd8Q8wmEpVYRE3ah0O8XoV1MvEgq2fKdsInXQYw21qKoadqdaHqpSQTqWE
 J/AblNEAfHgErz4/K6l4sOdLN/9O24jqBG00fhEwnnEs2Q5J9JSQ0JbXYhdi76KQSzL1
 knGT9h9oMUvo9AVbIV8E8rQnhzMzrckglMmmFxsZR4wnr9Zb/Bbihv8ivchuG/eGj7xG
 2FU+/raIkz6rwNlEL7UmLMlOwyY7JOa1lY7uQ5cUYVvjRuM1VQAgIlP8ceM96Stq7kX7
 7JN+AfZpFEGrFu7DL6SIPFaJLcMpz0/LoYwrwFz0MZE4dh5wT9gbQop6XPYYYLRPdgBi
 OCEg==
X-Gm-Message-State: AOAM533aQQImQLDQns1B3z9nziEAjCoo/VCszs4q1pX0GDNc3pgZfX9O
 OC4SbwIGZrl2C2Ij2s/bYbY=
X-Google-Smtp-Source: ABdhPJyW6WI+g29dTNawJ1+miqNXQEfKV65sxS6eTTaCmhAfO21hyaIO5yGGqu9+kNECK2Glk9Y4ZQ==
X-Received: by 2002:a17:90a:9b82:: with SMTP id
 g2mr26144757pjp.187.1593608560269; 
 Wed, 01 Jul 2020 06:02:40 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id d9sm6070908pgv.45.2020.07.01.06.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 06:02:39 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 David Dillow <dave@thedillows.org>, Ion Badulescu <ionut@badula.org>,
 Netanel Belgazal <netanel@amazon.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Guy Tzalik <gtzalik@amazon.com>,
 Saeed Bishara <saeedb@amazon.com>, Zorik Machulsky <zorik@amazon.com>,
 Derek Chickles <dchickles@marvell.com>,
 Satanand Burla <sburla@marvell.com>,
 Felix Manlunas <fmanlunas@marvell.com>,
 Denis Kirjanov <kda@linux-powerpc.org>,
 Ajit Khaparde <ajit.khaparde@broadcom.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 Somnath Kotur <somnath.kotur@broadcom.com>,
 Tariq Toukan <tariqt@mellanox.com>, Jon Mason <jdmason@kudzu.us>
Date: Wed,  1 Jul 2020 18:29:32 +0530
Message-Id: <20200701125938.639447-6-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
References: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 05/11] liquidio: use generic power
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

Drivers should not use legacy power management as they have to manage power
states and related operations, for the device, themselves. This driver was
handling them with the help of PCI helper functions.

With generic PM, all essentials will be handled by the PCI core. Driver
needs to do only device-specific operations.

The driver defined empty-body .suspend() and .resume() callbacks earlier.
They can now be define NULL and bind with "struct dev_pm_ops" variable.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 .../net/ethernet/cavium/liquidio/lio_main.c   | 31 +++----------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_main.c b/drivers/net/ethernet/cavium/liquidio/lio_main.c
index 66d31c018c7e..19689d72bc4e 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_main.c
@@ -405,27 +405,8 @@ static void liquidio_pcie_resume(struct pci_dev *pdev __attribute__((unused)))
 	/* Nothing to be done here. */
 }
 
-#ifdef CONFIG_PM
-/**
- * \brief called when suspending
- * @param pdev Pointer to PCI device
- * @param state state to suspend to
- */
-static int liquidio_suspend(struct pci_dev *pdev __attribute__((unused)),
-			    pm_message_t state __attribute__((unused)))
-{
-	return 0;
-}
-
-/**
- * \brief called when resuming
- * @param pdev Pointer to PCI device
- */
-static int liquidio_resume(struct pci_dev *pdev __attribute__((unused)))
-{
-	return 0;
-}
-#endif
+#define liquidio_suspend NULL
+#define liquidio_resume NULL
 
 /* For PCI-E Advanced Error Recovery (AER) Interface */
 static const struct pci_error_handlers liquidio_err_handler = {
@@ -451,17 +432,15 @@ static const struct pci_device_id liquidio_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, liquidio_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(liquidio_pm_ops, liquidio_suspend, liquidio_resume);
+
 static struct pci_driver liquidio_pci_driver = {
 	.name		= "LiquidIO",
 	.id_table	= liquidio_pci_tbl,
 	.probe		= liquidio_probe,
 	.remove		= liquidio_remove,
 	.err_handler	= &liquidio_err_handler,    /* For AER */
-
-#ifdef CONFIG_PM
-	.suspend	= liquidio_suspend,
-	.resume		= liquidio_resume,
-#endif
+	.driver.pm	= &liquidio_pm_ops,
 #ifdef CONFIG_PCI_IOV
 	.sriov_configure = liquidio_enable_sriov,
 #endif
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
