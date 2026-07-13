Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEF2343D72
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 20:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973484; cv=none; b=uJ95AuhpRF3WwtFN3jsZwnbk8BUBfeI2mgTdk/LYws46HgqOQvyZYEMJJyMAClrWsnsJvIva9nfnJrhO8owqc7jX53o6V7RDmzsg4GgGUPHpdx3pDB97jEFvq37XNz8opwiDCIHJwuYdu+iCQm8NIF0w8KUAaKsA7+qm+Mg/MY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973484; c=relaxed/simple;
	bh=oijPNhqgpO4Qm3F1V0rmon3NW05vN0/t9DHvOhpX/3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNLXqEqxYDrwyLYtyB/0EKvQH7n/vtp8gKg13mRBtlkYJZ2ys61rQypO9/7jDWThvPKDD6yS3C9YCZtKASHnrWva08Yps5KsoxWQY3ro00G5IgmMBBnP/os8pAWFBiytpeW6Ef4qIXss9rSznZhi1h7fsLEjNFR2+UvGZV1A4Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SbiDSVL1; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SbiDSVL1"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bfb3347dc4so2152200e0c.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 13:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783973481; x=1784578281; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZlod+e1uDv6Tp/oYJcGTQuaGxXKAIOzzH8wDVB6B7o=;
        b=SbiDSVL1caBCs93pc6Y44WZgBi2AQfbuOsfMGDKyJGS9v0e475hgCPj4qEoD+NdpDX
         hGIgVR7i5+fX7ybSxvEvNcgh482xfihO/W0Qsf5yXHH4mCossuj0o3g2vkw5VwbH+5ZN
         THZ7BX7bWU/q3KHLfRhx1YeFcibuqStM4rPEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783973481; x=1784578281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZlod+e1uDv6Tp/oYJcGTQuaGxXKAIOzzH8wDVB6B7o=;
        b=e6a/wM7ROoEqKaC0v0H2fNZ7RiNkIgVSYpLp3/nuMbd8BaqdbCrvMB7PWZtM/ha/9K
         mV5V0A1P6A1nzQOy4nuRdwD1TvRVThMpnRCrTObBoMr6y13dntkwvvAJ1gDxXkDNmNTR
         BiJ/m4f885eR8uFv+NsIjdKB8cko6X/uBLr3u6T3Mzr5MbNFphjIYnvYI0W3QwsoUoj3
         bDI2FXZEz+gbSay2V4KIXxqhtfzjiDUsBWZyxVHwZz3UMtHKZn0TEtkAqK5MyYLgyUcX
         GEikh7Ukp+CfigD/odzRzlG3QyTnsSihTC7hbQC3TJyoRc/Cwc3bMpw1MvUA0OAtD/8Z
         243w==
X-Forwarded-Encrypted: i=1; AHgh+RoPCV7xjQ+NVwrt7E3oXHe0U3HrymlE334B22tkAhVm32p5MBQU7JQ4i195v7o1u2vbc8PXgvzA4tw1u+zVG/SDJH9DEw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyN4ehhwYn1AKzxWsD6yEYvOaOKZ0rbaTk+9T2FfTKHNUOScvWX
	/SNr1njUG6/puFM6BgUc3eaWKVKLcPAIKO8BAIEiJ4xvwhLhIlohbHm40JVU8+HIycI3nc0yx3P
	sbgQ=
X-Gm-Gg: AfdE7ckS3KVdc14/BZsz9OcjmMvwUrPFjoYycJxhnn71vAXUoRxUOmhPCRtAxpT9mVt
	AJqfecVLUckDsrYEEb2fhyZQNyUZP1bMvsWP29rJaurPVxsP50TsyRdLLvPjqZ1pXl/lfXt/8d4
	/DEAvzlOEYayVl5zqkWQWSR8dGy14u0viixHQFkygLMvZVtRiHDmHstxFRXpgChBBiV81fQEHqo
	RCt5cLbrxzrZvJ9fVIdhJli+3oEbkkDJtLbBNizL6uVXs6obNXyBNXUzKSGISC6zmM8D2NTIo30
	Tu2dzptrloAEbYI7GtreFPxDioH12js8XWuYGO+aLy8t6vykS7aTTU1GgOi9wKIHu9aUraTZeC9
	OVyjT0YEX+BVhl0+YBEYa8viazqAIc1fldbVGbJnfC6lcSripZ1d/8vRekLfyQEc4hxNg3eRG12
	ntarvHi9s9cLz9JP0/f6GIiH3uRUkkJinJe7mtaZj9a3n2adoD+pw=
X-Received: by 2002:a05:6122:469a:b0:5bf:8469:c7a0 with SMTP id 71dfb90a1353d-5bfbf04ffd9mr6377116e0c.3.1783973481505;
        Mon, 13 Jul 2026 13:11:21 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f66eb74sm9620807e0c.7.2026.07.13.13.11.20
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 13:11:20 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-737f6e70678so2352996137.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 13:11:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RprOoajDE2WiG5hCGEamiVtjKmpcRePogOo10CgFoPHeEe1/LCrmEC/euG+JlMEsG877thT+kYmI/THAhc3W6OxPrLnuw==@lists.linux.dev
X-Received: by 2002:a05:6102:5605:b0:737:bfe6:3b03 with SMTP id
 ada2fe7eead31-74533bc9032mr5929953137.7.1783973479445; Mon, 13 Jul 2026
 13:11:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706224414.1015766-1-nico.antinori.7@gmail.com> <CAD=FV=UTtNdi_cUaqDXXWWFzZADh_HB=sJuZqKV=VB8tgFTwEg@mail.gmail.com>
In-Reply-To: <CAD=FV=UTtNdi_cUaqDXXWWFzZADh_HB=sJuZqKV=VB8tgFTwEg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Jul 2026 13:11:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VKA_SKpyew8o64_Fn6qG_mS5snXm1XAazG+3+mn_YJcQ@mail.gmail.com>
X-Gm-Features: AUfX_mw54ZGdoYJIFpDZ_csf_4F_WNipu_An5eSERMPBRjO9TuCn5xHygWB0_AE
Message-ID: <CAD=FV=VKA_SKpyew8o64_Fn6qG_mS5snXm1XAazG+3+mn_YJcQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: novatek-nt37801: Use mipi_dsi_*_multi() functions
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 6, 2026 at 7:31=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Mon, Jul 6, 2026 at 3:44=E2=80=AFPM Nicol=C3=A1s Antinori
> <nico.antinori.7@gmail.com> wrote:
> >
> > Replace mipi_dsi_* functions with their non-deprecated mipi_dsi_*_multi
> > counterparts. This change reduces error-checking boilerplate and improv=
es
> > readability.
> >
> > Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
> > ---
> > Changelog:
> > v2:
> > Implement feedback from the previous thread to simplify code in the
> > novatek_nt37801_prepare() function. This converts novatek_nt37801_on() =
to
> > return void and passes the mipi_dsi_multi_context struct directly as an
> > argument.
> >
> > v1:
> > https://lore.kernel.org/dri-devel/20260701125624.199786-1-nico.antinori=
.7@gmail.com/T/#u
> >
> >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 110 ++++++++----------
> >  1 file changed, 48 insertions(+), 62 deletions(-)
>
> Yah, looks great. Thanks!
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ...barring anything else coming  up, I'll plan to apply in ~1 week.

Pushed to drm-misc-next:

[1/1] drm/panel: novatek-nt37801: Use mipi_dsi_*_multi() functions
      commit: 5958ff1a715dd885210ce7208f1aa1fa930e8671
