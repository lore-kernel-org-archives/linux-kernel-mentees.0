Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B828C72636
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 00:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751330142; cv=none; b=qyvfWXBbJ7nHFK4hQs6EFful5+4cYDPWmRy+6yFxtj8HcfAy67qXaHyvCS3wGM4O83sSgEC8VM8AcZmez1KGjZQFyCaXsX2Vf2/4wwL499QpxDkm7ALa/UAQ7Za2+mKAefT87yL06ENtlnQsYzyVt/qTjIKBq2J/hcDJLVRC++Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751330142; c=relaxed/simple;
	bh=ERwlxARXEpt1F/4y2KtHKMEORUezg1jVkonhcyO5qhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXk2UTr8Rgjii7xd9Vic3bWt2I6mvRmJvQp5kYWvlpYt/NHxAMvUYJlwM+IcaJuv/cb/cZZx2ox6CFW3l7de1PBIJcB0nSgw83sKsIy6P1P7LV+NhO9wNVWyo07vf4CR6jNTaAW/+OAcpk8TxW0kuilRRWgu/4nuVUykjBmM6/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfNUS740; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfNUS740"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58B7E8030A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 00:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tn11s24E5GVm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jul 2025 00:35:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97A26804AE
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97A26804AE
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WfNUS740
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 97A26804AE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 00:35:38 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-610cbca60cdso1843771eaf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Jun 2025 17:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751330137; x=1751934937; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWI4N10Qll6H9gLi0COrUUb+8NPRB7fsuPXUb+Y1frk=;
        b=WfNUS740uUoilxsHXne6p0LPEoDZthg3ofOXCsvmRv4zC+epN+3DGADbGxA3g5teHs
         CGK+UgN6hvAR7oPF+1kO+5eWGzV+xfltCzgRT/S/sYHtgW0KMkEPtkxANB9DqoWdhEuo
         LKyFlnvwJrK1FjFTM+nbA4G/2qNTnCd2mn0UQASks5Mysg51tv9H3qkI9lRFl8LTabW0
         dOgdk3njxkGTFkBiGsNKpeOkj5tRFlpHRgG/mN8tCcPTjUfI0J9IYX7ZXMphpcIy2UOM
         sFrNnLitTXTk6VOUe7u9626hvavzmmA+uV23MCR9NDUpI5BqqYLf/vO3PAwnk4/RG75n
         YtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751330137; x=1751934937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWI4N10Qll6H9gLi0COrUUb+8NPRB7fsuPXUb+Y1frk=;
        b=SwLLL6RbGyzA3wHEomKzzbtTh3JlW9xD4wMa777VZ0ngFR3hPQ+gquInnlvxFv+jfb
         3qEn/Hohw7iKBmUrK9kCnFq2EQapC+8VbKzUTxwzJHnk15X73quKhXIyeBru2ygZcLSP
         Bmw5Pe+lnct//aze07UwHxcYJnQWTBAsSi52xqQ3QgAHQ9+3jnPkKg/ae3QrIJlwqXhA
         B4LSXeJtbHcIrczGb/qahfPGPQV4dG6qoRofoJe2OUS0TQLiwOHl40ASKd+afjF0yPPB
         cLJp9wb8F2tdlKTAkCW94hOiS7e2Yn9UGcr9zpWBRN35Mlw1xaW4nkWTQddtox6OLghl
         Q9bw==
X-Forwarded-Encrypted: i=1; AJvYcCWmzUXzzXcyksomdSNyFDlfq/EsGiyfwlSH9cZw8s6vmz9u28HWLhyO5hsGapgVU5XnuW5AvjDjLI77wQkSxgO6ZHou3Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxKy2R1Qpyv+fPPGyDAv/sX5SLgNxJEPVgyltgdmQYPyvlj0o6e
	lw5KefxkFOf3cLRzxmGAbsQDvmh/e4FQKJ+u1J46ZYOnyWSuFdrnPAfmgj2/N1xGwXrJQmWOGFF
	8REG6Bkd/FDRYWl6JAEFfEeBjFtRBgBs=
X-Gm-Gg: ASbGncvJYefNrgYNLI7baOpzf67IB7uOlEC+olrkBMF92hEqGXeYojFJT4/WYmH7dgL
	gpx9gKSHfS6KstalvRvwBQo6gkUjMvjYArKC3aMtjTXHupPycDk8dDeK2S6chjyXqc7tgZSGeQa
	T4IJVrxgoGL1K2cOW+Dx+OOzTxRO1IZghnhiPdpL1cqRo=
X-Google-Smtp-Source: AGHT+IFVdRd51zzo2gagjFpXgTBNdm7rEQILgwm7pFT36wENCbxr5fUARgOqLp4Zs15XgdjE9e6aRvtdJxw6++vpPx8=
X-Received: by 2002:a05:6820:1b0e:b0:611:b1c7:24b with SMTP id
 006d021491bc7-611b8ed608dmr9097448eaf.0.1751330137297; Mon, 30 Jun 2025
 17:35:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250629233509.291786-1-marcelomoreira1905@gmail.com> <2025063006-recopy-playmaker-562d@gregkh>
In-Reply-To: <2025063006-recopy-playmaker-562d@gregkh>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 30 Jun 2025 21:35:25 -0300
X-Gm-Features: Ac12FXz_69Zfj20sM9ZCsC3y4DQamsyQCYCGa35fTV1D9-WfSu36yRgghA9KVwI
Message-ID: <CAPZ3m_gDqVeyY9x838tUHBuEjXZrANLgqiJ=+Cn8DQYeCfSnGg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: replace scnprintf with sysfs_emit_at
 in debugfs show
To: Greg KH <greg@kroah.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 30 de jun. de 2025 =C3=A0s 02:09, Greg KH <greg@kroah.com> escreve=
u:
>
> On Sun, Jun 29, 2025 at 08:35:09PM -0300, Marcelo Moreira wrote:
> > Update the receive_timing_debugfs_show() function to utilize
> > sysfs_emit_at() for formatting output to the debugfs buffer.
> > This change adheres to the recommendation outlined
> > in Documentation/filesystems/sysfs.rst.
> >
> > This modification aligns with current sysfs guidelines.
>
> But this isn't a sysfs file, it's a debugfs file, so why are you calling
> sysfs_emit_at()?
>

You're right, thanks Greg.

> >
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/ite-it6505.c | 46 ++++++++++++++---------------
> >  1 file changed, 22 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/brid=
ge/ite-it6505.c
> > index 1383d1e21afe..98bea08a14e4 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -3427,37 +3427,35 @@ static ssize_t receive_timing_debugfs_show(stru=
ct file *file, char __user *buf,
> >       struct it6505 *it6505 =3D file->private_data;
> >       struct drm_display_mode *vid;
> >       u8 read_buf[READ_BUFFER_SIZE];
> > -     u8 *str =3D read_buf, *end =3D read_buf + READ_BUFFER_SIZE;
> > -     ssize_t ret, count;
> > +     ssize_t ret;
> > +     ssize_t count =3D 0;
> >
> >       if (!it6505)
> >               return -ENODEV;
> >
> >       it6505_calc_video_info(it6505);
> >       vid =3D &it6505->video_info;
> > -     str +=3D scnprintf(str, end - str, "---video timing---\n");
> > -     str +=3D scnprintf(str, end - str, "PCLK:%d.%03dMHz\n",
> > -                      vid->clock / 1000, vid->clock % 1000);
> > -     str +=3D scnprintf(str, end - str, "HTotal:%d\n", vid->htotal);
> > -     str +=3D scnprintf(str, end - str, "HActive:%d\n", vid->hdisplay)=
;
> > -     str +=3D scnprintf(str, end - str, "HFrontPorch:%d\n",
> > -                      vid->hsync_start - vid->hdisplay);
> > -     str +=3D scnprintf(str, end - str, "HSyncWidth:%d\n",
> > -                      vid->hsync_end - vid->hsync_start);
> > -     str +=3D scnprintf(str, end - str, "HBackPorch:%d\n",
> > -                      vid->htotal - vid->hsync_end);
> > -     str +=3D scnprintf(str, end - str, "VTotal:%d\n", vid->vtotal);
> > -     str +=3D scnprintf(str, end - str, "VActive:%d\n", vid->vdisplay)=
;
> > -     str +=3D scnprintf(str, end - str, "VFrontPorch:%d\n",
> > -                      vid->vsync_start - vid->vdisplay);
> > -     str +=3D scnprintf(str, end - str, "VSyncWidth:%d\n",
> > -                      vid->vsync_end - vid->vsync_start);
> > -     str +=3D scnprintf(str, end - str, "VBackPorch:%d\n",
> > -                      vid->vtotal - vid->vsync_end);
> > -
> > -     count =3D str - read_buf;
> > +     count +=3D sysfs_emit_at(read_buf, count, "---video timing---\n")=
;
> > +     count +=3D sysfs_emit_at(read_buf, count, "PCLK:%d.%03dMHz\n",
> > +                     vid->clock / 1000, vid->clock % 1000);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HTotal:%d\n", vid->hto=
tal);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HActive:%d\n", vid->hd=
isplay);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HFrontPorch:%d\n",
> > +                     vid->hsync_start - vid->hdisplay);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HSyncWidth:%d\n",
> > +                     vid->hsync_end - vid->hsync_start);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HBackPorch:%d\n",
> > +                     vid->htotal - vid->hsync_end);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VTotal:%d\n", vid->vto=
tal);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VActive:%d\n", vid->vd=
isplay);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VFrontPorch:%d\n",
> > +                     vid->vsync_start - vid->vdisplay);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VSyncWidth:%d\n",
> > +                     vid->vsync_end - vid->vsync_start);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VBackPorch:%d\n",
> > +                     vid->vtotal - vid->vsync_end);
> > +
> >       ret =3D simple_read_from_buffer(buf, len, ppos, read_buf, count);
> > -
>
> Shouldn't this all be using seq_print() instead?
>
> Again, don't use sysfs_emit*() functions for non-sysfs files, as you do
> NOT know the size of the buffer here (hint, it's not the same).
>
> And, your patch added trailing whitespace, did you forget to run it
> through checkpatch.pl before sending it?


Thanks again for the clarification, I'll be more attentive for future
submissions.

Specifically for this patch I forgot to run checkpatch, sorry. Sorry
for all the inconvenience.

Thanks Greg!

--=20
Cheers,
Marcelo Moreira
