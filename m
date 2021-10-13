Return-Path: <SRS0=TY1r=PB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F444C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 02:44:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2835360F3A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 02:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2835360F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECCE9607C3;
	Wed, 13 Oct 2021 02:44:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84Kw-YvX6ZWR; Wed, 13 Oct 2021 02:44:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 194C6600B5;
	Wed, 13 Oct 2021 02:44:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 003D0C0011;
	Wed, 13 Oct 2021 02:43:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1AEEC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 02:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5E5E828F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 02:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzDU-gtILSmA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 02:43:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39C0B828F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 02:43:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CAF460F38;
 Wed, 13 Oct 2021 02:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634093037;
 bh=uWF2h7wVwbhN8R7YBCXFrfY9XfSneeNPhl9j7cDE2Eg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=D+wndaYugsj0a/KFWj6jNfG705tzZ2S8OvWtV5jg0htFcEJYGSnVD709jkZ+01kdn
 CRQ07wIquGb02knjyBWRm6YpN2oLCOXlOJH0+V1Yth06b1vllZvSgdhLCoIlBC9TfR
 CVi1kPJMPu13cBZceSWDQdmJOVegGM2J/dQqkBU4kdOKsd+2zTRmszOuTZdvfKNsLp
 bGFWyLvvrjlSBY1RmNOfqpopNq400+lz6Oe+FXcmyYEaZ4mugnq5l+wap0Q7ruO2kt
 xtV1K/iXdHVR+1T1QeZ4KykNenNwP6Nle3g5pdKVX9FHTvRobBXc9rQvC3Dk3DxV1s
 xKfNOhbxPqO6g==
Date: Tue, 12 Oct 2021 21:43:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/22] PCI: Unify PCI error response checking
Message-ID: <20211013024355.GA1865721@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YWS1QtNJh7vPCftH@robh.at.kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, bhelgaas@google.com,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
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

[+cc Pali]

On Mon, Oct 11, 2021 at 05:05:54PM -0500, Rob Herring wrote:
> On Mon, Oct 11, 2021 at 11:08:32PM +0530, Naveen Naidu wrote:
> > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > causes a PCI error.  There's no real data to return to satisfy the
> > CPU read, so most hardware fabricates ~0 data.
> > 
> > Use SET_PCI_ERROR_RESPONSE() to set the error response and
> > RESPONSE_IS_PCI_ERROR() to check the error response during hardware
> > read.
> > 
> > These definitions make error checks consistent and easier to find.
> > 
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  drivers/pci/access.c | 22 +++++++++++-----------
> >  1 file changed, 11 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> > index 46935695cfb9..e1954bbbd137 100644
> > --- a/drivers/pci/access.c
> > +++ b/drivers/pci/access.c
> > @@ -81,7 +81,7 @@ int pci_generic_config_read(struct pci_bus *bus, unsigned int devfn,
> >  
> >  	addr = bus->ops->map_bus(bus, devfn, where);
> >  	if (!addr) {
> > -		*val = ~0;
> > +		SET_PCI_ERROR_RESPONSE(val);
> 
> This to me doesn't look like kernel style. I'd rather see a define 
> replace just '~0', but I defer to Bjorn.
> 
> >  		return PCIBIOS_DEVICE_NOT_FOUND;
> 
> Neither does this using custom error codes rather than standard Linux 
> errno. I point this out as I that's were I'd start with the config 
> accessors. Though there are lots of occurrences so we'd need a way to do 
> this in manageable steps.

I would love to see PCIBIOS_* confined to arch/x86 and everywhere else
using standard Linux error codes.  That's probably a lot of work, but
Naveen has a lot of energy :)

> Can't we make PCI_OP_READ and PCI_USER_READ_CONFIG set the data value 
> and delete the drivers all doing this? Then we have 2 copies (in source) 
> rather than the many this series modifies. Though I'm not sure if there 
> are other cases of calling pci_bus.ops.read() which expect to get ~0.

That does seem like a really good idea.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
