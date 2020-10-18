Return-Path: <SRS0=+KdI=DZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3CAC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Oct 2020 19:54:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD20D22268
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Oct 2020 19:54:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eH87+V9t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD20D22268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5534922D24;
	Sun, 18 Oct 2020 19:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ogsQsN5l0arw; Sun, 18 Oct 2020 19:54:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A31902291D;
	Sun, 18 Oct 2020 19:54:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 941F2C0052;
	Sun, 18 Oct 2020 19:54:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 058F4C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 017E8875AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 19:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5sE18NeX6Va6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 19:54:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 894C1870A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 19:54:27 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2DFB22263;
 Sun, 18 Oct 2020 19:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603050867;
 bh=lYYbu+LHVs/lI42o9GlVg5xf4fVuj6IuC281Ogm3UKg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eH87+V9t24jrCyts1XE4BPOlv/zkzt1xVw5KzK9qWvsLfSDe9MQuPqGunvGiubzgP
 dwOBj7YgdFy7GWJ6uAk/TBKbT4RxRfbIux+UZ7Xy1A3SIPCx5NQValsuU0XRPmOBqK
 Ngku01mhuYSPoejY2vD0Wc17FLgZ5JWoL6MgAXnM=
Date: Sun, 18 Oct 2020 12:54:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Greg KH <greg@kroah.com>
Message-ID: <20201018125425.05ef059d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201015153700.1e97b354@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
 <20201011173030.141582-1-anant.thazhemadam@gmail.com>
 <20201012091428.103fc2be@canb.auug.org.au>
 <20201016085922.4a2b90d1@canb.auug.org.au>
 <20201015152451.125895b1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20201015153700.1e97b354@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Anant Thazhemadam <anant.thazhemadam@gmail.com>, petkan@nucleusys.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: rtl8150: don't
 incorrectly assign random MAC addresses
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

On Thu, 15 Oct 2020 15:37:00 -0700 Jakub Kicinski wrote:
> On Thu, 15 Oct 2020 15:24:51 -0700 Jakub Kicinski wrote:
> > On Fri, 16 Oct 2020 08:59:22 +1100 Stephen Rothwell wrote:  
> > > > I will apply the above patch to the merge of the usb tree today to fix
> > > > up a semantic conflict between the usb tree and Linus' tree.      
> > > 
> > > It looks like you forgot to mention this one to Linus :-(
> > > 
> > > It should probably say:
> > > 
> > > Fixes: b2a0f274e3f7 ("net: rtl8150: Use the new usb control message API.")    
> > 
> > Umpf. I think Greg sent his changes first, so this is on me.
> > 
> > The networking PR is still outstanding, can we reply to the PR with
> > the merge guidance. Or is it too late?  
> 
> I take that back, this came through net, not net-next so our current
> PR is irrelevant :)

Looks like the best thing to do right now is to put this fix in net,
so let me do just that (with the Fixes tag from Stephen).

Thanks Anant!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
