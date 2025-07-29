Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B26F79D2
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 21:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753824827; cv=none; b=cM3g7V34owlTbqHft9oVmZHVzi9KAOnYtDJNzeoBIuBUj1vsTVqqSBMyBI5sm8Uh9EIjK1unWRhDjhLOu4kdS0BkQqnSsjy2lg+iy1UDd/axHVenhfMP7QyupRV62dwvJ2snV2N5MQ4Zn8VokIkTQj3UAr+inFJ5ur+TZ+6Ucyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753824827; c=relaxed/simple;
	bh=oK3zudS5L3oyJg6+qzi2hiSX0O/6W697rLcB9Z7qPcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mS6klnd5i9O0XHdLgAxnejvg7rTLSEprSe0AwVYX92Mah6+R7xbGO9VN7a/bbE2Ibq9/lBJR6SJfQ4EXWS1WstOAl/WI0lKgOnJKVbanzqOpW/BheKrOMgOUAGSrTUmMIAHhzPRNs+x5d0iv0rwum4PHpc3SFTq0KcCKCaFpBrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qnjj215o; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qnjj215o"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso6454203a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 14:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753824824; x=1754429624; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oK3zudS5L3oyJg6+qzi2hiSX0O/6W697rLcB9Z7qPcI=;
        b=Qnjj215okHBAlWAhMcTvMJSfoN1xRzFUERWW8O0D7gP9T4l6Wt6XYOwaJDxAJSAwLd
         0L1xaaRXbAywXXa73iqOJXjCo1QRq0krSkVJDts/XxO1AQpnu2oDktr0hyOm1jDjCRJO
         PreyjW0QoZIupKf8VdbuLRgsVOQCwqFX2dgLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753824824; x=1754429624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK3zudS5L3oyJg6+qzi2hiSX0O/6W697rLcB9Z7qPcI=;
        b=DHUDTG6+GoV5yTGIM+SvPx3E1jNKwVSasOT62COCjCLDukwi+oL3FXIiVg+S4g9wKK
         rkY7U6rTWol03ObckC4ijQWZTJ6A6ILz0i7AGxdGR7a3ch/G8LXhPQ7837ibXLKThpMF
         xOT8mzuiVQr4UH2gdolk2ZYxx50byd4KnVJAmwhbEWEMCeEWh+b/Rl4NFBy1VVPb5yR4
         1UGJelGrJb0oI1G60+SQmmaPYmNSqt2l1XM7sMaFs0keRwVrJ0BjZkWfTuRHIJfoDVHP
         glpsQatsuWd6oL0MNcV98rn3C+hP3F7wzPwFkRcVIYju6A9u8okgDf+tmb4e/Wvi/0hs
         VABg==
X-Forwarded-Encrypted: i=1; AJvYcCWPPJPCrAj/kpbJMvSEkmK5vsdQJrLnCtPVOBhX75oaFqvTn4GPY+jAX0J9r3B/pj7zvhfs6Kpsc8iX8xAkQV5WaCDaqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEKPX6MuWYmemsC/+hf6hifQUQBi3yRZy32j1wWywjOi7tW6Uz
	rSAr57rpSL+LjzNEUVn0EJmlIZAuCAGzzyweieWiyk9cKXrhFfzMaXDM0UCugx7Fis867VttYyX
	yORU=
X-Gm-Gg: ASbGnctKG5DbbTsnyoMWISwXBO+1cGWE1Q4bf6TV3f3azc72h6XQB/eq3FmBLS1tevn
	0JRRfyWQ5rNJkXJUrJHRyeeRCoQIIwtZLEEWdKi2U55O9uG01yaDaoa3XHpLicuQm8Hf7ehR9Su
	7487d99h1aQoHZGW/D28YsVk3vPJ31q5PxM25izD0gtsphlLefX/4WCoiaNbRq4kIM3Tubc2huI
	hx/ZE/bKDN1pxYsr5TPt3H8KK+UnyY8qNhZth3TdbAoPIrFphbYReZKi7MptjCK6h0QIHrYsnFT
	L3nDBuad1UR5zbo7aTkJpxkb2erUvn6NTNzTq3/AYCqA5kVRAGLdXof5ytoneG0J2uQXVpervDZ
	kSg92zuPrC+LHB87PgWvVv/eWPIOkCLeHboTa2KgthMu30LxVLNF7fuUYi84DqQ==
X-Google-Smtp-Source: AGHT+IF9FMXUr3xaQdYzoQHVJW7KazRoO51QI0dDWEQCDxrXUj005frZ6J/+3wdTpZDFtux81yeB2g==
X-Received: by 2002:a17:902:e294:b0:240:3bb7:fdc3 with SMTP id d9443c01a7336-24096b4c4b9mr8219565ad.28.1753824823755;
        Tue, 29 Jul 2025 14:33:43 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24071bddacesm23826245ad.1.2025.07.29.14.33.41
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 14:33:42 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31ecd1f0e71so3233107a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 14:33:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzSi8DzJI3eWG1a9jz5VfMWIr2ythPfgr4PZFGOWxrAkDANBXJuhBAleCPleAFpuEdCOQabqxgdRWSM2Kwc7fHHoUhQw==@lists.linux.dev
X-Received: by 2002:a17:90b:5623:b0:31c:23f2:d2ae with SMTP id
 98e67ed59e1d1-31f5de41b29mr1394160a91.15.1753824821327; Tue, 29 Jul 2025
 14:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250729054435.1209156-1-me@brighamcampbell.com> <20250729054435.1209156-2-me@brighamcampbell.com>
In-Reply-To: <20250729054435.1209156-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Jul 2025 14:33:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUdfTT4AJk77BFXWy7q_je0EbRKWc=nUVevbgitkn0gw@mail.gmail.com>
X-Gm-Features: Ac12FXz30yn8dPIvGy4yhci1kLmxkqO0_5A7uc1Q2WfPuAiJM5bHgzJdAchVJwg
Message-ID: <CAD=FV=VUdfTT4AJk77BFXWy7q_je0EbRKWc=nUVevbgitkn0gw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel: novatek-nt35560: Fix invalid return value
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 28, 2025 at 10:44=E2=80=AFPM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> Fix bug in nt35560_set_brightness() which causes the function to
> erroneously report an error. mipi_dsi_dcs_write() returns either a
> negative value when an error occurred or a positive number of bytes
> written when no error occurred. The buggy code reports an error under
> either condition.
>
> Fixes: 7835ed6a9e86 ("drm/panel-sony-acx424akp: Modernize backlight handl=
ing")

I think your Fixes tag is wrong, actually. I think it needs to be:

Fixes: 8152c2bfd780 ("drm/panel: Add driver for Sony ACX424AKP panel")

Even though that commit that you pointed at moved the code around, I
believe the code has been wrong since the start of the driver.

Other than that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
