Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B5FC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 15:49:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93A3322464
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 15:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaQlvs/T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93A3322464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 53F8B892F3;
	Tue, 14 Jul 2020 15:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQefzpB33Z1S; Tue, 14 Jul 2020 15:49:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 19968892DD;
	Tue, 14 Jul 2020 15:49:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8391C0891;
	Tue, 14 Jul 2020 15:49:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABF55C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 15:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A03948A833
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 15:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjXtCSficgRa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 15:49:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 09D6E88A56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 15:49:45 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C781122464;
 Tue, 14 Jul 2020 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594741784;
 bh=Ulz6kftsIf17MgM1f0YQJELfS5NjvEeQg+27bJIWgUA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=EaQlvs/TC2yUjHJK6smf4ynxhvgNy5wlI9WFj7L3BfuTU4CDzmYYc6S17Kw23RlD1
 ane48ARw0DttiT5GA+ADF+3szgTdBi3G/NGuj6uqbXK7TbOGD28k/kXcKTsDcmnQ/H
 L4Vbv6eXEAxcd1xgmuHjECuy9pqpSHzJy0jUhojw=
Date: Tue, 14 Jul 2020 10:49:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
Message-ID: <20200714154941.GA396741@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714110445.32605-1-refactormyself@gmail.com>
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>, linux-rdma@vger.kernel.org,
 linux-pci@vger.kernel.org, Dennis Dalessandro <dennis.dalessandro@intel.com>,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/14 v4] PCI: Remove '*val = 0'
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Jul 14, 2020 at 01:04:42PM +0200, Saheed Olayemi Bolarinwa wrote:
> From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> ...

> Bolarinwa Olayemi Saheed (14):
>   IB/hfi1: Check the return value of pcie_capability_read_*()
>   misc: rtsx: Check the return value of pcie_capability_read_*()
>   ath9k: Check the return value of pcie_capability_read_*()
>   iwlegacy: Check the return value of pcie_capability_read_*()
>   PCI: pciehp: Check the return value of pcie_capability_read_*()
>   PCI: pciehp: Make "Power On" the default 
>   PCI: pciehp: Check the return value of pcie_capability_read_*()
>   PCI/ACPI: Check the return value of pcie_capability_read_*()
>   PCI: pciehp: Check the return value of pcie_capability_read_*()
>   PCI: Check the return value of pcie_capability_read_*()
>   PCI/PM: Check return value of pcie_capability_read_*()
>   PCI/AER: Check the return value of pcie_capability_read_*()
>   PCI/ASPM: Check the return value of pcie_capability_read_*()
>   PCI: Remove '*val = 0' from pcie_capability_read_*()

1) Let's slow down on posting patches.  We need time to think and have
a conversation about where we're going, and waking up to dozens of new
patches every day doesn't help.

2) This series claims to have 14 patches, but only 3 made it to the
list.  I don't know if the others were rejected for too many folks in
the cc: list or what.  If you only updated these 3, we will still want
the full set of 14 posted because it's too hard to collect 11 things
from v3 and 3 things from v4, etc.

  $ b4 am -om/ 20200714110445.32605-1-refactormyself@gmail.com
  Looking up https://lore.kernel.org/r/20200714110445.32605-1-refactormyself%40gmail.com
  Grabbing thread from lore.kernel.org/linux-kernel-mentees
  Analyzing 4 messages in the thread
  ---
  Thread incomplete, attempting to backfill
  Grabbing thread from lore.kernel.org/linux-rdma
  Grabbing thread from lore.kernel.org/lkml
  Grabbing thread from lore.kernel.org/linux-pci
  ---
  Writing m/v4_20200714_refactormyself_pci_remove_val_0_from_pcie_capability_read.mbx
    [PATCH 1/14 v4] IB/hfi1: Check the return value of pcie_capability_read_*()
    ERROR: missing [2/14]!
    ERROR: missing [3/14]!
    ERROR: missing [4/14]!
    ERROR: missing [5/14]!
    ERROR: missing [6/14]!
    ERROR: missing [7/14]!
    ERROR: missing [8/14]!
    ERROR: missing [9/14]!
    [PATCH 10/14 v4] PCI: Check return value of pcie_capability_read_*()
    [PATCH 11/14 v4] PCI/PM: Check return value of pcie_capability_read_*()
    ERROR: missing [12/14]!
    ERROR: missing [13/14]!
    ERROR: missing [14/14]!
  ---
  Total patches: 3
  ---
  WARNING: Thread incomplete!
  Cover: m/v4_20200714_refactormyself_pci_remove_val_0_from_pcie_capability_read.cover
   Link: https://lore.kernel.org/r/20200714110445.32605-1-refactormyself@gmail.com
   Base: not found
	 git am m/v4_20200714_refactormyself_pci_remove_val_0_from_pcie_capability_read.mbx

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
