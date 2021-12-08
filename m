Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042CDC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Dec 2021 21:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D1EC831A0;
	Wed,  8 Dec 2021 21:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1SUgn8_uKhD1; Wed,  8 Dec 2021 21:21:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A6C8C82741;
	Wed,  8 Dec 2021 21:21:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85B1FC002F;
	Wed,  8 Dec 2021 21:21:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15D3CC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 21:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E50F540504
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 21:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0R00SFDX2ZLS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 21:21:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2041A404CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 21:21:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D7E09CE239B;
 Wed,  8 Dec 2021 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1040C00446;
 Wed,  8 Dec 2021 21:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638998479;
 bh=73Vl8RwVmilo4fD3Hf9e+Isj9nMRtlDaBdmSQJdZgOA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Uxizaj68TeaZ6luuiJ0NOsqU/zv65inqWQD15cM5rWXtnu49Tm/MWs7siom/aP6Mq
 DkdPBKgqjMJ227y1gsPhn1ixUW2pIENLJOVRgeBnSO473RxMsvMdkHJb7MacFhtm7r
 Ifk7VwgPTaI6fMAvZS4qJ0Or/FeoB9JeMIicSTZnF9qhSs1a9Hn9wotDK5bwwOak6X
 8W3GC7axKnyEagUWcYCB7bnAAUekJX4BO/Y1HNXAODFph2vEAjRLhUB9igH3e3QNDX
 /hCLfQPf/fQmqdP9q+uoSPI0INpYosQZZXfbnIR5pFv5K6oD4d7CLJPOlwyXFXgNvA
 B3PxdIDJV5BHQ==
Date: Wed, 8 Dec 2021 15:21:16 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Fan Fei <ffclaire1224@gmail.com>
Subject: Re: [PATCH 0/7] PCI: Prefer of_device_get_match_data() over
 of_match_device()
Message-ID: <20211208212116.GA162128@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211208205047.GA153767@bhelgaas>
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, Dec 08, 2021 at 02:50:47PM -0600, Bjorn Helgaas wrote:
> On Tue, Nov 23, 2021 at 04:37:55PM +0100, Fan Fei wrote:
> > Some drivers use of_match_device() in probe(), which returns a 
> > "struct of_device_id *". They need only the of_device_id.data member, so 
> > replace of_device_get_match_data() with of_match_device().
> > 
> > Fan Fei (7):
> >   PCI: altera: Prefer of_device_get_match_data() over of_match_device()
> >   PCI: cadence: Prefer of_device_get_match_data() over of_match_device()
> >   PCI: kirin: Prefer of_device_get_match_data() over of_match_device()
> >   PCI: dra7xx: Prefer of_device_get_match_data() over of_match_device()
> >   PCI: keystone: Prefer of_device_get_match_data() over
> >     of_match_device()
> >   PCI: artpec6: Prefer of_device_get_match_data() over of_match_device()
> >   PCI: dwc: Prefer of_device_get_match_data() over of_device_device()
> > 
> >  drivers/pci/controller/cadence/pcie-cadence-plat.c | 6 ++----
> >  drivers/pci/controller/dwc/pci-dra7xx.c            | 6 ++----
> >  drivers/pci/controller/dwc/pci-keystone.c          | 4 +---
> >  drivers/pci/controller/dwc/pcie-artpec6.c          | 6 ++----
> >  drivers/pci/controller/dwc/pcie-designware-plat.c  | 6 ++----
> >  drivers/pci/controller/dwc/pcie-kirin.c            | 6 ++----
> >  drivers/pci/controller/pcie-altera.c               | 8 ++++----
> >  7 files changed, 15 insertions(+), 27 deletions(-)
> 
> Applied to pci/driver-cleanup for v5.17, thank you, Fan!

Also applied the following patch since it's closely related.


commit 667c60afad25 ("PCI: j721e: Drop pointless of_device_get_match_data() cast")
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Wed Dec 8 15:18:20 2021 -0600

    PCI: j721e: Drop pointless of_device_get_match_data() cast
    
    of_device_get_match_data() returns "void *", so no cast is needed when
    assigning the result to a pointer type.  Drop the unnecessary cast.
    
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 918e11082e6a..0aa1c184bd42 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -367,7 +367,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	data = (struct j721e_pcie_data *)of_device_get_match_data(dev);
+	data = of_device_get_match_data(dev);
 	if (!data)
 		return -EINVAL;
 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
