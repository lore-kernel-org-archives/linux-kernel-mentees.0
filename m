Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC010C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:13:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4AD160E76
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4AD160E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 800B660F0E;
	Thu, 21 Oct 2021 15:13:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MzoDWvwmmbJ0; Thu, 21 Oct 2021 15:13:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BAA6060628;
	Thu, 21 Oct 2021 15:13:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99901C001C;
	Thu, 21 Oct 2021 15:13:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 230D8C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11A3383B61
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5DdoOismkYL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B11583AFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:13:00 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id np13so722320pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oxis35XdZSIgJr6mklaAXMEQHUEVDMfz+GZuoz2m4I8=;
 b=Ta4YqYD2dK9OeXNp0Zf5sqRkd/eq5kKd9TKeSc7ykHYSyvg+AeeiCKrpVUASKxVcXO
 wuH+KY5fSV9Rhi36wDSxclOzZMA6090dku+9uOweOzeA4m39Dgz6EJUhy8n9yDMp+1KC
 SrTnIXPKdqLyR66BLKwc4N3B5KxF9II83/rFNd6rgtirT/4w7EXj9vsWCbX9F5wBW2ku
 /UQOume5egEv4+YxSu4FzEVM1Qxp45HdhQhDdjxsrqOHs1/RLA/XUbzt+JhP/CpVACS1
 UsFbILyL6AsKSmf9oIRbEfDOommGYts92I3339GreiSSCGk50bjRKc/mjm9qwN4MTtrH
 EHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxis35XdZSIgJr6mklaAXMEQHUEVDMfz+GZuoz2m4I8=;
 b=o2jMBjmMWWKAO8l1c8owARB709TkNKEsQH+AeInBJBMv+aAPZPRpMcYE1fRVw0WH/J
 IwLNiD2YBxjPNjiIf0Eb1ZcpWIGSju8wkXI4/3f5O9KzhU/LKqS2AQUI1x1iRybxGcXP
 8w2g0bdzY8DzcXBkuFZJhDcOb67+l6zyA8FtRDbuIO9fsoxsULqfrrIjDmfWfa9AmrMp
 aSwGZWezLFsjMJyGGu0X6dow+8/ddA1YAvwNa51szvWILkpLFsurHDS7/SQQqGWPPqIq
 MGv5Yw+xBMSgv0OwcYTthurgJNtsWhnWurH8P5ix+Q5Jrj5x157PtiWIMmtyJOKmfxFP
 tGsg==
X-Gm-Message-State: AOAM533SRu5b8F4wK4M6vxps0rXixAUvM80Sj5BSrLzN96895oZxSE0S
 +iwIyGFMDKHHyiZfS3h2T0A=
X-Google-Smtp-Source: ABdhPJzgNhh6rQx1sqeey1CJfymo8XrBMm/8GD27m8WuMW3TcimDLTespjy/AzEL2p0EjasNmaE0yw==
X-Received: by 2002:a17:90b:388c:: with SMTP id
 mu12mr7323134pjb.146.1634829179947; 
 Thu, 21 Oct 2021 08:12:59 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:12:59 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 13/25] PCI: altera: Remove redundant error fabrication when
 device read fails
Date: Thu, 21 Oct 2021 20:37:38 +0530
Message-Id: <4a195807b993aa709d08e621c821fbf0c353f33a.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Joyce Ooi <joyce.ooi@intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error. There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

The host controller drivers sets the error response values (~0) and
returns an error when faulty hardware read occurs. But the error
response value (~0) is already being set in PCI_OP_READ and
PCI_USER_READ_CONFIG whenever a read by host controller driver fails.

Thus, it's no longer necessary for the host controller drivers to
fabricate any error response.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/pcie-altera.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
index 2513e9363236..a6bdf9aff833 100644
--- a/drivers/pci/controller/pcie-altera.c
+++ b/drivers/pci/controller/pcie-altera.c
@@ -510,10 +510,8 @@ static int altera_pcie_cfg_read(struct pci_bus *bus, unsigned int devfn,
 	if (altera_pcie_hide_rc_bar(bus, devfn, where))
 		return PCIBIOS_BAD_REGISTER_NUMBER;
 
-	if (!altera_pcie_valid_device(pcie, bus, PCI_SLOT(devfn))) {
-		*value = 0xffffffff;
+	if (!altera_pcie_valid_device(pcie, bus, PCI_SLOT(devfn)))
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	return _altera_pcie_cfg_read(pcie, bus->number, devfn, where, size,
 				     value);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
