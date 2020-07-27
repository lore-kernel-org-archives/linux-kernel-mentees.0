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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EF2C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 17:32:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9263020729
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 17:32:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHs7NZnj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9263020729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 66DE4875B7;
	Mon, 27 Jul 2020 17:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hadpuDj6CZCn; Mon, 27 Jul 2020 17:32:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A2DCA874DA;
	Mon, 27 Jul 2020 17:32:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DD15C0050;
	Mon, 27 Jul 2020 17:32:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9271EC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 17:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7F66686265
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 17:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVztf0uKkV6T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 17:32:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0791186207
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 17:32:47 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id o13so10188157pgf.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 10:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y/oiTZvRbIGlVilYBQAce6xZVdmLxNzc+uCZkzk1V9g=;
 b=FHs7NZnjm1y+Y0yUChIknkWpkRZeJSCPECasUc1GMHAAX0gQC7gJAuExKfTQg7YxK1
 RUEDwI/yoCS6n/MAz2kzUyR1GEi8teb8fBWPR71NfQOMldeVOEruRq8ehJwY9KQsapzX
 VttbXvWYZpzHEXv3/AsCgnykZlqIkofJxNQRSl86UnfHYfHfCRpGD7QfBdOkCbCuc5/u
 +tODKkcQ1dt1Q9MPe6D5gxWZL+sf27Y1rKDqNS/HwIDAbmf/aVM8qctgzobo3bNaN9Pq
 DXAgXHVNMFUpmOkmRAZio1bmexKAlAfRo2vsRAcg5LU52jLv2Lri37SJq3juqcItZTqY
 /xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y/oiTZvRbIGlVilYBQAce6xZVdmLxNzc+uCZkzk1V9g=;
 b=RxcRi6m8x6iWDf698PavGztu77IIVRwiFVnYa5Jl43kKueFPl1xafBjpxK26V8wndC
 jXUh0UmQDad6s3F0WR5JScHmCCzUSGcbv4vKqLokJL8wuMB6jW7fY8Rt/oZ4hSEU8z5C
 UH7Y2KWFaewI6k4jO0/A4E7RnamgfD4fz25vRRGKEtjuT9VIib2gHJ4I/aCZx8WW4tNu
 G/5REUipd4+ZAj5/OyP/8kvVZ3m7NsrN8mZlhQsp8pMtfwuJptVsfGWKGMgwpQDbVruJ
 yDxk56RdHV8ga1NBDt7FG5/YvsyBtBQTV0aV3eKHO/LlaaYb86YvoqoO88EvvlRUL6Od
 sahA==
X-Gm-Message-State: AOAM532ubqANVD4m58mAFjTvnNK/jPyYwtxY8ZCz4Efd021wqkxg3S6+
 bAYMaVbPvBg75OAiQyIY1/M=
X-Google-Smtp-Source: ABdhPJyCn9FDNTlrAkhDjbasGUiicJEpzPdljaTQslwjMY8oofLHLGd1j2EDiVq6xsMqKuOfd5dCeA==
X-Received: by 2002:a65:620e:: with SMTP id d14mr20414491pgv.360.1595871166544; 
 Mon, 27 Jul 2020 10:32:46 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id x66sm15427782pgb.12.2020.07.27.10.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 10:32:45 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Mon, 27 Jul 2020 22:59:37 +0530
Message-Id: <20200727172936.661567-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CAHp75VfmKvAy6bSk70g3c2qJcUzzo0AUhzxR6dFja+ZppGMLRg@mail.gmail.com>
References: <CAHp75VfmKvAy6bSk70g3c2qJcUzzo0AUhzxR6dFja+ZppGMLRg@mail.gmail.com>
MIME-Version: 1.0
Cc: linux-spi@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3] spi: spi-topcliff-pch: drop call
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

Fixes: f185bcc77980 ("spi: spi-topcliff-pch: use generic power management")
Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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
