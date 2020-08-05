Return-Path: <SRS0=4e7Y=BP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3A1C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 11:39:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0278622D00
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 11:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0278622D00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=localhost.localdomain
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D4A138659F;
	Wed,  5 Aug 2020 11:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZBM74kUMCJ9E; Wed,  5 Aug 2020 11:39:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 889A386582;
	Wed,  5 Aug 2020 11:39:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7744FC0051;
	Wed,  5 Aug 2020 11:39:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4BD4C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 11:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D42B2881A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 11:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHQq3n0A4IvJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 11:39:20 +0000 (UTC)
X-Greylist: delayed 00:54:44 by SQLgrey-1.7.6
Received: from smtp.tuxdriver.com (charlotte.tuxdriver.com [70.61.120.58])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1D28188192
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 11:39:20 +0000 (UTC)
Received: from [2605:a601:a627:ca00:664d:4b4b:674f:5257] (helo=localhost)
 by smtp.tuxdriver.com with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.63)
 (envelope-from <nhorman@tuxdriver.com>)
 id 1k3Gu7-0002qe-90; Wed, 05 Aug 2020 06:44:16 -0400
Date: Wed, 5 Aug 2020 06:44:09 -0400
From: Neil Horman <nhorman@localhost.localdomain>
To: David Miller <davem@davemloft.net>
Message-ID: <20200805104409.GA118086@localhost.localdomain>
References: <20200707171515.110818-1-izabela.bakollari@gmail.com>
 <20200804160908.46193-1-izabela.bakollari@gmail.com>
 <20200804.161414.149428114422381017.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804.161414.149428114422381017.davem@davemloft.net>
Cc: izabela.bakollari@gmail.com, nhorman@tuxdriver.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCHv2 net-next] dropwatch: Support
 monitoring of dropped frames
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

On Tue, Aug 04, 2020 at 04:14:14PM -0700, David Miller wrote:
> From: izabela.bakollari@gmail.com
> Date: Tue,  4 Aug 2020 18:09:08 +0200
> 
> > @@ -1315,6 +1334,53 @@ static int net_dm_cmd_trace(struct sk_buff *skb,
> >  	return -EOPNOTSUPP;
> >  }
> >  
> > +static int net_dm_interface_start(struct net *net, const char *ifname)
> > +{
> > +	struct net_device *nd = dev_get_by_name(net, ifname);
> > +
> > +	if (nd)
> > +		interface = nd;
> > +	else
> > +		return -ENODEV;
> > +
> > +	return 0;
> > +}
> > +
> > +static int net_dm_interface_stop(struct net *net, const char *ifname)
> > +{
> > +	dev_put(interface);
> > +	interface = NULL;
> > +
> > +	return 0;
> > +}
> 
> Where is the netdev notifier that will drop this reference if the network
> device is unregistered?
> 
See the changes to dropmon_net_event in the patch.  Its there under the case for
NETDEV_UNREGISTER

Neil
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
