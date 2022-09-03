Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0E5ECAAD4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Sep 2022 07:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FF6C408C9;
	Sat,  3 Sep 2022 07:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FF6C408C9
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=lPjBKz4Y
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcLNnMuyQj_0; Sat,  3 Sep 2022 07:58:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9297740457;
	Sat,  3 Sep 2022 07:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9297740457
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C670C0033;
	Sat,  3 Sep 2022 07:58:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADC4CC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 07:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88FF24010C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 07:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88FF24010C
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org
 header.a=rsa-sha256 header.s=2020 header.b=lPjBKz4Y
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3N7BdKxB_hfG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 07:58:55 +0000 (UTC)
X-Greylist: delayed 00:08:55 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80D33400F2
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80D33400F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 07:58:55 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 9E6EF100072; Sat,  3 Sep 2022 08:49:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
 t=1662191396; bh=G4MT1MV4esuAr0v8xfY1oNqEbcDxmnusDDYk2WFLurE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lPjBKz4YJU0zBRkohIzEImV5T8Vdxs3wm3YIKJvuSG6n3TB5kkoRxK7v2E4acMO2d
 wRNpdZ7ncFfzgIgDoTZ0FPXvOJYNkd1qBW3JGyLXG+hwHoLR+dtAK2mB/V+xbG8BOj
 kr+24owdZBA84+AdXiaC3KBw8zpIJlwIw06m7r01O4VbhvPt3hWdfaAPdNHigCVaDT
 cq2ekM0T3kjS54NikN5pyi+teKRf6CeO/9Fs7iMj7rrHpP0PIGSjr92PwUXDMF1ZxM
 JT4G088rtwYzRwPVxDTHTZ39ZEaLduSAbFMESumMoT3B+cgDOI7Df06ATHNCqloLPN
 48CCuyN81XiXA==
Date: Sat, 3 Sep 2022 08:49:56 +0100
From: Sean Young <sean@mess.org>
To: Gautam Menghani <gautammenghani201@gmail.com>
Subject: Re: [PATCH] drivers/media/rc: Ensure usb_submit_urb() is not called
 if write is in progress
Message-ID: <YxMHJNNq2e3kLxdQ@gofer.mess.org>
References: <20220814142543.24910-1-gautammenghani201@gmail.com>
 <YxJHmYDMtmzaHWQG@biggie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxJHmYDMtmzaHWQG@biggie>
Cc: hdanton@sina.com, linux-kernel@vger.kernel.org,
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

On Fri, Sep 02, 2022 at 11:42:41PM +0530, Gautam Menghani wrote:
> On Sun, Aug 14, 2022 at 07:55:42PM +0530, Gautam Menghani wrote:
> > The warning "URB submitted while active" is reported if the function
> > send_packet() in imon.c is called if a write is already is in progress.
> > Add a check to return -EBUSY in case a write is already is in progress.
> > Also, mark tx.busy as false after transmission is completed.
> > 
> > Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> > Cc: hdanton@sina.com
> > Suggested-by: hdanton@sina.com
> > Link: https://syzkaller.appspot.com/bug?id=e378e6a51fbe6c5cc43e34f131cc9a315ef0337e
> > Reported-by: syzbot+0c3cb6dc05fbbdc3ad66@syzkaller.appspotmail.com
> > Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> > ---
> >  drivers/media/rc/imon.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> > index 735b925da998..a5b997c2c7e2 100644
> > --- a/drivers/media/rc/imon.c
> > +++ b/drivers/media/rc/imon.c
> > @@ -598,6 +598,8 @@ static int send_packet(struct imon_context *ictx)
> >  	int retval = 0;
> >  	struct usb_ctrlrequest *control_req = NULL;
> >  
> > +	if (ictx->tx.busy)
> > +		return -EBUSY;
> >  	/* Check if we need to use control or interrupt urb */
> >  	if (!ictx->tx_control) {
> >  		pipe = usb_sndintpipe(ictx->usbdev_intf0,
> > @@ -654,6 +656,7 @@ static int send_packet(struct imon_context *ictx)
> >  			pr_err_ratelimited("task interrupted\n");
> >  		}
> >  		mutex_lock(&ictx->lock);
> > +		ictx->tx.busy = false;
> >  
> >  		retval = ictx->tx.status;
> >  		if (retval)
> > -- 
> > 2.34.1
> > 
> Hi,
> 
> Please review the above fix and let me know if any changes are needed.

Greg has pointed out issues with this patch: there is no locking.

Thanks,

Sean
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
