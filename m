Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3713C25B06
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Aug 2022 16:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4066160D50;
	Sun, 14 Aug 2022 16:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4066160D50
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k0ylHWRY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ktx5Wjcvegl7; Sun, 14 Aug 2022 16:44:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 398C060D69;
	Sun, 14 Aug 2022 16:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 398C060D69
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAE7BC0033;
	Sun, 14 Aug 2022 16:44:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58DFDC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 16:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 379B9405D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 16:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 379B9405D8
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=k0ylHWRY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CN7Humvv6R-U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 16:44:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 498A0401B7
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 498A0401B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 16:44:21 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id f65so4787903pgc.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=pL8g1BLQVZvrcgdrkNSBsPwGKS843D7eAlV+Ro1JYLM=;
 b=k0ylHWRY53YY1+dlQ/dbkvmTjalxRlqlsppaDkMFbbTxq0XCzrdszvfqaNG/Nxr8py
 Kbgq1NVl7bhB6wOrf45pn0Mc+LvFtpLdp069E9Ft1DI382mxMMCmXTw1FLDoh9tWyYKT
 uHhujxKlnb2eEw982KEegE56z1jeOL/FOtw7eyRJJXxqU9bMWrf+srwYqQ09yIDmTENt
 zMkT5OK8PkEpnmdsrD+1hhZSZ5qIGc8byzvNxRZYGOevjM4ycwbrfo8T3Le3b6cGV2Z7
 cOHne/7l48Bk1kHcNm0kgwEDa/0FLEfQg0FjnJqQ+F3XAGZm1UebDYGurZdOXFqf1mlw
 toug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=pL8g1BLQVZvrcgdrkNSBsPwGKS843D7eAlV+Ro1JYLM=;
 b=rsOAul7qr+dhh4UFLrnCQQ/1A4IQPZ/rE4L149WC+dvHq72NCEFu2ZXdahS43dcKen
 70mixSHEDsaULr/zS3GCieXYOXzPiBrQa4JyEe+/mxKwbF1adEcswoaFRrMVo7yE3xVQ
 kPSuiv6JHkqprm0EbRklMoez3svkHahuP2aMKruNimZyhL7BeHNbPLyWDAODYfEEfAQm
 YubyqPQQ+0NBHu7tYSWT0Fq8jnEOWCegYZDhDaRDPlQ7tbkbrKtYm5J2fkdvkf7Huzf1
 iQItTNvmyED0V1ubxoFNkIlFV9buvV7xJOJ1AR6VB5HiFcY33x+zNFjLYewhFXKBa8Xv
 jMsw==
X-Gm-Message-State: ACgBeo1jQ7ZEP6ueurbkGyscAcR8BgnqyI1PnzQLKpOZYRAjvgyNO1uU
 dw56QnJrGPv//m9+JSgxCbA=
X-Google-Smtp-Source: AA6agR7HECHODK6Fh2XDOqfqhpiyfU71JkO8dMXKf22iSRHVqgW246kAntAKOSOqcWg48QKEVu2C/Q==
X-Received: by 2002:a63:d70c:0:b0:420:f9b6:9c3d with SMTP id
 d12-20020a63d70c000000b00420f9b69c3dmr10701076pgg.377.1660495460514; 
 Sun, 14 Aug 2022 09:44:20 -0700 (PDT)
Received: from biggie ([103.230.148.189]) by smtp.gmail.com with ESMTPSA id
 c1-20020a170902d48100b001709e3c755fsm5584531plg.230.2022.08.14.09.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 09:44:20 -0700 (PDT)
Date: Sun, 14 Aug 2022 22:14:14 +0530
From: Gautam Menghani <gautammenghani201@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers/media/rc: Ensure usb_submit_urb() is not called
 if write is in progress
Message-ID: <YvkmXiZ+8zM9uh+Q@biggie>
References: <20220814142543.24910-1-gautammenghani201@gmail.com>
 <YvkKdIL8UVhKrI0Q@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YvkKdIL8UVhKrI0Q@kroah.com>
Cc: hdanton@sina.com, sean@mess.org, linux-kernel@vger.kernel.org,
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

On Sun, Aug 14, 2022 at 04:45:08PM +0200, Greg KH wrote:
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
> 
> What happens if we go busy right after this check?  Where is the locking
> here to protect this?

All calls to send_packet() are protected with ictx->lock() held. Are you referring 
to something else?

Also, if we return busy, the task is interrupted and the packet transaction fails, 
just like the current behaviour. With the above patch, warning is not triggered.
Here's the log from running the reproducer (with patch applied).

imon 1-1:0.0: Looks like you're trying to use an IR protocol this device does not support
imon 1-1:0.0: Unsupported IR protocol specified, overriding to iMON IR protocol
rc rc0: iMON Remote (15c2:0040) as /devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.0/rc/rc0
input: iMON Remote (15c2:0040) as /devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.0/rc/rc0/input5
imon 1-1:0.0: iMON device (15c2:0040, intf0) on usb<1:2> initialized
imon:vfd_write: send packet #0 failed
imon:send_packet: task interrupted
imon:send_packet: packet tx failed (-2)
imon:vfd_write: send packet #0 failed
usb 1-1: USB disconnect, device number 2

Thanks,
Gautam
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
