Return-Path: <SRS0=WnLp=AM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6FCC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 16:52:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27F0620748
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 16:52:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2iqyFAg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27F0620748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E73842E2F8;
	Wed,  1 Jul 2020 16:52:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sN4l0J71CxT0; Wed,  1 Jul 2020 16:52:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 39F922E2F1;
	Wed,  1 Jul 2020 16:52:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 243A4C0865;
	Wed,  1 Jul 2020 16:52:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1AD9C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8284E2E2F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r87sNMJnxe-Q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:52:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 8F5A42DA5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:52:27 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x3so5714678pfo.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 09:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yq7hs32OGfY8UE2WDtnMKE4YTJJ97qchS3NAypAqKh4=;
 b=a2iqyFAgZJghpL1599VKJivckFlNKW6YZ2eyXsbimKE8c9lemuTeuE7lj/cyp1Y40L
 Fgsq18tOxN1TfbuY/DMPfICbk52aFVuRdvz8RcCEnrgIsQHsvaqrdPepKUtwzJ8reyCw
 ggfMdD4+ryg3Mkip2YwIoucybjQoJBWSO4IjkPq3lpUSHg3/GsWOeXdtkGeLNJQAPSwT
 6OgJR5EFL4LA65j/FrnfLtl7JqVM5f6s7EbnfuiDCNRm9md3RhzwQtEvr1tF8wx8oFq6
 idbDwWHhB5sWFxsudB8ocXNK4VRxYI939wJ7NgQT/nVDkk1o0QIHiS6acEcZwRjNgy6j
 vs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yq7hs32OGfY8UE2WDtnMKE4YTJJ97qchS3NAypAqKh4=;
 b=CcPM9o7Px3554voXxVvL2T7F1RU1/b2nvwgsAaBKmlR2Phm2eEIxT868zMJAUWeXLt
 Ur9nBUwe2l49z0oeCGxi2OQmW91OZxvPOBj7QNdf7DTcEF3s9VJ+62yOP5ka4miVXi2P
 eqrvANuRR2w1yzV3DxsSr26URe67FcYZ2jw8yVmhwUlYnrTBZaXOJErS2jyWg7DFW/Rn
 JRYBEFb1iqu6itPlUTavnCjOlQ2ND/VB8rFFF4mKNPJn5qrILWDHVGj9dLbxe4mda5Nd
 zRkaTBblntgLZbCMbD413b59Ur1AYqIuBunhHXdaY6FWMwJ/8hpY4f2+B6cl4Ie2Dr9O
 D4eQ==
X-Gm-Message-State: AOAM531e+uDJTXizAxt+5/L9kYxCMV30lJhEevhdm9SBCfyEPTS4Zlfk
 Omz9pylnuf6HfWn4D4SVYoc=
X-Google-Smtp-Source: ABdhPJwZPXeUQcZx7/ku1wET7DYWbP5fjR/f9o0/uE/qo9tXNxugawuCNTx3l8stWcZDsJmbzgaheg==
X-Received: by 2002:a62:ee1a:: with SMTP id e26mr24172206pfi.228.1593622347102; 
 Wed, 01 Jul 2020 09:52:27 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id g140sm6297437pfb.48.2020.07.01.09.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 09:52:26 -0700 (PDT)
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
Date: Wed,  1 Jul 2020 22:20:46 +0530
Message-Id: <20200701165057.667799-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 00/11] net: ethernet: use generic
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
from net ethernet drivers.

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
 drivers/net/ethernet/amazon/ena/ena_netdev.c  | 22 ++++----
 .../net/ethernet/cavium/liquidio/lio_main.c   | 31 ++---------
 drivers/net/ethernet/dlink/sundance.c         | 27 +++-------
 drivers/net/ethernet/emulex/benet/be_main.c   | 22 +++-----
 drivers/net/ethernet/mellanox/mlx4/main.c     | 11 ++--
 drivers/net/ethernet/micrel/ksz884x.c         | 25 ++++-----
 drivers/net/ethernet/natsemi/natsemi.c        | 26 +++------
 .../net/ethernet/neterion/vxge/vxge-main.c    | 14 ++---
 11 files changed, 101 insertions(+), 182 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
