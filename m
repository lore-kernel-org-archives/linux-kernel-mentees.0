Return-Path: <SRS0=ZpoD=BI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A7EC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 12:30:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A20A622BF3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 12:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiLcXo4h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A20A622BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 62CA68816C;
	Wed, 29 Jul 2020 12:30:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4IaF56P4Qfq; Wed, 29 Jul 2020 12:30:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA7558816D;
	Wed, 29 Jul 2020 12:30:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C43EFC004F;
	Wed, 29 Jul 2020 12:30:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFD84C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 12:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AB2E488172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 12:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VN0yJ-vX67KF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 12:30:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 981DB8816D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 12:30:04 +0000 (UTC)
Received: from localhost (unknown [166.175.62.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1AD562070B;
 Wed, 29 Jul 2020 12:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596025804;
 bh=5gdtqyYzHNXUduyS3z6Fo+0DDu3Naabec0c2Ib17zHE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=EiLcXo4hnqx4SVOp3nLa2QptpSC6bi46vKjrpt5NPK3l0Wsjs4XOeBNeL/YR6Np69
 w2WjOjcqTT8xxQV+08q4BZSbVKJ6YS5QsBbqdH0siXw07EwYYu52GKiTKLMpwNZwv0
 FJVtFbjbepPQv93Zol3/MdTF3A626eZvEAvmmjqU=
Date: Wed, 29 Jul 2020 07:29:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200729122954.GA1920458@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729101730.GA215923@gmail.com>
Cc: linux-kernel@vger.kernel.org, Kevin Curtis <kevin.curtis@farsite.co.uk>,
 netdev@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] farsync: use generic power
	management
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

On Wed, Jul 29, 2020 at 03:47:30PM +0530, Vaibhav Gupta wrote:
> On Tue, Jul 28, 2020 at 03:04:13PM -0500, Bjorn Helgaas wrote:
> > On Tue, Jul 28, 2020 at 09:58:10AM +0530, Vaibhav Gupta wrote:
> > > The .suspend() and .resume() callbacks are not defined for this driver.
> > > Still, their power management structure follows the legacy framework. To
> > > bring it under the generic framework, simply remove the binding of
> > > callbacks from "struct pci_driver".
> > 
> > FWIW, this commit log is slightly misleading because .suspend and
> > .resume are NULL by default, so this patch actually is a complete
> > no-op as far as code generation is concerned.
> > 
> > This change is worthwhile because it simplifies the code a little, but
> > it doesn't convert the driver from legacy to generic power management.
> > This driver doesn't supply a .pm structure, so it doesn't seem to do
> > *any* power management.
>
> Agreed. Actually, as their presence only causes PCI core to call
> pci_legacy_suspend/resume() for them, I thought that after removing
> the binding from "struct pci_driver", this driver qualifies to be
> grouped under genric framework, so used "use generic power
> management" for the heading.
> 
> I should have written "remove legacy bindning".

This removed the *mention* of fst_driver.suspend and fst_driver.resume,
which is important because we want to eventually remove those members
completely from struct pci_driver.

But fst_driver.suspend and fst_driver.resume *exist* before and after
this patch, and they're initialized to zero before and after this
patch.

Since they were zero before, and they're still zero after this patch,
the PCI core doesn't call pci_legacy_suspend/resume().  This patch
doesn't change that at all.

> But David has applied the patch, should I send a v2 or fix to update
> message?

No, I don't think David updates patches after he's applied them.  But
if the situation comes up again, you'll know how to describe it :)

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
