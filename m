Return-Path: <SRS0=keMi=AS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E78C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 07:43:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F7152073E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 07:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAsb8bSZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F7152073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EF9CD893BD;
	Tue,  7 Jul 2020 07:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Cf08tWc3Ekm; Tue,  7 Jul 2020 07:43:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9426E88A4E;
	Tue,  7 Jul 2020 07:43:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7AE01C0893;
	Tue,  7 Jul 2020 07:43:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 014CAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 07:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DFBF788A4E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 07:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cOo+2964EJ4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 07:43:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7082488A43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 07:43:53 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q17so18064772pfu.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jul 2020 00:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oqg0waFV1lp8h1+Iq31KyC6DKlnZLj0Pwy1UxBj6Ho8=;
 b=DAsb8bSZtj79L46P+civ1l7WY7x77+BCU4mrZLoBfLIpXtNgH1HY/lGwcKX2o3IbLD
 5YRotXnwFtE0/TLB7mK53OSZivzhuVYrhazRzq+ZZ6HVXVsn2BmZBf8z8/XZ+m2Uh8ev
 bBcfzjmSV01aIEj+gdxVZvQ48Qx50LPHGWxHhGlnK2wC7rrJAiUw3wfAAm1GYV1VrnTs
 RTPqS5j1+9Cxw44HyDO6ExYYCPzmdqCqvIj+0AZGi/cL34fB+11+/LIPWONa2K4EA4/q
 19V0Al4aVIL718Dqf1AvU/RGpCkCwOrFh29Egcac8Nn27l613DujT9givcMQe+j6yewv
 dCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oqg0waFV1lp8h1+Iq31KyC6DKlnZLj0Pwy1UxBj6Ho8=;
 b=MW0o042AWRfut5+RdcxHFjOzoYEkkSt9UY7wxcDrZ7c4OMW+J8dmWZ/T6abubGG1f+
 6XorYQvkRBn6uO8tGs91NSPNKjq+e5NLh6Kr/RTNguZjUsOjyev9lhU4ucuSWx2v1iTv
 lQ8MV+T6TW9I31r7swerShfTbhan/HiTQqTtzg7xcWdMCly+1mKIWVsOmajXqZHA9KwY
 Kw2cyA2muoJFcWldtxXTzI4rjdTzibi+NaCfAWZiXfQwiNSEoWWePbwOZYHcUpRq9Qb2
 P3Ou3bSwJ2asBidywBw+MpEaNDK5pvgfKsITZiVzqke32PS4V/V2cZHl6VVMnvCj2vU/
 ZzQg==
X-Gm-Message-State: AOAM532RDlfowMM88eVdxVYFPDuMEAslmRTlVehfKru4qlgrj6oqM30W
 nbwNIxAWhoo5zIs5k1WOeds=
X-Google-Smtp-Source: ABdhPJyZxivWa3Zwd3TiXVj2C5Co1Tk0OgrJzdk8Va7YqEXPvY+3BH4n2OB5Ix08Z3T1moPGNugPhA==
X-Received: by 2002:a62:fb06:: with SMTP id x6mr48186275pfm.28.1594107832958; 
 Tue, 07 Jul 2020 00:43:52 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id s30sm21439248pgn.34.2020.07.07.00.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 00:43:52 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue,  7 Jul 2020 13:11:22 +0530
Message-Id: <20200707074121.230686-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH net-next] sun/niu: add __maybe_unused
	attribute to PM functions
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

The upgraded .suspend() and .resume() throw
"defined but not used [-Wunused-function]" warning for certain
configurations.

Mark them with "__maybe_unused" attribute.

Compile-tested only.

Fixes: b0db0cc2f695 ("sun/niu: use generic power management")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/sun/niu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index 68541c823245..b4e20d15d138 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -9873,7 +9873,7 @@ static void niu_pci_remove_one(struct pci_dev *pdev)
 	}
 }
 
-static int niu_suspend(struct device *dev_d)
+static int __maybe_unused niu_suspend(struct device *dev_d)
 {
 	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct niu *np = netdev_priv(dev);
@@ -9900,7 +9900,7 @@ static int niu_suspend(struct device *dev_d)
 	return 0;
 }
 
-static int niu_resume(struct device *dev_d)
+static int __maybe_unused niu_resume(struct device *dev_d)
 {
 	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct niu *np = netdev_priv(dev);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
