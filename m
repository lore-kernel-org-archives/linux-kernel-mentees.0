Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F904C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 03:58:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2483F20739
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 03:58:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQTsaYve"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2483F20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D970C203E7;
	Fri, 17 Jul 2020 03:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0OUSwBmnqHW; Fri, 17 Jul 2020 03:58:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 15C82203E0;
	Fri, 17 Jul 2020 03:58:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F050CC0893;
	Fri, 17 Jul 2020 03:58:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2ED06C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1C0CC203E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncxsMFTyeqIr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 5B478203E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 03:58:06 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id e8so6026204pgc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 20:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JetoyPciAFofOkM46v7697tncAhHHwvgmW6+FF7q4EI=;
 b=SQTsaYvetOM1v356yrgZ70ZWFIumZlyBqkh0U4F6uKel/LiVJTYLOVXba5FZWSoaMD
 j6rtq9l+rTGOMThBLvS0I5my3oWHWsZK6mJYDSjLcuQ8auxY/mOr3NEMACubjmWFYZtM
 WABUhv7XcAPkUuAkdyQpwoU66GY9UOm0h3crWecSGwy0UdaGJDHUHOo+k46ZNpwiBzFK
 KoogYvjSK243ZGt/UvlMK+PcJePlL9Uw80JjOBQxxVELVLDt1SzfwWPJJ6cC1zwrywRS
 VIzslPRF0mGxsXxa0ubTxio87UY1zZL2O+fFaCCeLs2rDjzsiSyer+47oc71997kHSwL
 BcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JetoyPciAFofOkM46v7697tncAhHHwvgmW6+FF7q4EI=;
 b=MnrzJNAKnZq6Auj2/e9tV3QNDcifnc8xXIhhDNyjpaCyHlnCPB/NqO7Zi3TWY5IHHS
 HqLrUKe996+zSdhbuLxYM5vXu7LEfTL0+MG3q/A3QTXuTps/4NAhRk2vBNd7SBddiQPJ
 GL6S5uhs1r3mIx2kCYhuTxt2x9Dx+M/rG1bU/iJqV29Gh5PuJJlZvQ83AXZmsBlzIfZf
 2I+KhjJyVzhSKMAxrHIwc5JUrNy397ilqg5ZrIFebHZO9LiA7UClHmdxOmiBumZZrlwm
 jRyNtTK7EqNQ6PC8hRqJwR8ihri8kI1k9cSvC5Lv0kW2jZOkZVtN/gzKMCRCFaxAh4Uf
 diRQ==
X-Gm-Message-State: AOAM532PU5p7Fe+sm171VDdzUn3l3vqBfhm7fQUqv993ASNzPUbHlYjU
 y5BsE/BBkA8PrUjGg0711C8=
X-Google-Smtp-Source: ABdhPJyQGXUcV6zCkE3MOHzwvTAOjdHtpOOsE/Zsef8mAJXI3n4YmvqKgpZUf/OTcBLcROCfl/0JxA==
X-Received: by 2002:aa7:9736:: with SMTP id k22mr6130149pfg.62.1594958285870; 
 Thu, 16 Jul 2020 20:58:05 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id v11sm6227907pgs.22.2020.07.16.20.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 20:58:04 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 17 Jul 2020 09:26:02 +0530
Message-Id: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 0/6] [media] pci: use generic
	power management
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

The purpose of this patch series is to upgrade power management in media
drivers. This has been done by upgrading .suspend() and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
their job.

The conversion requires the removal of those function calls, change the
callbacks' definition accordingly and make use of dev_pm_ops structure.

v2: v1 possibly broke cx23885 and cx25821.

All patches are compile-tested only.

Test tools:
    - Compiler: gcc (GCC) 10.1.0
    - allmodconfig build: make -j$(nproc) W=1 all

Vaibhav Gupta (6):
  sta2x11: use generic power management
  cx23885: use generic power management
  cx25821: use generic power management
  cx88: use generic power management
  meye: use generic power management
  tw68: use generic power management

 drivers/media/pci/cx23885/cx23885-core.c |  3 --
 drivers/media/pci/cx25821/cx25821-core.c |  3 --
 drivers/media/pci/cx88/cx88-video.c      | 52 +++++--------------
 drivers/media/pci/meye/meye.c            | 15 ++----
 drivers/media/pci/sta2x11/sta2x11_vip.c  | 63 ++++++------------------
 drivers/media/pci/tw68/tw68-core.c       | 30 +++++------
 6 files changed, 44 insertions(+), 122 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
