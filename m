Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C212D8DDD
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Nov 2025 06:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843124; cv=none; b=arHzNWmWu5Eenk8gn+MegUxjvSalVxkZqkS4eMewxlVHPfZ/ebCuVq/g7jLRtxlRQ1l12kR0fGmKg26O+SlSfHuFtX33zUCnVqoPj76bbyFjVggHofkA0evXoBi5HuLuVCPuT3tgKp+5N/1qLms8qsob1N9vePNzAH2p9+OM4nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843124; c=relaxed/simple;
	bh=Xl+bV7FTMz6YY5XMNc5QfCxFXt9tSNW93X8te6PCvC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QTOP/PJSAoTM+aFX8OY21BzQXNK7M3xU/HZQjJBzQqbvCdNiF79boBytYw7hQNkcrTtuzFKCa39RMlHtk4r0tXTH/aHn/dcics5jtGu9nyF4fqfotHEcN7jqIEFsEAN/6AQy0l0cSe2YEUhXNQMZgVDnp9g8n1mLK/as+yVFvBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dc6hvpKl; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dc6hvpKl"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-43323851d03so15092075ab.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Nov 2025 22:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762843122; x=1763447922; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euqY12f4XAJaMQMQzg4Wpf+lFNr4mTaEKvgVSPURHhY=;
        b=Dc6hvpKlFnF1UmtvfAjY3WBVe1/jAOi+YzdYgzjAkt0TJb7Lc04F0yWfc+bgyCTBam
         7D3W7j15qISNtrEJHeUEfMh+wz3a9jCwu0c2nsAK74n6T28PfAH+fLw/BXPj7nqRjG/u
         vtofM4rGMelma1TQ3M7FtqUR0iRxTMzijppJP1xhqBlbcnJneLI8gYugFQKRGVzNz98Z
         msj6pbqTL7vY3R/B/EwdO/40afr3DJLPY9dHUvxZT5hKBg/EAudvnTdXi7MhCsspzUaX
         aO3A+377/HSEHCrJuJ+UuI0rtlIXQy+QsvplhPwjMRyqA3qHL9xb2urQO3UzXvA8fNlq
         2jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762843122; x=1763447922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=euqY12f4XAJaMQMQzg4Wpf+lFNr4mTaEKvgVSPURHhY=;
        b=j28oD9birenWQ6cy6yqspzEP0UFkE6xemLs0/YuD083tRyRRWJXwL5HITJD/+V+taB
         Scj/v3ppJ1QdYokXGhASvN89xA4n+1FKhvldzjnW5bJ4sHbj3xs3j8GiEN+L7ed1+RL9
         D0L/2LPonXOlW1VeyP99PybHWfBleKwwdtTXhMgLchD1J5XpdpJxY7yp8G54+uAZFm2R
         eC3aEvvo6bNReCW5dnANHBLP0bG9C9Cem/H3xHv0tNAQo1O0tAYeHKMgn2rM0w3MCtqa
         Se7MU5/+rP3hBnIgfK95BM4S77wdS80lWTZMrAuPhNiMcpWMxsIBA8etSy9i4yKtlQve
         I5yg==
X-Forwarded-Encrypted: i=1; AJvYcCVcgo2ymkaKKr4Kgd6jIoIE8gNjHM28dkz7zkJcTE+vPvdHwchuUvCbRsgNz8papVj2uboKRsvX9F3GvU4z/zXCK98AHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyP3mROG3WfxNcpM+aSbY8KU+XBkQYMhd73nN9Rmc7qUWvry2xk
	Wp1EpYc1T2jycEp+hGRmyyNS/+wj9xiFTSXNaWGN/A9cWOMCM4tId8q/WMB5hOLZwMi0MxG3UQq
	gt7gM7NGy8D2+3uKMxPijYt9m91rJs00=
X-Gm-Gg: ASbGncsMsQciSh6JREU+dIIolqEtcczyp4U8Ix7Y1nCYBIvZ89KP1MeB9vx29l51Bi+
	MK6Bua0vjQOIXqsPeBrSjY3YT1DyiIBSgD9oQmELpJu/d3faLucY3QsR0LsBLKk+1+ViTu+BjAH
	a/AONmDZXCu65Gyf/iC4v8xJ5sPIwTWrmhCcMLfa3Sw+zpx2CeeuvSHxTklskRYTfhT3UfHtr6w
	99vGSTMjj94BTFJZi5At+iVuiaVuNTBqjFBNtldsXqs9urv94BkEeuqpQ4NOQ==
X-Google-Smtp-Source: AGHT+IFeRoakPRE8zi8k/oOfrR5pGfeZ4LbIVSqGrdkQqduDKfojeT6f0hQHugs1QFF1bO+YSrrqClPiCfH+kAuQvdc=
X-Received: by 2002:a05:6e02:216d:b0:431:d864:366a with SMTP id
 e9e14a558f8ab-43367dda177mr162444325ab.2.1762843122159; Mon, 10 Nov 2025
 22:38:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015094117.535157-1-rk0006818@gmail.com> <CAKY2RybBidcyMtUY8mwyT=F2e5f=HT9HR6JXmgz+UyU6_S3kUQ@mail.gmail.com>
 <26032cb1-53c6-46a1-b3eb-e1876142bf1c@kernel.org>
In-Reply-To: <26032cb1-53c6-46a1-b3eb-e1876142bf1c@kernel.org>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Tue, 11 Nov 2025 12:08:31 +0530
X-Gm-Features: AWmQ_bkXO6wyq1jlR5vqIwoGltTDZvA3BFaS9rpCJPD8ZK7lPKgSIKGBD1uL6n4
Message-ID: <CAKY2Ryb60yKh1ooFoF4VSTwSdR2srBVMTvFAy7PwVmxE__+SDg@mail.gmail.com>
Subject: Re: [PATCH] firmware: stratix10-rsu: replace scnprintf() with
 sysfs_emit() in *_show() functions
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 10:15=E2=80=AFAM Dinh Nguyen <dinguyen@kernel.org> w=
rote:
>
>
>
> On 11/2/25 23:55, Rahul Kumar wrote:
> > On Wed, Oct 15, 2025 at 3:11=E2=80=AFPM Rahul Kumar <rk0006818@gmail.co=
m> wrote:
> >>
> >> Replace scnprintf() with sysfs_emit() in sysfs *_show() functions
> >> in stratix10-rsu.c to follow the kernel's guidelines from
> >> Documentation/filesystems/sysfs.rst.
> >>
> >> This improves consistency, safety, and makes the code easier to
> >> maintain and update in the future.
> >>
> >> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> >> ---
> >>   drivers/firmware/stratix10-rsu.c | 7 +++----
> >>   1 file changed, 3 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/firmware/stratix10-rsu.c b/drivers/firmware/strat=
ix10-rsu.c
> >> index 1ea39a0a76c7..53c896ceca9a 100644
> >> --- a/drivers/firmware/stratix10-rsu.c
> >> +++ b/drivers/firmware/stratix10-rsu.c
> >> @@ -454,8 +454,7 @@ static ssize_t max_retry_show(struct device *dev,
> >>          if (!priv)
> >>                  return -ENODEV;
> >>
> >> -       return scnprintf(buf, sizeof(priv->max_retry),
> >> -                        "0x%08x\n", priv->max_retry);
> >> +       return sysfs_emit(buf, "0x%08x\n", priv->max_retry);
> >>   }
> >>
> >>   static ssize_t dcmf0_show(struct device *dev,
> >> @@ -632,7 +631,7 @@ static ssize_t spt0_address_show(struct device *de=
v,
> >>          if (priv->spt0_address =3D=3D INVALID_SPT_ADDRESS)
> >>                  return -EIO;
> >>
> >> -       return scnprintf(buf, PAGE_SIZE, "0x%08lx\n", priv->spt0_addre=
ss);
> >> +       return sysfs_emit(buf, "0x%08lx\n", priv->spt0_address);
> >>   }
> >>
> >>   static ssize_t spt1_address_show(struct device *dev,
> >> @@ -646,7 +645,7 @@ static ssize_t spt1_address_show(struct device *de=
v,
> >>          if (priv->spt1_address =3D=3D INVALID_SPT_ADDRESS)
> >>                  return -EIO;
> >>
> >> -       return scnprintf(buf, PAGE_SIZE, "0x%08lx\n", priv->spt1_addre=
ss);
> >> +       return sysfs_emit(buf, "0x%08lx\n", priv->spt1_address);
> >>   }
> >>
> >>   static DEVICE_ATTR_RO(current_image);
> >> --
> >> 2.43.0
> >>
> >
> > Hi Dinguyen,
> >
> > Just following up to see if you=E2=80=99ve had a chance to review this =
patch,
> > or if there=E2=80=99s anything more needed from my side.
> >
> > Link to v1:
> > https://lore.kernel.org/all/20251015094117.535157-1-rk0006818@gmail.com=
/
> >
> > Thanks,
> > Rahul
>
> Sorry about that. I've applied it.
>
> Thanks,
> Dinh
>

Hi Dinh,

Could you please share the commit ID where this patch was applied?

Thanks,
Rahul
