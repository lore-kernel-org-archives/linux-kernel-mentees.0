Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB50C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3384422BF3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcMW1Amz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3384422BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 27893886FC;
	Fri, 31 Jul 2020 12:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cpi-U6wj-Jty; Fri, 31 Jul 2020 12:02:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BC98188639;
	Fri, 31 Jul 2020 12:02:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97F54C0864;
	Fri, 31 Jul 2020 12:02:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74477C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 63B85869E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYYGWabQSApa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6B1C0869C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:20 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id bs17so3431013edb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 05:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=amVhr7R4Tl+AZRhIhKHpLA6uHviyCSc4sbl+N98Jdpg=;
 b=JcMW1AmzuSS8oG65Inbid1bJUW/hbncZI7QS2d5UfMrtraGXnzfDKeDWUDIhuDP/6T
 a5oy1TmPN7ZBWRpPUELAvSc5ujNSi1+DihJnVMqL9vW2Zx+Gqyawvb1ZEH1Jfv3gEIrJ
 Lb33FgO9+8s5fiMLgtNRSIsBQ/8O1duwSGT7dVS7uZoRDhjo39sJfhzJWtn4xdYsjJ2u
 Ap3vuoboz/YeojnQZcGlmicmKam1fnTIigSdb5tkXlt1czDa2nbdWRmVzLSyOYzUiz0Q
 HEQsp232s4YkFDK8tN4PaxGlzYevBgaH5JeG75wkyNZjaVXbkGPtcdIWaK1VnBc5/gUK
 kRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=amVhr7R4Tl+AZRhIhKHpLA6uHviyCSc4sbl+N98Jdpg=;
 b=WICF2pXSXYGjsz88JlShCsYoNP9SpNZ6C/qjd/rEE57C7RBKM4gYd8WZQfTgNklzAd
 zXLAAVb376zHcyhbaSwnHJUT/X96cGd7bwfMQobO2yvombsiWuDDDWnyjnvklk5vMlWu
 DkkWUI5ZyCnsdnrMPcRwLrHG3BI57ExQ4STYnu1keN7Mwhvug26M/0r/YPD9HJPrzPGW
 bSmh4AAXtE/UdvkjqyldAmlxN2cZBs76862Me9wS5ff/qFcB/zmzAXI1ab06pBMrEg6z
 qcc9LFJEGPAZYV+jQKSzbdYdQcpDfN/ump65llZ86oKF8fHrF/1LzU50r/9ArKkU/+GA
 wbGw==
X-Gm-Message-State: AOAM533/C44NgcM56yIjdRd/eLwpQAUNMDhOSkQ3yra2Ojv5SStcYKkC
 oDmcvT4zVJo/gAcBXIm3ji0=
X-Google-Smtp-Source: ABdhPJxxcaYV0fL7ANNAzpxeHZXM0MM7VCpGGNBUD6uol8RNcQxADNTtg7/dBuH2xZETfFkTuu3WUQ==
X-Received: by 2002:aa7:ce90:: with SMTP id y16mr3597463edv.325.1596196938310; 
 Fri, 31 Jul 2020 05:02:18 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id j5sm9091734ejk.87.2020.07.31.05.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:02:17 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 31 Jul 2020 13:02:29 +0200
Message-Id: <20200731110240.98326-2-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200731110240.98326-1-refactormyself@gmail.com>
References: <20200731110240.98326-1-refactormyself@gmail.com>
Cc: linux-rdma@vger.kernel.org,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 01/12] IB/hfi1: Check if
	pcie_capability_read_*() reads ~0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On failure pcie_capability_read_dword() sets it's last parameter,
val to 0. In this case dn and up will be 0, so aspm_hw_l1_supported()
will return false.
However, with Patch 12/12, it is possible that val is set to ~0 on
failure. This would introduce a bug because (x & x) == (~0 & x). So
with dn and up being 0x02, a true value is return when the read has
actually failed.

Since, the value ~0 is invalid here,

Reset dn and up to 0 when a value of ~0 is read into them, this
ensures false is returned on failure in this case.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---

 drivers/infiniband/hw/hfi1/aspm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/aspm.c b/drivers/infiniband/hw/hfi1/aspm.c
index a3c53be4072c..9605b2145d19 100644
--- a/drivers/infiniband/hw/hfi1/aspm.c
+++ b/drivers/infiniband/hw/hfi1/aspm.c
@@ -33,13 +33,13 @@ static bool aspm_hw_l1_supported(struct hfi1_devdata *dd)
 		return false;
 
 	pcie_capability_read_dword(dd->pcidev, PCI_EXP_LNKCAP, &dn);
-	dn = ASPM_L1_SUPPORTED(dn);
+	dn = (dn == (u32)~0) ? 0 : ASPM_L1_SUPPORTED(dn);
 
 	pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &up);
-	up = ASPM_L1_SUPPORTED(up);
+	up = (up == (u32)~0) ? 0 : ASPM_L1_SUPPORTED(up);
 
 	/* ASPM works on A-step but is reported as not supported */
-	return (!!dn || is_ax(dd)) && !!up;
+	return (dn || is_ax(dd)) && up;
 }
 
 /* Set L1 entrance latency for slower entry to L1 */
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
