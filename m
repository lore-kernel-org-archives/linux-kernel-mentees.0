Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95219C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 13:21:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65DA62074F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 13:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IO7Asnw1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65DA62074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 36082204A4;
	Mon, 27 Jul 2020 13:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2W53KSMfsRl; Mon, 27 Jul 2020 13:21:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DBAF920493;
	Mon, 27 Jul 2020 13:21:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0763C0050;
	Mon, 27 Jul 2020 13:21:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4031BC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2DAFE20481
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:21:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCaJ3oKteAex
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:21:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id C6F17204C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:21:05 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id g67so9502460pgc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 06:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lCrFxpLw5jwB0ZWba+VhbgCI7p4GpK2jg/E4s1AB/yM=;
 b=IO7Asnw1x5jaHrPrBYcTWUlGNNMyYH8tet7FkILH4HmzUn9u+meMUVh7296Xg4Rcrw
 26mjFiFrtobGZP6/JQgzxcGK4uQo2Ig3wmk7+u7qj0oChgvGHJ5G9KhIY810qGt9ivDU
 ecmte3moVCfdGcTryICQuGadpX09WZv7fo/TBHNX0iVyai2I1ajQfLVDjDziQuCVg66d
 Op9jGMYmfwrIRYRcsmdDWYl1LEML4CLEJmejHa22x3gGRBecWBIPddPw5Uv7QAQUHlzf
 sAX2Uzq+xrcpElEoZ7YiGfd1t7G8ipJ6UnABh/A6XbzkyEMxuz72nuyz0qykT0qrGyq2
 K9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lCrFxpLw5jwB0ZWba+VhbgCI7p4GpK2jg/E4s1AB/yM=;
 b=meIdFNork8HMl40Hda7gmDaD8Y6HjwOELSPghiF2+X8mmd3czIaYDQfoHmpYm+/G9f
 QoWINm5ugaxTiEre6J9nHNrU9K8Hq5sz5tSDyS79dazuLkJadAkokLQXKg+zr7gwBQ30
 g796L4l7r78QnP1jUlNSZQccZ3/nWhs4D9W8Tju/UDyV3mugZ+ItqfuRnzRL35nCfXK8
 S9Uf7kNE5dpk4b9XdFfrs/7jaLpDhv1jSYaA7plZjac1hwNDq5xh4fXaNCfNI2KKv0m+
 ToRjcRLszlpKclE+0UTmTIFz4MKWb27SQBhRaQVfiDSUIdTgBU6JYUIauMmRVcyFbPk1
 Cvow==
X-Gm-Message-State: AOAM530X7P0KBxxjo09K+JznqyTjI/L+KbHdPLyddGkVA0HavbQESOhV
 c4lybrnjyCmn1e9gai8uq8o=
X-Google-Smtp-Source: ABdhPJxRloIPWLVUZ2/SuwNrfH74RWEzbhOzbwrdKU/RikSvAOSrIk2YgZzbcFwz0HqrECq6wOxFhQ==
X-Received: by 2002:a63:5a20:: with SMTP id o32mr20002948pgb.15.1595856064511; 
 Mon, 27 Jul 2020 06:21:04 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id my16sm12206087pjb.43.2020.07.27.06.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 06:21:03 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Mon, 27 Jul 2020 18:47:43 +0530
Message-Id: <20200727131742.82289-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CAHp75Vdo22ofbCktupFYbfYy6PQ609fsk5B6u2b3FpfKxs8OQg@mail.gmail.com>
References: <CAHp75Vdo22ofbCktupFYbfYy6PQ609fsk5B6u2b3FpfKxs8OQg@mail.gmail.com>
MIME-Version: 1.0
Cc: linux-spi@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2] spi: spi-topcliff-pch: drop call
	to wakeup-disable
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

Before generic upgrade, both .suspend() and .resume() were invoking
pci_enable_wake(pci_dev, PCI_D3hot, 0). Hence, disabling wakeup in both
states. (Normal trend is .suspend() enables and .resume() disables the
wakeup.)

This was ambiguous and may be buggy. Instead of replicating the legacy
behavior, drop the wakeup-disable call.

Fix: f185bcc77980("spi: spi-topcliff-pch: use generic power management")
Reported by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/spi/spi-topcliff-pch.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pch.c
index 281a90f1b5d8..c73a03ddf5f3 100644
--- a/drivers/spi/spi-topcliff-pch.c
+++ b/drivers/spi/spi-topcliff-pch.c
@@ -1648,8 +1648,6 @@ static int __maybe_unused pch_spi_resume(struct device *dev)
 
 	dev_dbg(dev, "%s ENTRY\n", __func__);
 
-	device_wakeup_disable(dev);
-
 	/* set suspend status to false */
 	pd_dev_save->board_dat->suspend_sts = false;
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
