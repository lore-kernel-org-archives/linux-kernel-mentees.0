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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959BDC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6515622B40
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mX+NGt0G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6515622B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 53689886F5;
	Fri, 31 Jul 2020 12:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TaEdzKXdhUiV; Fri, 31 Jul 2020 12:02:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E943288639;
	Fri, 31 Jul 2020 12:02:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7B5AC0050;
	Fri, 31 Jul 2020 12:02:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CFE4C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3F7C323771
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IfEP+vy0mvt8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 7165521551
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:28 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a14so5212464edx.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iuQy8w3jTC6B7f+e5+v+su2hWV/K85XhH+2elaMKuus=;
 b=mX+NGt0GAao51iB7oaEfO5+Btfka8TE/iCN9cnpXnNXnPfsggcBwStFE9SJ7n5EFNY
 jdMFPXe/UGbl0eBCTUV/gPshZTOV/RtMC0+K0sWnHYgY8gJr334m9IIIelnNoSDq6RAm
 PPvOdXtA4osZ4abuOYMB1Irc9HnBU7cxU0kwk0eejbhv9hq6X3XyYT4inmGtiS53gIgR
 ZiZb/sRX3OSs5GpMMr80sJDOqSQ8YpXdt51eHE3GJ5JtzQOMS1cw+lx/A6r33aMSGKLo
 Q/lJ4lkI9ut0SlODtbMP5L4nvqXTGYkyAPQ/6BgtdlGRVhRdb2rl8Cp163guf8Cg6IdL
 Uw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iuQy8w3jTC6B7f+e5+v+su2hWV/K85XhH+2elaMKuus=;
 b=BEFztIj5CvVwhGwrSI686W1YPqaKKTOY2ZYFTaEN6AFxpJTRTqFjv3DB0ge7NHzPVH
 WJKb0D2XgMTvq1jdaAk/xBJ/yInmQ7g6GDtEo2MFG1R96nYLFz8+V0uleWYK/SwVKMsb
 iZMzNSQgUYvhaMiqjZKVKPM5/8P0x8uYcxkWlbiMSu/QjJAfQgZ0E6enldWTc6cdVSwQ
 NEraQuuDavDGGtG1lKAJc/FZ9X1y+Bo+1/EXcTaDFZ8JSk+00q6vQc9pucitNgOG5Nuz
 cz+3FDqMupMaQcWJ0z4Vx6QCm9zdNOhdv3bJdyxXhImSJXRADy6qJvkR17hN4Wf9jQNZ
 045w==
X-Gm-Message-State: AOAM53191dQfcRmMCS/xvfhj2Aq67fEGYoYxGJGpD9VumlTY/a3YLDpB
 FQFmpJ5bsq+t+KdzelDNUQA=
X-Google-Smtp-Source: ABdhPJzSf08P3jMuQU718EQhoumM6CT4AGAq2dZFlEfSRpdPJLSq+0WSaj54UAXLkHWN8FeZq8vKKg==
X-Received: by 2002:aa7:ce91:: with SMTP id y17mr3587091edv.105.1596196946844; 
 Fri, 31 Jul 2020 05:02:26 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id j5sm9091734ejk.87.2020.07.31.05.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:02:26 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Len Brown <lenb@kernel.org>
Date: Fri, 31 Jul 2020 13:02:35 +0200
Message-Id: <20200731110240.98326-8-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200731110240.98326-1-refactormyself@gmail.com>
References: <20200731110240.98326-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 07/12] PCI/ACPI: Check if
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

On failure pcie_capability_read_*() sets it's last parameter, val
to 0. However, with Patch 12/12, it is possible that val is set
to ~0 on failure. This would introduces a bug because
(x & x) == (~0 & x).

Since ~0 is an invalid value in here,

Add extra check for ~0 in the if condition to ensure success or
failure.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pci-acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 7224b1e5f2a8..873b005947e4 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -253,7 +253,7 @@ static bool pcie_root_rcb_set(struct pci_dev *dev)
 		return false;
 
 	pcie_capability_read_word(rp, PCI_EXP_LNKCTL, &lnkctl);
-	if (lnkctl & PCI_EXP_LNKCTL_RCB)
+	if ((lnkctl != (u16)~0) && (lnkctl & PCI_EXP_LNKCTL_RCB))
 		return true;
 
 	return false;
@@ -797,7 +797,7 @@ bool pciehp_is_native(struct pci_dev *bridge)
 		return false;
 
 	pcie_capability_read_dword(bridge, PCI_EXP_SLTCAP, &slot_cap);
-	if (!(slot_cap & PCI_EXP_SLTCAP_HPC))
+	if ((slot_cap == (u32)~0) || !(slot_cap & PCI_EXP_SLTCAP_HPC))
 		return false;
 
 	if (pcie_ports_native)
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
