Received: from e240-9.smtp-out.eu-north-1.amazonses.com (e240-9.smtp-out.eu-north-1.amazonses.com [23.251.240.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CFA13633F
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 03:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747454036; cv=none; b=bvGBHLcngSDcWInEz17hfszMRojsGjCcNkoskinlgbQBzlbp1OfwssCiMtwIvkWzIEf6yvB1NEBIVkEmLYeHbXQUX3rdFDKVR5R81cyB5ssZZLmTrLIYXR7hUU1Ir9kMhnpZgVEgcRiZQ28zop54wZmYmlPQgXDRqDSHbopmFyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747454036; c=relaxed/simple;
	bh=Uev6fEYlz5XwC9qWMx8Sr5cx34YcV4H6PxahUjMrGlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdWyT1WNXDp3/VIfUUDwLS6HIcUJKNQ/uR8eAYaqAlkhTgEmFIpdbWZUuqpljmP5OlyFZzql+j0VMSOv4Ad8DIbzzCLvxMiRGe9hon7omWqo47hb/G5+FvcpunUMHn87tOBQSaeMjVceQAHnbwB+KiK9/n42FeVzFvWyaSNcj1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=ekLJ4g2H; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=I3IqomDf; arc=none smtp.client-ip=23.251.240.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="ekLJ4g2H";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="I3IqomDf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1747454032;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Uev6fEYlz5XwC9qWMx8Sr5cx34YcV4H6PxahUjMrGlU=;
	b=ekLJ4g2HjjLiJ6Fvnk1YdiZgdYQJ1ho/+H2qnFoGWi9F9uvr/IL/5/QtKX8tTjfk
	Se8sogXh1zinTyxxImapDOlaNp9icaZpKX6Lhqif6z4wJItQ0uGAsOE8SmdVd2NrN6T
	s0Bq0bHGfaelsBFtK0tYmRXUKZDCDamt2jfHjO7YXzOSqA7TGnZras+PZhMe8J8IP/p
	juUuGi0QRtCL08MOCxx99dza0YaKrdyuEB+GV5xyOta//h2zsarAADOGk6gbSjL2vNR
	0FJJdumc/UEQcEkimQAqvmOm9AWn3dO6MHUvt7culRpN4MWcZieDirZTKejiopyYwdY
	fjIEnALRfQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1747454032;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=Uev6fEYlz5XwC9qWMx8Sr5cx34YcV4H6PxahUjMrGlU=;
	b=I3IqomDf05zn5tQyq/Zj4hYjUzQ3BiHtpt8948hFEFmWKrzfcBgMVKAjAeVLt4gb
	Z4Yp43p5kjvHJiEY76i3iSFWr+7bRZ2ixTyPW7FpbVhJQwgasOuXa0E2dUG9TrgK0qA
	WLiwnC52UYAN1qFhilHwV0TRpqMvwB2v8Y+Evz20=
X-Forwarded-Encrypted: i=1; AJvYcCVQKsbX7sA5Kf4T1Lp3Dt6xeXuOsJYDPAyPaCF8I2zEzpDJiWdyOi3P679qrh98es4ZjGmps2Fpo5e8vSpgLJ1pKB5lFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxnyXC9esoc2efEtL3bh7s2PRGeOxsJpsqk+7mK/tjKNzdKP5M
	/aEHF+pwISrldNn/UuckNCSuIqiJJehArRiHeWnlKylwthC23Wp4hiGPZo9GIOoeRsJfmRU+gW4
	+MmW0aes4pRw2yawI9oTm/sH+xY8Y+Z8=
X-Google-Smtp-Source: AGHT+IHf19z2sbUg7xrM4qsuKOPs/2f9qWqFkx5Ys30i8cc/aKp+R4ErTYpyM5kQDtvy+RMgphYTqVKTkUuG9PdPAhM=
X-Received: by 2002:a17:902:d484:b0:231:e413:986c with SMTP id
 d9443c01a7336-231e4139adamr56049165ad.11.1747454030242; Fri, 16 May 2025
 20:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
From: Ozgur Kara <ozgur@goosey.org>
Date: Sat, 17 May 2025 03:53:52 +0000
X-Gmail-Original-Message-ID: <CADvZ6Er=6M4Q9WKyQXSxfQ=KDgZ7rabKER=MUVoirxavukwQjQ@mail.gmail.com>
X-Gm-Features: AX0GCFtcuNqyH6AItJPisixd0IN5CrGy5hhjrQS6OJ-E5B0yBtGKj1UY3yegyfw
Message-ID: <01100196dc607a97-93a6aa8d-b8d1-4c05-9889-d6c671e6d5d1-000000@eu-north-1.amazonses.com>
Subject: Re: [PATCH 2/2] fixing typo in function name
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.17-23.251.240.9

Jihed Chaibi <jihed.chaibi.dev@gmail.com>, 17 May 2025 Cmt, 06:09
tarihinde =C5=9Funu yazd=C4=B1:
>
> "ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS
>

i didnt see this and yes *grph_object_ctrl_defs.h* is exactly what i'm
talking about, please ignore my previous email.

Regards

Ozgur

> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
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
>
>
