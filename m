Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3356EC4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 14:14:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 913AB23119
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 14:14:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obHtpepx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 913AB23119
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1187A86864;
	Wed, 23 Sep 2020 14:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIt9+NDc1OEf; Wed, 23 Sep 2020 14:14:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6A30D867E3;
	Wed, 23 Sep 2020 14:14:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51657C0859;
	Wed, 23 Sep 2020 14:14:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4C9DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE276867F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LvCYqu9g8EBD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:14:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A3266867E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:14:13 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id k18so197212wmj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OwjrYT2cgYiXPXM5damUhK95qHZgYya6zZ6mXD0zFBE=;
 b=obHtpepxuTTVBXFISitT+Nk85ES0huZDcdAzFAhmfmHMPjV4m156WAwF0U69K9wIGy
 z7hfLvHdGReIh3bXPoJr2bWj2gowLyCvtCzn6jtQRFn2DzWLG3lF1uj1QupWHiy3N0ho
 bxTXmzFhulvDsG2A3P20KAJxWDZpWxq/Xc4OkWsmJZVzVfNkgQ8rCP4OG41c+4pS058T
 e1LIcYESpjcGsgW2MUCfgnisE2uidlu2+vJJeefwdJaUC3Zqo73pkITqT6ddgZXyhC20
 OlfOzf7EGcycT2aX9p2h7hd6ENemBVb798fmdWFcsaqSxCDhUj4BtdY+13p4PGQVt1+9
 DSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OwjrYT2cgYiXPXM5damUhK95qHZgYya6zZ6mXD0zFBE=;
 b=Sw4K/Iwv7oVkIdzKW+25aybr1zJVK4GXoaGwTUM+tnPXbHf47CZiTHG01lsieCVKv9
 0ANE/69w1BbVIjVTU0Nmm5YQ2h7Y1++TMNiWLpxMryUgbedGlPbrj5JTfJ3OtJxadwUL
 Sk++rNjDtLJIeGRbaIOwBjLDw6h1hlAYym1Ityx1emYBfkmxNy4G9LNypzYM7Igm6gbo
 YM4HzvUWNx3dz3jztrJWKd4vO/0RqBw/Prn2fqqlG/5WkIDm3qvy4Sqt7LjNCmWrP1O9
 7RInIaxq9WdwB45n0wBz+XkQTr/ZRyGYrD25GJWE4ahqdYCJtXCPok05qTyTbJlz8C+J
 cXDA==
X-Gm-Message-State: AOAM533tP1dy6wdKrAXNEzE4wNZ6uvzt6XWWRBJjtwN2zZJmTm+hZSRA
 ZrGzuNe+mn+YQav6sBJ+Q4VOECS4bPCAefwVWrM=
X-Google-Smtp-Source: ABdhPJwdy6UD/UzHfr2IcuCNMK2z1a9fd/uvMgG9JscXgN32cCh6DM8001ZMYmM7ElTCq0gduZVIX3YihxNI3VPmGts=
X-Received: by 2002:a1c:6341:: with SMTP id x62mr6771683wmb.70.1600870452134; 
 Wed, 23 Sep 2020 07:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-5-himadrispandya@gmail.com>
 <20200923102256.GA3154647@kroah.com>
In-Reply-To: <20200923102256.GA3154647@kroah.com>
From: Himadri Pandya <himadrispandya@gmail.com>
Date: Wed, 23 Sep 2020 19:44:00 +0530
Message-ID: <CAOY-YVnFtDMkRVVg4TZ-3rRxciRYwEQCf-ctbm9=KbF4=1FqMA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB list <linux-usb@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 pankaj.laxminarayan.bharadiya@intel.com, Oliver Neukum <oneukum@suse.com>,
 yuehaibing@huawei.com, LKML <linux-kernel@vger.kernel.org>, ogiannou@gmail.com,
 netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, petkan@nucleusys.com
Subject: Re: [Linux-kernel-mentees] [PATCH 4/4] net: rndis_host: use
	usb_control_msg_recv() and usb_control_msg_send()
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

On Wed, Sep 23, 2020 at 3:52 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 23, 2020 at 02:35:19PM +0530, Himadri Pandya wrote:
> > The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
> > usb_control_msg() with proper error check. Hence use the wrappers
> > instead of calling usb_control_msg() directly.
> >
> > Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> > ---
> >  drivers/net/usb/rndis_host.c | 44 ++++++++++++++----------------------
> >  1 file changed, 17 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c
> > index 6fa7a009a24a..30fc4a7183d3 100644
> > --- a/drivers/net/usb/rndis_host.c
> > +++ b/drivers/net/usb/rndis_host.c
> > @@ -113,14 +113,13 @@ int rndis_command(struct usbnet *dev, struct rndis_msg_hdr *buf, int buflen)
> >               buf->request_id = (__force __le32) xid;
> >       }
> >       master_ifnum = info->control->cur_altsetting->desc.bInterfaceNumber;
> > -     retval = usb_control_msg(dev->udev,
> > -             usb_sndctrlpipe(dev->udev, 0),
> > -             USB_CDC_SEND_ENCAPSULATED_COMMAND,
> > -             USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> > -             0, master_ifnum,
> > -             buf, le32_to_cpu(buf->msg_len),
> > -             RNDIS_CONTROL_TIMEOUT_MS);
> > -     if (unlikely(retval < 0 || xid == 0))
> > +     retval = usb_control_msg_send(dev->udev, 0,
> > +                                   USB_CDC_SEND_ENCAPSULATED_COMMAND,
> > +                                   USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> > +                                   0, master_ifnum, buf,
> > +                                   le32_to_cpu(buf->msg_len),
> > +                                   RNDIS_CONTROL_TIMEOUT_MS);
> > +     if (unlikely(xid == 0))
> >               return retval;
> >
> >       /* Some devices don't respond on the control channel until
> > @@ -139,14 +138,11 @@ int rndis_command(struct usbnet *dev, struct rndis_msg_hdr *buf, int buflen)
> >       /* Poll the control channel; the request probably completed immediately */
> >       rsp = le32_to_cpu(buf->msg_type) | RNDIS_MSG_COMPLETION;
> >       for (count = 0; count < 10; count++) {
> > -             memset(buf, 0, CONTROL_BUFFER_SIZE);
> > -             retval = usb_control_msg(dev->udev,
> > -                     usb_rcvctrlpipe(dev->udev, 0),
> > -                     USB_CDC_GET_ENCAPSULATED_RESPONSE,
> > -                     USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> > -                     0, master_ifnum,
> > -                     buf, buflen,
> > -                     RNDIS_CONTROL_TIMEOUT_MS);
> > +             retval = usb_control_msg_recv(dev->udev, 0,
> > +                                           USB_CDC_GET_ENCAPSULATED_RESPONSE,
> > +                                           USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> > +                                           0, master_ifnum, buf, buflen,
> > +                                           RNDIS_CONTROL_TIMEOUT_MS);
> >               if (likely(retval >= 8)) {
>
> retval here is never going to be positive, right?  So I don't think this
> patch is correct :(
>

Yes :(.

> >                       msg_type = le32_to_cpu(buf->msg_type);
> >                       msg_len = le32_to_cpu(buf->msg_len);
> > @@ -178,17 +174,11 @@ int rndis_command(struct usbnet *dev, struct rndis_msg_hdr *buf, int buflen)
> >                               msg->msg_type = cpu_to_le32(RNDIS_MSG_KEEPALIVE_C);
> >                               msg->msg_len = cpu_to_le32(sizeof *msg);
> >                               msg->status = cpu_to_le32(RNDIS_STATUS_SUCCESS);
> > -                             retval = usb_control_msg(dev->udev,
> > -                                     usb_sndctrlpipe(dev->udev, 0),
> > -                                     USB_CDC_SEND_ENCAPSULATED_COMMAND,
> > -                                     USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> > -                                     0, master_ifnum,
> > -                                     msg, sizeof *msg,
> > -                                     RNDIS_CONTROL_TIMEOUT_MS);
> > -                             if (unlikely(retval < 0))
> > -                                     dev_dbg(&info->control->dev,
> > -                                             "rndis keepalive err %d\n",
> > -                                             retval);
> > +                             retval = usb_control_msg_send(dev->udev, 0,
> > +                                                           USB_CDC_SEND_ENCAPSULATED_COMMAND,
> > +                                                           USB_TYPE_CLASS | USB_RECIP_INTERFACE,
> > +                                                           0, master_ifnum, msg, sizeof(*msg),
> > +                                                           RNDIS_CONTROL_TIMEOUT_MS);
>
> You lost the error message that the previous call had if something went
> wrong.  Don't know if it's really needed, but there's no reason to
> remove it here.
>

The wrapper returns the error so thought that might work instead. But
yes, the old msg is better.

Anyways, this series is dropped :).

Thanks for the review,
Himadri

> thanks,
>
> greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
