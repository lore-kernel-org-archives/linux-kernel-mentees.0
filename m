Return-Path: <SRS0=WnLp=AM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6663DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:01:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CED820760
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIfoTf9a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CED820760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E33138BF7B;
	Wed,  1 Jul 2020 13:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95QZDccfxkLI; Wed,  1 Jul 2020 13:01:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 649E38BF60;
	Wed,  1 Jul 2020 13:01:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48F01C0865;
	Wed,  1 Jul 2020 13:01:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 405FDC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 073432F936
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ihySFC+YTe4j
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:01:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 34F7F2F90B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:01:11 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id h22so11024915pjf.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VJuhLyKx0l/petl/Rvjp0iqv9iNt+v6qKlOcfit+AJ4=;
 b=aIfoTf9aApBl06YRh9QdqwTktxo7ifaiaKRMMUT2fop5u7VRORc6pQV6sVf6ZMbT2f
 g6ZBp4FiMVDOjREmzUXAFtE038jkevv28skhmfoRN291ZQze1m74696Cg+yD7TJ1kJS8
 EEMUXwIpzdcImcD0p0D0O7BJCIG6uLpt8wmEBiAhYLJ4hpldEr6fEhVc9jsec7eBMeBd
 c9USZfRwFvVUHppP6NYyT1fbkfsbMPcE6TLjR2B2Ues6clXYKy6vom3G4bJO0lX7wyNf
 16bZtOHTsmb59xeHm2B7Ce2HIh5EuWKasfDlaF2r+ZnvZ7U9ZJkkMgFNp2UeUBZlljm8
 U5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VJuhLyKx0l/petl/Rvjp0iqv9iNt+v6qKlOcfit+AJ4=;
 b=VmdpKya8VUexxLEy5LHLahF/Mxj8kJ/1hef2hmmuYTMABj7oOcwj/nR3DBShCDHmnh
 cWicTwPj/qthEUksMCIJOg1BHRm1kS58gMMmjOFtwFcrefm/o7WMyBRhrxLtMVUZqN1+
 nmuhl2Rrog/QDTMGHM5edXSKyrltJ76oV25XDbdUE+UQmbPJZ9OciLLLTqFw/KtwCoVH
 7iec0VayOk6qsy9BVFoWNgI7YyfVYxXxRRj2zs9KhYar46R/qILtn5CcVg+vIzET/gkC
 ExCi/ua1EdklDIeIMpa2SSFDYYLAQaBHZyILOSyUoLITe5GPHdhYQfe512JVjDMNEFH2
 2DVA==
X-Gm-Message-State: AOAM531eYzpVNbSlxOognLKLwPtH9yvqSLE6tDjx9t+PK3zY4Fy61wOs
 XujXJNzNG6Mr0vV7r5gdldA=
X-Google-Smtp-Source: ABdhPJyRnBmYViuI+0falPe09/7/sFXP+SCBULyj2QhZcilzCh6We+Y3aeitc2dCJXg+GxPnYxyh1g==
X-Received: by 2002:a17:902:7c13:: with SMTP id
 x19mr328651pll.74.1593608470657; 
 Wed, 01 Jul 2020 06:01:10 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id d9sm6070908pgv.45.2020.07.01.06.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 06:01:10 -0700 (PDT)
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
Date: Wed,  1 Jul 2020 18:29:27 +0530
Message-Id: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 00/11] net: ethernet: use generic
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

The purpose of this patch series is to remove legacy power management callbacks
from amd ethernet drivers.

The callbacks performing suspend() and resume() operations are still calling
pci_save_state(), pci_set_power_state(), etc. and handling the power management
themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Vaibhav Gupta (11):
  typhoon: use generic power management
  ne2k-pci: use generic power management
  starfire: use generic power management
  ena_netdev: use generic power management
  liquidio: use generic power management
  sundance: use generic power management
  benet: use generic power management
  mlx4: use generic power management
  ksz884x: use generic power management
  vxge: use generic power management
  natsemi: use generic power management

 drivers/net/ethernet/3com/typhoon.c           | 53 +++++++++++--------
 drivers/net/ethernet/8390/ne2k-pci.c          | 29 +++-------
 drivers/net/ethernet/adaptec/starfire.c       | 23 +++-----
 drivers/net/ethernet/amazon/ena/ena_netdev.c  | 21 +++-----
 .../net/ethernet/cavium/liquidio/lio_main.c   | 31 ++---------
 drivers/net/ethernet/dlink/sundance.c         | 27 +++-------
 drivers/net/ethernet/emulex/benet/be_main.c   | 22 +++-----
 drivers/net/ethernet/mellanox/mlx4/main.c     | 11 ++--
 drivers/net/ethernet/micrel/ksz884x.c         | 25 ++++-----
 drivers/net/ethernet/natsemi/natsemi.c        | 26 +++------
 .../net/ethernet/neterion/vxge/vxge-main.c    | 14 ++---
 11 files changed, 100 insertions(+), 182 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
