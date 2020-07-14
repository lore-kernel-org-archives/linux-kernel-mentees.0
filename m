Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6420BC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 10:04:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3897F221FD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 10:04:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhMkyJCc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3897F221FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 122D28A3C4;
	Tue, 14 Jul 2020 10:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61tKd3PAtczO; Tue, 14 Jul 2020 10:04:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3B24A8A3C3;
	Tue, 14 Jul 2020 10:04:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37821C0891;
	Tue, 14 Jul 2020 10:04:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80589C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CF1E08A3BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBoVD3uVsTey
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:04:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E99A78A3A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:04:35 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id w6so20871462ejq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aMKbSEl+TSwwECHcG9VnO2R6z/5zU0sZpPUGSBe9CVI=;
 b=VhMkyJCc+Ub0Mlz/veOdOjCD70CzW+qNp9KM0xawUl4zbqa4ZnNKGxddnev15er0ru
 Su7pl3xeo8u1djqLQfWwT+CefBtYCAyvY14CgksDgSXDqSIj/8PH4HUgqp9ViEDKF+kK
 bHYUTq+xQcdBaljJ40HNq71TKiTqJ/3GB0euhCsxmeiWFKvBy29FnZUc62aJ9+Zu3GJj
 25iqFmUnXxhK3AexMaqjMUttk9KzZKKvqUW0cB3cc/MQeN9DL3uFn0Xg5ll6xyysHm9C
 HNtvnPq4pVlVKl4bfERgc9XXMieiWWlYK1VFx08RIkVcfY1GD06438NPaqbMsKJMNMmi
 dPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aMKbSEl+TSwwECHcG9VnO2R6z/5zU0sZpPUGSBe9CVI=;
 b=i2GTtgCHYYLdzGc0ouDgtn5kzucvJdNvXglSlh+KCUHfHY17tKN8jCu3h3Ilzfwp/K
 SptOZMvXe5TAiv1N1SkpeJDU8SDQwc6t1UKtIkYh/OtXsygvTsS9aaEVWfHveLcCh2oW
 yHw8OxpliUEN6Qr3LXJoJL2g7JRl+hPE+Fy6dYxuQWTVIqnyVe65DcAo+VbT3VvafbxQ
 Pm8XsL/t+IX5pEOAsDUJGo970zWMo5g25/3ikITQJeTMMH38wzVr7Wxxc+AZtDfZeJJn
 RdJ19+tQpg+clxBIjhZpxjFilJoSAUy9ovmMVFAxmJI5yKAeppjFWtXt9CqYkBt/QLpe
 kF/w==
X-Gm-Message-State: AOAM5308EyaauGba1LKFNgRRArZBvFIwOkevQrW8LZQeshouB1i1S+Ct
 fYrYaMswXkGTalQMZsDY3/o=
X-Google-Smtp-Source: ABdhPJwucgF3GRDOzOtGpASqDtOayCAxkkAolx9Zcs/9pzfdhZ8Vr81ft8NDuUFEr7wkKLkv2Z7gJQ==
X-Received: by 2002:a17:906:38da:: with SMTP id
 r26mr3618268ejd.120.1594721074231; 
 Tue, 14 Jul 2020 03:04:34 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id bs18sm14137672edb.38.2020.07.14.03.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 03:04:33 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 14 Jul 2020 13:04:43 +0200
Message-Id: <20200714110445.32605-2-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200714110445.32605-1-refactormyself@gmail.com>
References: <20200714110445.32605-1-refactormyself@gmail.com>
Cc: linux-rdma@vger.kernel.org,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/14 v4] IB/hfi1: Check the return
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
v4 changes:
Remove unnecessary boolean conversion.

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
+	return ret_dn && ret_up && (dn || is_ax(dd)) && up;
 }
 
 /* Set L1 entrance latency for slower entry to L1 */
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
