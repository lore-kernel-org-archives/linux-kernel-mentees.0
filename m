Return-Path: <SRS0=sA50=AN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3203C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 10:55:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CC562084C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 10:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdNYyNcY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CC562084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 317E689092;
	Thu,  2 Jul 2020 10:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYFr3TK-SEhI; Thu,  2 Jul 2020 10:55:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D043088EA8;
	Thu,  2 Jul 2020 10:55:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4690C0890;
	Thu,  2 Jul 2020 10:55:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44CA4C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 10:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2D99B88EA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 10:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpxxFjsbfP9g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 10:55:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A7D4988E82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 10:55:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id bj10so5945305plb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Jul 2020 03:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zVDLoXI8L+yFA0AKDZ7bUdoOmqmHzhsfGkRFres4Vo8=;
 b=hdNYyNcYxBMGp0vsVUVonQjCpRwp++MyCLX9Du8x4iyfHlecQ3mb2EMkm/m/IRvvZg
 xYlhVFm8LAbWcdOZh/gw0VTE60cuCuVZsNil/9zRwJBa1t9v+SEArbG5G+lATbyMuurC
 lBeVipe3KDJyN/pcqw0qvyF+czgN2bbwgAVBHHuF8HO0gr5lkOMhwW58KXF0rdAuQEL1
 CpCI6J2bR8HsWTADn+oPoV4ckqy/yAk7O1crJe08+MVmGyvDNbF2vKgz/NPPK1cHAsoT
 oJOCKClxm16+jGJcCrY+xmMUcrZ6+E5U5SHFSDISL8179bkNn6vaLzok3MU9/KpSCIG/
 DwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zVDLoXI8L+yFA0AKDZ7bUdoOmqmHzhsfGkRFres4Vo8=;
 b=Kq4wYp5mMK9zOlPkeoNhWNFQ4RLtPS3Wc2oOXapxjzOISNMJOIgPI+sZZNrXm2SWaB
 +V0UlJ0ldLH5IoOcTlYi6pTsZ/KBMQ31xa4R1rPW4OEABBKCfU1Qrjjfsw4At3Saxj7O
 BXzA/hkldXzQlD2IbUR/5hevPWo5P5L71ks1j08HMs1IArfiaNl9xlOsTFLgSb7mt6Ln
 vOifhE9f9Yv9jOBUbbJdK69fuDKahmRJQhihIJphuydyFyapbvbTBH2jDNITOT/OBkEk
 ondEKkyXbqeJRgtMqfdcg6u/UOde4m4YS7Y3S9ZUv5fFqQ1XUvoj3kfSbQqGvosqLTK5
 8rLA==
X-Gm-Message-State: AOAM531mjN+371fhOsZGdQfm5Hdt4iPvZ0u1opEw+Qswpv5nkngUrD4y
 L50oVGWbCanYVxu7tm5BPiQ=
X-Google-Smtp-Source: ABdhPJxp+jQqbymWxFOlaBxL4wvWCrVMPfYTU4e2ktouEmQs2F9WH9ppF7JvRDsVQrDg7te85eQ/lA==
X-Received: by 2002:a17:90a:d104:: with SMTP id
 l4mr32286340pju.65.1593687312256; 
 Thu, 02 Jul 2020 03:55:12 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id z13sm8702393pfq.220.2020.07.02.03.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 03:55:11 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Steve Glendinning <steve.glendinning@shawell.net>
Date: Thu,  2 Jul 2020 16:23:49 +0530
Message-Id: <20200702105351.363880-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 0/2] smsc: use generic power
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
from smsc ethernet drivers.

The callbacks performing suspend() and resume() operations are still calling
pci_save_state(), pci_set_power_state(), etc. and handling the power management
themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Vaibhav Gupta (2):
  epic100: use generic power management
  smsc9420: use generic power management

 drivers/net/ethernet/smsc/epic100.c  | 19 +++++---------
 drivers/net/ethernet/smsc/smsc9420.c | 39 +++++++---------------------
 2 files changed, 16 insertions(+), 42 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
