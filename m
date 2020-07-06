Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0DAC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 10:32:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 626B92073E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 10:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlFSHDDG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 626B92073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5754E8737C;
	Mon,  6 Jul 2020 10:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2UwT0X0PFSl; Mon,  6 Jul 2020 10:32:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F07FA86FFF;
	Mon,  6 Jul 2020 10:32:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBA86C0891;
	Mon,  6 Jul 2020 10:32:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E98B1C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2E1382000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3wgKXhKtoVEy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:32:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 1D7B322234
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:32:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q15so38663519wmj.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 03:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y2WTHkWkBXP6KtKrUoVpSxGPEmpKkWatEbS8g3/VmJo=;
 b=OlFSHDDGHR404dT/3kL3jkvo2plJxDWWyyh5OnhIzyStXIKsAN3fusRdId3t/uXxuk
 XkBKy46pRsqU9PQkmDYPUyW8cJKpws5VFHqPD21/g3auLB1fAe91aftmO1NROt+5rX9/
 HnFtbi9p7NE4O17V0BYdylfx8t4JmC46/pRqy0igdV/JuNkj0dZ5wMRNC5vE/vq9O7aS
 ZvAdxzPQ2I5W3j5JcwPdaenpq5X+kqHA1cZZBbqg9q51oDlMu8zUb7JS77ZpJTG5+Io+
 /I+rP8ZSMqUOV2RgSJaXEdwuzTVT9r5YZUN17vJrVUi2fRWLzT09/JPl5mlw67YcYpdb
 fAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y2WTHkWkBXP6KtKrUoVpSxGPEmpKkWatEbS8g3/VmJo=;
 b=fX06nMB5Zq90PQZOS6MgsYx+Z2TIg4S7zeviIQZdAA7OOkoI2l5eMVGwaCGX3aDrkR
 sL2WGOnMdXGDhGV22Eya9/mhTHY1XoXZ9uexQ8yQWqHvEqAyxatTOz6r8XEj/UggM1tj
 CS+ebwhehcqlAllW22/kf41AYFdgLTN9i4S75RBDXDrXmy5p7H19ekXKdlrmD5HoowkQ
 ginxNIdd4A/bYB1BP44IOjcObZrW60r/KtqppQpDbu/dDckvqqYUWhtx1kFh6TnAZ2T2
 BwBZJI/SgEDJrq5F+gPEEFvaEuWsmtQdWdOyB8mcaHG92DnM0+oM3OltUxhqq7TjYV/f
 MZ7w==
X-Gm-Message-State: AOAM530lje5ijbqZXSKHN4vzjdSuOW5BXy6MntgqwAwVdvCZwaHPyJQO
 NSdLOcIWWlXwueW5v/HSVsQ=
X-Google-Smtp-Source: ABdhPJxxifR3mv9mSzpOkdU4f8tnrsoDL5lEYmVLzuSjsTXhcamBJ4SbMlRPvrxl21FVX2sNVimeLg==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr47188051wmf.87.1594031523459; 
 Mon, 06 Jul 2020 03:32:03 -0700 (PDT)
Received: from net.saheed (51B7C2DF.dsl.pool.telekom.hu. [81.183.194.223])
 by smtp.gmail.com with ESMTPSA id 22sm24216859wmb.11.2020.07.06.03.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 03:32:02 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Mon,  6 Jul 2020 11:31:21 +0200
Message-Id: <20200706093121.9731-12-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200706093121.9731-1-refactormyself@gmail.com>
References: <20200706093121.9731-1-refactormyself@gmail.com>
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Jason Gunthorpe <jgg@ziepe.ca>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Len Brown Lukas Wunner <"lenb@kernel.orglukas"@wunner.de>,
 linux-acpi@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
 Russell Currey <ruscur@russell.cc>, linux-pci@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-rdma@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 11/11 RFC] PCI: Remove "*val = 0"
	from pcie_capability_read_*()
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

 **TODO**

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
This patch  depends on all of the preceeding patches in this series,
otherwise it will introduce bugs as pointed out in the commit message
of each.
 drivers/pci/access.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index 79c4a2ef269a..ec95edbb1ac8 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -413,13 +413,6 @@ int pcie_capability_read_word(struct pci_dev *dev, int pos, u16 *val)
 
 	if (pcie_capability_reg_implemented(dev, pos)) {
 		ret = pci_read_config_word(dev, pci_pcie_cap(dev) + pos, val);
-		/*
-		 * Reset *val to 0 if pci_read_config_word() fails, it may
-		 * have been written as 0xFFFF if hardware error happens
-		 * during pci_read_config_word().
-		 */
-		if (ret)
-			*val = 0;
 		return ret;
 	}
 
@@ -448,13 +441,6 @@ int pcie_capability_read_dword(struct pci_dev *dev, int pos, u32 *val)
 
 	if (pcie_capability_reg_implemented(dev, pos)) {
 		ret = pci_read_config_dword(dev, pci_pcie_cap(dev) + pos, val);
-		/*
-		 * Reset *val to 0 if pci_read_config_dword() fails, it may
-		 * have been written as 0xFFFFFFFF if hardware error happens
-		 * during pci_read_config_dword().
-		 */
-		if (ret)
-			*val = 0;
 		return ret;
 	}
 
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
