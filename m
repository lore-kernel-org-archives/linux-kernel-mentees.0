Return-Path: <SRS0=y1cr=NC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D050C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Aug 2021 13:59:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 789A160231
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Aug 2021 13:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 789A160231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E14640599;
	Wed, 11 Aug 2021 13:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeJNoIKX8FUP; Wed, 11 Aug 2021 13:59:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 960C04059F;
	Wed, 11 Aug 2021 13:59:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79D32C0010;
	Wed, 11 Aug 2021 13:59:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79764C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 13:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D5FC838CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 13:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1U_U8S3hSDwy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 13:59:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEC8B833A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 13:59:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1628690347; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WuCCI/rBZ8lWr4irii8zUWZ/ieQbpl22r1PPJcUhed74/0NYs6GyBwGAdIZhMcRFCEqH1t9Fqpj/zCUqDDpAyAhthzAkfwQpP7FiQ9YUhdFuaiPEWFzuUO7lbp2y72MtNczYsEY2TBh+IIv119sbv/f46i5fjZsvA0DVQKl03JY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1628690347;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=ubSIKy+sSgzaqZS7QTljTFHq59xZvHdz22kUHhUcLOw=; 
 b=IaxZT30rB2Rk2y6sU6OTCz+96J1mdnVL3QFQo8B11pcMaYaCX0CaBODB2Va8gFlpfBx1nSKXm8/jJBCNbPoYZuCJ9Hh2OLvoZfVEvV6VCESVJInEyDG0TFYvwQE3owdtplqtGS+lQAfA8NSA2+fbTJY5X37xof4qLUcIrs5EYkg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1628690347; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=ubSIKy+sSgzaqZS7QTljTFHq59xZvHdz22kUHhUcLOw=;
 b=UkZlPPIiSLNX9ZNTu2Ec+isPz4t+sIg8xlYMHLpbAySl1P6iBIc0JNTLOi6vvcwP
 lFgOY3GQS16mWlmwuIFf5R/Jp7GqpYNjpvxKPSr5D0Ck5/SRbGVVLhmJrGHAMPml0pG
 Q4/KvDk8BSjs3KqolW3YhLzi9jaSM0yAsE8Bh5Ts=
Received: from anirudhrb.com (106.51.105.246 [106.51.105.246]) by
 mx.zohomail.com with SMTPS id 1628690342411673.202954929236;
 Wed, 11 Aug 2021 06:59:02 -0700 (PDT)
Date: Wed, 11 Aug 2021 19:28:55 +0530
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] usbip: give back URBs for unsent unlink requests
 during cleanup
Message-ID: <YRPXnzpyHETZ9bn2@anirudhrb.com>
References: <20210806181335.2078-1-mail@anirudhrb.com>
 <4aaf420d-e85e-212e-3bc4-a70e016de610@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4aaf420d-e85e-212e-3bc4-a70e016de610@linuxfoundation.org>
X-ZohoMailClient: External
Cc: linux-usb@vger.kernel.org, Valentina Manea <valentina.manea.m@gmail.com>,
 linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
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

On Tue, Aug 10, 2021 at 05:25:51PM -0600, Shuah Khan wrote:
> On 8/6/21 12:13 PM, Anirudh Rayabharam wrote:
> > In vhci_device_unlink_cleanup(), the URBs for unsent unlink requests are
> > not given back. This sometimes causes usb_kill_urb to wait indefinitely
> > for that urb to be given back. syzbot has reported a hung task issue [1]
> > for this.
> > 
> > To fix this, give back the urbs corresponding to unsent unlink requests
> > (unlink_tx list) similar to how urbs corresponding to unanswered unlink
> > requests (unlink_rx list) are given back. Since the code is almost the
> > same, extract it into a new function and call it for both unlink_rx and
> > unlink_tx lists.
> > 
> 
> Let's not do the refactor - let's first fix the problem and then the refactor.

Sure, I will make it a two patch series where the first one fixes the
problem and the second one does the refactor.

> 
> > [1]: https://syzkaller.appspot.com/bug?id=08f12df95ae7da69814e64eb5515d5a85ed06b76
> > 
> > Reported-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
> > Tested-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
> > Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> > ---
> > 
> > Changes in v2:
> > Use WARN_ON() instead of BUG() when unlink_list is neither unlink_tx nor
> > unlink_rx.
> > 
> > v1: https://lore.kernel.org/lkml/20210806164015.25263-1-mail@anirudhrb.com/
> > 
> > ---
> >   drivers/usb/usbip/vhci_hcd.c | 45 +++++++++++++++++++++++++-----------
> >   1 file changed, 32 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> > index 4ba6bcdaa8e9..67e638f4c455 100644
> > --- a/drivers/usb/usbip/vhci_hcd.c
> > +++ b/drivers/usb/usbip/vhci_hcd.c
> > @@ -945,7 +945,8 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
> >   	return 0;
> >   }
> > -static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
> > +static void __vhci_cleanup_unlink_list(struct vhci_device *vdev,
> > +		struct list_head *unlink_list)
> >   {
> >   	struct vhci_hcd *vhci_hcd = vdev_to_vhci_hcd(vdev);
> >   	struct usb_hcd *hcd = vhci_hcd_to_hcd(vhci_hcd);
> > @@ -953,23 +954,23 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
> >   	struct vhci_unlink *unlink, *tmp;
> >   	unsigned long flags;
> > +	if (WARN(unlink_list != &vdev->unlink_tx
> > +				&& unlink_list != &vdev->unlink_rx,
> > +			"Invalid list passed to __vhci_cleanup_unlink_list\n"))
> > +		return;
> > +
> 
> With this change, this will be only place unlink_rx is used without
> vdev->priv_lock hold? Please explain why this is safe.

Well, this doesn't read or modify the contents of unlink_rx and unlink_tx.
So, it looks safe to me. Let me know if I'm missing something here.

> 
> >   	spin_lock_irqsave(&vhci->lock, flags);
> >   	spin_lock(&vdev->priv_lock);
> > -	list_for_each_entry_safe(unlink, tmp, &vdev->unlink_tx, list) {
> > -		pr_info("unlink cleanup tx %lu\n", unlink->unlink_seqnum);
> > -		list_del(&unlink->list);
> > -		kfree(unlink);
> > -	}
> > -
> > -	while (!list_empty(&vdev->unlink_rx)) {
> > +	list_for_each_entry_safe(unlink, tmp, unlink_list, list) {
> >   		struct urb *urb;
> > -		unlink = list_first_entry(&vdev->unlink_rx, struct vhci_unlink,
> > -			list);
> > -
> > -		/* give back URB of unanswered unlink request */
> > -		pr_info("unlink cleanup rx %lu\n", unlink->unlink_seqnum);
> > +		if (unlink_list == &vdev->unlink_tx)
> > +			pr_info("unlink cleanup tx %lu\n",
> > +					unlink->unlink_seqnum);
> > +		else
> > +			pr_info("unlink cleanup rx %lu\n",
> > +					unlink->unlink_seqnum);
> >   		urb = pickup_urb_and_free_priv(vdev, unlink->unlink_seqnum);
> >   		if (!urb) {
> > @@ -1001,6 +1002,24 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
> >   	spin_unlock_irqrestore(&vhci->lock, flags);
> >   }
> > +static inline void vhci_cleanup_unlink_tx(struct vhci_device *vdev)
> > +{
> > +	__vhci_cleanup_unlink_list(vdev, &vdev->unlink_tx);
> 
> With this change, this will be only place unlink_rx is used without
> vdev->priv_lock hold? Please explain why this is safe.
> 
> > +}
> > +
> 
> Is there a need for this layer?
> 
> > +static inline void vhci_cleanup_unlink_rx(struct vhci_device *vdev)
> > +{
> > +	__vhci_cleanup_unlink_list(vdev, &vdev->unlink_rx);
> 
> With this change, this will be only place unlink_rx is used without
> vdev->priv_lock hold? Please explain why this is safe.
> 
> > +}
> > +
> Is there a need for this layer?

I added these wrappers purely for convenience. There is no other purpose.
Would you prefer this patch without the wrappers?

Thanks for the review!

	- Anirudh.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
