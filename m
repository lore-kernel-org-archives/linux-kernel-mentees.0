Return-Path: <SRS0=sA50=AN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F67C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 17:03:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58DC2206E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 17:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIk2bIct"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58DC2206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 456C088ED9;
	Thu,  2 Jul 2020 17:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Axpr9SeyI6cD; Thu,  2 Jul 2020 17:03:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E31A488ED1;
	Thu,  2 Jul 2020 17:03:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9683C0890;
	Thu,  2 Jul 2020 17:03:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 425D1C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 314718AD39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1-d976TQ3PF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:03:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A9FC88AD3E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:03:05 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id m9so2533945pfh.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Jul 2020 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sdX4HaTp9icl96MrCuNrfjEqzJvThTeDSS/Lnbk9eSI=;
 b=qIk2bIctJuCw/nX0bYoysOksrp7u5CkoSzEjixR3X+RCXSGs7q5D1/l6rUJdVlSgSI
 TKQZE6MLK9wmKW5WLX0W+Zyn+ZIqbr3KB0Aw44bz0u7qbT++5115Uc9A4zByiAd2GKve
 3t/P4oa/c8FUJJCqE3KiD7eegicbFbRUSTl77earMKh33vDPuq/nj9dPSvfp/Jr0WnqJ
 sKWcFckkLmmJ0TstROceDpwp8n4xfjLL2b1vfBRdWDiF0Bxmag5t0C/icsv40WKdV084
 OxXGWUiA4bkbv3mPmQ7dRO817I87lhgLzIFoFMOzpmNjc6oqR9ZZfCHQhNxforOJdj1a
 Pz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sdX4HaTp9icl96MrCuNrfjEqzJvThTeDSS/Lnbk9eSI=;
 b=cf7YWFvFidtHPLbZC+/jPmqeWUKw9cS8ul+SQ62tE696L0l6JQ8BdITAuYpPf/XiOV
 XRsmt+hJQji8dr1H8PLQdONsL+hQ6G37a6BhAUW7matj43JEqGV9IzYC/AR8aTiNzpVM
 Zk5DvEkWFPaP3ydXd02Sk44gvu3N9DQ5vYqDrnQ52Cy7JufjxpB1rvKroq029iuSP+4t
 gIVrQ9Rx688xNWRVIo6ytngKkskxeuTc+hCMpilNFwBlgF4vDQjCnVaF4Ydqnn51XZ20
 YlNyoHK+7v4XCB+QNGr/FtkbC/MlZf8w/shgI5R/Jpo1GGAagGvcdSMLutM4cqqeB843
 bw/g==
X-Gm-Message-State: AOAM5316lQ5+6VTP0EHB0pej2hxjgXV8beUEvuntKRA3G3ZHnGHknr3k
 zOaOCXwENqxZz7LpyiRavRc=
X-Google-Smtp-Source: ABdhPJzsKs1R5yuKZm5NZySSEZZHZPlNsiGXwAR+dvp1/5lvQkYtz7GeTgWdeKqHCK0mCo0ZRiOznQ==
X-Received: by 2002:a65:43cb:: with SMTP id n11mr24992540pgp.160.1593709385187; 
 Thu, 02 Jul 2020 10:03:05 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id j21sm9230429pfa.133.2020.07.02.10.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 10:03:04 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>
Date: Thu,  2 Jul 2020 22:31:41 +0530
Message-Id: <20200702170143.27201-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 0/2] qlogic: use generic power
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

Linux Kernel Mentee: Remove Legacy Power Management.

The purpose of this patch series is to remove legacy power management callbacks
from qlogic ethernet drivers.

The callbacks performing suspend() and resume() operations are still calling
pci_save_state(), pci_set_power_state(), etc. and handling the power management
themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

V2: Fix unused variable warning in v1.

Vaibhav Gupta (2):
  netxen_nic: use generic power management
  qlcninc: use generic power management

 .../ethernet/qlogic/netxen/netxen_nic_main.c  | 59 +++++++++----------
 .../net/ethernet/qlogic/qlcnic/qlcnic_hw.c    | 11 +---
 .../net/ethernet/qlogic/qlcnic/qlcnic_main.c  | 33 +++--------
 3 files changed, 37 insertions(+), 66 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
