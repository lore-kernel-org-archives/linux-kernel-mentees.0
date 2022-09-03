Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D1EECAAD4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Sep 2022 10:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D837B60B09;
	Sat,  3 Sep 2022 10:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D837B60B09
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=aOhhg4xe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPtGYGHHDkK7; Sat,  3 Sep 2022 10:04:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 839DA60A8D;
	Sat,  3 Sep 2022 10:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 839DA60A8D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55E7DC0032;
	Sat,  3 Sep 2022 10:04:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E6A3C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 10:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DCAB41527
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 10:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DCAB41527
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=aOhhg4xe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iAZO8DLB2_0x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 10:04:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C81041525
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C81041525
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 10:04:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2B34B80DC5;
 Sat,  3 Sep 2022 10:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B40C433C1;
 Sat,  3 Sep 2022 10:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662199482;
 bh=Pj0zqIKfHzh65CyGkqtE2borz9TbGysUmBOC7MLXY58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aOhhg4xesyo8EpZYWuUAYqHWLTizkU+6Zw+HGyYnQMWRG3bErMbWdbXAwTdQmF04o
 QKfpjYhvPNJkdZyhT+J21xhwAh26HBi87mNxZP1ml6EwJQvR3Fk9QjpKDg2cuVQvsD
 4O2zjRgXfRt7qnfwH5TNKqe9V2i7UQxfrxcLuw24=
Date: Sat, 3 Sep 2022 12:04:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gautam Menghani <gautammenghani201@gmail.com>
Subject: Re: [PATCH] drivers/media/rc: Ensure usb_submit_urb() is not called
 if write is in progress
Message-ID: <YxMmtzKzkoglBOwu@kroah.com>
References: <20220814142543.24910-1-gautammenghani201@gmail.com>
 <YxJHmYDMtmzaHWQG@biggie> <YxMHJNNq2e3kLxdQ@gofer.mess.org>
 <YxMgj9CoUyY+r2qa@biggie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxMgj9CoUyY+r2qa@biggie>
Cc: hdanton@sina.com, Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
 syzbot+0c3cb6dc05fbbdc3ad66@syzkaller.appspotmail.com, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

On Sat, Sep 03, 2022 at 03:08:23PM +0530, Gautam Menghani wrote:
> On Sat, Sep 03, 2022 at 08:49:56AM +0100, Sean Young wrote:
> > On Fri, Sep 02, 2022 at 11:42:41PM +0530, Gautam Menghani wrote:
> > > On Sun, Aug 14, 2022 at 07:55:42PM +0530, Gautam Menghani wrote:
> > > > The warning "URB submitted while active" is reported if the function
> > > > send_packet() in imon.c is called if a write is already is in progress.
> > > > Add a check to return -EBUSY in case a write is already is in progress.
> > > > Also, mark tx.busy as false after transmission is completed.
> > > > 
> > > > Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> > > > Cc: hdanton@sina.com
> > > > Suggested-by: hdanton@sina.com
> > > > Link: https://syzkaller.appspot.com/bug?id=e378e6a51fbe6c5cc43e34f131cc9a315ef0337e
> > > > Reported-by: syzbot+0c3cb6dc05fbbdc3ad66@syzkaller.appspotmail.com
> > > > Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> > > > ---
> > > >  drivers/media/rc/imon.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> > > > index 735b925da998..a5b997c2c7e2 100644
> > > > --- a/drivers/media/rc/imon.c
> > > > +++ b/drivers/media/rc/imon.c
> > > > @@ -598,6 +598,8 @@ static int send_packet(struct imon_context *ictx)
> > > >  	int retval = 0;
> > > >  	struct usb_ctrlrequest *control_req = NULL;
> > > >  
> > > > +	if (ictx->tx.busy)
> > > > +		return -EBUSY;
> > > >  	/* Check if we need to use control or interrupt urb */
> > > >  	if (!ictx->tx_control) {
> > > >  		pipe = usb_sndintpipe(ictx->usbdev_intf0,
> > > > @@ -654,6 +656,7 @@ static int send_packet(struct imon_context *ictx)
> > > >  			pr_err_ratelimited("task interrupted\n");
> > > >  		}
> > > >  		mutex_lock(&ictx->lock);
> > > > +		ictx->tx.busy = false;
> > > >  
> > > >  		retval = ictx->tx.status;
> > > >  		if (retval)
> > > > -- 
> > > > 2.34.1
> > > > 
> > > Hi,
> > > 
> > > Please review the above fix and let me know if any changes are needed.
> > 
> > Greg has pointed out issues with this patch: there is no locking.
> > 
> > Thanks,
> > 
> > Sean
> 
> Hi,
> 
> I am a bit confused about the locking part. All the calls to send_packet() are
> made with ictx->lock held. So will the following be sufficient?
> 
> lockdep_assert_held(&ictx->lock);
> if (ictx->tx.busy)
> 	return -EBUSY;
> 
> Or do we need to add a mutex/spin lock inside ictx->tx structure? 

If a lock is held, how can this function be called at the same time
through different ways?  That should not happen.

> Or should we instead wait for the the tx to be completed as follows:
> wait_for_completion(&ictx->tx.finished);

It depends on what you are trying to protect from here.  What is the
real issue that is allowing multiple submissions of the same urb to
happen?  Fix that issue instead of trying to paper over it in this lower
level function please.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
