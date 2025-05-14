Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E251537A7
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 14 May 2025 14:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232179; cv=none; b=jMU5hxvY22YDrXUko1lzAuhGoSgBic4X9E5+WY4Y6M033polt9qAhBmQ8gGexHSYXQPTkVRNoP6hjNDtc5L5UpNvaASg2OgCbCpXpFW9qGleIrvzF14Ce5bxer4yT7/xxGn59QlAJOU3Iy2KoOJC00weyyGx4klUIZlRZSUZPX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232179; c=relaxed/simple;
	bh=26grGj1agecMz+PCvuHvclLshWUQzEmjBvBmS8cdWSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9z/MG1m21NWxdrtDJ/4LllR5HE4eandorp4yJX9A1Uxtkgb5Jf/ZVJD20Wltvhitf2tzpBCId/ayrV5+Nx3mqDuuoum4FXRp7Z3jl6cBKzK+uYpiE5noRq6pmTvYnL9+YWF3++C+4CFmkMXeMW/Lx1DSkoivSHrKTA90Rp9w9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ib4B+lX2; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ib4B+lX2"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b1276984386so673672a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 14 May 2025 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747232177; x=1747836977; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9l/yJokrJezdTMly2gEBI61HIpT790BZH9nQ/918eA=;
        b=Ib4B+lX2F9BoN+jhBGC5cy2NJzv4D5ilOZS4C/fst+6s5pwNyCBkHPtIVjqigEuDJ5
         22q18wxFaEWZb+Aqfy/Cua3CNdbrOFLFmzj4N4b6zGBL66eg/1vSMWf7HA9jlrQScGVX
         nYx3nbc054zhsciZqk7wtGHrsnoxQlUaxupSwv/pNL5XJeETaptkLmWDXAeoaJQNatkY
         SIqmsT6oORSX6KBGwp1WPR3is31rFwXoDvKYJQlnQS/2asko0mUOuqF7vsRP8O4KUwBU
         W0wm3rV8A4+TuUoDCD0zYyHN9INHhUzkZLSfrPckIJSHJngFF+pATz779S8LGwMmgeFz
         3nmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232177; x=1747836977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9l/yJokrJezdTMly2gEBI61HIpT790BZH9nQ/918eA=;
        b=D0og4JR5pAaTehoEQc4zDsitLxpElvb1nf3FV5tmzEJOXcE2UUvx45prplsIEfI+sj
         I6yQNhlls92UhuMRawqBVPOP9TV4zLlGIrsuj3t30Y696/OpTlnRSMkfq3RUwJ3DdmQo
         d9oavW2SLRT21jjILKr0ySqunfOtv3RQo4uSfrMtTxXdxvsk1ByMjJP/oaOWEEYCGISB
         55NdbdSdZ+ecSWs3KUYusj0hX0TehNJGEZub+NBwyt67mGJUc8AqmAWwE9MY3HChx3Sb
         U5//l+4A5kjhk9TCU6EiVyHJUQdeb6lOKeo3oMKk/1i5+YQYgu1HnHri+WcX3FHCehrv
         8Bdg==
X-Forwarded-Encrypted: i=1; AJvYcCXhVeYPiuclsUkXg2UKYAnxggmP+b+xiw2mLsmwgQLEYSgrsnEPl8dNkK/bfOirzaIDEBWeBmHPYbwPPlhluSAZMS9gUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcK7nBdmnCiyIKPgLnaB7O7DdE2Quvq/GnT0LxfnZZL7yBY7iQ
	o1YCGBB+Gr0AnWfSkk0KlVMR9TmGqntCQ8qQNX1vp9GSSLHbc9vW5+XGah6UdFoCNWffgLmVJP4
	b6ViEerMlbq1+DlOJS2XkAN045SA=
X-Gm-Gg: ASbGncuX4VYqB/t8kY5QyId03J1/1V+YxOfYGrS8rCucMuysfZWJMK6IMsXwGN5Feu1
	e1Te49FbU1rXQ+X1T4aJzkMr+gLveKdv7PGAjhZ2ZJOxmAsjGPQ4gSd2fY78ZidT4OsDzo2fRTu
	4MKLjW12dhhDXgc8/luXa+a4M14/NJw17D
X-Google-Smtp-Source: AGHT+IHtKxU0GEGaAeLVg/+ec50sLA3k6YKoCWcfCuiQT8vSKq7Gdewqx4zLExHIkduOo2EYU8VEwV70WujGnLmeMn0=
X-Received: by 2002:a17:903:248:b0:215:435d:b41a with SMTP id
 d9443c01a7336-231980ce4d3mr20167045ad.1.1747232177142; Wed, 14 May 2025
 07:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250513234621.322283-1-Abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250513234621.322283-1-Abdelrahmanfekry375@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 May 2025 10:16:05 -0400
X-Gm-Features: AX0GCFvNZ6---Ox_xhZShkODoC-fkTW8iHJut3_i8L0kz1QSIWvS7bGXMuWlPGI
Message-ID: <CADnq5_MAYSH0Cj6pfZFdPx8b_goJRFEeB61iW6bD_wON-GWxzg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: fix kernel-doc parameter tag format
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 3:31=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> The DC_HDCP_LC_ENABLE_SW_FALLBACK enum comment was missing the required
> colon after the parameter name in its kernel-doc tag:
>
>   * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, ...
>
> Kernel-doc insists on the form @name: description. Adding the colon
> eliminates the warning and ensures consistent extraction into Sphinx
> documentation. No functional changes are made.
>
> Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>

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
> 2.25.1
>
