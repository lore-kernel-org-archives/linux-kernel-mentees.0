Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36109E784BF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 15:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF1C7610C7;
	Mon,  2 Oct 2023 15:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF1C7610C7
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FNWMof49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id akefASgvxosP; Mon,  2 Oct 2023 15:46:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CA3C86105F;
	Mon,  2 Oct 2023 15:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA3C86105F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4730C008C;
	Mon,  2 Oct 2023 15:46:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50361C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 15:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28D38418D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 15:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28D38418D1
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=FNWMof49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OogylIZ67lPQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 15:46:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7DED417BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 15:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7DED417BD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DFEC60F5A;
 Mon,  2 Oct 2023 15:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6377EC433C7;
 Mon,  2 Oct 2023 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1696261612;
 bh=giO6yTDPYsIHUPl4IocJu5KNEwm8QrDYd0E9A53jQd0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FNWMof490ByBbYRaekI4eeVyhAPb8/GjD92mJuUyEYOdRercVeebtctz8uUzhyfcD
 fRG+cj7ZdMCrlMHs/+3S7o1FNRbJSIMZWZiu0LxWDViF0cD13z4/l0EWNHf/A57rnF
 j2ZXy2XNYU3obhiZXl9Wrv0ufCkcfmnl4M+0K/no=
Date: Mon, 2 Oct 2023 17:46:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: swarup <swarupkotikalapudi@gmail.com>
Subject: Re: [PATCH] usb: fix kernel-doc warning
Message-ID: <2023100207-unmoved-arbitrary-2c33@gregkh>
References: <20230918193505.7046-1-swarupkotikalapudi@gmail.com>
 <2023100253-aide-authentic-5aa1@gregkh>
 <ZRrkbkjoHgEnuy/m@swarup-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZRrkbkjoHgEnuy/m@swarup-virtual-machine>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Mon, Oct 02, 2023 at 09:10:30PM +0530, swarup wrote:
> On Mon, Oct 02, 2023 at 04:42:03PM +0200, Greg KH wrote:
> > On Tue, Sep 19, 2023 at 01:05:05AM +0530, Swarup Laxman Kotiaklapudi wrote:
> > > Fix kernel-doc warnings discovered in usb driver.
> > > Fixes this warning:
> > > warning: Function parameter or member 'gfladj_refclk_lpm_sel'
> > >          not described in 'dwc3'
> > > 
> > > Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> > > ---
> > >  drivers/usb/dwc3/core.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > 
> > What commit id does this fix?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hi Greg,
> Please find the commit id as mentioned below,
> next time onwards i will mention it:
> 
> Fixes: 5cd07f96c0c6 ("usb: fix kernel-doc warning")

That is not a valid commit id in Linus's tree, are you sure it is
correct?

And please resend the patch with that information in it.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
