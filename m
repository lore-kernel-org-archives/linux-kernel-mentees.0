Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6DBC433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 16:55:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 989D42067D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 16:55:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="On/rLQmi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 989D42067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 460738978A;
	Mon, 13 Jul 2020 16:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xKHdaDKJ40xF; Mon, 13 Jul 2020 16:55:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AE0428956F;
	Mon, 13 Jul 2020 16:55:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 948B7C088E;
	Mon, 13 Jul 2020 16:55:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0E65C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D80D823735
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:55:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CS4zoEptR+V4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:55:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 81E0A22718
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:55:12 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id bm28so12302492edb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TkNyGhVGg6gVUCzpTd9OAFstGgg/MKOfxToRs2GSfBQ=;
 b=On/rLQmicINxtBadu57xIG7YClMaLhAuYyqGOWK0VWZeuVm3nzNHkYxBhM7+pqw2M+
 7m8Q1icCJMMhuHmHo3kSwPbHgZGXy0UiwvZD12pqIzpd2CDKU57S8LCMyEP3yURnJjfv
 myqn7MQi0idmjaLsLHcssx7seM009f8dFGz8gWyiVZqcD5qUm8elVVT7gu1QW1s/6bdk
 rm4q6KVqW3pAYu0Ss9kPbeBtHzXqspcsRxr6CuQxPyzrSlfShcDamTPe84b80t9/oIvn
 OMkyMrn+y8k4CWVQwg9NyLJXhVSIgNXPEAHc3gYjxrjtcgTYGQ0bXgJvnCKrobicfPUG
 39jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TkNyGhVGg6gVUCzpTd9OAFstGgg/MKOfxToRs2GSfBQ=;
 b=cDIdHx4Ma6uPNGaleNWvDcP+RPXkKcKP2npJvjm6bNUyTrfD3nMYLBbSAFDm13w3vx
 k+e3ipYRJCosJXAwarKJF0vZt7DU8su8N8uI9sWnmx+7RKHZxZs/o7GpQZisYt0GPSgf
 kANboxoY4N+ZY6aX06H3ITekRVWvH7R1vzPnCeLOAfLPYGxyoG1Uv1IVhMm9hkL/FZMO
 djoVszUhIGjJFG255znQNkE0VnfyySjZXT4Xt21omntuVuNdwF3IOVljjMgjKOGPjtC8
 1FbMWvM0appyA6VGTmcf6mVK+Jor/kRgeeCgB4fiQfLf9VkCgswWwaF/b2zOB+Lq7vd3
 Uvvg==
X-Gm-Message-State: AOAM5307tZsvOaakogi1dxj70GFy2D6B2N/omfUVWy1eLVmApMHYPK6g
 qpApoIYITRhqSvtK034fE4Q=
X-Google-Smtp-Source: ABdhPJyMCnsUp9Wj1A7Ygk/lw7FDwznI2xdPP4+uz9bNiAb1owWHZffQG+VupT2yXc4MjZgCEMmQVA==
X-Received: by 2002:aa7:d90f:: with SMTP id a15mr340801edr.86.1594659310905;
 Mon, 13 Jul 2020 09:55:10 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id w3sm11838938edq.65.2020.07.13.09.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 09:55:10 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: skhan@linuxfoundation.org, linux-rdma@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Mon, 13 Jul 2020 19:55:25 +0200
Message-Id: <20200713175529.29715-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH 1/14 v3] IB/hfi1: Check the return
	value of pcie_capability_read_*()
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

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

On failure pcie_capability_read_dword() sets it's last parameter,
val to 0. In this case dn and up will be 0, so aspm_hw_l1_supported()
will return false.
However, with Patch 14/14, it is possible that val is set to ~0 on
failure. This would introduce a bug because (x & x) == (~0 & x). So with
dn and up being 0x02, a true value is return when the read has actually
failed.

This bug can be avoided if the return value of pcie_capability_read_dword
is checked to confirm success. The behaviour of the function remains
intact.

Check the return value of pcie_capability_read_dword() to ensure success.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/infiniband/hw/hfi1/aspm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/aspm.c b/drivers/infiniband/hw/hfi1/aspm.c
index a3c53be4072c..80d0b3edd983 100644
--- a/drivers/infiniband/hw/hfi1/aspm.c
+++ b/drivers/infiniband/hw/hfi1/aspm.c
@@ -24,6 +24,7 @@ static bool aspm_hw_l1_supported(struct hfi1_devdata *dd)
 {
 	struct pci_dev *parent = dd->pcidev->bus->self;
 	u32 up, dn;
+	int ret_up, ret_dn;
 
 	/*
 	 * If the driver does not have access to the upstream component,
@@ -32,14 +33,14 @@ static bool aspm_hw_l1_supported(struct hfi1_devdata *dd)
 	if (!parent)
 		return false;
 
-	pcie_capability_read_dword(dd->pcidev, PCI_EXP_LNKCAP, &dn);
+	ret_dn = pcie_capability_read_dword(dd->pcidev, PCI_EXP_LNKCAP, &dn);
 	dn = ASPM_L1_SUPPORTED(dn);
 
-	pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &up);
+	ret_up = pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &up);
 	up = ASPM_L1_SUPPORTED(up);
 
 	/* ASPM works on A-step but is reported as not supported */
-	return (!!dn || is_ax(dd)) && !!up;
+	return !!ret_dn && !!ret_up && (!!dn || is_ax(dd)) && !!up;
 }
 
 /* Set L1 entrance latency for slower entry to L1 */
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
