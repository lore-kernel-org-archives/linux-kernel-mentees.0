Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D3D34545
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 14 May 2025 14:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232191; cv=none; b=SgDR9T6gFojCLx5Ns4+mxNHjzDxjvyBW4opjIcPqERHMtJxhhmjF8NoZYKnXKAJmA8m+xsSH3O2L7ND0v6PyOeyVVG/acORfeYQtzWsSLUNn/hRjjcU9C5euTbUPASfADzsN6pEvuaF03upBVavtWNqaKGHNJr7hMV+sxgGlIb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232191; c=relaxed/simple;
	bh=dctgj7OI44hL4Z70amYhMFqF1v3D71Minb2zs5mQdHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bllxZmQJla/cHzZs3yxM3RrS+1lxwP6DY4+IQOKAAJSVxU0K5UgHIURfxsdUWx/U+7hbkXz5PEW7ZgGuQr1WnxJ1TdgDRh3TGw80b7rUPnqWdpQGShDCAab5NcZK6G5pI1TLvtzrmrp5PRt0dVIt9fg1gV2MW136Ih3EhSkSpiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=if0ECYPM; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="if0ECYPM"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22fb6eda1cbso4545605ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 14 May 2025 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747232189; x=1747836989; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n+16DpFOcpOhaliZB3idim37DYPJw0hjtvBfmuDl1M=;
        b=if0ECYPMUfe6Ng6axGyigwS5NVv6GJy4XTifSgbWYolkNCUF4Krhrz7l1e59X+sBtm
         PitkmqLU2T6WV/WRjANoFuSXIVgfiKDjRa1pYPGvc88gg89sumWb9wCFusqv36tn6Xla
         Gm/n+rXENVYUsvocki0tQgp3gFXhMj6j72IKiFl5oippwEioc4mGzxpF/D/U6cmjCDNl
         Vk9ACFwMGXlNWA5MhG59PX1rJ06PCHn1zPqIgdMRVnydhCst6+k3s0H8kTajbpuTIiDj
         Y1Qren27/o8lZo8u/XS1o9dTPnOuUpGgXkI8D6Nf3056fmhpNKzjboeVhqs+BJoNj4ks
         Xi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232189; x=1747836989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3n+16DpFOcpOhaliZB3idim37DYPJw0hjtvBfmuDl1M=;
        b=BvVAJPnpwNcMuITZnGNla0/Qs7+rX8VDrLE3mQ9C0erchAThRUBFM/ntg39vvpf5YA
         FLiEQOC53L8JryrhQdW5Nw6Gmm7AwnSW1NkdAvh82qlojdZUzPJL1+fmN7H9Kf/DOedi
         sxXTqySlJZD3ooxYVvhUqCiwlOkAgoVz9k9rRHNZ7N/9m1QwbzWMU9CdxKt0ZrvfyIAg
         QmUJIivfB154ah+J+KdjNhcNd5pZXPKkD2PaVP0OTHN5ENygeEb1uHedhI22GDKCWguq
         +rVHXrxn59clRhK1PU4R8h9igHPAhOSmTNlDQpsjcyeOHOOhyWu5SJ4OOU2nSkY4Ry/E
         hzVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIv3ycNYiXExao8JHMtvgBqMNTpKxhMEhEo/QovCaswxyXh1zE/wmRnzyATVU+zNTZXLg0zA+qERUGY7+ZSSovVia9rQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4HDA10IOYe9Yxqgk4QAktkRn+WIs0S5vv3pJazO2agtp6Fm9m
	2RnnklNnaYH2V6K++s+yQev+fjpy/VGX0z0GsjZb+TZYm24PshwlCr7WOVAlmKieMfhjCgSX2xK
	lJ/JVVYZnUaAfZiVXyRPEFnTuVcdSPLIN
X-Gm-Gg: ASbGncuyuF1xiUOwP4beFQr8oivDj/CE2U94iYAw4tEBUih7NwFJKNgVhpVIMWbYI6N
	hz5E5XAa6HZUeEeB/qZ6Cmaabq7yomg1TqxkmwlU+O5tfrfw5Np/pqCTpgrXYXoeMDpNfSccvqW
	8e4ojLycQd0KHmbudqFYmMYizGWRRa+PLS
X-Google-Smtp-Source: AGHT+IGgOLVHlFTGN9a0SvwGp9aOaUq0v2qKq+BNE0DOArgTcRewkV7J2kadBkn8RZHPlisNdGKLis3afd8TsAPJpdo=
X-Received: by 2002:a17:903:1a6f:b0:22e:62da:2e58 with SMTP id
 d9443c01a7336-2319812a735mr20961985ad.10.1747232189515; Wed, 14 May 2025
 07:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250513233212.21186-1-contact@gvernon.com>
In-Reply-To: <20250513233212.21186-1-contact@gvernon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 May 2025 10:16:18 -0400
X-Gm-Features: AX0GCFukKcW8G7VG06CTXQGuzf_x_lHNu0hKnNMVT_ZvRA146nuD9ytPZqqbJCg
Message-ID: <CADnq5_Nv1b+C-oaQi1hEq15T2fOZS0FiQ+RgOyQyOizC6hGuaA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix docs build warning
To: George Anthony Vernon <contact@gvernon.com>
Cc: airlied@gmail.com, simona@ffwll.ch, skhan@linuxfoundation.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 3:24=E2=80=AFAM George Anthony Vernon
<contact@gvernon.com> wrote:
>
> The kerneldoc comment for HGCP locality check debug mask was missing a
> semicolon resulting in a documentation build warning. Correct it.
>
> Signed-off-by: George Anthony Vernon <contact@gvernon.com>

Thanks for the patch, but this was already fixed.

Alex


> ---
>  drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/a=
md/include/amd_shared.h
> index 4c95b885d1d0..c8eccee9b023 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
>         DC_HDCP_LC_FORCE_FW_ENABLE =3D 0x80000,
>
>         /**
> -        * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Chec=
k FW
> +        * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Che=
ck FW
>          * path failure, retry using legacy SW path.
>          */
>         DC_HDCP_LC_ENABLE_SW_FALLBACK =3D 0x100000,
> --
> 2.49.0
>
