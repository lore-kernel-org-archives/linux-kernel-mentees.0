Return-Path: <SRS0=ZEDA=M4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0F4C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 14:21:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22FC760EB2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 14:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22FC760EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE8F883947;
	Thu,  5 Aug 2021 14:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NnaWOG7flXsa; Thu,  5 Aug 2021 14:21:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F05CC838FE;
	Thu,  5 Aug 2021 14:21:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0079C0010;
	Thu,  5 Aug 2021 14:21:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47B53C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 14:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 303EE4033A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 14:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqVbVBpjAHXw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 14:21:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8597402F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 14:21:08 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id k65so9181218yba.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Aug 2021 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l4igTG4JDqw7cdSD03JVVY43wkTmekWhkLK6llc1k3s=;
 b=U3Om4RPmG5JZzc0S2sIr89rTSBs7rMp3XAkIGi2hK2+mlJ7SACUwB1WbwkmWS5e7Zt
 m7eBQFQciyfYFDlAFTZ3cQ5TrZvPCJpMfO/YyAhdrt7JBpTlCpwAqLBo97Z+jtogERPV
 /wJbtxgXGi0OHVWmnENi4sY5jlwZ+htMg/DFueU/ODLfG+XTJVb9L6rrWTqMm/R326+9
 aA9g+8JRlWc7ZYPIM8BEkNpmxLTWu0P8QNxnHMB43kli+cVlen9Q1U/p+T1bPpVc+kJn
 B4eWAK+eRuTVVnqPdGtlnAbZCx3okCbgQ10dskGmfdfL+jczi9neWhsrS5CTbeAxBMd1
 hcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l4igTG4JDqw7cdSD03JVVY43wkTmekWhkLK6llc1k3s=;
 b=ZFwMxeTkp1pxIc/V5VdHCjv+Rchax6iLZ+R1PW7FdFkYeFmc2XaNUEhHQQqHPPFDqR
 580HRBOZZcnwkWHr3xr4nXUzJaDUZeNpThleubVi2gm1mS5ehv7qE4sn1kuu2MwA8bUd
 Z98XwKQbF2xB0Jx8iA93yWSWusbTLd3FBNuP4h7s8mSPL0Wf5WNbpLKh/0/33FIbbVzj
 teRQDY6lOXMz4FjRI4SOT/M42WfpDJGVyRhLgTZO1YhsCCbiqkh5qnL2dpedcFRfEB8i
 X1QTZHaSmzx4KWxVY5J1DcUKb01ugdEyq9JDp3IhLEksySvrIle2UB6KG8btDwzkpFgq
 5dpA==
X-Gm-Message-State: AOAM533MPtTkaiOBBQf4tmMbCwNDP1wtWi5XCAUtC3Sa8ixZqoPPAonu
 E6YaLIEn6fKx2JR0DQ4m5oY7tkrYbtg07mcxQxc=
X-Google-Smtp-Source: ABdhPJyjMXtGEGB07x95668arFZka+rcB9IsljwMldl+kYAMQAwEEr41e/ch+ObQS2S5gF/bp+8LkAApdI50s6kYtyU=
X-Received: by 2002:a25:842:: with SMTP id 63mr6245073ybi.518.1628173267724;
 Thu, 05 Aug 2021 07:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
 <20210803142109.17137-1-utkarshverma294@gmail.com>
 <CABJPP5A9wjSpoYfX3j2v1dUGWv17hE6mNztuk5z2d5hyFuwohA@mail.gmail.com>
In-Reply-To: <CABJPP5A9wjSpoYfX3j2v1dUGWv17hE6mNztuk5z2d5hyFuwohA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 5 Aug 2021 16:20:56 +0200
Message-ID: <CAKXUXMydtSce3t91s0wmD87qr005MiVeMQ15UH-HBfsVub5ABQ@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: iuu_phoenix: fix quoted string split across
 lines
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Aug 5, 2021 at 3:53 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Tue, Aug 3, 2021 at 7:51 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> >
> > Fix checkpatch warning "quoted string split across lines".
> >
>
> You could write a line about why this change is required.
> And that there are no functional changes.
>

... and does this change actually increase the line length beyond 80,
or even 100 characters?

So, did you run checkpatch on your patch?

If you are just swapping one violation of one rule by the violation of
another rule, you will need to make a judgement which rule is more
important and provide a good reasoning for that.

Other than that, it looks good to me.

Lukas

> > Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> >  drivers/usb/serial/iuu_phoenix.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
> > index 19753611e..f2c0dad91 100644
> > --- a/drivers/usb/serial/iuu_phoenix.c
> > +++ b/drivers/usb/serial/iuu_phoenix.c
> > @@ -1195,13 +1195,10 @@ module_param(boost, int, S_IRUGO | S_IWUSR);
> >  MODULE_PARM_DESC(boost, "Card overclock boost (in percent 100-500)");
> >
> >  module_param(clockmode, int, S_IRUGO | S_IWUSR);
> > -MODULE_PARM_DESC(clockmode, "Card clock mode (1=3.579 MHz, 2=3.680 MHz, "
> > -               "3=6 Mhz)");
> > +MODULE_PARM_DESC(clockmode, "Card clock mode (1=3.579 MHz, 2=3.680 MHz, 3=6 Mhz)");
> >
> >  module_param(cdmode, int, S_IRUGO | S_IWUSR);
> > -MODULE_PARM_DESC(cdmode, "Card detect mode (0=none, 1=CD, 2=!CD, 3=DSR, "
> > -                "4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING)");
> > +MODULE_PARM_DESC(cdmode, "Card detect mode (0=none, 1=CD, 2=!CD, 3=DSR, 4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING)");
> >
> >  module_param(vcc_default, int, S_IRUGO | S_IWUSR);
> > -MODULE_PARM_DESC(vcc_default, "Set default VCC (either 3 for 3.3V or 5 "
> > -               "for 5V). Default to 5.");
> > +MODULE_PARM_DESC(vcc_default, "Set default VCC (either 3 for 3.3V or 5 for 5V). Default to 5.");
> > --
> > 2.17.1
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
