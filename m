Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CA81B0414
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 20 Jul 2025 07:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752997848; cv=none; b=ldTljRvMpAjn8hjUEPZQ21D0IzkAN9DN0Ms2REvONPxhzsNNH5q+Z2B3JQEaO536xxw/9byUeZJDhutBxZbp58Ma5F6llg/jd0sTetQVkGFSp33PkDPhuECoxX4I1YlMLjuqeTBdUfrfgJvzDDiIM/6j5RQQPNnmuLz27HJiWBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752997848; c=relaxed/simple;
	bh=1EIzLiEKFNKNhapurV5TiPfyoyMNTU5jV2wejXKsOv0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ncGSYVAPjGCF4sXYAJQ3l6r0J01oqrG8+IevcIh1Bm1ssK7UFZoVfYrouPpuI8quqwcbC+4oZEWM6ME0/YnF0lLESEPTPtpqJpolfIyAW1TC55wMzbwjcrXj2Yu2IclbliTVPXELVd96tf5EfsKrVPMZuZb4bpt7uushfjI0mJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=bCm6YcBP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="bCm6YcBP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23dea2e01e4so37897695ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 20 Jul 2025 00:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752997846; x=1753602646; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EIzLiEKFNKNhapurV5TiPfyoyMNTU5jV2wejXKsOv0=;
        b=bCm6YcBPnV099AT2VWimuNGDs+GgdWezMk3cO5Qlt14+2w8l+sWLVYWsLWde82NOf/
         V5G/I0bnIrCUcUMM/ID6ifUFtRhAkTT3eyAxZPoJm5wprBpHMtMJMR1l9WJ0K5oIM90A
         MqxyV7+AKL/K6p8HZHb9WNFdVVGVHP/JLxQ41sEQWVjqIwL7onjVOsGuMi+ZvBOqPotP
         2Ql97kI2RYyNy+QQ9FXgdFq1n7BGu76VfoH1FexZ9uO8xzo/uKNGg7i2S80OEV+mXhym
         T/6qVJw8BGvXnqCNQ8SCnRH6vxmTUDmk1VGKn1VcEQ4bzqGl0i7DMh7mTXVCfyCo5Ro2
         syCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752997846; x=1753602646;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1EIzLiEKFNKNhapurV5TiPfyoyMNTU5jV2wejXKsOv0=;
        b=kMRMPm3QxGUGNmOq/UJlqMRxP2xUKfyK902UZV8OviV4vmroD+Vyx1LOE9BF3pRzML
         0oNAGYAh9k3uA8PoBXVi7CTmcejW6dF23q2WgB1Oa2o2MXtxP/TUlIzUcjNxIFosTd5h
         UzEOxuAPJlWMZolMP4WOZ5yHkgokg/+stxq++3iBc7m1Dl5a6lV6gIIB4bwRYZQ4W5ej
         KFu9tAxTg2xMwEqUYZy2ZuccAoky2KUbGg7uKa1+DS+/e/BV81C0WciqeMrMLgq7gItD
         SLtd/RAzXYdwrwp0ou+FO4RsbsJQmknqSm5qvJCyv/uIJ16ZBbOzPStzAjQ4F3cdkQKV
         flAg==
X-Forwarded-Encrypted: i=1; AJvYcCXjtPa17EU31UDmFoPNGbIQNv/qZJJJ7XNZAcizQV7A+Bx7AW9JajEQJOyF1p51GGT/7WShrTLy1kbkB4+7PB+oxdmpUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlvVWbS6WZOlfnJkmsjmKi7B5p2jSSvQbvyhmTlpv/N4KO931X
	001jzoTm3IsHIDYw3AQYwd/znNDrJnjD77O4zhF0uAZuDtZBP7HmQC0p9nb7cUlWSdI=
X-Gm-Gg: ASbGncsydZ2iO2+iDj0OCWGGS+OMFj1AVLHvCwfPU+SHxQevee8qGyj65Bbl1Glyki2
	D1Fc7NuUQVlxbqJX4B4nNRsY8djk9h1kWAtUac/vbM6uyqX6hlx9hs+Rllp33WX+Sd+EaHzAhdO
	hVWV3y+SQhsxCPZpsQGf7U2V+zpl0UZ7ke3KqHu6NEKp+weTvq4GdCHDJ+o8qjK+pLeD+/Qh+uk
	U8narPI4b5jAjgdzjdId9Kokx540n4qUJ3yzfHzF148GP/OjwfbRwQMpGWYYrIw5nL+4udoYAK7
	sKQunrf7X876JFPF+4joR8C6LMcrrNLeZYpWbS26j1CYCYDtGEFVJfdYhCu96OHYOuOyNSE/a6m
	sRiIwhZl4ADlM4apSPrk=
X-Google-Smtp-Source: AGHT+IHLtegd1iyRVDLN/vP8oO8twGnp2iC58ZPKXolFVDdIfrLW6ekD318QbzbDW8XkVDBKOe/oyA==
X-Received: by 2002:a17:902:ef44:b0:234:a139:120b with SMTP id d9443c01a7336-23e2566ae6fmr224043965ad.11.1752997846197;
        Sun, 20 Jul 2025 00:50:46 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60ec88sm38530095ad.65.2025.07.20.00.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 00:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Jul 2025 01:50:43 -0600
Message-Id: <DBGPVFN5DTGU.5UTP35ALYS2Q@brighamcampbell.com>
Cc: <tejasvipin76@gmail.com>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Subject: Re: [PATCH v4 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up
 driver
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Diogo Ivo" <diogo.ivo@tecnico.ulisboa.pt>, "Doug Anderson"
 <dianders@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-3-me@brighamcampbell.com>
 <CAD=FV=Vrp9MM_5de10sV-TC_mp-D7en9gjU8DBoD6mBrRvF2eg@mail.gmail.com>
 <f0d300fc-0141-4eab-a888-d1d32778f5de@tecnico.ulisboa.pt>
In-Reply-To: <f0d300fc-0141-4eab-a888-d1d32778f5de@tecnico.ulisboa.pt>

On Sat Jul 19, 2025 at 11:10 AM MDT, Diogo Ivo wrote:
>> nit: can just be this:
>>=20
>> struct mipi_dsi_multi_context dsi_ctx =3D {};
>
> I am not an expert here but I was under the impression that this is only
> valid with C23 while the kernel is written in C11. Is there something I
> am missing?
>
> Diogo

You're right, C23 was the first standard to bless the usage of the empty
initializer, ` =3D {};`, but if I'm right, it's been a GNU extension long
before C11. At risk of being pedantic, I'll draw attention to line 580
of the kernel's root Makefile:

KBUILD_CFLAGS +=3D -std=3Dgnu11

The kernel is technically written in the GNU variant of C11, extensions
and all. In fact, the first patch of this series uses optional variadic
macro arguments, which aren't a part of any official C standard as far
as I'm aware.

In any case, a simple grep for some forms of the empty initializer shows
usages all over the drm subsystem.

That said, I don't know if GNU extensions are formally documented or
where one would look for that information. Importantly, I am by far the
junior as far as kernel coding is concerned. I yield to your experience
and I'm happy to change this initialization in v6 if that's best.

Cheers,
Brigham
