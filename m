Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12858C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 21:23:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F38422CE3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 21:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F38422CE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4AA4B87A1E;
	Fri,  4 Dec 2020 21:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Em6e47aHA93O; Fri,  4 Dec 2020 21:23:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B8878797A;
	Fri,  4 Dec 2020 21:23:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A77DC0FA7;
	Fri,  4 Dec 2020 21:23:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 560A7C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 21:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5231187F85
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 21:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgQale0cTLS9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 21:23:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BAB2987E81
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 21:23:00 +0000 (UTC)
Date: Fri, 4 Dec 2020 15:22:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607116980;
 bh=PkJF33JVKECCkm4TMuSlA11u1wCMOpDxOVCEtMn7/uY=;
 h=From:To:Cc:Subject:In-Reply-To:From;
 b=XCFYmQEhPZ/IoUVxofjWjhQQNe+Jiu3eTDE/rzyEsUDncdabkVFgHsyA0WBNLg9Mi
 FHcCwOVEQB+772rLWBl3ih3eQ48Ci6KyBsfxB+ZRCYqVRNXubCuDpzE+pmg7dwOlW9
 oCkvaPR6ubc5TvscuRD64786yuvJOH/+jrLtc9JpDGrsagu+iMi/bBHZ4VdcTERa25
 9YFLStzgAFnuhw9JiMSFlvNFR2Ga259sKD3ODNZqzcGHNRRAeyvf9M0f8j5nIIFn6O
 WVbFPU0jyqdwrNwl6bhqjIJJqV7/yYLSfCPMEVqHd3zRQT5bpjr9/7P0w1mgiK2orB
 5dYZtzTjignvg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Message-ID: <20201204212258.GA1965139@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201129164626.12887-1-puranjay12@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] PCI: Return u8 from
	pci_find_capability()
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

I also propose this follow-on patch to do the same for the extended
capabilities:

commit ee8b1c478a9f ("PCI: Return u16 from pci_find_ext_capability() and similar")
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Fri Dec 4 15:14:07 2020 -0600

    PCI: Return u16 from pci_find_ext_capability() and similar
    
    PCI Express Extended Capabilities are in config space between offsets 256
    and 4K.  These offsets all fit in 16 bits.
    
    Change the return type of pci_find_ext_capability() and supporting
    functions from int to u16 to match the specification.  Many callers use
    "int", which is fine, but there's no need to store more than a u16.
    
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b3761e98377b..85cb873266d3 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -527,11 +527,11 @@ EXPORT_SYMBOL(pci_bus_find_capability);
  * not support it.  Some capabilities can occur several times, e.g., the
  * vendor-specific capability, and this provides a way to find them all.
  */
-int pci_find_next_ext_capability(struct pci_dev *dev, int start, int cap)
+u16 pci_find_next_ext_capability(struct pci_dev *dev, u16 start, int cap)
 {
 	u32 header;
 	int ttl;
-	int pos = PCI_CFG_SPACE_SIZE;
+	u16 pos = PCI_CFG_SPACE_SIZE;
 
 	/* minimum 8 bytes per capability */
 	ttl = (PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) / 8;
@@ -582,7 +582,7 @@ EXPORT_SYMBOL_GPL(pci_find_next_ext_capability);
  *  %PCI_EXT_CAP_ID_DSN		Device Serial Number
  *  %PCI_EXT_CAP_ID_PWR		Power Budgeting
  */
-int pci_find_ext_capability(struct pci_dev *dev, int cap)
+u16 pci_find_ext_capability(struct pci_dev *dev, int cap)
 {
 	return pci_find_next_ext_capability(dev, 0, cap);
 }
diff --git a/include/linux/pci.h b/include/linux/pci.h
index e615f8abdd79..441e5753da0c 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -381,7 +381,7 @@ struct pci_dev {
 	struct pcie_link_state	*link_state;	/* ASPM link state */
 	unsigned int	ltr_path:1;	/* Latency Tolerance Reporting
 					   supported from root to here */
-	int		l1ss;		/* L1SS Capability pointer */
+	u16		l1ss;		/* L1SS Capability pointer */
 #endif
 	unsigned int	eetlp_prefix_path:1;	/* End-to-End TLP Prefix */
 
@@ -1069,8 +1069,8 @@ u8 pci_find_capability(struct pci_dev *dev, int cap);
 u8 pci_find_next_capability(struct pci_dev *dev, u8 pos, int cap);
 u8 pci_find_ht_capability(struct pci_dev *dev, int ht_cap);
 u8 pci_find_next_ht_capability(struct pci_dev *dev, u8 pos, int ht_cap);
-int pci_find_ext_capability(struct pci_dev *dev, int cap);
-int pci_find_next_ext_capability(struct pci_dev *dev, int pos, int cap);
+u16 pci_find_ext_capability(struct pci_dev *dev, int cap);
+u16 pci_find_next_ext_capability(struct pci_dev *dev, u16 pos, int cap);
 struct pci_bus *pci_find_next_bus(const struct pci_bus *from);
 
 u64 pci_get_dsn(struct pci_dev *dev);
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
