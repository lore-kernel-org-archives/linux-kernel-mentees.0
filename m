Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06EA3D79F9
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 10 Jul 2026 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690058; cv=pass; b=LlTgQXyfobhueXY2wHy5YBAuYhqcACyq4PCXVWRu88n4ArMBRG0B6Xf9bfAoIy1RkiEu83+IH+wqggTdjFbwtaaKFZEGbGaMTO2SwuMtx+pTUPYIpB/GhidI9Og6QEdclD0IiKgilwoNJWh//hIDwFWaKe26p76rkz5ZqgocMuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690058; c=relaxed/simple;
	bh=+VqRbJDfg9ALsRs4cpCZ2q2mdZVyKCDuuPstD47+C04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abJjwmMWQT7oRgoi2EnUT8ozG1gju0K+aiKj5pjrcWuZSD7BPu/H5m6QpFyqtTB1Wbp7TdvInFIupprF5iE/wIidEfMkAvFVR5kTTeMSnf2dHjOPaW7FFNCk6PTkIVX0PXYkIIqCFyGGn7XM/pr4rrOsEGfxcAWn+I+d8NcnNsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q4wL2J4I; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4wL2J4I"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3860f32307bso209667a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 10 Jul 2026 06:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783690056; cv=none;
        d=google.com; s=arc-20260327;
        b=VasmTOejpwsQ9Wob22b8Lx3bluvibhif7IA6ZlsWX48JLnBduk0vLPHCxkEWdMtGxI
         iYSfAQm577wNjINL4CGwqIVQDWrqrAm2yGyqFRwR0Cwg5uhMices3jA5nRoMSFwqIJ1e
         u/6XZynGnRDOIngBprRYtoEbPfCQLd5JvRsYC/AXJafUaPytlfXqMgpMYxV75kmCc9fc
         3ZApllJV4lBjLb6asgGZutq47yvWZ2hHkPk78e9TBDpO3EHwIMSTInemYVHBlthKPyUt
         epXCm1KthElxHVuHKDrpGYabcBntNwP+rUQRxsvXUdgFtrD+Pc8VUc3GaIDGyjsFz4Ik
         +wWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Xz8mAiIS9bhxJSnBlNVStU7ycoiUswNHhwr3rObZng=;
        fh=7GFlUNgwtQFaYoFMP7raUQrdeEPeL6ZBOLK6C1WWZiE=;
        b=YExHAUyim66FaEDEmMXBMxJo3qWLt1P404KFA4YjlcqHVHVCyuW252BehlLcg8Gj7C
         4VE1FUg3blz8ZejODzUwXChD0fWcHfc6kpGq7KMkLTqnHPxGQZya2/6RspcA+aWcso8w
         ghjRHuWFf6FLlzWbiIL5rnO7Dl4Ibq5G1HRUtHN6tR24mH86/yXFH9D65O8WxPecOsdH
         CcSr+LHzU1CEacM+fYoqG2GwM50PmRTZtkE9p7Xx+trgXyMZkeJDD874YI4KaDxfNEjc
         Hu0aYNaPA18/KeYb+N9F8za7qAOY3ynLaVbkcsOpf09xZv6ju+Luz0YFRCs74O/dIGj5
         lCVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783690056; x=1784294856; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Xz8mAiIS9bhxJSnBlNVStU7ycoiUswNHhwr3rObZng=;
        b=q4wL2J4I3+9u14EmPeG1jH7vQdz29PFlYpR4bgYKOvW7k2RLZrCzwpabaKpC5i/B+E
         4OwuEF6V3oBwWKwuk4acbP1nFuqzmm0BsaOQTEncYnHNS8G2vpOW0BxTO3j8czhgQEkJ
         ctRLmlxqpouGt9SvIjnMcIBugpOa6L8KiaLy8M23gwkjAPyw33SgNCedfUtCVA4X+OpU
         njzhTGZ5iAzJ3SNoG3ntf6uyMg0iy5W+cfcCs3KN5CyS8jjz7hrT0c8guWsLL+xDvdTV
         FJN5C2yu7Tyq74hbNJxDoOBwZgWEBVv6nwmweInqoaJNYll42P6213trE/ylFV/WeWvB
         9TXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783690056; x=1784294856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Xz8mAiIS9bhxJSnBlNVStU7ycoiUswNHhwr3rObZng=;
        b=jH79xbefwWLb1+vt1simLwN/STQ0PTrZ4L4pyCf/4TpwEGYVkEkFFmkMaI/PwiOFcN
         HPHulD0zNsZOczdZaMG8dryflY1yAhqtzwJhXZK/s27oWRjTdjgvjVUWqWRkI2ARE2TD
         RHr0x7KasL6DJ09d/0GwX1GfLXRVh2nplG51RwGyDdV+g+zK5YZRO2IxFE8mb1+g23jK
         dY+fT31BlXoB/Sn8jNoFzeLmcxyJ57ZbmXpQ5k+68DyJzWVVBw9rCDu/J7Pn5FKAVwL7
         EEG08PsWqyEYM3oE2jzOs2Mix12lr2NrhOl4XShMB46XAuINf3Vwdpje4oQDhHJvg0WB
         /f4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrbEPnLFCNFJIBnAFDYq1OIhlTHuwd5Vv1CXVrDdh5ul690cP32LyPogKPVwrlCzmRkxY2+mmLwGV0YhNXxd/vdJrlisg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9LEP1vIiuz6Hx19gZS29SPOgCqhNqVa68RdF5PF1hBzfNiods
	058sqmU7i2aMUSDw2x2mr/gOctiK988EaCd0O29RGTHxSLks6IwYkckSampDcNyvKqp30aLGWjY
	JvijMwaEp1wVb1p6aKsJSc+Qxttznls4=
X-Gm-Gg: AfdE7cmAJBvXr0hiGYQAvCe6nLCnVAII1NFyrChjVTed8VqRTX8++vWPBwTXsLH2JsJ
	nmdIt48a3Dh2HEHUEtS9PeOCEYH8d8vm5mZA6+T53ZZFek8n00tHGnUUOrI+5EwWh55oMSb7AVR
	uXSAFl1hQxFc97v3p8YUpxSlVxG+m7spp2+TeIAoI/jZoD8MuCTS3FxCmwBIp2dcg3obaYEuBQl
	Oz0A/Y3wUPI1g3EJGQj63DPzC22dtdeXj9aYx7kH853yp4nAQ9x6gCUC2RNtgwe5QDKtCw9zHRD
	xGregDSt1Ef7upwDW9ulBCtQqwzGwAdp9LU1bNHi9xlhEmZQ1e/vrzKyLnGupGITz2zLhg==
X-Received: by 2002:a17:90b:390e:b0:381:77cd:38ca with SMTP id
 98e67ed59e1d1-38a20c48ce0mr6963500a91.4.1783690056153; Fri, 10 Jul 2026
 06:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708222035.7324-1-nico.antinori.7@gmail.com> <fd5ecc7b-b9b5-4653-b7ad-72bdcd0b8518@suse.de>
In-Reply-To: <fd5ecc7b-b9b5-4653-b7ad-72bdcd0b8518@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Jul 2026 09:27:24 -0400
X-Gm-Features: AVVi8CfC8WMQvuOOX9IbEu4pHDNwlbHNhnBztQ4WqIxX3gf9mAdHkuUx5nllMac
Message-ID: <CADnq5_OBYXSz2HG7SCA2eK5_z1J0SmJCwCW2RkGJ5d1-tAVC6g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Inline drm_simple_encoder_init()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Brigham Campbell <me@brighamcampbell.com>, 
	David Airlie <airlied@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Thu, Jul 9, 2026 at 3:17=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
>
>
> Am 09.07.26 um 00:20 schrieb Nicol=C3=A1s Antinori:
> > Simple KMS helpers are deprecated because they introduce an unnecessary
> > intermediate layer between atomic modesetting and the DRM driver.
> >
> > Inline the functionality of drm_simple_encoder_init() to remove
> > dependencies on these deprecated helpers.
> >
> > Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vkms.c
> > index 170adaf7e76a..d5b0692fe860 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > @@ -2,7 +2,7 @@
> >
> >   #include <drm/drm_atomic_helper.h>
> >   #include <drm/drm_edid.h>
> > -#include <drm/drm_simple_kms_helper.h>
> > +#include <drm/drm_encoder.h>
> >   #include <drm/drm_gem_framebuffer_helper.h>
> >   #include <drm/drm_vblank.h>
> >   #include <drm/drm_vblank_helper.h>
> > @@ -316,6 +316,10 @@ static struct drm_plane *amdgpu_vkms_plane_init(st=
ruct drm_device *dev,
> >       return plane;
> >   }
> >
> > +static const struct drm_encoder_funcs drm_encoder_funcs_cleanup =3D {
> > +     .destroy =3D drm_encoder_cleanup,
> > +};
> > +
> >   static int amdgpu_vkms_output_init(struct drm_device *dev, struct
> >                                  amdgpu_vkms_output *output, int index)
> >   {
> > @@ -342,7 +346,9 @@ static int amdgpu_vkms_output_init(struct drm_devic=
e *dev, struct
> >
> >       drm_connector_helper_add(connector, &amdgpu_vkms_conn_helper_func=
s);
> >
> > -     ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VI=
RTUAL);
> > +     ret =3D drm_encoder_init(dev, encoder,
> > +                            &drm_encoder_funcs_cleanup,
> > +                            DRM_MODE_ENCODER_VIRTUAL, NULL);
> >       if (ret) {
> >               DRM_ERROR("Failed to init encoder\n");
> >               goto err_encoder;
> > --
> > 2.47.3
> >
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG N=C3=BCrnberg)
>
>
