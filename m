Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3E36FD2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9G3bm6z"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B2D742107
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 08:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B2D742107
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U9G3bm6z
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDdbrXPRqLyc
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 25 Nov 2023 08:39:01 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 779CF420F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 08:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 779CF420F7
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2859551886cso786353a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 00:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700901541; x=1701506341; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3Bf/Yl9mKrvt0khOxHwark3QzJ6UQysXXp2xzavtBk=;
        b=U9G3bm6zDfUMV9LFMZQIrZkZKbmsjbxZOXQknMDUMCvlXOaHOVWChIOZHjMHQQXDT4
         duMgYCfbIGWfUD3b4c7UMHEc3ERIvSwC61j/1wx3VkZRBnJNyHnO+UkPNlUMTJYGrIHI
         ojweH9Oqn5Ewtg7aQr0hUtbQgKRaldkc0KiR0YWgP3myWm4+Y0+r56ZwLlGIn+3dWJFS
         CMw2sL2RFWrCGMBWRX24Hf/46tm5lRJHKSIC6tCHKFeeZb4D4DZLmY2FpxM+5Xlun+fc
         w1EATZCwvWxQ6YSvI3jPuaJn7mXJinH4UBypGvuC7VVC6WCBXg9h7ofWRkNHLFmw4yph
         dS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700901541; x=1701506341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3Bf/Yl9mKrvt0khOxHwark3QzJ6UQysXXp2xzavtBk=;
        b=bQANRvJQZq+NIGrbAUZ/Fr4KysBzNbVbbheFfckHhu6s+xxm7tPk1arrYVubm6ASca
         mtxUnaMym6VdmbPPT08AEi5WdENlbYFfB6coRkY2lkHJqALBbK5cxxd5dcX+zXV8FBSO
         CQnzMR0xsrNAbAGeBwrrFgfajeiFxY7CS6E36QrB54hsM8f71E0k9Idr7zn4XktBLgNT
         vUF4RnOe1YbahHUalQRcdHGF/NruVdq9Z2rAOQNtaTAGeYwOWAHZtwo5VuRipIYeVm/9
         obULm55kzyn/3aGMqBXkmP9/kXyf6Jxd1CgAzALFTeT5WbqsRl9DBvuEzl1dWh+ZkNAg
         +VIw==
X-Gm-Message-State: AOJu0YxCPVXMjKDNCr6RNqMu0WAVS3i/FZcWbOco59g08yMDwDj+ebob
	sYCnMW5Fb3DOqqdZJFP3dRppwwCTpYXk7Mrmt1w=
X-Google-Smtp-Source: AGHT+IHgS1+vLNVv0PbZzEHH+jxGqxTkbV8A7WbpzlVQdFNHj8uftYyqF+QcWVS7dsCJBiOglO8+HHcs980EBN6qpng=
X-Received: by 2002:a17:90b:224b:b0:27d:880d:8645 with SMTP id
 hk11-20020a17090b224b00b0027d880d8645mr5626111pjb.49.1700901540728; Sat, 25
 Nov 2023 00:39:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231125073738.649948-1-ghanshyam1898@gmail.com>
 <2023112554-bagginess-banker-089e@gregkh> <CAG-BmocpXo5GY7KSh-nnw7Z6ExkMGKxetoeSdbyNjrqFCGJLQA@mail.gmail.com>
 <2023112508-clothing-twirl-fe40@gregkh>
In-Reply-To: <2023112508-clothing-twirl-fe40@gregkh>
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Date: Sat, 25 Nov 2023 14:08:24 +0530
Message-ID: <CAG-Bmoesp5B+7G4in_OH7qH2g_N3A+7tfO=ximbPZMfoTaAJaA@mail.gmail.com>
Subject: Re: [PATCH V3] media: stk1160: Fixed high volume of stk1160_dbg messages
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, 
	Phillip Potter <phil@philpotter.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2023 at 1:58=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Nov 25, 2023 at 01:51:35PM +0530, Ghanshyam Agrawal wrote:
> > On Sat, Nov 25, 2023 at 1:18=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Sat, Nov 25, 2023 at 01:07:38PM +0530, Ghanshyam Agrawal wrote:
> > > > The function stk1160_dbg gets called too many times, which causes
> > > > the output to get flooded with messages. Since stk1160_dbg uses
> > > > printk, it is now replaced with printk_ratelimited directly.
> > > >
> > > > Suggested-by: Phillip Potter <phil@philpotter.co.uk>
> > > > Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> > > > ---
> > > > V3:
> > > > Fixed the issue with my patch needing previous versions being appli=
ed
> > > > first.
> > > >
> > > > Used printk_ratelimited instead of dev_warn_ratelimited because
> > > > of compiler error "incompatible pointer type".
> > > >
> > > > V2:
> > > > To add KERN_WARNING in printk_ratelimited, and later as per warning=
 by
> > > > the checkpatch script, replaced  printk_ratelimited with
> > > > dev_warn_ratelimited.
> > > >
> > > > V1:
> > > > The function stk1160_dbg gets called too many times, which causes
> > > > the output to get flooded with messages. Since stk1160_dbg uses
> > > > printk, it is now replaced with dev_warn_ratelimited.
> > > >
> > > >  drivers/media/usb/stk1160/stk1160-video.c | 5 ++---
> > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/me=
dia/usb/stk1160/stk1160-video.c
> > > > index 4e966f6bf608..98417fa31d70 100644
> > > > --- a/drivers/media/usb/stk1160/stk1160-video.c
> > > > +++ b/drivers/media/usb/stk1160/stk1160-video.c
> > > > @@ -107,8 +107,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8=
 *src, int len)
> > > >
> > > >       /*
> > > >        * TODO: These stk1160_dbg are very spammy!
> > > > -      * We should 1) check why we are getting them
> > > > -      * and 2) add ratelimit.
> > > > +      * We should check why we are getting them.
> > > >        *
> > > >        * UPDATE: One of the reasons (the only one?) for getting the=
se
> > > >        * is incorrect standard (mismatch between expected and confi=
gured).
> > > > @@ -151,7 +150,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8=
 *src, int len)
> > > >
> > > >       /* Let the bug hunt begin! sanity checks! */
> > > >       if (lencopy < 0) {
> > > > -             stk1160_dbg("copy skipped: negative lencopy\n");
> > > > +             printk_ratelimited(KERN_WARNING "copy skipped: negati=
ve lencopy\n");
> > >
> > > You changed a debug message level to a KERN_WARNING level?  That feel=
s
> > > like a step backwards.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Hi Greg,
> >
> > Thanks for your response. The log level should indeed be DEBUG
> > as it was earlier.
> >
> > I only wanted to add a rate limit there because it was printing too
> > many log messages as mentioned in the todo. Shall I update the
> > log level  to DEBUG and resend the patch? Thank you very much
> > again.
>
> If it's spamming the logs, why print anything at all as obviously
> everyone is ignoring it?  But I do not really know, the final decision
> should be up to the developer and maintainer of this subsystem.
>
> thanks,
>
> greg k-h

Hi Greg,

Noted with thanks. Let me update the patch.

Regards,
Ghanshyam Agrawal
