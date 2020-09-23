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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40BBC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 14:06:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 026B72137B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 14:06:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoYYRY91"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 026B72137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 97DCB8607D;
	Wed, 23 Sep 2020 14:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TI2WGjUiRO-x; Wed, 23 Sep 2020 14:06:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2552986031;
	Wed, 23 Sep 2020 14:06:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A092C0859;
	Wed, 23 Sep 2020 14:06:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65F95C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4CBB1867E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6bHGZY4Q8Qqf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:06:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C9AE2867CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:06:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z1so186172wrt.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 07:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TwbdsbNQ01qQwqOKbFf8TNuPGrR4dQ5NlUzkmbce0+o=;
 b=OoYYRY91DkAWgnnrlsYtddRWauvcC6OJ5YzJtW14Fojl7S4eZu1wwPYvSc1xRvOEMv
 NjV30C9vrMMoW8M8VbZL6SYmtTfdm6l8PF3MV1MPl/O5bP1cPPtTNLMzN07U4AaGgrQD
 1iQ6DgdL6L/1+296uCalBUseH+C2U6RrgSxZFNZ9m16wZ0G62sAK9zfLarzt+aPJfm9o
 6Vl5sVJOYSPYUWhIPgbLUqapDKdAiyL+8hp8lm85XhycIHqGinZ032dKeMCkKiT0EZwI
 UVKtL2IHxKhQbmx5Zw28U1jBOiJPv0NdtE1x2+1cNl972ttnYEXMS48Tg8J+P/LVblZw
 xNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TwbdsbNQ01qQwqOKbFf8TNuPGrR4dQ5NlUzkmbce0+o=;
 b=Nrc9UA37OKxM9JzofVJPdt6XURHOCh/hMfZ1QmqT8DE4/E1Y1F06wEwWMHc7Z2jSjt
 U/y/UCzGb6iKgYDWtwoqPuFi7zGSvyzC7lxQU2UJcyAWWvLfI7n7IOh/5Xnf0Hz8qzxM
 RRpmXLvW4/U9ltsJPq0aI8n+9AxJtZFETRkN+/J2nrKOkUrIjo547qe7i74RCi73PSkE
 QSt2pO8yqbD+9QzMkrDqVaM1kq0rfWXMLTJF1QlJD4rIzbRhczaC+UuhDBNjuKWr7MK0
 SmwwiTb2FueBJ4wQUEG6EqKcJmsPSKwCMadLE2iltR1GW7OlT98K0WR5LD27U8I2/bpy
 e4AA==
X-Gm-Message-State: AOAM530PUGH7fke+UV2McxP+nOsRSrsRJlY0Gu61NH9PDXCAEgWo+tB5
 YC5g0vkpnnDzK5t0V9eiQHT4ARbyCI89yLKmwzA=
X-Google-Smtp-Source: ABdhPJyRnzCExgkJl9cfP16TzWgw3924AwBQWxefA0lv/y8yZPq6g1F4ltEIa2eo/BbQ02YGvNKwscalgdDEGS6Awlk=
X-Received: by 2002:adf:9b8b:: with SMTP id d11mr1131300wrc.71.1600869982290; 
 Wed, 23 Sep 2020 07:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-4-himadrispandya@gmail.com>
 <1600856557.26851.6.camel@suse.com>
In-Reply-To: <1600856557.26851.6.camel@suse.com>
From: Himadri Pandya <himadrispandya@gmail.com>
Date: Wed, 23 Sep 2020 19:36:10 +0530
Message-ID: <CAOY-YVkHycXqem_Xr6nQLgKEunk3MNc7dBtZ=5Aym4Y06vs9xQ@mail.gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: petkan@nucleusys.com, pankaj.laxminarayan.bharadiya@intel.com,
 USB list <linux-usb@vger.kernel.org>, yuehaibing@huawei.com,
 LKML <linux-kernel@vger.kernel.org>, ogiannou@gmail.com,
 netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, Kees Cook <keescook@chromium.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 3/4] net: usb: rtl8150: use
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

On Wed, Sep 23, 2020 at 3:52 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Mittwoch, den 23.09.2020, 14:35 +0530 schrieb Himadri Pandya:
>
> Hi,
>
> > Many usage of usb_control_msg() do not have proper error check on return
> > value leaving scope for bugs on short reads. New usb_control_msg_recv()
> > and usb_control_msg_send() nicely wraps usb_control_msg() with proper
> > error check. Hence use the wrappers instead of calling usb_control_msg()
> > directly.
> >
> > Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> Nacked-by: Oliver Neukum <oneukum@suse.com>
>
> > ---
> >  drivers/net/usb/rtl8150.c | 32 ++++++--------------------------
> >  1 file changed, 6 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> > index 733f120c852b..e3002b675921 100644
> > --- a/drivers/net/usb/rtl8150.c
> > +++ b/drivers/net/usb/rtl8150.c
> > @@ -152,36 +152,16 @@ static const char driver_name [] = "rtl8150";
> >  */
> >  static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
> >  {
> > -     void *buf;
> > -     int ret;
> > -
> > -     buf = kmalloc(size, GFP_NOIO);
>
> GFP_NOIO is used here for a reason. You need to use this helper
> while in contexts of error recovery and runtime PM.
>

Understood. Apologies for proposing such a stupid change.

> > -     if (!buf)
> > -             return -ENOMEM;
> > -
> > -     ret = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
> > -                           RTL8150_REQ_GET_REGS, RTL8150_REQT_READ,
> > -                           indx, 0, buf, size, 500);
> > -     if (ret > 0 && ret <= size)
> > -             memcpy(data, buf, ret);
> > -     kfree(buf);
> > -     return ret;
> > +     return usb_control_msg_recv(dev->udev, 0, RTL8150_REQ_GET_REGS,
> > +                                 RTL8150_REQT_READ, indx, 0, data,
> > +                                 size, 500);
>
> This internally uses kmemdup() with GFP_KERNEL.
> You cannot make this change. The API does not support it.
> I am afraid we will have to change the API first, before more
> such changes are done.
>
> I would suggest dropping the whole series for now.

Okay. Thanks for the review.

Regards,
Himadri

>
>         Regards
>                 Oliver
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
