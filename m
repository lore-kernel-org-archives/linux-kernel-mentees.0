Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750D59444
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rqo2UikY"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF5DE615FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 08:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF5DE615FE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rqo2UikY
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lG-9rysM0oOA
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 25 Nov 2023 08:22:12 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B01A2614F8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 08:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B01A2614F8
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6cb749044a2so2544559b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 00:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700900532; x=1701505332; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXAMT1m/Mn+bDDg8lCVh+2sMt2ufqIKuHwMzy74xes8=;
        b=Rqo2UikYP60cbQ73WVKStet4jsDNybz7An7teSv6q7B8X4JP3DPgZKJ/X7hDOkjdpn
         Nmey+MmkGDoMN+mcKL5abUqpEKwYso8+lrDWGKHiA6F1wOzcGyQDFyX6rszZuTyM+R/A
         oFhXcYyhDjYavF7ScILYtVJ2qBF3Il34udsIgoi3YfvgtxYKJYZ913qfZE3m3bc1X+xa
         HO+qNMk6VGqvBIAODqoO2bxlcgZAKBiZ6RKgUD5/VsB1Ki2cF5U72URsffMOzi9DSCar
         hGGsH9zhngl/3u30ToIzOo67kodftC7LalWTmgRwtTln2Kr0HmWqEoWzywZ0g3d95nxv
         Ip5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700900532; x=1701505332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXAMT1m/Mn+bDDg8lCVh+2sMt2ufqIKuHwMzy74xes8=;
        b=oZ6uaDLJRLZP7M5Jp6/PXz2WIPLwVs7BcfQGMvJFgkAQIOBW9CwdW04xvsAWPvOPH1
         j9TmbZ/Hkf/FE8b0ojZBcvpNTOUyj7NaU4LPdDlqXFk/+0gjEDlUYZiXB5MgBNJPJy0+
         1cJNeQy3reV9XRL22MKyKq1UqYmM18bNfWXfZjE1+rIBjMo4mPBnxc87dKmtdgKdnS+j
         SWnVlX76K91JLMw0mtjrs1cl7JTayma+GMV2tCu1Re7k/77nIaCZFhMee3zFF1O3d2Tl
         VCvoCQRQrOJlWe9ysbJjeReImloAVPMBK0iiRPaKmz648VDz+WRp/ci2ob1vvEzl7uDz
         pctg==
X-Gm-Message-State: AOJu0YyRSw1BST0o/5Ou2M4mQBhDeX9prkp1QBzKQvjMpN3MzpeciJj0
	4aBS17WRMa7e7BnBxUFHI+iYDUQ/bfRivRgeY1s=
X-Google-Smtp-Source: AGHT+IGIERX2T7/D9zdX3uAWBmI3HkeyREbrc0bFp4tUviYv26xYWhn+7W1oa8oyCvK0VLx70DDaHtjBNsFax/WpcLg=
X-Received: by 2002:a05:6a20:8421:b0:185:876f:4f4d with SMTP id
 c33-20020a056a20842100b00185876f4f4dmr8211221pzd.32.1700900532019; Sat, 25
 Nov 2023 00:22:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231125073738.649948-1-ghanshyam1898@gmail.com> <2023112554-bagginess-banker-089e@gregkh>
In-Reply-To: <2023112554-bagginess-banker-089e@gregkh>
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Date: Sat, 25 Nov 2023 13:51:35 +0530
Message-ID: <CAG-BmocpXo5GY7KSh-nnw7Z6ExkMGKxetoeSdbyNjrqFCGJLQA@mail.gmail.com>
Subject: Re: [PATCH V3] media: stk1160: Fixed high volume of stk1160_dbg messages
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, 
	Phillip Potter <phil@philpotter.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2023 at 1:18=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Nov 25, 2023 at 01:07:38PM +0530, Ghanshyam Agrawal wrote:
> > The function stk1160_dbg gets called too many times, which causes
> > the output to get flooded with messages. Since stk1160_dbg uses
> > printk, it is now replaced with printk_ratelimited directly.
> >
> > Suggested-by: Phillip Potter <phil@philpotter.co.uk>
> > Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> > ---
> > V3:
> > Fixed the issue with my patch needing previous versions being applied
> > first.
> >
> > Used printk_ratelimited instead of dev_warn_ratelimited because
> > of compiler error "incompatible pointer type".
> >
> > V2:
> > To add KERN_WARNING in printk_ratelimited, and later as per warning by
> > the checkpatch script, replaced  printk_ratelimited with
> > dev_warn_ratelimited.
> >
> > V1:
> > The function stk1160_dbg gets called too many times, which causes
> > the output to get flooded with messages. Since stk1160_dbg uses
> > printk, it is now replaced with dev_warn_ratelimited.
> >
> >  drivers/media/usb/stk1160/stk1160-video.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/=
usb/stk1160/stk1160-video.c
> > index 4e966f6bf608..98417fa31d70 100644
> > --- a/drivers/media/usb/stk1160/stk1160-video.c
> > +++ b/drivers/media/usb/stk1160/stk1160-video.c
> > @@ -107,8 +107,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *sr=
c, int len)
> >
> >       /*
> >        * TODO: These stk1160_dbg are very spammy!
> > -      * We should 1) check why we are getting them
> > -      * and 2) add ratelimit.
> > +      * We should check why we are getting them.
> >        *
> >        * UPDATE: One of the reasons (the only one?) for getting these
> >        * is incorrect standard (mismatch between expected and configure=
d).
> > @@ -151,7 +150,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *sr=
c, int len)
> >
> >       /* Let the bug hunt begin! sanity checks! */
> >       if (lencopy < 0) {
> > -             stk1160_dbg("copy skipped: negative lencopy\n");
> > +             printk_ratelimited(KERN_WARNING "copy skipped: negative l=
encopy\n");
>
> You changed a debug message level to a KERN_WARNING level?  That feels
> like a step backwards.
>
> thanks,
>
> greg k-h

Hi Greg,

Thanks for your response. The log level should indeed be DEBUG
as it was earlier.

I only wanted to add a rate limit there because it was printing too
many log messages as mentioned in the todo. Shall I update the
log level  to DEBUG and resend the patch? Thank you very much
again.

Regards,
Ghanshyam Agrawal
