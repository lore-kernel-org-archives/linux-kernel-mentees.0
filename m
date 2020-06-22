Return-Path: <SRS0=5DCt=AD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C13C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:44:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 913EA20732
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:44:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTA7ISWL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 913EA20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5DA8C862BC;
	Mon, 22 Jun 2020 11:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tpCEBrfR1Uc2; Mon, 22 Jun 2020 11:44:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F198C862AB;
	Mon, 22 Jun 2020 11:44:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8C68C0891;
	Mon, 22 Jun 2020 11:44:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D70FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 36F7E203E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tey8LRq8WNig
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 1EB68203DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:04 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b5so8287342pfp.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 04:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZPn01r6wkXnMIHGh/thIPTlSxs28rdWp4NIXuzwx0oQ=;
 b=FTA7ISWLI4A9wg3ouOgx4YNdJh6le0da9LW3IxYp8AUgvV84ghq39qDPNlErkkjgkS
 6n7yR++UXq0RhCO0bGYxDcWQroLp4MJjinLXikt6ktxSaHE/xdx5pw/9+UsYUCPzzmFX
 T6OMMHt1MG63b9lVgOhZOhTtk32Q5L9/wy1Exz6sY/Qyatk2ZF19UdaVS/buFpsSwc7k
 aXe2ikHii5w35iVohD4NaSMTeNPAlrs8BVKDEu9exIIN8KCozhA/23oWq/xoD8NMLQ84
 3IeJMkoPknDdeGaM0E04h/LLzw9sYnbt7+O7iONBdNFqdMti8nPM0+NtuJlulUrRX1sM
 vGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZPn01r6wkXnMIHGh/thIPTlSxs28rdWp4NIXuzwx0oQ=;
 b=rzpqihooVzl5IiGL6Zv4c3QFk/L7JHz0dtib8y7Iy11jMm/VgMSQcp2u1in9GbVVO4
 HGfqxIF+Y2rwcfDsit+s3tDUYrum+AIjh7DvGXcu/sBR8R5DQX+UfiAY+Lr3VxouM4sg
 uqRwEoSuMrmejLmbEPna4WOSJVlJIz4Cbe4AYzu0rpOHdWbO3Mvcuy8RZW2e1kdC0qL3
 2xgTm2xECVJpcu8osD4qUw9OkZxL3FwJxbauWu9iuwyPUYA5KKSkUtasYeHq7b/KzAoh
 TpDT6TjZeErQuUUuAub52JjUsZLYGVQ26BdDBziLB3tQoNyVvu8ODnFgWxWJAEux1Pg1
 8u9g==
X-Gm-Message-State: AOAM532X7mfVXI/J6o2gBN+oAhmk/Oco6SBWGlFkOBcFk500iRmemF/T
 JO5raD/cjlKRIh88baLojnE=
X-Google-Smtp-Source: ABdhPJyMdkCLlkB48Di9E70YagohvSIbysJTGd9ixEwryDW489vir8n7x1GTRBGyvbi/fqwswBpNbQ==
X-Received: by 2002:a62:ee08:: with SMTP id e8mr18838245pfi.93.1592826243593; 
 Mon, 22 Jun 2020 04:44:03 -0700 (PDT)
Received: from varodek.localdomain ([2401:4900:b8b:123e:d7ae:5602:b3d:9c0])
 by smtp.gmail.com with ESMTPSA id j17sm14081032pjy.22.2020.06.22.04.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:44:02 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Mon, 22 Jun 2020 17:12:23 +0530
Message-Id: <20200622114228.60027-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-parisc@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 0/5] ethernet: dec: tulip: use
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

Linux Kernel Mentee: Remove Legacy Power Management.

The purpose of this patch series is to remove legacy power management
callbacks and invocation of PCI helper functions, from tulip ethernet drivers.

With legacy PM, drivers themselves are responsible for handling the device's
power states. And they do this with the help of PCI helper functions like
pci_enable/disable_device(), pci_set/restore_state(), pci_set_powr_state(), etc.
which is not recommended.

In generic PM, all the required tasks are handled by PCI core and drivers need
to perform device-specific operations only.

All patches are compile-tested only.

Vaibhav Gupta (5):
  tulip: dmfe: use generic power management
  tulip: windbond-840: use generic power management
  tulip: de2104x: use generic power management
  tulip: tulip_core: use generic power management
  tulip: uli526x: use generic power management

 drivers/net/ethernet/dec/tulip/de2104x.c     | 25 +++-------
 drivers/net/ethernet/dec/tulip/dmfe.c        | 49 ++++---------------
 drivers/net/ethernet/dec/tulip/tulip_core.c  | 51 +++++---------------
 drivers/net/ethernet/dec/tulip/uli526x.c     | 48 +++---------------
 drivers/net/ethernet/dec/tulip/winbond-840.c | 26 +++-------
 5 files changed, 45 insertions(+), 154 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
