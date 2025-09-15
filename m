Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1154E14A4F9
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Sep 2025 21:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757972732; cv=none; b=ZvebqUP3pWqhBzSc9J01bNqhHAm1JSoI43O5fESZ94JUgls+FRNM3ztZbhC+ZH9q+l5A2C7WNoIR5u2N5YIlDOdVvvnpxnPY1tWuZByme15rDWfLeQ3UzSkGX/OW9N8THtOVwd8EyUWPb8XbvsR6ms0GTZcFErZsaaHeWSL2oFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757972732; c=relaxed/simple;
	bh=3S+/CIj2dTjZzfVmKIc9+YYV8Tg/YeaidG5GPR9wTBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+IuK5VyIEwqRaBZMrQGhkpME6XagyvzkCS01NAXbCfN+dM9WagjGfW4Zqqzd4xNGPDK2Y1rbsqUeypQbTuqyyDt+F3YZoaFJ23uJXScwDNPXZA8x0EJO1XqdTtCTsf9RZq5P5wmxkqv6wFWFIywq50vfF5wawDtoz1+QJjrLRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XydcY84z; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XydcY84z"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24498e93b8fso6899715ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Sep 2025 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757972730; x=1758577530; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgjQuP4Me3guJDVcSDtwLqdLj9Ad4VyHioffhsnvnuU=;
        b=XydcY84zpJaUevPEhT0WxLay//zeq7qC8NnzvsowsnLUTP4Mc+6/YZTZbtqhQTmHQt
         XktASd2GiRDP1vb+jh1zrffzHrAtc0FQE4JUwG/iLfXV7sR3DI5TNb6In7xv+w2ezYQB
         QnKraY7eNbCECiFNtGqk19JkfrYmEml5AEPTp+tswDHA8rbk9JcAiW/lsUQLyck2hgs0
         SUnL/H741lkZa3f72wgAdHH+ZxAu2/Mmy+vOSVeeb1MBwA4EOErTvFneDq+lxk+Wa84Y
         0hA9yLDp2bMjEDvpdS/Wd5YYy7JglaU5VZBm5LYcZsQuvkoJm5X1UVmZIE8eFl6k6D6+
         VUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757972730; x=1758577530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgjQuP4Me3guJDVcSDtwLqdLj9Ad4VyHioffhsnvnuU=;
        b=ibLrFVRBzRQjymGrqqtkXYIfVVEUWiB6qmfxur7mTugqNYdHjGmCCdhALd72syp64u
         1fhY+a7EN1ZBiTPEF1ma7MD2wBsThfMNQ/43rz5ZGbpoQZ4hBnLX7WyCEjkDKDDDHdrl
         EIu7JrlD3QsTSJpKsmqW8lSaJbWnZ3w8TucLtesSgW0CsssjmSgfRt2Xwe2hHJQ66xsn
         143sxJJ9BXwCGgfJywiF5jE6XAM72FP/UaWTzRAgAX+O2750MKt1f3+pCV5mHKsa+fUn
         NUwosSXSedUY/5RFJ4jfzZLHKH+mI+VQ23Ig5R7U1IXAWDygX3Ll77GuE0yssGQjWJi+
         j75g==
X-Forwarded-Encrypted: i=1; AJvYcCUbDmmnNqNfcACrnv+blsI/SBXAa4t24WdxSd2Mv0a+OjW8CPhP8hY7ysHXbGaJvwwc2vZpsAxUfLWFQkCzolfmw4dLfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZsW78twf+z/hqxFzOkOSma1yQosZHB4A6Z9VluiZZjalwBMzh
	UZC+rbsPW0cBWP5peR582Qx0/1v3sV3sJ2a+kBmODkO11lbHI9zpF1P0a9CezQQ5XmHfzNmc6Ft
	fIZjZmka0mCzfJpniup4sm8aeBsRYeaw=
X-Gm-Gg: ASbGncuFJH3/6ZQ1LvIu7QJCvdKvDSGXCwwEZ79m9sIPFoOtYX+XcVR8Mdt1tgMn9JV
	TKyZpqPHfXmRq3imF9N+kAnedcZl/MGG3pZ0jf73j2s/Fd/bniuAu3GTyIarpA7ikrFvos30rJc
	pi1Ulh96mDZvb5oZV9oIg5drPvXO56AoWLJkfgK0cOlJVT0AvAZntvZY2Fyi0tnKaQ8SRjbcUw6
	aUgs6/qMjB5RiR1yA==
X-Google-Smtp-Source: AGHT+IHw3Z18XHstUu2o5MDyyGsJMQUZc09lyWpgCR+3iBlFcxOGkW7iUUBCOCFrQn0WS7ZaeI8Iju8q0S+OmEonvrg=
X-Received: by 2002:a17:903:1a8b:b0:25a:4437:dbb7 with SMTP id
 d9443c01a7336-25d25e85badmr85747195ad.4.1757972730212; Mon, 15 Sep 2025
 14:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250913052109.2638-1-bold.zone2373@fastmail.com>
In-Reply-To: <20250913052109.2638-1-bold.zone2373@fastmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Sep 2025 17:45:18 -0400
X-Gm-Features: Ac12FXyeEWmkZqa6wbMn8t2Wun6mfw4KJJSTBJD8vx8rr6MmHrmXg4LFyNCd8yc
Message-ID: <CADnq5_N9r+hyu6ARUGeYnsSPNNBM-bq0YV5mQoH6vp2yXdXZhg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Use kmalloc_array() instead of kmalloc()
To: James Flowers <bold.zone2373@fastmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
	alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, roman.li@amd.com, alvin.lee2@amd.com, 
	skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Sat, Sep 13, 2025 at 1:31=E2=80=AFAM James Flowers
<bold.zone2373@fastmail.com> wrote:
>
> Documentation/process/deprecated.rst recommends against the use of kmallo=
c
> with dynamic size calculations due to the risk of overflow and smaller
> allocation being made than the caller was expecting. This could lead to
> buffer overflow in code similar to the memcpy in
> amdgpu_dm_plane_add_modifier().
>
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
> I see that in amdgpu_dm_plane_get_plane_modifiers, capacity is initialize=
d to
> only 128, but it is probably preferable to refactor.
>
> Tested on a Steam Deck OLED with no apparent regressions using these test=
 suites from
> igt-gpu-tools:
> 1) kms_plane
> 2) amd_plane
> 3) amd_fuzzing
> 4) testdisplay
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index b7c6e8d13435..b587d2033f0b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -146,7 +146,7 @@ static void amdgpu_dm_plane_add_modifier(uint64_t **m=
ods, uint64_t *size, uint64
>
>         if (*cap - *size < 1) {
>                 uint64_t new_cap =3D *cap * 2;
> -               uint64_t *new_mods =3D kmalloc(new_cap * sizeof(uint64_t)=
, GFP_KERNEL);
> +               uint64_t *new_mods =3D kmalloc_array(new_cap, sizeof(uint=
64_t), GFP_KERNEL);
>
>                 if (!new_mods) {
>                         kfree(*mods);
> @@ -732,7 +732,7 @@ static int amdgpu_dm_plane_get_plane_modifiers(struct=
 amdgpu_device *adev, unsig
>         if (adev->family < AMDGPU_FAMILY_AI)
>                 return 0;
>
> -       *mods =3D kmalloc(capacity * sizeof(uint64_t), GFP_KERNEL);
> +       *mods =3D kmalloc_array(capacity, sizeof(uint64_t), GFP_KERNEL);
>
>         if (plane_type =3D=3D DRM_PLANE_TYPE_CURSOR) {
>                 amdgpu_dm_plane_add_modifier(mods, &size, &capacity, DRM_=
FORMAT_MOD_LINEAR);
> --
> 2.51.0
>
