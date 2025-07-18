Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841D32E6139
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752855099; cv=none; b=pZsBrgyAB43S0Qh0gaycVqFwKkTWl/UHfgqeUO7DAuwWsQ9w1Yv3SLAifUG9ncHr0qLsfMRa1WBxsJ7rsiSrqAvLM1eIRyZhZzwCeWc2m2L1/mLj0/AIFWWw/fdlFhfbSrXP8t7dhe+1abfMWnRH5mTIqBT0mXiwhTNHAvMEbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752855099; c=relaxed/simple;
	bh=FyRfBnxU/OGyyizvx31WzrOI+l2j9rU6IuwyuQVHu2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwJv8PgX3SCT7wPaZ08UoGbgM8+zu922TOAWil4IFIBVFyQI2ddhCJV3n90GvOS0atXJLCRM+WrfvL31msg5jey9OuhY30JXaiVmL5AnlEgxt3bWIGkmTRS5pNuzAp/GnKU8yw7DmIWuzSE2F8eHLM49OMiI9KqeZp70s3/LGKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eF1EAnCD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eF1EAnCD"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso2053374a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752855094; x=1753459894; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4sbOB8EUknRai1AuJ9cdNWA6bF4sUdUbr8Aph2l+CY=;
        b=eF1EAnCDhvr0tUh2kyGnowGZkRz1w3nPK3xALKZGLmaTf8RmEAxSfGq0dBMlstRLqy
         Y4hJhm3rB5Hju5RU9CqJszmz7ei/5YMXVI5IjcP5FRjiocFJwW/dpLtWgEbja8a8Xzt6
         RyoaJENaop8YmytUn9BKb0pc5ggBkdmW21n8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752855094; x=1753459894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4sbOB8EUknRai1AuJ9cdNWA6bF4sUdUbr8Aph2l+CY=;
        b=FpJyXkGKU0I7kjH2m5FTzXA1b3KriwIZ3jr+I1SU5pEMkP6OMCTwaMYZtrV77ouKes
         722wwI9pbwKm7tGYfiW/icl7yG7Rf3TErM/YUsp91UOK+hrbt63E01dvcrBV1wUGCaFJ
         Z21kDBoefDtLXFKkaEizT2JFsmzdgG4YWyu6YncD5an4KGVJOJ8MEFG+noyIWcrh/6gB
         U9AnTY8iJiMqQHXoV39KN+OcLxaZq+13GQ2RkVREg7jJs5wypmSjV+gKCdaF3P63TeRg
         KpDuQ+vcFhdZGxSUTPzoMKqcicM11G7Zz0U7nAHi2rWx93KK/+Ij1H3hThdPH+8+tj0x
         mTug==
X-Forwarded-Encrypted: i=1; AJvYcCUAGTfsNnrlIzeAO0zC+sXQtskMAfl6qr0GjT9WGtveQ0tgTKsIyrkf8L01JZfNzq3s6nO3I/+7SiyaB1WWKeJEKr9FxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIscwSvYs3ZDxnB1HwED12USsQLpn4WblDPNdR+s3ZOXEGBojr
	1Kq3Zbj0xDZYiy3oatgg3E0+TCznLlyax86JTWaS7+F7XCQx2tYSH/3iQctnaXl2Ig6Jto92D1W
	kkps=
X-Gm-Gg: ASbGnctCN0SUhckFVMPskezV/BgdP5BW+QGI/P5nYKGP8meVm5VCkOQrRJIwv4/ZLNg
	Ygq1a3dJ2FAZhR2EHIw9ZtjzpstQSBtMvIr7khGz5G8IkOmaEO1vfxp2PdrJ4h3lyuPas59EtFM
	0+5169CdYsiR6MF6Gf21VDjZ+JprZk5GgIAnUFHfVclsrRm+yVFbYaTJS4kgI3BBJ1TYLrSHCV6
	01sm6KHlaR8tXor566teoLYCxS8kSrXZL1CkzA3FFSlY1V9fPgagCAqk2fUSDJzYQ/0CFpJypHI
	t0PSIvuLesmoajeWJoc4iB49qM1PefSrOA4w7jyV7EAeBaNz5CByGH2WRMVp059GJ23xHl5MgFf
	vkg09rcsJlCAvgXzJb8JxKqkAEIO+EaLGiS84TWRgbmr8pRneZEehnHxzheslvQQHHw==
X-Google-Smtp-Source: AGHT+IHRrGHZml7GrW522hL0YaTXGNNnYJPoHoE0NmyIzsLsXvZeyniHiss5FnAH2uEDqpidIJDzLg==
X-Received: by 2002:a17:90b:5244:b0:312:db8:dbd2 with SMTP id 98e67ed59e1d1-31c9e75b9bcmr16804616a91.19.1752855094444;
        Fri, 18 Jul 2025 09:11:34 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e424sm5588399a91.40.2025.07.18.09.11.32
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 09:11:32 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23694cec0feso22058285ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 09:11:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXN6r5flaPwvhd3gRqWChMQTPqAIK7xsV0wThPFjG2Vnqa03JDIS0KjoCCzPteZ2DWZoFZyIZG8ZhnBJzK5/Kg+ASrq8g==@lists.linux.dev
X-Received: by 2002:a17:903:2d1:b0:234:d2fb:2d28 with SMTP id
 d9443c01a7336-23e24ec73b2mr186837285ad.2.1752855091825; Fri, 18 Jul 2025
 09:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717164053.284969-1-me@brighamcampbell.com> <20250717164053.284969-3-me@brighamcampbell.com>
In-Reply-To: <20250717164053.284969-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Jul 2025 09:11:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vrp9MM_5de10sV-TC_mp-D7en9gjU8DBoD6mBrRvF2eg@mail.gmail.com>
X-Gm-Features: Ac12FXz3KKf6EYjEda0vjUCQyFQVXEd84VY4Ny25pnbUOfssxeUq4v1dFeHX4UU
Message-ID: <CAD=FV=Vrp9MM_5de10sV-TC_mp-D7en9gjU8DBoD6mBrRvF2eg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 17, 2025 at 9:41=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
>  static int jdi_panel_prepare(struct drm_panel *panel)
>  {
>         struct jdi_panel *jdi =3D to_panel_jdi(panel);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .accum_err =3D 0 };

nit: can just be this:

struct mipi_dsi_multi_context dsi_ctx =3D {};

This looks so nice and clean now! :-) I'd bet that the compiled size
of the code is also quite a bit smaller as well...

Reviewed-by: Douglas Anderson <dianders@chromium.org>
