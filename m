Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB440C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:43:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F20F21744
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:43:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Boub8lNC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F20F21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5E9572010D;
	Fri, 31 Jul 2020 12:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHsiCeDTpW35; Fri, 31 Jul 2020 12:43:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8B220203A3;
	Fri, 31 Jul 2020 12:43:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7765CC004F;
	Fri, 31 Jul 2020 12:43:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4240BC0864
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3612B86AB7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEZSb6Yup18L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:43:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6A01586AB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:43:16 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id o18so31264256eje.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 05:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Z7WaVDyC31Xqp9aG4vaiaHbvwp6b775oA7lj7CzrKBo=;
 b=Boub8lNC8OOZzaDP7HakRmCigQ9s+TmAZKT/FvTXISovow+eY1+3iv9s7tVr5dADQb
 tIF5zqqI08ULoL0yyrXmhoapYfXxmRW0lyX2RCJXcewDU1EB9xdyPBrZABXn08aJJ28c
 Ix6TlonWfWSChmEA3cZnWfApy3SwFu1s8TocFkM7yBDwtH78cBXTAF1xTDgYs+VIg8UE
 kcTAWODekL0CEEpa/XJHHc7Z1xM6Zm5QjgRxMYhQQz3mO4eSz2plfe9QNw1SAJHLLj1J
 ZA6BNEbFTnFQK6vaB1h+hfyveE/uv2QDJ4RmDfBaoT3ERtSvXRg9SGL9BruBwod71w3x
 jyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Z7WaVDyC31Xqp9aG4vaiaHbvwp6b775oA7lj7CzrKBo=;
 b=jqq+j4JaqlD999lSMXRSnvxJziPAgTK65APV/xDK+CNm9K2PQFgVIeT4W969X6cZ8F
 19hgBqhtgrX2pFRR7xpc3MmgdgD5hrp+k0PMO2CwOs0AzyvqaTvTOqoP8wDb6pknUQMT
 Sbqg+eQKm7+1AE0N9djmo7cOj5Uhs9+w/x5n3fpb+ymmGjM2PJVwE6fUPABQCMb5/WSD
 qt1cfA3DIVsW1F3H+EwKmns/IujETYY4jlan9DUHBSoMRQERIMfinOPu2/Uv7Il/o3Uy
 b4Dx0NqwNLPknYULSyQp/zEfZ1kWF+IaMomdG5fYsK7ybkSOTZSTE2zJHr27MU24SXKM
 SDFA==
X-Gm-Message-State: AOAM53299Y9bqsYynt5po0hPUfKms2z6nf+vdUVa1z4Feu6C4j2G8Mzv
 41kAXECZCASzMsYRdnpWbqE=
X-Google-Smtp-Source: ABdhPJz2I4wMlXEMP6P1KRM4mmo8+jpv64fXNEUIP720yCcVBp2o7uTyVYR6ab20bRx5VLVhSw6mFA==
X-Received: by 2002:a17:906:3281:: with SMTP id
 1mr3932259ejw.132.1596199394967; 
 Fri, 31 Jul 2020 05:43:14 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id g23sm8668514ejb.24.2020.07.31.05.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:43:14 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Fri, 31 Jul 2020 13:43:29 +0200
Message-Id: <20200731114329.100848-5-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200731114329.100848-1-refactormyself@gmail.com>
References: <20200731114329.100848-1-refactormyself@gmail.com>
Cc: linux-wireless@vger.kernel.org,
 QCA ath9k Development <ath9k-devel@qca.qualcomm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Russell Currey <ruscur@russell.cc>,
 linux-acpi@vger.kernel.org, linux-rdma@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 linux-pci@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@codeaurora.org>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH v4 12/12] PCI: Remove '*val = 0' from
	pcie_capability_read_*()
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

There are several reasons why a PCI capability read may fail whether the
device is present or not. If this happens, pcie_capability_read_*() will
return -EINVAL/PCIBIOS_BAD_REGISTER_NUMBER or PCIBIOS_DEVICE_NOT_FOUND
and *val is set to 0.

This behaviour if further ensured by this code inside
pcie_capability_read_*()

 ret = pci_read_config_dword(dev, pci_pcie_cap(dev) + pos, val);
 /*
  * Reset *val to 0 if pci_read_config_dword() fails, it may
  * have been written as 0xFFFFFFFF if hardware error happens
  * during pci_read_config_dword().
  */
 if (ret)
	 *val = 0;
 return ret;

a) Since all pci_generic_config_read() does is read a register value,
it may return success after reading a ~0 which *may* have been fabricated
by the PCI host bridge due to a read timeout. Hence pci_read_config_*()
will return success with a fabricated ~0 in *val, indicating a problem.
In this case, the assumed behaviour of  pcie_capability_read_*() will be
wrong. To avoid error slipping through, more checks are necessary.

b) pci_read_config_*() will return PCIBIOS_DEVICE_NOT_FOUND only if
dev->error_state = pci_channel_io_perm_failure (i.e.
pci_dev_is_disconnected()) or if pci_generic_config_read() can't find the
device. In both cases *val is initially set to ~0 but as shown in the code
above pcie_capability_read_*() resets it back to 0. Even with this effort,
drivers still have to perform validation checks more so if 0 is a valid
value.

Most drivers only consider the case (b) and in some cases, there is the
expectation that on timeout *val has a fabricated value of ~0, which *may*
not always be true as explained in (a).

In any case, checks need to be done to validate the value read and maybe
confirm which error has occurred. It is better left to the drivers to do.

Remove the reset of *val to 0 when pci_read_config_*() fails.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
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
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
