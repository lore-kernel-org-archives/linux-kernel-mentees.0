Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA0EC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 09:34:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E9872145D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 09:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YyfjRMFz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E9872145D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5C16C872D2;
	Sat, 10 Oct 2020 09:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmfjgXRoTc2J; Sat, 10 Oct 2020 09:34:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 327488714D;
	Sat, 10 Oct 2020 09:34:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19B22C016F;
	Sat, 10 Oct 2020 09:34:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B67B7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 09:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9417B85513
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 09:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4g16i1b6fLD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 09:34:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0077A85313
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 09:34:35 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36CFA208C7;
 Sat, 10 Oct 2020 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602322475;
 bh=8G56kfNsKN2o+qwV8vuB+SUXCDERhQbqnXbs1jkx5yc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YyfjRMFzoI8iBbEwupEs+h0rwJrqBDmuYxRIp40itCm9pFPhRx/M5C45rvN/IkzBl
 gPnOtJ++HEF4aCOQWyJf05y6ZPBk/dToQPjI4TNLuiT9VMOfmk843soS2P2BfFRnXs
 EleVu+VBEezmhC+6F+gREWOObJXDCuxhPmEkRxqk=
Date: Sat, 10 Oct 2020 11:35:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20201010093519.GA981987@kroah.com>
References: <20201010082933.5417-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201010082933.5417-1-anant.thazhemadam@gmail.com>
Cc: devel@driverdev.osuosl.org,
 syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com,
 Ian Abbott <abbotti@mev.co.uk>, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] staging: comedi: check
 validity of wMaxPacketSize of usb endpoints found
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

On Sat, Oct 10, 2020 at 01:59:32PM +0530, Anant Thazhemadam wrote:
> While finding usb endpoints in vmk80xx_find_usb_endpoints(), check if 
> wMaxPacketSize = 0 for the endpoints found.
> 
> Some devices have isochronous endpoints that have wMaxPacketSize = 0
> (as required by the USB-2 spec).
> However, since this doesn't apply here, wMaxPacketSize = 0 can be
> considered to be invalid.
> 
> Reported-by: syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com
> Tested-by: syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
> Changes in v3:
> 	* Correctly list version information
> 
> Changes in v2:
> 	* Fix coding style issue
> 
> The error (as detected by syzbot) is generated in 
> vmk80xx_write_packet() (which is called in vmk80xx_reset_device()) when
> it tries to assign devpriv->usb_tx_buf[0] = cmd.
> 
> This NULL pointer dereference issue arises because
> size = usb_endpoint_maxp(devpriv->ep_tx) = 0.
> 
> This can be traced back to vmk80xx_find_usb_endpoints(), where the usb 
> endpoints are found, and assigned accordingly.
> (For some more insight, in vmk80xx_find_usb_endpoints(), 
> if one of intf->cur_altsetting->iface_desc->endpoints' desc value = 0, 
> and consequently this endpoint is assigned to devpriv->ep_tx,
> this issue gets triggered.)
> 
> Checking if the wMaxPacketSize of an endpoint is invalid and returning
> an error value accordingly, seems to fix the error.
> 
> We could also alternatively perform this checking (if the size is 0 or not) 
> in vmk80xx_reset_device() itself, but it only seemed like covering up the issue
> at that place, rather than fixing it, so I wasn't sure that was any better.
> 
> However, if I'm not wrong, this might end up causing the probe to fail, and I'm 
> not sure if that's the right thing to do in cases like this, and if it isn't I'd
> like some input on what exactly is the required course of action in cases like this.
> 
>  drivers/staging/comedi/drivers/vmk80xx.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/comedi/drivers/vmk80xx.c b/drivers/staging/comedi/drivers/vmk80xx.c
> index 65dc6c51037e..cb0a965d3c37 100644
> --- a/drivers/staging/comedi/drivers/vmk80xx.c
> +++ b/drivers/staging/comedi/drivers/vmk80xx.c
> @@ -667,6 +667,9 @@ static int vmk80xx_find_usb_endpoints(struct comedi_device *dev)
>  	if (!devpriv->ep_rx || !devpriv->ep_tx)
>  		return -ENODEV;
>  
> +	if (!usb_endpoint_maxp(devpriv->ep_rx) || !usb_endpoint_maxp(devpriv->ep_tx))
> +		return -EINVAL;
> +
>  	return 0;
>  }

Why not just rewrite vmk80xx_find_usb_endpoints() to use the
usb_find_common_endpoints() or other helper functions like
usb_find_bulk_in_endpoint() or others, so that this type of thing is
checked there?

Ah, wait, no, the packet size is not checked there, sorry, maybe that
will not help out here.  Is a bulk urb allowed to have a 0 size?  If
not, maybe we should just forbid that in the core?  Time to go read the
USB spec...

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
