Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514E9374EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 19:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzDlPXx5"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2492401A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 19:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2492401A3
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MzDlPXx5
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fwHcUPwe6Oui
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  8 Nov 2023 19:00:32 +0000 (UTC)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AB83140147
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 19:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB83140147
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1f066fc2a28so3672016fac.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Nov 2023 11:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699470031; x=1700074831; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otxnVkd8YgWVTzG3H7cvr+93qyokKFzdStJbXRE7UUc=;
        b=MzDlPXx5w3v/gE+BzeH8UyIvmJCwKlcvsXMcpuomCd+/M+SV5HHUD1X5SKxOf3+zHR
         ENBDleVAZD/lVPehLuauXz0cBhWZ5kdIa4lYp0m6OEyoFUfNCoQumcgKLZiKsae7IkNw
         +rw/d2BjsCym0DvtYJc2NG5RwX81MBysLLKhE76JvsCpxzJeEbhpm8F2wEhODoilXIZB
         U4nhjjTbLLmfDomZOmWeg/pCpvlkD6H14J03wLtQ0RX0lhbfR4tIUSF6qGI5UKsYyTaI
         EX3CMmN9PeSQ8vJa1wXnI9Zmmi5m5eRYaMCc9WcYTTRpX+uxHptw7DM/tFfbejn05+gt
         ckfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699470031; x=1700074831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otxnVkd8YgWVTzG3H7cvr+93qyokKFzdStJbXRE7UUc=;
        b=l1IO0pHH0uGWJ+OxUvMhx5OIAiITl4/3DdsbFEbzhUMP2cQfM0eglghcO1hKsMUrbc
         5hNBTjIwNkmj6LBoULvBN4EhjOX2sLuHuNuVUvl+EsNkoKWEpeQU30jF3xZkY9GYUTYT
         On8USBJWMZwLPauBSAhFLdTHsPJLWo5aVTFFns+XLbjC94Ek6s/dh8ghbZWDx4i3/Tnj
         8iBQUh7wI4os1Dgug/bi2JnLCAg7yl4qhlbTXiaJzHBYAzp6sdHF5BYC8smpRKoEuw4X
         U0m0kl12I726idRg1NzSLFDbIktodhdcYahf7nNhFCr5HdXyIUYFQ8ziVSpem7lw6TZB
         Sfdw==
X-Gm-Message-State: AOJu0YyYKJpdr1Rwa+F84CQ1rX6jHOr1Sh09oruavVmRKcZqyxhY8R7n
	BjPI5nKRde54YCE4TrCniG7wGu3zyHvKBkaw+AY=
X-Google-Smtp-Source: AGHT+IHvpi3a4SBVR+ik6OpPcUARXpDbAmpBYewfy5UA+w+qqJFFTZ6OeD4JVSJcj/4uYdeGrClnwBQQdXADX431yUk=
X-Received: by 2002:a05:6870:470b:b0:1e9:d158:2465 with SMTP id
 b11-20020a056870470b00b001e9d1582465mr3028814oaq.17.1699470031642; Wed, 08
 Nov 2023 11:00:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231029093926.137766-1-jose.pekkarinen@foxhound.fi>
 <d56cd927-49fc-cb4e-8abd-abc539e4d276@amd.com> <e095fae915d44ccc186d5e5ee74ec119@foxhound.fi>
In-Reply-To: <e095fae915d44ccc186d5e5ee74ec119@foxhound.fi>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Nov 2023 14:00:19 -0500
Message-ID: <CADnq5_NjUnC_nsaDCgma8u=eBKv4qMb1L214QEY9S75tA=2vTA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove duplicated argument
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>, sunran001@208suo.com, sunpeng.li@amd.com, 
	qingqing.zhuo@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	Zhongwei.Zhang@amd.com, alex.hung@amd.com, Yao.Wang1@amd.com, 
	dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org, 
	alexander.deucher@amd.com, Jun.Lei@amd.com, christian.koenig@amd.com, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Wed, Nov 8, 2023 at 3:52=E2=80=AFAM Jos=C3=A9 Pekkarinen
<jose.pekkarinen@foxhound.fi> wrote:
>
> On 2023-10-30 15:54, Aurabindo Pillai wrote:
> > On 10/29/2023 5:39 AM, Jos=C3=A9 Pekkarinen wrote:
> >> Spotted by coccicheck, there is a redundant check for
> >> v->SourcePixelFormat[k] !=3D dm_444_16. This patch will
> >> remove it. The corresponding output follows.
> >>
> >> drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c:5130:86=
-122:
> >> duplicated argument to && or ||
> >>
> >> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@foxhound.fi>
> >> ---
> >>   drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c | 2
> >> +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git
> >> a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> >> b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> >> index ad741a723c0e..3686f1e7de3a 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> >> @@ -5128,7 +5128,7 @@ void
> >> dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib
> >> *mode_l
> >>                      ViewportExceedsSurface =3D true;
> >>              if (v->SourcePixelFormat[k] !=3D dm_444_64 &&
> >> v->SourcePixelFormat[k] !=3D dm_444_32 && v->SourcePixelFormat[k] !=3D
> >> dm_444_16
> >> -                            && v->SourcePixelFormat[k] !=3D dm_444_16=
 &&
> >> v->SourcePixelFormat[k] !=3D dm_444_8 && v->SourcePixelFormat[k] !=3D
> >> dm_rgbe) {
> >> +                            && v->SourcePixelFormat[k] !=3D dm_444_8 =
&& v->SourcePixelFormat[k]
> >> !=3D dm_rgbe) {
> >>                      if (v->ViewportWidthChroma[k] > v->SurfaceWidthC[=
k] ||
> >> v->ViewportHeightChroma[k] > v->SurfaceHeightC[k]) {
> >>                              ViewportExceedsSurface =3D true;
> >>                      }
> >
> > Thanks for catching.
> >
> > Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
>
>      Sorry to bring this up, I just wanted to check whether this
> has been applied in the following pulls or not.
>
>      Thanks!
>
>      Jos=C3=A9.
