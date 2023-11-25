Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53D34435
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 07:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmT/c+D6"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58AA960AF6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 07:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58AA960AF6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hmT/c+D6
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GNHfk0C3bVM
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 25 Nov 2023 07:13:03 +0000 (UTC)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A5D9B60AE1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 07:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5D9B60AE1
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2859551886cso757720a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Nov 2023 23:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700896383; x=1701501183; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtqF80WLttDzEODiE7Bbxwbs4nxVZwokhMgPSxT4dEQ=;
        b=hmT/c+D6cCWeqtbD/gtPvY0i05ufcxfO4hFknvmIQ4sFIl7msSjDSnBaRpwz6upaqX
         XuwYpfdqcqTbJ6dHloQiSrsSgtwwm5ZhA8MjX7rDukUgQReiRN3QuzgO6yHK1TLlciRT
         RPazO2czXtK0WvCtNcofyzCGunkrzax18OWbvWpRbm1mp2WhBGsJPrqRRsUQ09SpVjPJ
         VyHXgSP31QQ2f9VL5NGNHsl6kaFGBJ0OlZZzYc/FEjIpW4k5BjrG3oitHR+bsDOMFIZS
         uwCbCPWViJFDmygFDBf2f7N56Xoa/j4qZR/a7+O8zcI3BzVRkdcJs0Ty4sD/JUewdnWf
         gKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700896383; x=1701501183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtqF80WLttDzEODiE7Bbxwbs4nxVZwokhMgPSxT4dEQ=;
        b=ASIUMa+/1flZew3xNXDRAznTxfa0o4udbHAGGLvtZ83dR8fwkNRc/15d+ENrR+okvD
         MyAqcxc17E8AuxX41VDmJw2PwH7FBMCz0AYCNqyWa04FuTnou6jPJZTanzRU37KssqOR
         D6Yrw8PuSGBg+HOa7vt0pXD54DisQtS91+pG94UI2z3ci5w6tXG+v8q4Qqv2sVx0mIMn
         huG1HRBAmBMa+iYDj4AEdIRD+m+6qc3G3nHdKPnlMT/k1ge/lHUHiox6brl/E9W8qhM/
         cMSm0XZH3mwa19JOUDNF6NWfnzNxHt6cTvwTk98m/+3UgWa6x10Ko8J0D7uz6Hnh38Hw
         qxDQ==
X-Gm-Message-State: AOJu0YzRb+QGvwxYGSaNgswB1C9FryCw8LqH67iuj4n50Y5W8rjrNXFM
	b72t8buxxSCQ2QblATWcDJ/OxJoZ8XgLX6IJOBo=
X-Google-Smtp-Source: AGHT+IGaNH7fS0iuKiLVJx9efwqeQT0c6EltM7hmQCQVaOg6Ga0b0I2i4sPz23HYXj4pfnwwRDx401MO2Xi0yrlkjfc=
X-Received: by 2002:a17:90b:1d09:b0:280:c98f:2090 with SMTP id
 on9-20020a17090b1d0900b00280c98f2090mr6878396pjb.32.1700896382977; Fri, 24
 Nov 2023 23:13:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231122161304.12434-1-ghanshyam1898@gmail.com> <ZWEj5sDUs83qn0pc@equinox>
In-Reply-To: <ZWEj5sDUs83qn0pc@equinox>
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Date: Sat, 25 Nov 2023 12:42:26 +0530
Message-ID: <CAG-BmodoZyi50XK-pQ=YPZ-q6BLKCbwSpck7jn=dgRsXVQxUwA@mail.gmail.com>
Subject: Re: [PATCH V2] media: stk1160: Fixed high volume of stk1160_dbg messages
To: Phillip Potter <phil@philpotter.co.uk>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2023 at 4:00=E2=80=AFAM Phillip Potter <phil@philpotter.co.=
uk> wrote:
>
> On Wed, Nov 22, 2023 at 09:43:04PM +0530, Ghanshyam Agrawal wrote:
> > The function stk1160_dbg gets called too many times, which causes
> > the output to get flooded with messages. Since stk1160_dbg uses
> > printk, it is now replaced with dev_warn_ratelimited.
> >
> > Suggested-by: Phillip Potter <phil@philpotter.co.uk>
> > Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> > ---
> > v2:
> > Thanks for your suggestions Phillip. I have updated the TODO comment an=
d
> > used dev_warn_ratelimited for inclusion of kernel warning.
> >
> >  drivers/media/usb/stk1160/stk1160-video.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/=
usb/stk1160/stk1160-video.c
>
> Hi Ghanshyam,
>
> Thank you for the patch, but it is sadly incorrect.
>
> You have created this V2 against a tree including the V1 version of your
> patch. A V2 patch should apply cleanly against the source tree, with no
> previous version first needing to be applied.
>
> On another note, why are you using dev_warn_ratelimited here, and if
> there's a good reason, why not use it for the other callsites in this
> function? (Genuine question here, I've not studied the difference).
>
> Please create a V3, many thanks.
>
> Nacked-by: Phillip Potter <phil@philpotter.co.uk>
>
> Regards,
> Phil

Hi Phillip,

Thank you for taking time to review my patch.

I will fix the issue with my patch needing previous versions being applied
first.

I had used dev_warn_ratelimited because the checkpatch script mentioned
a sequence of priorities to use various logging functions and
dev_warn_ratelimited had higher priority. But now I have found other issues
with using this function here, so I will switch back to printk_ratelimited.

Let me fix the issues and submit a V3 patch. Thanks again for your time
and kind suggestions.

Regards,
Ghanshyam Agrawal
