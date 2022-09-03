Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B54DECAAD4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Sep 2022 09:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0997B60B0A;
	Sat,  3 Sep 2022 09:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0997B60B0A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XMwQvR+w
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rnfWV-uLjYWw; Sat,  3 Sep 2022 09:38:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D635F60ABB;
	Sat,  3 Sep 2022 09:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D635F60ABB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3616C0032;
	Sat,  3 Sep 2022 09:38:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADEE2C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 09:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74D8540167
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 09:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D8540167
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XMwQvR+w
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcUAexmokkXQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 09:38:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E2CC40111
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E2CC40111
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 09:38:30 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id q63so3953383pga.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Sep 2022 02:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=9JI/4sTLYEP4qjrqdu4vBGJWCWh4ts5jBH6TaDxFm2M=;
 b=XMwQvR+wAp9DfsI7ldrGy0tzrOwPV3hrOAsDk5oJOvE1dM5Jmk0sRc6dBhr4PFYoYx
 uNmljk0/PEX+lQCCg9/PaQoqQFPL/Ojf0KEUxVBAHMyZBH/3KRraVhaVcGyViXQWN+he
 pt3VrL4rh7CUjICaQxA1LOH8EqPn+xUDrkbJht1NNG90/6D3YjKQ5fakjgqKgYe4KsQ+
 LFEpnEc3IAsWsEmjsdiyVH2lvaI8r+MGCZTMPOj3mbpvhc+FsT9OxUphtC9uu5q62jza
 N4olFDuPE1tcnjr1g7vLzRZZd2R6U092WePm5lGEN+hIlwd+badTdRvdFFI3VkTQxaFE
 ZGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=9JI/4sTLYEP4qjrqdu4vBGJWCWh4ts5jBH6TaDxFm2M=;
 b=1jEOR3lGFFLNSu0aBgSPcI3OyPV9Io03qFJKyaiX/WithskTt/xLkNHTbHwEVPs9tZ
 twdaBfJmgW+KEihv3ATlZeeYCqYWLLtWNDeoMpiIIOfG/MU6oBtbsvoF8AMLqMKndOy1
 iSSJ1Sm5fti24sWDWSgpln/hwexA1A63WpbhSoqLPnXLadsITp2kLH5RBy0jEJrdFvaT
 RNHH3sD2dATmtRhpVFyJOY44MtCcbcPdUX447Zp7xLlB4+wVROgg/8qJPt4gUo69Kk8m
 NpG9wZWqIiXYv3MfTPS25wtfGoUkSku5SuwY9l7OldCxIuLbtjmL70/RykOOdwkRwppW
 I3mw==
X-Gm-Message-State: ACgBeo1oYQtJiRYbaY3EN7KT7yxXFs24s2tbAaUmh4tmcN+b+iDmBJAj
 ZqEzxk3UxXeh+5RZYghfQX0=
X-Google-Smtp-Source: AA6agR4SF+9cxVCowhT7YIYuX2Ty5EfWBH9l3jwQE34EGLz2yobfHpy3VFoFhaYBrGr+M5JR0qpUnQ==
X-Received: by 2002:a65:6d89:0:b0:421:94bc:cb89 with SMTP id
 bc9-20020a656d89000000b0042194bccb89mr33380126pgb.129.1662197909827; 
 Sat, 03 Sep 2022 02:38:29 -0700 (PDT)
Received: from biggie ([103.230.148.184]) by smtp.gmail.com with ESMTPSA id
 s21-20020a170903201500b0016d2db82962sm3141068pla.16.2022.09.03.02.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 02:38:29 -0700 (PDT)
Date: Sat, 3 Sep 2022 15:08:23 +0530
From: Gautam Menghani <gautammenghani201@gmail.com>
To: Sean Young <sean@mess.org>
Subject: Re: [PATCH] drivers/media/rc: Ensure usb_submit_urb() is not called
 if write is in progress
Message-ID: <YxMgj9CoUyY+r2qa@biggie>
References: <20220814142543.24910-1-gautammenghani201@gmail.com>
 <YxJHmYDMtmzaHWQG@biggie> <YxMHJNNq2e3kLxdQ@gofer.mess.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxMHJNNq2e3kLxdQ@gofer.mess.org>
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

On Sat, Sep 03, 2022 at 08:49:56AM +0100, Sean Young wrote:
> On Fri, Sep 02, 2022 at 11:42:41PM +0530, Gautam Menghani wrote:
> > On Sun, Aug 14, 2022 at 07:55:42PM +0530, Gautam Menghani wrote:
> > > The warning "URB submitted while active" is reported if the function
> > > send_packet() in imon.c is called if a write is already is in progress.
> > > Add a check to return -EBUSY in case a write is already is in progress.
> > > Also, mark tx.busy as false after transmission is completed.
> > > 
> > > Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> > > Cc: hdanton@sina.com
> > > Suggested-by: hdanton@sina.com
> > > Link: https://syzkaller.appspot.com/bug?id=e378e6a51fbe6c5cc43e34f131cc9a315ef0337e
> > > Reported-by: syzbot+0c3cb6dc05fbbdc3ad66@syzkaller.appspotmail.com
> > > Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> > > ---
> > >  drivers/media/rc/imon.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> > > index 735b925da998..a5b997c2c7e2 100644
> > > --- a/drivers/media/rc/imon.c
> > > +++ b/drivers/media/rc/imon.c
> > > @@ -598,6 +598,8 @@ static int send_packet(struct imon_context *ictx)
> > >  	int retval = 0;
> > >  	struct usb_ctrlrequest *control_req = NULL;
> > >  
> > > +	if (ictx->tx.busy)
> > > +		return -EBUSY;
> > >  	/* Check if we need to use control or interrupt urb */
> > >  	if (!ictx->tx_control) {
> > >  		pipe = usb_sndintpipe(ictx->usbdev_intf0,
> > > @@ -654,6 +656,7 @@ static int send_packet(struct imon_context *ictx)
> > >  			pr_err_ratelimited("task interrupted\n");
> > >  		}
> > >  		mutex_lock(&ictx->lock);
> > > +		ictx->tx.busy = false;
> > >  
> > >  		retval = ictx->tx.status;
> > >  		if (retval)
> > > -- 
> > > 2.34.1
> > > 
> > Hi,
> > 
> > Please review the above fix and let me know if any changes are needed.
> 
> Greg has pointed out issues with this patch: there is no locking.
> 
> Thanks,
> 
> Sean

Hi,

I am a bit confused about the locking part. All the calls to send_packet() are
made with ictx->lock held. So will the following be sufficient?

lockdep_assert_held(&ictx->lock);
if (ictx->tx.busy)
	return -EBUSY;

Or do we need to add a mutex/spin lock inside ictx->tx structure? 

Or should we instead wait for the the tx to be completed as follows:
wait_for_completion(&ictx->tx.finished);

Please advise.

Thanks,
Gautam
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
