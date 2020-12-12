Return-Path: <SRS0=PhKz=FQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C181BC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Dec 2020 18:11:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4987522571
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Dec 2020 18:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4987522571
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E7A3B8748D;
	Sat, 12 Dec 2020 18:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTcDQwsCbMTE; Sat, 12 Dec 2020 18:11:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5671787488;
	Sat, 12 Dec 2020 18:11:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47239C0893;
	Sat, 12 Dec 2020 18:11:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EF6DC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 18:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 387E586C90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 18:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ef4yvAp3hqcx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 18:11:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 641C486A39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 18:11:11 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id a12so19794214lfl.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 10:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rd/MSDCqB3proq83PvZ8hbJOMjEFaKKxahVpwT8rkaE=;
 b=fYpxU5I2pfZcsjgJSvvKC7vW+JvJiS0EXdB4pf4OO+o+8GbICuEKFOQBZO70BMJ1IN
 K5FblLgigMCtAKIeGO8se728e0eOf5mzs5Ai9VIxE0/0I3lf9pArXKxQyACAMrVetANi
 yneOh/nLlF5RaAAn9ocN2Z3buoZxw5SNXxbZ16ydkqcUTV0zPKv31XBsQOvDUR1K9GCV
 h6xVQ0hWZEezJRnQTADoV/i304BtVsYeeOifYO2qlE9RGrTPXKZwwhQPfwKhwQraZB1u
 JwMAz8GDnYRu8nSUdRC5euDloLRHo5MqKmKk398AELMm4vnBNbxIBmf1+yTl6dj3Hfsu
 ehQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rd/MSDCqB3proq83PvZ8hbJOMjEFaKKxahVpwT8rkaE=;
 b=ckQUOtdRDN/hiWrzE579gVed+AGVlH+Ix0bT9zHXGS5kcpcRFyLUa6gUISIaulu3sB
 G+hRyAdzmxPq/z5SWpjdLIqFLlzs4apW0ishViOQtm4tzMFuTKOZnnKl+SbEdXxcWkhq
 CdeNhVou6PcE2EPPstLE/9iaVdyDk9Zf3yDJ2pFkW3anHQ5O53Rb8vD9KWrUD1RIaQkC
 hJ091P0/XZjoa9Y4zlUlr34dcgJ8GNpN27o8wb+cUa3/IaQRDH3DgI9y1BkzVQRhrIOl
 fQTrDPdOnTuwFfWtmqK3+2XoF1JJdc6X8t63zEMd4cwY+MrKh1qN1BGKULB2yBL2eNcp
 d8dg==
X-Gm-Message-State: AOAM532efZHx4ay/CFZ8pUMvrhdmE+1C3SLZa59OTL44VJmOJa5WxZCY
 0YjN6UFEW9yUSltx13futHeiW0nWdRljGIUPTYw=
X-Google-Smtp-Source: ABdhPJx9tzHCcjsNb7KD0g6JqEIbkRFOC//36LCaSZoNVemwLTQI8QRBmsEULtsn44NRZtiL/6u8BkwK5RhquN4btlI=
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr7799598lji.466.1607796669300; 
 Sat, 12 Dec 2020 10:11:09 -0800 (PST)
MIME-Version: 1.0
References: <20201212153517.155164-1-dwaipayanray1@gmail.com>
 <X9UDC9YNCnxCf0w/@kroah.com>
In-Reply-To: <X9UDC9YNCnxCf0w/@kroah.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 12 Dec 2020 23:40:44 +0530
Message-ID: <CABJPP5D=fti+4R6wYQnCH04uBPJgVThYAGTqO+t2C1CAVtQPTQ@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] leds: convert symbolic
 permission bit macros to octal
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

On Sat, Dec 12, 2020 at 11:19 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sat, Dec 12, 2020 at 09:05:17PM +0530, Dwaipayan Ray wrote:
> > Symbolic macro names are hard to understand and should not be
> > used for permission bits.
> >
> > Convert all bad symbolic permission bit macro uses in led to just use
> > the octal numbers.
> >
> > Following macros were replaced:
> >
> > S_IRUGO => 0444
> > S_IWUSR => 0200
> > S_IRUGO | S_IWUSR => 0644
> >
> > Link: https://lore.kernel.org/lkml/CA+55aFw5v23T-zvDZp-MmD_EYxF8WbafwwB59934FV7g21uMGQ@mail.gmail.com/
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  drivers/leds/leds-blinkm.c        | 8 ++++----
> >  drivers/leds/leds-lm355x.c        | 2 +-
> >  drivers/leds/leds-lm3642.c        | 4 ++--
> >  drivers/leds/leds-lp55xx-common.h | 6 +++---
> >  4 files changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> > index e11fe1788242..6b9b13f58d8a 100644
> > --- a/drivers/leds/leds-blinkm.c
> > +++ b/drivers/leds/leds-blinkm.c
> > @@ -209,7 +209,7 @@ static ssize_t store_red(struct device *dev, struct device_attribute *attr,
> >       return count;
> >  }
> >
> > -static DEVICE_ATTR(red, S_IRUGO | S_IWUSR, show_red, store_red);
> > +static DEVICE_ATTR(red, 0644, show_red, store_red);
>
> Why not use DEVICE_ATTR_RW() instead?  THat would handle all of this
> automatically for you, which is why they are recommended to be used
> instead.
>
> thanks,
>
> greg k-h

Thanks Greg, I will do that.

Seems like the led drivers are still using a lot of those old constructs.
leds$ git grep -P "DEVICE_ATTR\(" | wc -l
          31

Will correct them all.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
