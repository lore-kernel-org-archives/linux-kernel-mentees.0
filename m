Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0297284B36
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 May 2025 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666779; cv=none; b=be40DL+FgJ6yH6FpDQlOdckXYFrUwthkmHmJh5qqY5Gip8BXBOR6N4yZPb++zch2SiDgN1ExJV2Ybg88GKQ9gU6cN5F4zu8fJxbpEr5mcVFuJV7YVmFL5/sJdGI10P42vaelxNXSlB83/4mWChmthtEV6j2v2MHI6uT0IKF31R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666779; c=relaxed/simple;
	bh=7oSkyG6mSA89oGxPnxCMu+L1kjgYHryzmDKNjMLyeNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6j51HrP5UVxAKmtip0uyvu9Jeil7Yyw5ia7EZ6bZd26FpTU7FGvrRRiJkDUqOZpfgIRmsZY1a1x1l/CIyDTfFToLzoKxJOHjlqLcnW0HQ3L91vguRcOEBJAHu38+hNPxSeX8LIYpmssCslgsUIrK1ZDaKJx0IXKGJNrNyvYR5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPdb52Ip; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPdb52Ip"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-231ba912ba1so3875765ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 May 2025 07:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747666777; x=1748271577; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJbKnQ6THaOIWWHkWKM4XnXv59kQm5WmU7EOv3ddOfo=;
        b=OPdb52IpShpJ94dpOfSn1nORE5c5sM0QIomCAe18k3tN2Gzj85xSStDApw46qjfil/
         6BKUt5rb/4PmUFsbnO1UHhDSfnbilpTKs5L1I2abg8zSOlDnv9KQZQi2VL37xR/iAeVX
         Ujm4I99PUnzHTiPMQ2Ki/icir2uCbZrT5qdcyfu8Dtb8zyk7t4orwtdQD7TzA5vF9C/w
         RpCzzKgKQZq5r7XAQ7FCFXE07hs/gFy2MSEyPDDx+krWN0rAi8i3Q8IAaxjHvP0lgVxK
         Z1KoSbaEZ9AoMKg5YFdKgtxNkXHGmpJ0rzP9jZoiod1CN2S4QAE2tPHD+y+in/mXVOQA
         kKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747666777; x=1748271577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJbKnQ6THaOIWWHkWKM4XnXv59kQm5WmU7EOv3ddOfo=;
        b=wvNaxiS+HXbFeY6qcefRQao2f+7GLxOojKX4F78uZ+zIsYr0MfhNZ8HF1CTAUfV5cn
         4Uc1Xh2Yhnszf/jatkcVf8p9bk8il0N1GEtwZp1nJndBVBwFFsQWOJIg07ZvIwy/18rp
         +ucCmr4KCkokSqJIvkl0B+EFpSrm7iG49hAzsmy/+w0QxWCUGCc/Tb+W0V15D+8txu5t
         yEy1wcJHw6dxLkzb9aPn3iRfSZS6Jy191wKr4ZfVCSbg4z4ow2eyh9BzFO2ZkpQOIN8f
         77PiC/q/Ii+VFahM6hy6PSVrqcoXtSA5AdFlOWZMYVjEwCzwO8tTEhxcjz4O7pRUuif3
         L4Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWDF68Uc4MkU7ELHdOUw/dAem6RHUjXLeiribQc4QOohyn1wrLdn0BTULuz5kvzIJt4bL63hI311538wuImnmcFzDraVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgoFGUFLl0L75+qU5U0nuu2oT+zuY6BqpCbimuhGGKmtiBPPAO
	ggMcxxx2GTmLmb++8e8b4lpM2VffhVQBgekdnQgjIh2+o2f6B8GOW+i+m9wyK9INgo9a7j/v0ib
	Xv4G33RDT2NCCZZhwtQGhwIuFXsDyfHI=
X-Gm-Gg: ASbGnctcAAnEM8dmwGrZIWJb8Dz/oz8J9zLIRF/Al5wm3WsqjShWCBtB/K322+othPR
	UeV+weaCGOrnlBzaAPX95RGzPHChulM5v2tbmpXj+vBF4RXCb952dGoitkxEoVsjmhO7bTdas9f
	TOJLhORbc6zN8Rk8wkA3t0R4f+DjM4g4Jq4A==
X-Google-Smtp-Source: AGHT+IHLS/MC9ULQUfEueaLkKs2Re4yb5qkf2UfVq+r3wklL/AUqeNW5UH4uETMeYpvy3Y7FlPakYzri3fcicI5uAZA=
X-Received: by 2002:a17:902:cf07:b0:220:e1e6:446e with SMTP id
 d9443c01a7336-231d437f0damr66974215ad.1.1747666777173; Mon, 19 May 2025
 07:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 May 2025 10:59:25 -0400
X-Gm-Features: AX0GCFsSRi45LP3otZw9uo5k9qEKoUzLkQAZiNfSWJQGWEj7HNf0_zawacqQN8Y
Message-ID: <CADnq5_PSfZ+jMMAXb427TF1Z0qQBq_kgZVo+3qfrXkFxJTSzRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] fixing typo in function name
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 8:38=E2=80=AFAM Jihed Chaibi <jihed.chaibi.dev@gmai=
l.com> wrote:
>
> "ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/atombios.h | 2 +-
>  drivers/gpu/drm/radeon/kv_dpm.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/a=
tombios.h
> index 2db407892..b961096a4 100644
> --- a/drivers/gpu/drm/radeon/atombios.h
> +++ b/drivers/gpu/drm/radeon/atombios.h
> @@ -5072,7 +5072,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_7
>  #define SYS_INFO_GPUCAPS__TMDSHDMI_COHERENT_SINGLEPLL_MODE              =
  0x01
>  #define SYS_INFO_GPUCAPS__DP_SINGLEPLL_MODE                             =
  0x02
>  #define SYS_INFO_GPUCAPS__DISABLE_AUX_MODE_DETECT                       =
  0x08
> -#define SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS                             =
  0x10
> +#define SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS                             =
  0x10
>
>  /***********************************************************************=
***********************************************
>    ATOM_INTEGRATED_SYSTEM_INFO_V1_7 Description
> diff --git a/drivers/gpu/drm/radeon/kv_dpm.c b/drivers/gpu/drm/radeon/kv_=
dpm.c
> index 55dbf450b..4aa050385 100644
> --- a/drivers/gpu/drm/radeon/kv_dpm.c
> +++ b/drivers/gpu/drm/radeon/kv_dpm.c
> @@ -2329,7 +2329,7 @@ static int kv_parse_sys_info_table(struct radeon_de=
vice *rdev)
>                                 le32_to_cpu(igp_info->info_8.ulNbpStateNC=
lkFreq[i]);
>                 }
>                 if (le32_to_cpu(igp_info->info_8.ulGPUCapInfo) &
> -                   SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS)
> +                   SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS)
>                         pi->caps_enable_dfs_bypass =3D true;
>
>                 sumo_construct_sclk_voltage_mapping_table(rdev,
> --
> 2.39.5
>
