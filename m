Return-Path: <SRS0=ZpoD=BI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A28C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 09:59:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 754EE2068F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 09:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rb8/dupy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 754EE2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 44F5688453;
	Wed, 29 Jul 2020 09:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVuYTTPpBRnp; Wed, 29 Jul 2020 09:59:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CE5BA883A3;
	Wed, 29 Jul 2020 09:59:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1BF1C0050;
	Wed, 29 Jul 2020 09:59:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D70BC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 09:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 46C3E857B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 09:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cxlQNoSbtZMZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 09:59:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CC7B085766
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 09:59:33 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id mt12so1644829pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 02:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T0Z6YHYdP/kQD0cMS+cNQldOhqY6T8q1pjXPvT/YgO4=;
 b=rb8/dupyCMFbBH4YZJuE/RPbByMpGQ5LAydsXv+QjPXvhSZxULUuuRV8XlGBj1j99K
 XFszBCZ2K4ch/ddu2OZLiYmUBUeRhRcbu8a3Yu8TAZA5bE2F4mG5ltCYhNeoIFUJ61ru
 dbWRev/5xq+8WUIhLulvMFFuSBNToV5Vr8YCCTuPFgOHfGo0l95lBrQH2s6enGdm98ab
 YadDobj5jWlZYvQI61D7RjMi1YuDBExT4iDSKpotJY0g8mdjfoffFRt437s530RMwJx9
 8Y+G0QWfDnEINXow8ElKpN8xnB5aVnJhiz6hciPST9mC0ScqccExXerDwCKuLEIQd1Wi
 BzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T0Z6YHYdP/kQD0cMS+cNQldOhqY6T8q1pjXPvT/YgO4=;
 b=NRenmH9cXULk5TEE1OOsDMZBThgJ2HwglU0YJkU4KQ3V5qtsKbj7KM51B3MgGdd1Hu
 CMdsC3SSgbPT2fn3JN9CgcyvNx88wA0NNVtnCFPpjK36rIY9GguTd3O9r6sjEsyCyK64
 bZFjB65OrQ6CM6hXi6dI4+A9BdAxoy7Kx3EHVsHTEQG7tdpnO3bAxsJ8T/J1MyibADWi
 RpnAQDCpPNFW4t2VWGaccjeqUkftn7jdldPm0tlXhHAUrV1NW6zvIkTQUSScyVO62rpJ
 4KS9cCVYr7HKEkHhAjteJfd2soq5KMEAjjLyrMBwAvUj6JMfIAbd3lAx00HmTvv24ISh
 itqw==
X-Gm-Message-State: AOAM530Fbf/IbRO800mw9gKaxAIIBgpmWXUz8HgiRLh21aGty9/oHkvC
 kllLmOfyMJFJt+Zto/isPqg=
X-Google-Smtp-Source: ABdhPJwlUgeMIQUydEFbTDZ99rxEoaivKlj3ebAXEwUBoUc6lmxEGQaE2R4Y9pOgdMTLv9N/en648Q==
X-Received: by 2002:a17:902:7b92:: with SMTP id
 w18mr27533925pll.258.1596016773345; 
 Wed, 29 Jul 2020 02:59:33 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id i128sm1815776pfe.74.2020.07.29.02.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 02:59:32 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Daniele Venzano <venza@brownhat.org>, Samuel Chessman <chessman@tux.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Date: Wed, 29 Jul 2020 15:26:57 +0530
Message-Id: <20200729095700.193150-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 0/3] net: ethernet: use generic
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

The purpose of this patch series is to upgrade power management in net ethernet
drivers. This has been done by upgrading .suspend() and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
their job.

The conversion requires the removal of those function calls, change the
callbacks' definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Test tools:
    - Compiler: gcc (GCC) 10.1.0
    - allmodconfig build: make -j$(nproc) W=1 all

Vaibhav Gupta (3):
  sc92031: use generic power management
  sis900: use generic power management
  tlan: use generic power management

 drivers/net/ethernet/silan/sc92031.c | 26 ++++++++---------------
 drivers/net/ethernet/sis/sis900.c    | 23 +++++++--------------
 drivers/net/ethernet/ti/tlan.c       | 31 ++++++----------------------
 3 files changed, 22 insertions(+), 58 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
