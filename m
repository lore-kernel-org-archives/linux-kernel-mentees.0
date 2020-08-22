Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561B6C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ABEA2086A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rR06E+lm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ABEA2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E7B9C84E49;
	Sat, 22 Aug 2020 21:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0E31GR4I2B67; Sat, 22 Aug 2020 21:03:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E6AB384E5D;
	Sat, 22 Aug 2020 21:03:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E33F0C07FF;
	Sat, 22 Aug 2020 21:03:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19C66C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0454688378
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBMcff3okyci
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 377F08816B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r15so5008974wrp.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5NgdVefAozHZlgVm+Dl4HA3ohniok2u/igm0neSHIZ8=;
 b=rR06E+lmHt0xvDz8IQdmsVhZZlwxCImrrEK3Tl6Bu5moY7Po6cs3SsXxGhKRS+L1Zh
 Vv7/pp+/mcFKqnxYoQvDtiZ7jjAhCkg2WNvM4J+sybQM1Z8+JNZ4ty7AJMMt0J7Yks9t
 DhWZWfAwZfv/I2iXkUqNIHxYW3ffrWENN5z1VbCtJVg/W4t5DxnTONvcViFtYIg368uH
 fYv5kDf2XrO/iV5sDyiG1XwSBta3azosBC7kUSAV04JwsSWZKleGDL73O1RmF/nj4Uyi
 MQC7h0eLS6AbbS6aFXI3aV26fFvkcZCBpoR6PTyyXhY0jAMYoTi1he7i1ouBMqAejEpy
 MOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5NgdVefAozHZlgVm+Dl4HA3ohniok2u/igm0neSHIZ8=;
 b=qSybFzCIkNjGTP1olwqI8t228nAqB6FxfEKVb6ramGeRjzChTCL7S4F8oTRFiwu1ns
 Rx805cbLCnK2kCCPg89PXVIY/xJ/rSB4JGZDpYJnBoWQaduc7ADDv1DD+a/LyUA+ztQ3
 xFKLwVZgWybFUrdffx7WUE66INNHAgveAE/DCgvctif5dLtq5LKRYfNRo8ldQ2GGXWZs
 ItX/TuGo0qsp90zlbO12BnmGPwBRTdTHfbZCIWjii686mWqAUGoOKobz17VyI572Spp9
 vJ8QfYmqtxZKnliaJhVlPBqrW/HxydnlKqu20Jbyf3BdLIGpZko6UoRoxVs8Tkvy89vT
 mMNw==
X-Gm-Message-State: AOAM531MtJwdgv1d4kHTw/++mhLX+6d0g2U8jzyLtHsHNh/E0A1S7dke
 PnyCDHYtNgMWH2aWiXRkrOU=
X-Google-Smtp-Source: ABdhPJxgQbpUdDLdZzZmU2Hpaa4oNwIS/m+2CSzz4CfWKpSP+XOVlk2ykD+sR+KvHv0+eK53/paubA==
X-Received: by 2002:adf:a102:: with SMTP id o2mr8153257wro.319.1598130217597; 
 Sat, 22 Aug 2020 14:03:37 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:37 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:37 +0200
Message-Id: <20200822200358.252967-3-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 02/23] PCI: Add l1ss_cap and
	l1ss_cap_ptr to struct pci_dev
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

 - Add l1ss_cap and l1ss_cap_ptr to struct pci_dev
 - Compute the value of pci_dev.l1ss_cap and pci_dev.l1ss_cap_ptr

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/probe.c | 6 ++++++
 include/linux/pci.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 6cae7230f3b5..787ab6e831c7 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2101,6 +2101,12 @@ static void pci_configure_ltr(struct pci_dev *dev)
 	if (!pci_is_pcie(dev))
 		return;
 
+	/* Read L1 PM substate capabilities */
+	dev->l1ss_cap_ptr = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_L1SS);
+	if (dev->l1ss_cap_ptr)
+		pci_read_config_dword(dev, dev->l1ss_cap_ptr + PCI_L1SS_CAP,
+								&dev->l1ss_cap);
+
 	pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
 	if (!(cap & PCI_EXP_DEVCAP2_LTR))
 		return;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 3d30d3650ac9..fa114c5d01e7 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -381,6 +381,8 @@ struct pci_dev {
 	struct pcie_link_state	*link_state;	/* ASPM link state */
 	unsigned int	ltr_path:1;	/* Latency Tolerance Reporting
 					   supported from root to here */
+	int		l1ss_cap_ptr;	/* L1SS cap ptr, 0 if not supported */
+	u32		l1ss_cap;	/* L1 PM substate Capabilities */
 #endif
 	unsigned int	eetlp_prefix_path:1;	/* End-to-End TLP Prefix */
 
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
