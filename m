Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABA8C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Nov 2023 18:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E30428223E;
	Fri,  3 Nov 2023 18:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E30428223E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FyM320pe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igVE1dJLCq_B; Fri,  3 Nov 2023 18:33:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3BBEE8223D;
	Fri,  3 Nov 2023 18:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BBEE8223D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 110CBC0071;
	Fri,  3 Nov 2023 18:33:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28152C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 18:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E334C8223E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 18:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E334C8223E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9fAQIMoNnaf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 18:33:41 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A68DB8223D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 18:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A68DB8223D
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C7033CE0A3C;
 Fri,  3 Nov 2023 18:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E749C433CA;
 Fri,  3 Nov 2023 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1699036417;
 bh=GCcviAr0J+IVeM1/p5MQ4ex6AHZgCCmGit6AtH3K05k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FyM320peA+QJM3iwPOVx6aexI+At1jmo+xGow9tXL1dH6z/biHMdoS+afNaGl1mSa
 H559T8yRhyt/BtwSnyLPNC+nzAAPis18jy9AaJTiXUw12ij6GM5PApK80g7lY7mcT/
 rxtzhYNEuT14oqiJl2oi5vH8irjBNVvM2kjqmum0=
Date: Fri, 3 Nov 2023 19:33:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH] Prevent out-of-bounds read/write in bcmasp_netfilt_rd
 and bcmasp_netfilt_wr
Message-ID: <2023110318-utensil-figure-eb80@gregkh>
References: <DB3PR10MB6835E073F668AD24F57AE64AE8A5A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <2023110301-purist-reputable-fab7@gregkh>
 <e3ac58b2-bb78-4364-94c0-f18c376ac132@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3ac58b2-bb78-4364-94c0-f18c376ac132@broadcom.com>
Cc: pabeni@redhat.com, florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

On Fri, Nov 03, 2023 at 11:23:16AM -0700, Justin Chen wrote:
> 
> 
> On 11/3/23 5:57 AM, Greg KH wrote:
> > On Fri, Nov 03, 2023 at 05:57:48PM +0530, Yuran Pereira wrote:
> > > The functions `bcmasp_netfilt_rd` and `bcmasp_netfilt_wr` both call
> > > `bcmasp_netfilt_get_reg_offset` which, when it fails, returns `-EINVAL`.
> > > This could lead to an out-of-bounds read or write when `rx_filter_core_rl`
> > > or `rx_filter_core_wl` is called.
> > > 
> > > This patch adds a check in both functions to return immediately if
> > > `bcmasp_netfilt_get_reg_offset` fails. This prevents potential out-of-bounds read
> > > or writes, and ensures that no undefined or buggy behavior would originate from
> > > the failure of `bcmasp_netfilt_get_reg_offset`.
> > > 
> > > Addresses-Coverity-IDs: 1544536 ("Out-of-bounds access")
> > > Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> > > ---
> > >   drivers/net/ethernet/broadcom/asp2/bcmasp.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
> > > index 29b04a274d07..8b90b761bdec 100644
> > > --- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
> > > +++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
> > > @@ -227,6 +227,8 @@ static void bcmasp_netfilt_wr(struct bcmasp_priv *priv,
> > >   	reg_offset = bcmasp_netfilt_get_reg_offset(priv, nfilt, reg_type,
> > >   						   offset);
> > > +	if (reg_offset < 0)
> > > +		return;
> > >   	rx_filter_core_wl(priv, val, reg_offset);
> > >   }
> > > @@ -244,6 +246,8 @@ static u32 bcmasp_netfilt_rd(struct bcmasp_priv *priv,
> > >   	reg_offset = bcmasp_netfilt_get_reg_offset(priv, nfilt, reg_type,
> > >   						   offset);
> > > +	if (reg_offset < 0)
> > > +		return 0;
> > 
> > Shouldn't you return an error here?
> > 
> > thanks
> > 
> > greg k-h
> 
> As long as offset is less than MAX_WAKE_FILTER_SIZE we don't need to worry
> about error checking. This is already checked before we call
> netfilt_get_reg_offset() in both cases. Instead of returning -EINVAL in
> neffilt_get_reg_offset() lets return 0. This will silence the coverity
> check. In practice we will never hit this logic.

Then don't change it, coverity is incorrect here.

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
