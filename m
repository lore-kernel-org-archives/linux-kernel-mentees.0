Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8274478F51
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 06:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758694071; cv=none; b=OPFUFGA11upARjPHa7GlQ8GyHjUECUR3PXH2OHtato9dqygN+6WsEtVv5d4so2lhtvsAzFrFnhdRhqgUT+MPjK0t+v2NOui/iCz4WNoxMYPSciJhkKD964bRRx8hW1yBJV8hcX2suBpnuK6Nip0FQJ8eF8gWtEMunY2cV2E9a6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758694071; c=relaxed/simple;
	bh=I06BXhpPXpJEEUQCQ5M1faoAt4YtubozaPfMBEUCyL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ru7kKL0yeT8fbwotgClqu5o2tkiRXbygN7hv8YwlNMHjblhr834V8RUqxepGTstxfdzjdPP1hPSnE2JGwcyL020Ud8Z64V4Wxz/SKTzavmXJFRNZqzW2YcL167f+Li1iK9gttD4Vua00jHoPEsRQ6OOem45W4a56HlRGriz2jYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtAWhJNY; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtAWhJNY"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE9B6078F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 06:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MosU5CnU9lEI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Sep 2025 06:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com; envelope-from=rk0006818@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6380A60784
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6380A60784
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PtAWhJNY
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6380A60784
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 06:07:49 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-889b846c314so157636439f.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 23:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758694068; x=1759298868; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dasyWeqvVNrFPy7VboPpD0Yyy39SDT10f/tzxZcxFug=;
        b=PtAWhJNYgnxuA1OUfWFyvY7NO+095LuggGZ+sBbSqbNtoWAgUmcxOJ1sSqLDSU6iN1
         HEr3Em/+rcA+/gtuX1HeOij+8CqLfg/tv7Tdy/oR87SWn82S43jSFzasic+VcbRNHoep
         S6fVYXEZtDTpBO7TK9euUMVeKefufNC0D0gDju2W2MdcngAAeEQAA3yU73opnKPs9NhA
         8Tfj84okETpXBmyXg9w7eam1Ii0j31IbDGJuLAZsxdakSefLLolhGIFXEZz7jldAzyuB
         lI+p/3V+6y39KyUM1uAXy1NuObUoBAEUrBF5wKNVlcggG4OQ+4JxKMwyq8Q3T+/SHcMM
         dCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758694068; x=1759298868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dasyWeqvVNrFPy7VboPpD0Yyy39SDT10f/tzxZcxFug=;
        b=XFg4nwgyMFE9xnoVFuKd+yX/tuN6twb0VNTCfwmbgj1Vi1gpc11nuCsAjWo+UDLenI
         66Cw9u9JTJ3zPT6dJWoF2Tz2BimMxT7Z5skwUHLweTQTBSGNXdO1VcAUMrJT8i7vXKmg
         vJYxMgymAbWkap4NkIc/+eul+KwAXnJ2MxdEZ5SUOc2bo/mNzMY201W43KVlr/hb9jt4
         cPF12vGnXI769zBL99g3qOZNwKXZHD0pTfD/FHO0HDVofd2EWgoDzgB8yOfrydLQdfsM
         AEfS6MqjkfuyfgUtkce17xHQGYcs6FbtGxWgaexO/CKzEO1X6R2zNDf3wZ510vtr9/tk
         CQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+EgaHiJ6Dc5a9HJGSOTgwgvSfh0245odiMCHK/uq1HPCt3exBl6Ibc21PxmJQod7HFJ/A7QkKLp9iAlMSUCr67zdrcQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywkl5OkGakuqEzNtzQ769wHypeD8nPFNML28/qUtetfdHo7bMP+
	yIJBGEJGvVqsZOqKwKa6FpoHtmFUyd01Wm64KFPkUtXReQagP0PL1z0fDgHQlaCP2xM/+yiEocT
	FMU9SCi/9yybz8Z1eBcwtjqo+WwyymCQ=
X-Gm-Gg: ASbGncsRcQK63P9iXNvzt2yGFDoXF2Waf1D+27dDgFu8flaTxbFr7wparK5hhRI3rYO
	bFObE5OfeK3iVa5SK/ceg6E1I/8K0jv1dnbTKwhNtcM2Max7rMm4CbtxwfN5kn8sP/ojxPOpMFk
	tDVrUHvg5SqyCl6rvU6LjDUaNisg+odJq21PWH0pq/x2RcGsu9BNBXd4iaitUpjPlkr7nYhxzAB
	OusGw==
X-Google-Smtp-Source: AGHT+IF7Azm3CSbUgIQ4C9xp80mGayFs6CTpry8PZJSTktWx2LuSb+ASvg7efRnLQb4fysk7hEHLlIkaBjL07vspxo0=
X-Received: by 2002:a05:6e02:1d8a:b0:424:82a6:3105 with SMTP id
 e9e14a558f8ab-42581e7a637mr77513085ab.18.1758694068284; Tue, 23 Sep 2025
 23:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250923110025.1358920-1-rk0006818@gmail.com> <712a27fc6c4060e67b3da58cb8564387b40b5971@intel.com>
In-Reply-To: <712a27fc6c4060e67b3da58cb8564387b40b5971@intel.com>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Wed, 24 Sep 2025 11:37:36 +0530
X-Gm-Features: AS18NWD5IFOEWGCNPxL9ZnD6mR-sqY_bheO6aEH2LgX-tdaroQ-7z_CDe3m7m7E
Message-ID: <CAKY2RybJ+kyj=5E1pnu2RUEW3T7rXLrqyedR5LkfX=bUOv=_8A@mail.gmail.com>
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 7:21=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Tue, 23 Sep 2025, Rahul Kumar <rk0006818@gmail.com> wrote:
> > Documentation/process/deprecated.rst recommends against the use of
> > kmalloc with dynamic size calculations due to the risk of overflow and
> > smaller allocation being made than the caller was expecting.
> >
> > Replace kmalloc() with kmalloc_array() in drivers/gpu/drm/tiny/repaper.=
c
> > to make the intended allocation size clearer and avoid potential overfl=
ow
> > issues.
> >
> > Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> > ---
> >  drivers/gpu/drm/tiny/repaper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repa=
per.c
> > index 5c3b51eb0a97..4d439a2d973a 100644
> > --- a/drivers/gpu/drm/tiny/repaper.c
> > +++ b/drivers/gpu/drm/tiny/repaper.c
> > @@ -535,7 +535,7 @@ static int repaper_fb_dirty(struct drm_framebuffer =
*fb,
> >       DRM_DEBUG("Flushing [FB:%d] st=3D%ums\n", fb->base.id,
> >                 epd->factored_stage_time);
> >
> > -     buf =3D kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
> > +     buf =3D kmalloc_array(fb->width, fb->height / 8, GFP_KERNEL);
>
> That's just not the same thing, though.
>

Thanks Jani, you are right. My change made the allocation size
different from the original (width * height / 8). The current code is
fine, so I will not change it.

Thanks,
Rahul


> BR,
> Jani.
>
> >       if (!buf) {
> >               ret =3D -ENOMEM;
> >               goto out_exit;
>
> --
> Jani Nikula, Intel
