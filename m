Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB7930EF74
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509115; cv=none; b=lV+x6EcLjdufBdoSk2HsKxvfN0pl5lrHMY420DX40Lx4DWf6fOjH1etYjRgwUyP9sWmtV/pqGoQGOOLyhRrjwYoaiqCtfKTEZb8RwG2zaEg2hTmQ5sGMgHqYg2nEzy6TzhDp83+Sx/1UyFOrZycgpkWUxb8veVJ47ETgN+wA6MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509115; c=relaxed/simple;
	bh=HWl9Wdg6tQt829hLiKPSU5FXqMuW8JcenL87lFgKzLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QlYu+KhcDiOo6MlwhDgzS3/GKzuXalXt1BoAWkqlwnlzQVX5IFg++edwjLd1uw1opdKQAe+a18Ou8amRvF6XS9w/yCiTL6wtmy0ydO8O9+W+1t5W761+fVh2FB2FMHofcgKXDCywKtDxbAUuxCaa5MsOenL0YPq+ML2jOD1yiW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qXsHOreT; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qXsHOreT"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55ce5253a57so3874176e87.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755509110; x=1756113910; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWl9Wdg6tQt829hLiKPSU5FXqMuW8JcenL87lFgKzLo=;
        b=qXsHOreTftNkv4cghKEuuX0qKO/m5/yVkVbTCuREt4gDBo3myxlbhBhr82oRBOtjdO
         Q6v8PsdT8sxHggQIByxbWIdWHJ5yQVURf26ARjcLeV2CBZ9+rWUQYqAAUGxPZ/ald4v8
         jFFANuG79gTtcBTnSk65FP5HohAnSzcAc6e/nalq8pzVqr8IJevaYr2yLZVUYbgzKU4t
         EyI/IEEXSWf1ZKAoxel17l272PFEKUzUXOEISntKasP7N0UnU5XCN4MSFyvIx+R5rxFb
         bgiC1ssy9p5h2K+DSUOgvqivOKxDvUg/Lata6mAzgIxFpW84vNiQ2NyQFCiQAaPcop71
         IWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755509110; x=1756113910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWl9Wdg6tQt829hLiKPSU5FXqMuW8JcenL87lFgKzLo=;
        b=W9/nurW8kp5v17vzMrlEcd/a338CE5KtMY7BfF0SzrvxAcoeHUccPclNeG74zyqwNf
         3p3pDuTOSDYaiympbnXXab7qy/f0fZDYiHkF0Zh419tJJnGibgcLIj4H1V+jjIALTE+M
         ytehQYWrB/LWAUgJbn9ZQHy7iDUXFQyPGa+2EjJ93/OshTB28jVSuZWlB2eXSpZUQ6fm
         TyM3cT7NQt8mJlpo96chv8wGRU4ESLXl39Z+GgeLHBeJ5ia0yFXTIL9G7oMcP9ergBm8
         nDZS0aZAuDuIHgf1bb8jEtb+XV5Gh8aSCc3e7bmWNEV+HoZrDzxtPiqEHn6KKyNq5rbx
         tWfA==
X-Forwarded-Encrypted: i=1; AJvYcCV+wTHcalPy62NDPq53DxJ9HtIQDI8GcBMN2dsuOVF8qBm/uh3WM2NvRnWO5J+a7+JksNHXIaxdj6cqoGoRNZXsmBSA3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLnFpJvmEEVauJmYC/NNUo6pPYHaHcyOtgZyHgn+obhj7or2lH
	tUbzLAySvRAycKt2OGbhxMzlJENWfrtvHD/4VQRTMPbNF4pLzx7XKd2JIG5dlN94D5c0yITJBrl
	2v7poz/raHYNZtAaHC3lD7lDpBBmnx5eaenBjcYS7Aw==
X-Gm-Gg: ASbGncuaKupySUaHhWEaOyMTQdwYSie3tmxh46XAPGuPF2FHn4usuaDen+x11I3uJGU
	42ERfk0iDoxI+DFRBeUNlUZ+LGG6T4vh5tgj2XjrCRPIK/UCPGUeTQOMrv/zmaEFRzudTRINMbd
	yhh4pLW3DLlb59Gc1qYSry62qYvj+IQaJQZVvMVwgANuOpKcOIvZTluC5E0baMUqJ/F3WGias8Y
	NHWJEOIwNQN
X-Google-Smtp-Source: AGHT+IFC1ZjNERncmt6aCwcSemfraYYSYedGgU7En/j6NqE3CZM6qjD72eC9aTSLaWwQX3FdwMknfiQchSSy/0ZOP1k=
X-Received: by 2002:a05:6512:104a:b0:55b:760d:c2f2 with SMTP id
 2adb3069b0e04-55ceeb68062mr2942102e87.33.1755509110245; Mon, 18 Aug 2025
 02:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730061748.1227643-1-me@brighamcampbell.com> <20250730061748.1227643-2-me@brighamcampbell.com>
In-Reply-To: <20250730061748.1227643-2-me@brighamcampbell.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 11:24:59 +0200
X-Gm-Features: Ac12FXwBqttAHWn-Fzo0FTZhwhrfc7nvpSbb3PEL3L84qoflel5B9j8C02N8kLo
Message-ID: <CACRpkdaZxPKmi3XWxKVG+HpssdH=HGDa68Ek=bcX-GEaQXaSbw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/panel: novatek-nt35560: Fix invalid return value
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, neil.armstrong@linaro.org, 
	jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, dianders@chromium.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 8:17=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:

> Fix bug in nt35560_set_brightness() which causes the function to
> erroneously report an error. mipi_dsi_dcs_write() returns either a
> negative value when an error occurred or a positive number of bytes
> written when no error occurred. The buggy code reports an error under
> either condition.
>
> Fixes: 8152c2bfd780 ("drm/panel: Add driver for Sony ACX424AKP panel")
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

(Maybe this is applied already...)

Yours,
Linus Walleij
