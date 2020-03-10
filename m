Return-Path: <SRS0=vND2=43=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB0BC18E5B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Mar 2020 18:17:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9350B21D56
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Mar 2020 18:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0E8HUeA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9350B21D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 69F4587A5A;
	Tue, 10 Mar 2020 18:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iA5dNdUf5rAt; Tue, 10 Mar 2020 18:17:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1442187A2E;
	Tue, 10 Mar 2020 18:17:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2172C07FE;
	Tue, 10 Mar 2020 18:17:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C65DC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 18:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 68FAB87A2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 18:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQs868v+BULw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 18:17:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EDF23879A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 18:17:26 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id y7so771815pjn.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 11:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5tsowySGUi7fWa5LgHfYnviwiJBcMtPtbeyXUuKpjsQ=;
 b=T0E8HUeA7l4gRvbttaZDHmRSVcxZWbwTx8VaRiegZJ1itOZbArzlvs6v8reeDRz1VQ
 NoRxhUI8omLu6iCccuoI6TSyHXu12+JsWLVY3ownjYdKRidQh1PCQikeud7opT/kV0xD
 JCO5tSEbRUHMPdSSYkhz/q7Etd10dLCsXshRfQiEgb6PmabB1iqNWlmgb2R00JWaVq0e
 N8kCvTzv2GFCxY2S3jCHzSZWxpSIUPCAEZAkqUuXPC5NR1LszhMjOnqRzVmTyOCXfZaT
 2Difadbergz4ym4bsqs7hVfDzGokD8JiDaetZoAN4eZo4rqYkdNDWwC68jq/bbouH7ih
 lHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5tsowySGUi7fWa5LgHfYnviwiJBcMtPtbeyXUuKpjsQ=;
 b=ZVKHAJ8PVrIqM1k5S+BZGgLxNZjMLqYB8pYXNNg9rVq48E7VT46vyQdKaFsoPzBsTq
 6q+hwk1cUyzsIg7hdx+iMogeZPea4SX8NQGGE3idfNchA8WSvdD2XgkKqwSrXMi9TnVL
 phmw9rMNrhV6MHJVYJmtcCND8O2YOMJ8CKRgo5fJtFhq265eTtS38c8W03V87dYDF1fO
 djZCF36JQc3MLTbQQQQjk9rPY1Bgcpy6EU4arelRlD/Xca991DHvxpXQH7ZOiMXC1VpD
 siHbZSLjWdC/4qtSPgF35H4RA7Mc5VfDNwFId19z7n1SRwuB4Q+Ip2N2bRQGNv3s/Fsf
 HkVA==
X-Gm-Message-State: ANhLgQ1aBCmI+tvAZF5/xwRGtmtMS4yTXoJ0GVpFltvrB+nvuZ/mOFMi
 6gZv7/r6E7BasQjX3acoRxI=
X-Google-Smtp-Source: ADFU+vt1aV+K5dD0WuYCnprsamxD3MXtNOZ1HsDbCasxtvc8KALg1pF81s2OzocK/4CjJoAiTwRLJw==
X-Received: by 2002:a17:90a:db49:: with SMTP id
 u9mr3002772pjx.175.1583864246484; 
 Tue, 10 Mar 2020 11:17:26 -0700 (PDT)
Received: from localhost.localdomain ([49.128.163.16])
 by smtp.gmail.com with ESMTPSA id l25sm47245630pgn.47.2020.03.10.11.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 11:17:25 -0700 (PDT)
From: Sladyn Nunes <sladynlinuxkernel@gmail.com>
To: gregkh@linuxfoundation.org
Date: Tue, 10 Mar 2020 23:47:12 +0530
Message-Id: <20200310181712.884-1-sladynlinuxkernel@gmail.com>
X-Mailer: git-send-email 2.18.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, rafael@kernel.org
Subject: [Linux-kernel-mentees] [PATCH] drivers: base: platform.c: Fix
	coding style issue.
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

Fixed whitespace and coding style issues in the
document.

Signed-off-by: Sladyn Nunes <sladynlinuxkernel@gmail.com>
---
 drivers/base/platform.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 7fa654f1288b..0da339e14437 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -552,7 +552,8 @@ int platform_device_add(struct platform_device *pdev)
 		if (p) {
 			ret = insert_resource(p, r);
 			if (ret) {
-				dev_err(&pdev->dev, "failed to claim resource %d: %pR\n", i, r);
+				dev_err(&pdev->dev, "failed to claim resource %d: %pR\n",
+						 i, r);
 				goto failed;
 			}
 		}
@@ -573,6 +574,7 @@ int platform_device_add(struct platform_device *pdev)
 
 	while (i--) {
 		struct resource *r = &pdev->resource[i];
+
 		if (r->parent)
 			release_resource(r);
 	}
@@ -604,6 +606,7 @@ void platform_device_del(struct platform_device *pdev)
 
 		for (i = 0; i < pdev->num_resources; i++) {
 			struct resource *r = &pdev->resource[i];
+
 			if (r->parent)
 				release_resource(r);
 		}
@@ -997,7 +1000,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *a,
 	if (len != -ENODEV)
 		return len;
 
-	len = acpi_device_modalias(dev, buf, PAGE_SIZE -1);
+	len = acpi_device_modalias(dev, buf, PAGE_SIZE - 1);
 	if (len != -ENODEV)
 		return len;
 
-- 
2.18.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
