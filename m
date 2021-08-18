Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C517AC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 05:39:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73F3E61038
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 05:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73F3E61038
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BDB080DE8;
	Wed, 18 Aug 2021 05:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sPkKwXDasm6; Wed, 18 Aug 2021 05:39:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3259180DD6;
	Wed, 18 Aug 2021 05:39:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D49EC001A;
	Wed, 18 Aug 2021 05:39:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E1E4C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 05:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95DEB401F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 05:39:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzwPemzH-Po9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 05:39:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C99F40180
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 05:39:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13E0161029;
 Wed, 18 Aug 2021 05:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1629265181;
 bh=EtIBL4nck6yS3y+rq79pT9mCLC3bvjYO+hQnPLk5ThE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S60Z4BDzLUbMnBdGBVbSnwufET+iJ+kHOPHNmlS04Qy7kLoYhoYJETBuvVh454+rm
 s59j4s8IFK7gcIoexdKrq8Qj0jtRu+T2ZB7nt1OH+Iy7JbU2h7ubByiYYFZ/krBbQs
 djRx51fhdmXLeZ1/fYVa5PfoawGeuoIFEpaYB9N4=
Date: Wed, 18 Aug 2021 07:39:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 1/2] usbip: give back URBs for unsent unlink requests
 during cleanup
Message-ID: <YRydGRdPmOaiMWaY@kroah.com>
References: <20210813182508.28127-1-mail@anirudhrb.com>
 <20210813182508.28127-2-mail@anirudhrb.com>
 <13450a85-bbfe-09c5-d614-1a944c2600c2@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13450a85-bbfe-09c5-d614-1a944c2600c2@linuxfoundation.org>
Cc: shuah@kernel.org, linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
 syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com,
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

On Tue, Aug 17, 2021 at 05:16:51PM -0600, Shuah Khan wrote:
> On 8/13/21 12:25 PM, Anirudh Rayabharam wrote:
> > In vhci_device_unlink_cleanup(), the URBs for unsent unlink requests are
> > not given back. This sometimes causes usb_kill_urb to wait indefinitely
> > for that urb to be given back. syzbot has reported a hung task issue [1]
> > for this.
> > 
> > To fix this, give back the urbs corresponding to unsent unlink requests
> > (unlink_tx list) similar to how urbs corresponding to unanswered unlink
> > requests (unlink_rx list) are given back.
> > 
> > [1]: https://syzkaller.appspot.com/bug?id=08f12df95ae7da69814e64eb5515d5a85ed06b76
> > 
> > Reported-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
> > Tested-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
> > Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> > ---
> >   drivers/usb/usbip/vhci_hcd.c | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> > 
> > diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> > index 4ba6bcdaa8e9..6f3f374d4bbc 100644
> > --- a/drivers/usb/usbip/vhci_hcd.c
> > +++ b/drivers/usb/usbip/vhci_hcd.c
> > @@ -957,8 +957,34 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
> >   	spin_lock(&vdev->priv_lock);
> >   	list_for_each_entry_safe(unlink, tmp, &vdev->unlink_tx, list) {
> > +		struct urb *urb;
> > +
> > +		/* give back URB of unsent unlink request */
> >   		pr_info("unlink cleanup tx %lu\n", unlink->unlink_seqnum);
> 
> I know this is an exiting one.
> Let's make this pr_debug or remove it all together.
> 
> > +
> > +		urb = pickup_urb_and_free_priv(vdev, unlink->unlink_seqnum);
> > +		if (!urb) {
> > +			pr_info("the urb (seqnum %lu) was already given back\n",
> > +				unlink->unlink_seqnum);
> 
> Let's make this pr_debug or remove it all together.

As you have a struct device for all of these, please use dev_dbg() and
friends, not pr_*(), for all of these.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
