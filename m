Return-Path: <SRS0=UocX=PA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7B3C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Oct 2021 23:12:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC3E260E53
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Oct 2021 23:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC3E260E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C488E60C25;
	Tue, 12 Oct 2021 23:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hwc2WVhBhlEZ; Tue, 12 Oct 2021 23:12:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2CC5560737;
	Tue, 12 Oct 2021 23:12:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11D5DC000F;
	Tue, 12 Oct 2021 23:12:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1AF8C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 23:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D256382907
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 23:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOUvHtuU-uZZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 23:12:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D07A828F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 23:12:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AC8A60C49;
 Tue, 12 Oct 2021 23:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634080324;
 bh=XqxlPp6YkN/WfuyoQ/c4x1VlZQyfuu5pa8exw8RscaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jdFYDK5QGubWgrvW5Hj9GLJ3T8+p4EkaPRYileJCu4dc06QLkKtJkWtWej+ANZTvG
 /reHq7mNkzEyWunsPNpVSRnZrnqYaaAjLn53xDnSgQmC5leZLXvsMhEmeOBt+Be1GV
 2NOph/7YdMT/a0shKsXNDy57o+LC+ZXuo+aJigxGVRhtdJnB+4/yIzQM/V1eRJLUlY
 5ckQOEX9qIcgMNS2YoAgSLREla4ghiZ/yDXRAysVyACjqr+mxrhv/oKKvabPVf0Hmd
 2rz2bGLth2UJ2dysQfm6F+t6gVRr9BUDy71iwhoNj9R/R/czw9e/VLH9nj7NjHAZHY
 5mYb2UjzixkVw==
Received: by pali.im (Postfix)
 id 08EB67B4; Wed, 13 Oct 2021 01:12:01 +0200 (CEST)
Date: Wed, 13 Oct 2021 01:12:01 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH 16/22] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to check
 read from hardware
Message-ID: <20211012231201.xj7fvfgvpde5wwrl@pali>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
 <36c7c3005c4d86a6884b270807d84433a86c0953.1633972263.git.naveennaidu479@gmail.com>
 <20211011194740.GA14357@wunner.de>
 <20211012160505.3dov6gjnmxdq5lz6@theprophet>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211012160505.3dov6gjnmxdq5lz6@theprophet>
User-Agent: NeoMutt/20180716
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Tuesday 12 October 2021 21:35:13 Naveen Naidu wrote:
> On 11/10, Lukas Wunner wrote:
> > On Mon, Oct 11, 2021 at 11:37:33PM +0530, Naveen Naidu wrote:
> > > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > > causes a PCI error.  There's no real data to return to satisfy the
> > > CPU read, so most hardware fabricates ~0 data.
> > > 
> > > Use RESPONSE_IS_PCI_ERROR() to check the response we get when we read
> > > data from hardware.
> > 
> > Actually what happens is that PCI read transactions *time out*,
> > so the host controller fabricates a response.
> >
> 
> Ah! yes. Now that I look at it, RESPONSE_IS_PCI_TIMEOUT() does indeed
> seem like a better option to RESPONSE_IS_PCI_ERROR(), since it's more
> specfic and depicts the actual condition. 

This is not fully correct. 0xffffffff is returned when some error
happens. It does not have to be timeout error. Errors like Unsupported
Request, Completer Abort or Configuration Request Retry Status (when
CRSSVE bit is disabled) are also reported as 0xffffffff and they do not
represent timeout. For example Unsupported Request is returned when you
try to read from non-existent device behind some PCIe switch.

Also pci-aardvark.c fabricates value 0xffffffff when trying to read from
config space below the PCIe Root Port when PCIe link is not up.

And I have seen that Completer Abort was returned by PCIe switch when
switch itself did not received reply from device below switch. So it
means that controller can receive some reply from other device even when
no real reply was sent. Which means that timeout can be reported by some
other message.

So I think that generic PCI_ERROR is the best name. You do not know what
really happened (only some controller drivers can provide additional
information, it does not have any standard HW<-->OS API) and application
logic must decide how to process error.

> I'll wait for sometime and see if others have any objection/a better
> name for the macro and then redo the patch with that.
> 
> Thank you very much for the review ^^ 
> 
> > By contrast, a PCI *error* usually denotes an Uncorrectable or
> > Correctable Error as specified in section 6.2.2 of the PCIe Base Spec.
> > 
> > Thus something like RESPONSE_IS_PCI_TIMEOUT() or IS_PCI_TIMEOUT() would
> > probably be more appropriate.  I'll leave the exact bikeshed color for
> > others to decide. :-)
> > 
> > 
> > > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > > ---
> > >  drivers/pci/hotplug/pciehp_hpc.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > Acked-by: Lukas Wunner <lukas@wunner.de>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
