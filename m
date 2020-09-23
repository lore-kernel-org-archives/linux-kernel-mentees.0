Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA92FC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 14:08:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 444DE2220D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 14:08:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIsdByJz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 444DE2220D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E92EB8704E;
	Wed, 23 Sep 2020 14:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcDkbtXBBpbg; Wed, 23 Sep 2020 14:08:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83BB686E5B;
	Wed, 23 Sep 2020 14:08:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60940C0859;
	Wed, 23 Sep 2020 14:08:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF577C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AAEDD8607D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdS3FYIGBieQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:08:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4E5C986031
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:08:26 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a17so172089wrn.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 07:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4uOSBvkeFCtt0jtghI6Iaa1Oo8+32MdaZFs6lvK60t8=;
 b=hIsdByJzmuRZb2kuHY+GIbDpMgWlvIUBRMTXmdV1C4IB9eRgcQy/OMVs2LdsuXRALc
 OPjiJGytcYJ+AqzYQ5+tx7xtLh+HPD1VxW1yvp/tZNOtCvSnydgapNZUVaFkMSapnkUV
 dn9rUUzdxM28cMyXFHXi4gXE32x+JjKe7gj8YX07quIKnNYjNcsA1Hj71H1/YIqtk+An
 vqMD9ip4rhlImUBqeu7EzMTx6OQe7a94hq6HBB21V+1x2Kk7PgLgb+t2XF8Njo6T8Qlv
 QgC7XqKrVAt5bRwL5i4A/pXjwpHdnhvjfMKRd9HDdfGzo52JbJhYPkcUFq8/+7FfOHMB
 7HJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4uOSBvkeFCtt0jtghI6Iaa1Oo8+32MdaZFs6lvK60t8=;
 b=DNu5Tn0drnORatXPGkHH2Fq6ml4IRptPYp9qZgX3tyqwYfz5IMLQmHymObGZfySrZK
 jT7K2nka4/bpN9eqegeLBb1shMV9OT4v8IakHYWN5H8pgiihG0kt08M82i8vx6QnyhYj
 afeKrD8mbKX6sOYhGdXdR//HHeIy78cozEUNmNV0fphF9wjzfe8TIbHFJ0ZLITedZt3p
 udsivOBo/U9qD8lzSzjopUlG8bD9vBDxuH/H77YyZUsr3slHZLgAc/9I6+3Q7E+gEflO
 1D4u+Vp5+IydkyNwBOjEbqeD1DZEoiyI368sv10zwJq+6nvPOAejAxmsX8rpkhEiWr5b
 Prlg==
X-Gm-Message-State: AOAM5327rxJMrLXWWnOsijofGtXxjk9GG3+9nS6QIqiwy64qsu1VmW/6
 DxO9AxK7xL776b14gESZOu+fG6bUSeQmspxgI9U=
X-Google-Smtp-Source: ABdhPJwfifO44HBhduMMKEMbLd2291rc6s++c2z9Q98+xivVO3BJPwzCQSMyA1phXsZQ4fDrwn6LpOEPvUyk8VM1Cs4=
X-Received: by 2002:adf:9b8b:: with SMTP id d11mr1141570wrc.71.1600870104795; 
 Wed, 23 Sep 2020 07:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-2-himadrispandya@gmail.com>
 <20200923102425.GC3154647@kroah.com>
In-Reply-To: <20200923102425.GC3154647@kroah.com>
From: Himadri Pandya <himadrispandya@gmail.com>
Date: Wed, 23 Sep 2020 19:38:13 +0530
Message-ID: <CAOY-YVk3Vio=jKndTMnn66h-dZAnFUpZU701KqvdYh51ZQFk+g@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB list <linux-usb@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 pankaj.laxminarayan.bharadiya@intel.com, Oliver Neukum <oneukum@suse.com>,
 yuehaibing@huawei.com, LKML <linux-kernel@vger.kernel.org>, ogiannou@gmail.com,
 netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, petkan@nucleusys.com
Subject: Re: [Linux-kernel-mentees] [PATCH 1/4] net: usbnet: use
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

On Wed, Sep 23, 2020 at 3:54 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 23, 2020 at 02:35:16PM +0530, Himadri Pandya wrote:
> > Potential incorrect use of usb_control_msg() has resulted in new wrapper
> > functions to enforce its correct usage with proper error check. Hence
> > use these new wrapper functions instead of calling usb_control_msg()
> > directly.
> >
> > Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> > ---
> >  drivers/net/usb/usbnet.c | 46 ++++------------------------------------
> >  1 file changed, 4 insertions(+), 42 deletions(-)
> >
> > diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> > index 2b2a841cd938..a38a85bef46a 100644
> > --- a/drivers/net/usb/usbnet.c
> > +++ b/drivers/net/usb/usbnet.c
> > @@ -1982,64 +1982,26 @@ EXPORT_SYMBOL(usbnet_link_change);
> >  static int __usbnet_read_cmd(struct usbnet *dev, u8 cmd, u8 reqtype,
> >                            u16 value, u16 index, void *data, u16 size)
> >  {
> > -     void *buf = NULL;
> > -     int err = -ENOMEM;
> > -
> >       netdev_dbg(dev->net, "usbnet_read_cmd cmd=0x%02x reqtype=%02x"
> >                  " value=0x%04x index=0x%04x size=%d\n",
> >                  cmd, reqtype, value, index, size);
> >
> > -     if (size) {
> > -             buf = kmalloc(size, GFP_KERNEL);
> > -             if (!buf)
> > -                     goto out;
> > -     }
> > -
> > -     err = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
> > -                           cmd, reqtype, value, index, buf, size,
> > +     return usb_control_msg_recv(dev->udev, 0,
> > +                           cmd, reqtype, value, index, data, size,
> >                             USB_CTRL_GET_TIMEOUT);
> > -     if (err > 0 && err <= size) {
> > -        if (data)
> > -            memcpy(data, buf, err);
> > -        else
> > -            netdev_dbg(dev->net,
> > -                "Huh? Data requested but thrown away.\n");
> > -    }
> > -     kfree(buf);
> > -out:
> > -     return err;
> >  }
>
> Now there is no real need for these wrapper functions at all, except for
> the debugging which I doubt anyone needs anymore.
>
> So how about just deleting these and calling the real function instead?
>

Yes, that would be a better thing to do.

Thanks,
Himadri

> thanks,
>
> greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
