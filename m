Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4AC2C872
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Nov 2023 15:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDHDrvGw"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1f0820b7657so2453769fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Nov 2023 07:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699371591; x=1699976391; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JW7foL1oxcRpbeUsbIlYVRRPx5rqbcU/gbE+Wj+BaFE=;
        b=JDHDrvGwhRxjMhzLlENXQwAYlcOxYNBMSxw8JEM+/SaLOO156JWKFHh5tSCQv45fud
         6Kd+Lusny0R8Hio91hqvndRrOBOFJpddIsSy8kTgn4JzPrn9TQZ6Z44PYTT2qM1lZuEN
         GD0Za18M/VWNB6DoJmcOX91KM9fpOQlhW6eMZU7QObwKc4HLIzivAP+XVHhXWSwTiaYt
         1QIu8jj609/DbVhMx7q8RAfbETvW2blPwaTfslVAoayhNVghfE1Dn2fqMlG3/B/DRjdr
         iC7fFRUgz3VCEkKbfdoX5Rm+B+k0YZT5f6cg4k2GdvQ9jxfEkHgF3Ot1URA7+wHDM4qT
         Va2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699371591; x=1699976391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JW7foL1oxcRpbeUsbIlYVRRPx5rqbcU/gbE+Wj+BaFE=;
        b=fcFbPPAE9f8c8I5QSqOJzaDh7OJwu6MS2vtzfGxe6R9AVIL3rm7q1LxCiLNGHjuB4D
         NloLVy0b1uyojngkhRDDHM1TvzCyfGu3Q3rM8cLXNxLp7bVhZNplR9DmvrKlWTqxuS5H
         eHqYjqGHuFveSBXPi/OqlytuAZdIbSGdFfJBgApuv4HmeIBRNxiiOVEqiFDEsxMO6LRu
         TDWtf5WirZFk4g02yi1B1eOvu4aHajMYCYAR9EcxI3Y65Us949Wvr/++dQpO97Y/uVLB
         G9f3fhRQ+wDYVdiXqn9EUevn9R/8VczoUGAwY4rbFoIoQPJdthUKrOkU89fCA772RxpS
         9Asg==
X-Gm-Message-State: AOJu0Yxj0bRXt/kenhc188/zd3Kls6GhjYTQ0YF+dwOg26ukiGystal6
	dH7ttpHtvArDPbBXhI+UZHnC1xd/RYKhmCTC66o=
X-Google-Smtp-Source: AGHT+IFvtIGgWBLyu7RRG3uFcIzUM0xQQOleEl4WYezcoWx58X/a2dPjF56SgV0wq6ut3+Af0EixxFZNfu5sL4Wnq0k=
X-Received: by 2002:a05:6870:168a:b0:1ef:bae2:e3ac with SMTP id
 j10-20020a056870168a00b001efbae2e3acmr3487366oae.55.1699371591585; Tue, 07
 Nov 2023 07:39:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231107082839.92061-1-jose.pekkarinen@foxhound.fi>
In-Reply-To: <20231107082839.92061-1-jose.pekkarinen@foxhound.fi>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Nov 2023 10:39:40 -0500
Message-ID: <CADnq5_NpMmo5SdXdStcRMGfcz0v6Nu-ZTORsSHo4_m_piAB77Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: clean up redundant conversions to bool
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
	alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	Bhawanpreet.Lakha@amd.com, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 4:44=E2=80=AFAM Jos=C3=A9 Pekkarinen
<jose.pekkarinen@foxhound.fi> wrote:
>
> This patch will address the following couple of warnings retrieved by
> using coccinelle, where there is an explicit conversion to bool that
> are redundant.
>
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:94:102-107: WARN=
ING: conversion to bool not needed here
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:102:72-77: WARNI=
NG: conversion to bool not needed here
>
> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@foxhound.fi>

Thanks for the patch, but this was already fixed by Srinivasan a while ago.

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> index 32d3086c4cb7..5ce542b1f860 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> @@ -91,7 +91,7 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struc=
t amdgpu_dm_connector *ac
>         pr_config.replay_supported =3D true;
>         pr_config.replay_power_opt_supported =3D 0;
>         pr_config.replay_enable_option |=3D pr_enable_option_static_scree=
n;
> -       pr_config.replay_timing_sync_supported =3D aconnector->max_vfreq =
>=3D 2 * aconnector->min_vfreq ? true : false;
> +       pr_config.replay_timing_sync_supported =3D aconnector->max_vfreq =
>=3D 2 * aconnector->min_vfreq;
>
>         if (!pr_config.replay_timing_sync_supported)
>                 pr_config.replay_enable_option &=3D ~pr_enable_option_gen=
eral_ui;
> @@ -99,7 +99,7 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struc=
t amdgpu_dm_connector *ac
>         debug_flags =3D (union replay_debug_flags *)&pr_config.debug_flag=
s;
>         debug_flags->u32All =3D 0;
>         debug_flags->bitfields.visual_confirm =3D
> -               link->ctx->dc->debug.visual_confirm =3D=3D VISUAL_CONFIRM=
_REPLAY ? true : false;
> +               link->ctx->dc->debug.visual_confirm =3D=3D VISUAL_CONFIRM=
_REPLAY;
>
>         link->replay_settings.replay_feature_enabled =3D true;
>
> --
> 2.39.2
>
