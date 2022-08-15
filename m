Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24467C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 06:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 951C84049F;
	Mon, 15 Aug 2022 06:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 951C84049F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dOLsO0eW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DOFkUMQKjBU8; Mon, 15 Aug 2022 06:37:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 887E840146;
	Mon, 15 Aug 2022 06:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 887E840146
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4158EC0032;
	Mon, 15 Aug 2022 06:37:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89EACC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 06:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FD6E415D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 06:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FD6E415D0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=dOLsO0eW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8Qgpnsmk-j8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 06:37:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1CC2415B5
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1CC2415B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 06:37:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC945B80C82;
 Mon, 15 Aug 2022 06:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743EAC433D7;
 Mon, 15 Aug 2022 06:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660545468;
 bh=i3Lhu29DAuR1+5toOtx6WUN5Q9/XjYipUqxecRURQhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dOLsO0eWL1louTh1erlzYfiyxe3e1GCuC6rITTMB6BAFW0KYj4VI2sod/q921wwgf
 qgeNPTQAt9VclhBL3OLkn0QO3EDriXGrjbiBwZf5gf4gjsOO8njLu3nhbLUBuuPqQE
 mSU/BTQYvSJzrPgD6m1fVkeJrGXt3Yx+Tzq0GG6U=
Date: Mon, 15 Aug 2022 08:37:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Message-ID: <YvnpuK8phVyF7053@kroah.com>
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
 <YvjEIjXg7KxtTT/0@kroah.com>
 <cc6560c3-98c2-bdb5-cfc3-b39d3675382e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc6560c3-98c2-bdb5-cfc3-b39d3675382e@gmail.com>
Cc: alsa-devel@alsa-project.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>
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

On Mon, Aug 15, 2022 at 10:08:07AM +0600, Khalid Masum wrote:
> On 8/14/22 15:45, Greg KH wrote:
> > On Sun, Aug 14, 2022 at 02:04:15PM +0600, Khalid Masum wrote:
> > > According to the TODO, In sw_bus_master_add, bus->multi_link is to be
> > > populated with properties from FW node props. Make this happen by
> > > creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use
> > > the flag to store the multi_link value from intel_link_startup. Use
> > > this flag to initialize bus->multi_link.
> > > 
> > > Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> > > ---
> > > I do not think adding a new flag for fwnode_handle is a good idea.
> > > So, what would be the best way to initialize bus->multilink with
> > > fwnode props?
> > > 
> > >    -- Khalid Masum
> > > 
> > >   drivers/soundwire/bus.c   | 4 ++--
> > >   drivers/soundwire/intel.c | 1 +
> > >   include/linux/fwnode.h    | 1 +
> > >   3 files changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> > > index a2bfb0434a67..80df1672c60b 100644
> > > --- a/drivers/soundwire/bus.c
> > > +++ b/drivers/soundwire/bus.c
> > > @@ -74,9 +74,9 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
> > >   	/*
> > >   	 * Initialize multi_link flag
> > > -	 * TODO: populate this flag by reading property from FW node
> > >   	 */
> > > -	bus->multi_link = false;
> > > +	bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
> > > +		== FWNODE_FLAG_MULTI_LINKED;

I missed that this was an if statement here, please write this to be
more obvious and readable.

> > >   	if (bus->ops->read_prop) {
> > >   		ret = bus->ops->read_prop(bus);
> > >   		if (ret < 0) {
> > > diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> > > index 505c5ef061e3..034d1c523ddf 100644
> > > --- a/drivers/soundwire/intel.c
> > > +++ b/drivers/soundwire/intel.c
> > > @@ -1347,6 +1347,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
> > >   		 */
> > >   		bus->multi_link = true;
> > >   		bus->hw_sync_min_links = 1;
> > > +		dev->fwnode->flags |= FWNODE_FLAG_MULTI_LINKED;
> > >   	}
> > >   	/* Initialize shim, controller */
> > > diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
> > > index 9a81c4410b9f..446a52744953 100644
> > > --- a/include/linux/fwnode.h
> > > +++ b/include/linux/fwnode.h
> > > @@ -32,6 +32,7 @@ struct device;
> > >   #define FWNODE_FLAG_NOT_DEVICE			BIT(1)
> > >   #define FWNODE_FLAG_INITIALIZED			BIT(2)
> > >   #define FWNODE_FLAG_NEEDS_CHILD_BOUND_ON_ADD	BIT(3)
> > > +#define FWNODE_FLAG_MULTI_LINKED		BIT(4)
> > 
> > What does this commit actually change?
> 
> The new flag will lets us save if the device has multilink in fwnode_handle
> whenever needed.
> Then for soundwire/intel, save the multi_link flag into fwnode during
> startup.
> Later at master_add, as written in todo, initialize the multilink flag with
> fwnode's flag property.

And what does that allow to happen?  What changes with all of this?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
