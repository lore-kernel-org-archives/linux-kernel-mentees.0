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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F41C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 279C020739
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAHhr86L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 279C020739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E87B7889EC;
	Mon, 15 Jun 2020 08:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKemkuy6k5BN; Mon, 15 Jun 2020 08:32:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 77D618898B;
	Mon, 15 Jun 2020 08:32:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6927BC0888;
	Mon, 15 Jun 2020 08:32:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2101EC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0F919870ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SGfflJuf2nec
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3EA7587097
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x14so16146948wrp.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 01:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=E7c3us/Xdo7gpPBkK7+mW2slrEL0thvCYN6BbFEa5oU=;
 b=RAHhr86L5TxO7qa82JTPVxEl0mGBrpvxFjlmM+EiQBZhgH8Nw+TSXs48wV3k2C82Hh
 BczCJeydJaFzprQ/NO832n8R5X8noWsFYYXOzXlZ84QG/GqRYDEjiNT7QQ6FUq5FHWsV
 HtDu0Vioe3hbYRYGV59vkpy83ObtztOEPSk3z5f6OJjW+UJS/v4ukLWGsMKO2drC7afQ
 cVCG7WZPaeJ6p9V4NJ2xZiHwzaCkGt9C5EZu1PWjn4mZWeOP+wYD+BFoMFkt0FWIG0TT
 bkN8+cgiXoLZaG+KLmISc0zVjoAs14x8B9AKHJgTwj/sj38ohGe6QyuU4z9Ugx3Qtvy3
 Lo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=E7c3us/Xdo7gpPBkK7+mW2slrEL0thvCYN6BbFEa5oU=;
 b=PHkBshd2mEBI2UhDt7MunlmYSHRI585qFYoLOwOwCHm20+B9U+rMJkOjx4Uly5MOwg
 fwkhdAp02coswQPpWRKFhZOJhfyhI6FQu9UXwi4IEft0bVsacb6G7xP1WyoPgytImhWz
 8B/86TorC5wrr3165o0hM1Q3Bj4h8S5NPT+T26V8+uZ2jKaDfYobuLG6x2/evOx7thcd
 QSBURjbnulsCcCd+FZCLPzHc0x4mATuYzMZsnSivfh7YuUGiw5Wowth4pCxKNh+XqyGb
 jTM0ObH6zSi79ggr6kWz06qr07aS5Ng0zlwurRctWaypf1xHXX945d1/rpgKpCcX1lN7
 bosg==
X-Gm-Message-State: AOAM531oK69RMgXv8Dgoolm+KflWBJn9qL6KFuZ9g/kk9YQn5MTIz2Jn
 7c6qQEPkgj6RlJeLaSQldWc=
X-Google-Smtp-Source: ABdhPJyC/eAZEu3qZ+O+V+6SdJaepuhbRuoOUAqjH0NTA1yqfiGMIBoQbTQ/8Q8bouEQaYl+z8yCpw==
X-Received: by 2002:a5d:4f81:: with SMTP id d1mr29018002wru.95.1592209941717; 
 Mon, 15 Jun 2020 01:32:21 -0700 (PDT)
Received: from net.saheed (54006BB0.dsl.pool.telekom.hu. [84.0.107.176])
 by smtp.gmail.com with ESMTPSA id z206sm21954745wmg.30.2020.06.15.01.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 01:32:21 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Date: Mon, 15 Jun 2020 09:32:19 +0200
Message-Id: <20200615073225.24061-3-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200615073225.24061-1-refactormyself@gmail.com>
References: <20200615073225.24061-1-refactormyself@gmail.com>
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>, linux-rdma@vger.kernel.org,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 2/8] IB/hfi1: Convert PCIBIOS_*
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

pcie_speeds() returns PCIBIOS_ error codes from PCIe capability accessors.

PCIBIOS_ error codes have positive values. Passing on these values is
inconsistent with functions which return only a negative value on failure.

Before passing on the return value of PCIe capability accessors, call
pcibios_err_to_errno() to convert any positive PCIBIOS_ error codes to
negative generic error values.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/infiniband/hw/hfi1/pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hfi1/pcie.c b/drivers/infiniband/hw/hfi1/pcie.c
index 1a6268d61977..eb53781d0c6a 100644
--- a/drivers/infiniband/hw/hfi1/pcie.c
+++ b/drivers/infiniband/hw/hfi1/pcie.c
@@ -306,7 +306,7 @@ int pcie_speeds(struct hfi1_devdata *dd)
 	ret = pcie_capability_read_dword(dd->pcidev, PCI_EXP_LNKCAP, &linkcap);
 	if (ret) {
 		dd_dev_err(dd, "Unable to read from PCI config\n");
-		return ret;
+		return pcibios_err_to_errno(ret);
 	}
 
 	if ((linkcap & PCI_EXP_LNKCAP_SLS) != PCI_EXP_LNKCAP_SLS_8_0GB) {
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
