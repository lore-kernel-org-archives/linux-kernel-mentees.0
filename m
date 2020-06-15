Return-Path: <SRS0=vsPk=74=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70A0C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B998F20714
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWZbMGLU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B998F20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB60E884AA;
	Mon, 15 Jun 2020 08:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MibpVu6Q6mUh; Mon, 15 Jun 2020 08:32:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 95F1F88111;
	Mon, 15 Jun 2020 08:32:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8487AC0888;
	Mon, 15 Jun 2020 08:32:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59D39C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 42DAF889C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPXw2k9-veqg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 73F27889AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c3so16091087wru.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d3aQ/PgWjHRbwdP69pQYwDMstdmD8+pp4wlXRjxHodA=;
 b=aWZbMGLUyNSKzVZstBGG6z7eZvsz5piuZ/f5umAvnUxKhZ6nIDYzliFDXW/+/OTPeI
 2M3ceHFBb6iwy4Sy6pX/0g9ulNbfXBurcKzZnP2EzOdN1Dn/M0gl05Jwr4kfI3J+2N2k
 deCpdOEVmzl1DNjiIVxxMtdJ/kW+mTuwyMAV4FOueKp6VcLLqdPksLhluyTT/s+/LZsw
 kIRVCtVMPiyev+RINHxAAsDQn19VURIjwvOTVHxJDIEqGWHjIWUAMFigBMy37F7RtNHO
 jWhOzopPPl5yj/BSsC+uj1YQCvrEpgc9GztXPO4j48eCM5ZGmcxcUVtCZgmu6y4QQZd2
 eIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d3aQ/PgWjHRbwdP69pQYwDMstdmD8+pp4wlXRjxHodA=;
 b=keMEwANbVY51NgepqBWmCQe7CWWOvXzjc7fPwWyfxLy20A+DyW3092BrLVoj1NHFr4
 qHsvruaa/mWDj6oF8OnbTn+Rvtz+KCD0QFtiAacyb/pSjHVE+n3cUfFb8W6RyuChh8oG
 6sh1eqz+rXfaxuAKQVcnB8qMp7y1sFS+/AeiR4P5QTAUXC+TYCayzEhRnguQ1R93eSuz
 ePpXhDrxwn2JmfeUgfji9hnlC50li/rtLwfwFLPIIsYI6ydEi+Sl2Yspf402Ykzkwvdm
 LWjfl4I4bb8Urs7M/1daEUXHMvfNqBklxhsWX5zR9MN3VLIANUELNYLTFNrBM5WGAzKE
 FdEg==
X-Gm-Message-State: AOAM530cIwAZ17mIOhAOX44ek/yIYtNTZiik+WHUomB0xh1c0qLyfiuI
 Qmv4wD0/jyvEgy0SLJtwuog=
X-Google-Smtp-Source: ABdhPJw3IaYVJt7P8aT+wywoWLCu1BN+hwGNrjLmTa8ClloFJ7Il32qviKwMUw1SM4b7jQFKmJZSzw==
X-Received: by 2002:adf:fec3:: with SMTP id q3mr27238053wrs.123.1592209945027; 
 Mon, 15 Jun 2020 01:32:25 -0700 (PDT)
Received: from net.saheed (54006BB0.dsl.pool.telekom.hu. [84.0.107.176])
 by smtp.gmail.com with ESMTPSA id z206sm21954745wmg.30.2020.06.15.01.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 01:32:24 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Date: Mon, 15 Jun 2020 09:32:20 +0200
Message-Id: <20200615073225.24061-4-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200615073225.24061-1-refactormyself@gmail.com>
References: <20200615073225.24061-1-refactormyself@gmail.com>
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>, linux-rdma@vger.kernel.org,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 3/8] IB/hfi1: Convert PCIBIOS_*
	errors to generic -E* errors
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

restore_pci_variables() and save_pci_variables() return PCIBIOS_ error
codes from PCIe capability accessors.

PCIBIOS_ error codes have positive values. Passing on these values is
inconsistent with functions which return only a negative value on failure.

Before passing on the return value of PCIe capability accessors, call
pcibios_err_to_errno() to convert any positive PCIBIOS_ error codes to
negative generic error values.

Fix redundant initialisation.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/infiniband/hw/hfi1/pcie.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/pcie.c b/drivers/infiniband/hw/hfi1/pcie.c
index 1a6268d61977..2a45f34ac6c8 100644
--- a/drivers/infiniband/hw/hfi1/pcie.c
+++ b/drivers/infiniband/hw/hfi1/pcie.c
@@ -334,10 +334,14 @@ int pcie_speeds(struct hfi1_devdata *dd)
 	return 0;
 }
 
-/* restore command and BARs after a reset has wiped them out */
+/**
+ * Restore command and BARs after a reset has wiped them out
+ *
+ * Returns 0 on success, otherwise a negative error value
+ */
 int restore_pci_variables(struct hfi1_devdata *dd)
 {
-	int ret = 0;
+	int ret;
 
 	ret = pci_write_config_word(dd->pcidev, PCI_COMMAND, dd->pci_command);
 	if (ret)
@@ -386,13 +390,17 @@ int restore_pci_variables(struct hfi1_devdata *dd)
 
 error:
 	dd_dev_err(dd, "Unable to write to PCI config\n");
-	return ret;
+	return pcibios_err_to_errno(ret);
 }
 
-/* Save BARs and command to rewrite after device reset */
+/**
+ * Save BARs and command to rewrite after device reset
+ *
+ * Returns 0 on success, otherwise a negative error value
+ */
 int save_pci_variables(struct hfi1_devdata *dd)
 {
-	int ret = 0;
+	int ret;
 
 	ret = pci_read_config_dword(dd->pcidev, PCI_BASE_ADDRESS_0,
 				    &dd->pcibar0);
@@ -441,7 +449,7 @@ int save_pci_variables(struct hfi1_devdata *dd)
 
 error:
 	dd_dev_err(dd, "Unable to read from PCI config\n");
-	return ret;
+	return pcibios_err_to_errno(ret);
 }
 
 /*
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
