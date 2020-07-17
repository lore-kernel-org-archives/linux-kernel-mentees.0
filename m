Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9030C433EB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 08:10:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE61420737
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 08:10:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmHO/eZD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE61420737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 918C3881EC;
	Fri, 17 Jul 2020 08:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1r+hw7Wncy4e; Fri, 17 Jul 2020 08:10:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1070B87D9E;
	Fri, 17 Jul 2020 08:10:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F34AFC07FF;
	Fri, 17 Jul 2020 08:10:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC2DFC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 08:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9B903881EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 08:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PSev+axSx5aq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 08:10:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 12D9C87D9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 08:10:42 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id k5so6019278pjg.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iRMBvN5jV5opfKEhcuX/0MlxIGyzv8/E8aHaaJydPsI=;
 b=HmHO/eZDd0+8PW70sN9QzeabUtqpZZrvu2RYNEtW25g5QZ7/HT9+hDxQ2gBLm1aJyU
 ZBZbKlKA8GBPsSdf6GMHnzCdMUJsPij6/lKPox6+Te3Sj7pSAbZTB6H+TcWqhR7Dpj5M
 H90j9eVITqNucGzIk1rsKC7znL3hTG9PeNbXhlX4YkybdM6SOGRGhi0wtCsJV1e3qWjz
 vSo+/ATEK276kyKxNtFkuLmfukJvVRPBd58R11Jrj3xy/W2xp5ky366Hbbsf2J7RuKB5
 MKWtbvW3joAr3FoQP1GQjv+HWo5RmQzE3pAVHSy05PkBEdMSDY1cGlsq0neqWpF9axLQ
 0veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iRMBvN5jV5opfKEhcuX/0MlxIGyzv8/E8aHaaJydPsI=;
 b=Hk+ySTxqjg6D6ElyW3xQyxGuBBsrcFAcJbuxPHZUfFoN050WSDoxBS2vUYPx7PV9cn
 idGUZN2KqcWEjGkOzEtgUZMphunengScYTbUkxZX4p+7yUQKXtFAJCKsYWCZsBTFCDwc
 Rx/8Okf/TAFjZF6Wxy+Mbdu4Ze9PR1HfbbNLiBIxikFBFXTbn2NDovkWgIynjkV8oh4i
 eSc9Rrv/2bug5g+DS3LPP3ePX58NCoraB3SzjrDAB0kWX/k/6YIkwXiS7de2hJsNOa+W
 ONK7bqzlMkm1kQYkVQw1RpXdE0dNYc/a2Xkv3zr27SZvKdEqqCGJMs2TcxVo4RQ3rwnZ
 fucQ==
X-Gm-Message-State: AOAM530oiBwvyPe4z4n8SyIa/Tx8RXi5uLkzhhphAC8Bd0b725+LyQcr
 kk5Aoon8/B1ioA/6usfJJOo=
X-Google-Smtp-Source: ABdhPJyE8L2iwEKxWiGnIhifYEnsfEu0RpKl7X3WakdF5Pv/dp2KCSwf8f471+NnlYLcej7ngyRL8Q==
X-Received: by 2002:a17:90a:4b0d:: with SMTP id
 g13mr908667pjh.200.1594973441663; 
 Fri, 17 Jul 2020 01:10:41 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id d5sm1937296pju.15.2020.07.17.01.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 01:10:41 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Fri, 17 Jul 2020 13:39:09 +0530
Message-Id: <20200717080910.342741-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717080910.342741-1-vaibhavgupta40@gmail.com>
References: <20200717080910.342741-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 2/3] rsxx: use generic power
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

Drivers using legacy PM have to manage PCI states and device's PM states
themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of
above mentioned, device-independent, jobs.

This driver has not defined .resume(), hence define it as NULL.

Change function parameter in both .suspend() to "struct device*" type and
mark the parameter as "__attribute__((unused)) " as the function body is
empty.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/block/rsxx/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
index 10f6368117d8..866153fd380a 100644
--- a/drivers/block/rsxx/core.c
+++ b/drivers/block/rsxx/core.c
@@ -1030,12 +1030,15 @@ static void rsxx_pci_remove(struct pci_dev *dev)
 	kfree(card);
 }
 
-static int rsxx_pci_suspend(struct pci_dev *dev, pm_message_t state)
+static int __maybe_unused rsxx_pci_suspend(
+	__attribute__((unused)) struct device *dev)
 {
 	/* We don't support suspend at this time. */
 	return -ENOSYS;
 }
 
+#define rsxx_pci_resume NULL
+
 static void rsxx_pci_shutdown(struct pci_dev *dev)
 {
 	struct rsxx_cardinfo *card = pci_get_drvdata(dev);
@@ -1071,12 +1074,14 @@ static const struct pci_device_id rsxx_pci_ids[] = {
 
 MODULE_DEVICE_TABLE(pci, rsxx_pci_ids);
 
+static SIMPLE_DEV_PM_OPS(rsxx_pci_pm_ops, rsxx_pci_suspend, rsxx_pci_resume);
+
 static struct pci_driver rsxx_pci_driver = {
 	.name		= DRIVER_NAME,
 	.id_table	= rsxx_pci_ids,
 	.probe		= rsxx_pci_probe,
 	.remove		= rsxx_pci_remove,
-	.suspend	= rsxx_pci_suspend,
+	.driver.pm	= &rsxx_pci_pm_ops,
 	.shutdown	= rsxx_pci_shutdown,
 	.err_handler    = &rsxx_err_handler,
 };
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
