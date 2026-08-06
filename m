Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F933BBA01
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  6 Aug 2026 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019351; cv=none; b=WTSR0Ua2+Vmnfws+nJRhQ/xTvx/giQVfA33uRXxVcesYQL/DX1WqjS+tmhq6LuFYnarWZj0QK9SHMm+J3QFlDkZdsg7bkRE6a53Wq+jdoiMB3MuY42LqhAH++XF4PB7ckssOREzfYnq6fgMXfE+kIUlRow/1p9juew3PpofwjEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019351; c=relaxed/simple;
	bh=0GPU2RDOo1K4GDlwMUbDeW7qfULfQqQrIuFbppi2FFs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qEpA1ovZXtlg+GTCFPlcrRfpjtM6UuKG7F6ia3lTZC7rvLQbZiiir/CBqb4HDbnyhIyl3v8lXEjb5QBRhSkt3mQn1olaWnZI4P3xs1febtQXpFTq1SeczgvikvgVq/cuUHu55zwq4tXhZ+x893hU1LndfPhzP9n0XKZjePnOc9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3bzTWuZ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3bzTWuZ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1904408a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 06 Aug 2026 05:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786019350; x=1786624150; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PATN1j5zjfMqry81Ubt1Txf86+h6fghF2+e0J3o9yzQ=;
        b=h3bzTWuZEulHU/BOSAFYIOO0BNdbsyb6GpFE3d3Bx2GrT17R09Jg9wt6ELHadPOvwn
         Z2r9GG+CPvwPPw3KkJhTXj+hkIn3baJVk+wXaTsRv7HCbklAQUj/Wg/XDDhR7JCWZtPf
         O/XFX/KkSLeBT8uSseBJCi/weL9cfkI6OAHfGDfpRrNu4/KxAwjhjK2EWJerCr3N8+qB
         ow+WEXVuyS88KOgecttCp5TJK1QVVSAPieyqvUtxvULG/loQbA19i5JlximX9Lq0DDls
         CeILkyg5VlzQrWyFS4mKpNQ8HZMDVrGKFsU+2i4gMayvUNhU93hrBP/62SGBv1WhOAqi
         hxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786019350; x=1786624150;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PATN1j5zjfMqry81Ubt1Txf86+h6fghF2+e0J3o9yzQ=;
        b=Gye5Y2apZvYHVSgoJnRBhDjAoc5pouBnjGmB5yxxevy4h1G9jbCmBtP050Ibc+wN3M
         wtH2+IC1kOktGr8bg26LRitK+ySwrUvlEpAkp7rAA5xqiv8pwsyCbe4tZtEScf2UG3GX
         e+BudQXfPFBKTXPBPTbJceyu/uFC9Fr1g8z2sFAyjbH5dTo9vciN0TPFP1cv+b42CV91
         k6R1z4Ze39k0ffx4s1mNpN5Z5XMFAcHrU9Xicb6xQxgP1C7S7v5qG5JZWug0AbzoA1S8
         vnU0BGPUhYD4oEC9+QXJ4BfmhPID0QEU40I34GYQrJzE42G5FnVlsmtcCnKYDOYGL0t7
         D4/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rok52DelIpzzFZ/AfhQ+iFuutA1GImNIEZn6bzLwLi6cGc9NhWOQyR9q7EBVOJ+W0gPteNAUCEDEKnh4kRyD+1zuiss+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyitKFbGy/YcRLcwCUGTUKVGF5Fo+5nB5v2rx0BUryURYrhGDOM
	t/UA9sAJAFvhdmX6xj5oGcXD2vSYYu7ezunhA69mbB08vJV+vuODLIA=
X-Gm-Gg: AR+sD12rlCM5YS8FI7aLg5HZ+cTXMvOpg/g+arYLbS0o4i7GIpNXYWENMedhGCkBBOp
	ZRAA62yEDXn662bVKRfCW/wtVnoMbKkGwKU0kMh8r2cKwrlEvyK1Y48Tfv5T6zHDHKSnw9yBbTt
	wyfQIhr5knwiOsPQHIAvq9kFIsedetMdXn5cLWNgUg2OfbJyTe/z9u+vCjIX93jPoH+zVk7N6Wg
	vQqDZ3fyigAW4leei5fU2TStlA4ZRCRKbbeN3708aw+TLesCYMSqcYEcjMopGCn321x3cbywDcU
	gCw05pbV6KvxpntpQSx4bN/1o0Dq2Iyawhy9Jk2e4pJDu8baSCfOTkuYDx2dpqH2YArqSUb/PKI
	5pbPa9WI1xj7MNkCxf7QVAx0zpXU478MKs3gvzNCAagiaP82asDNqzOG3jKL9bMrDj3wv5ZQg3o
	Zm35uxB0q4amtm8o8jSNZhTWk0nx4vyziGMJyF2zvAyNiC9K0KG76n1rF15/uWkg9cGuX9SLgT0
	3/jkM2YPmFqlbLr6YeeBhcg
X-Received: by 2002:a17:90a:da83:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-3903c5d2f8bmr14496686a91.11.1786019349803;
        Thu, 06 Aug 2026 05:29:09 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dbf82csm1463292a91.1.2026.08.06.05.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 05:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 09:29:04 -0300
Message-Id: <DKHV0NRB0DYQ.2EYHJ4T1FV9N7@gmail.com>
Cc: "Brigham Campbell" <me@brighamcampbell.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/mipi-dsi: docs: Mark mipi_dsi_compression_mode() as
 deprecated
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260702194223.290763-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260702194223.290763-1-nico.antinori.7@gmail.com>

Hello,

On Thu Jul 2, 2026 at 4:42 PM -03, Nicol=C3=A1s Antinori wrote:
> The mipi_dsi_compression_mode() function is a thin wrapper around
> mipi_dsi_compression_mode_ext(), which is already marked as deprecated.
> Additionally, the non-deprecated mipi_dsi_compression_mode_multi()
> alternative exists.
>
> Document this deprecation to encourage developers to use the multi varian=
t.
>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_ds=
i.c
> index 3ac1dd5ad640..9e20818f2de0 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -699,6 +699,8 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode_ext);
>   * Enable or disable Display Stream Compression on the peripheral using =
the
>   * default Picture Parameter Set and VESA DSC 1.1 algorithm.
>   *
> + * This function is deprecated. Use mipi_dsi_compression_mode_multi() in=
stead.
> + *
>   * Return: 0 on success or a negative error code on failure.
>   */
>  int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> --
> 2.47.3

Is there any feedback on this patch?

Regards,
Nicol=C3=A1s
