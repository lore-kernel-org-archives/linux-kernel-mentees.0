Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF747C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Dec 2021 20:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C736401E2;
	Wed,  8 Dec 2021 20:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxtbAzQpg1MV; Wed,  8 Dec 2021 20:16:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5684C400FC;
	Wed,  8 Dec 2021 20:16:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36A60C001E;
	Wed,  8 Dec 2021 20:16:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1467BC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 20:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA419409AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 20:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3sCwToFiwctc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 20:16:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1235140904
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 20:16:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85671B822B8;
 Wed,  8 Dec 2021 20:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48D7C00446;
 Wed,  8 Dec 2021 20:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638994600;
 bh=ObuOO5WhMAOnf9+coMNNdUrPXL9BF1wt2mjnxkUZUQk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=MKYapKUNIHxSlGKSnqD0tTLZYZd5p0t5E+i7kUhfp5BV1VLqwub9FhvAPtqRn8zvk
 x83/tp5i/Kqj7KZU0/fjrk+HSAlQ7PQN4tv12arprSRni4ajmv0NxLZ8Iqp4QNOoFq
 VemZgw+In9DbZaMQ93dwrH+Q+1KvAdRrroRxJakkHUXJE9PfrkT6Zm2BZaNVaXy1kE
 H9tQjytn0a+tVxq9H6Of+bqcEx0uDMZ0UXUhvm+MDfAG6pJK/qY3JWRD+CrunA1dec
 9KUtU21+HcSwe25gwmDLfFu6RsHXVf3ixugoYrxKfVZuF0aqI9/IgcVvaB0SC1CGv4
 XKkREC/87YLLA==
Date: Wed, 8 Dec 2021 14:16:38 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Dave Airlie <airlied@linux.ie>
Subject: Re: [PATCH v3 0/3] agp: convert to generic power management
Message-ID: <20211208201638.GA150092@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.2112081942330.32242@skynet-temp.skynet.ie>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
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

On Wed, Dec 08, 2021 at 07:55:08PM +0000, Dave Airlie wrote:
> On Wed, 8 Dec 2021, Bjorn Helgaas wrote:
> 
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Vaibhav has converted around 180 drivers to generic power management, and
> > over 100 of those conversions have made it upstream.  If we can finish off
> > the remaining ones, we'll be able to remove quite a bit of ugly legacy code
> > from the PCI core.
> > 
> > This is a repost of Vaibhav's patches for AGP.  I rebased them to v5.16-rc1
> > and updated the commit logs to try to make it easier to verify them.
> > 
> > In the most recent posting here:
> > 
> >   https://lore.kernel.org/linux-pci/20211201025419.2797624-1-helgaas@kernel.org/
> > 
> > my commit log updates were incorrect.  This v3 has updates that I believe
> > to be correct, but of course I'd be grateful for more corrections.
> 
> Hi Bjorn,
> 
> Do you want to merge these via your tree?
> 
> if so,
> Acked-by: Dave Airlie <airlied@redhat.com>

Either way is fine; I'll merge them to save you the trouble.  I put
them on pci/legacy-pm-removal for v5.17 with your ack.  Thanks!

> > Vaibhav Gupta (3):
> >   amd64-agp: convert to generic power management
> >   sis-agp: convert to generic power management
> >   via-agp: convert to generic power management
> > 
> >  drivers/char/agp/amd64-agp.c | 24 ++++++------------------
> >  drivers/char/agp/sis-agp.c   | 25 ++++++-------------------
> >  drivers/char/agp/via-agp.c   | 25 +++++--------------------
> >  3 files changed, 17 insertions(+), 57 deletions(-)
> > 
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
