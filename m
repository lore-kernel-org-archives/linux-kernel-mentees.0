Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9787620487E
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 21:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753478241; cv=none; b=pGq5hGfwV9eUtKaJ41gFEOjViJC8NnfEfeZIw83V4renP3TUryS7wh2maCZlt+/+kLx+JGzdtp4UQMRW2AYfrDYtAb1wRrktx9TSSeIIFLk2CGlRxCz4prRmUzS2bbl3jsWd92q6tEvt4/uevdU10vDHkJvfVdazZrUDVINwYbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753478241; c=relaxed/simple;
	bh=5W1xWN/MH3bhYHOn5uEZ50/hNwMW6Ugv61qVaiOuZ68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxdkfeGMckwuYEK272tpcra/A5rlEf3rz65XnE+wLg8OazuXLadLNJ12cHdA6qxrOBcYTZxGB2ns6w5a8KAiPsn1o1e8P0czKqNkZgpGsXbMYlORg1dRi686p0iYtW+byz3xV/hzfOm5qrU50zNC5/+UbhNXeG6/QIadGzI1lB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J6iBjZ9l; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J6iBjZ9l"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2350b1b9129so18498005ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 14:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753478236; x=1754083036; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETkxLDxYY1VgsCRsmN7I3Wj916ZLSMePTLbGFUiSWPc=;
        b=J6iBjZ9lq2bQk/GnV4D7qPNhHAdKEj4VN7EkyplNofSeTGeKVXO/s7PhbCbQetP681
         vSLYFZFClmq5TTZNEPOm0XIxQsRe9W4uiFJ2ORcu17qUTsGJBs28gpwFq7urLfMoboTh
         tQYmNe1v5AgXxh4UYjBKwxniTS+N3kgr5ZZEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753478236; x=1754083036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETkxLDxYY1VgsCRsmN7I3Wj916ZLSMePTLbGFUiSWPc=;
        b=Q0wNHb7tD/u6MEQXDQbB8s/4WEBg0IpeUK0VupuUP6mUPKzfax5HNw055A6wlBd3KS
         ktdhBI+bb5WvmsNGoJfbzfGjxBDjhUwAADZ++fxqasaukHPU2t3TXEZnsQt3SrgqY64V
         RkmJC5AlPpskhi5ZnqlQzFbG1uGJGHoAH8stwM91VM1iXViYD+hAQm5gzoDRpAgnGGi4
         5sxd78MfDJCggsn9ta7/7lIxljZVsyrCwLEyCu3CEocnyyrC/FIjxQZquBdUSR86OX5T
         x6/ts3wSuO0i5OJoItoQyQ8APrhK/9/x8UvmFGucNVJZ1IEBD0n/wnbfkrRhBbswKg52
         VovQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH+ZN3ZCP1a8pic0Sug998onaopJcufnoc+D7t7K0+Y3WVRtQz+vfD36RqZSpaueIxW7rkNoOA6hzTeM/r1cfkm70uhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyObcT79ZdDI1RzKeipZPrKHzpGbkUBiEVwB/bV3iEQpVVxwec3
	jyRM3nu/XmhMr/NRHQFCHQT8JIoUhundwouGPqmBAYss3vvAZQ96fsgHlWfdxGx94sO2V3Kdshk
	EvX8=
X-Gm-Gg: ASbGncvxswiY12DO6uV14ZQIlelbEaivBsoK/69iAzkY2bL0U8+vLsNusobEhtxOb4K
	o9i6jHBXK5w1vdArTthDP1XXCb1dRQGeYANeCwNVgxHRX6QaJmSoCtHT0Kx77PRn0oStZdYiSdu
	577b9jp6JqnHf1rEJHrwZ8bK2l5ch5qsk9rMYvnYeoT8COUgQK+WN6/trP2AKOdyGZk2BAcmEJZ
	qa3lVgHjwbTQJmhhcswLqNvM7BB6dHv+0OpyesMEDCbM7pt0igu/NG2qRlcLnSZG7Za8M8euEzW
	2e/r9LUaBRUnzkc0MXtR2M9qNxuoEYmdhALJsTK5RGovSCzABq2nMLcUTkemRn7xaF6FYPA3OOW
	uvldl39aGMFf1AI+rNGJpDt3jeKQrG0o/BoS7ebr1iQYQc2WeslCfWwSeb8OlTih4ZA==
X-Google-Smtp-Source: AGHT+IE8gtnSj2wEudIJNp8iIU6cLG7Wgl5GrpZvJNuQihTfOwc4+GZEVE7HK/E6eLP3sUvgalQ5bw==
X-Received: by 2002:a17:903:4b28:b0:235:81c7:3c45 with SMTP id d9443c01a7336-23fb3129c91mr53226565ad.46.1753478235818;
        Fri, 25 Jul 2025 14:17:15 -0700 (PDT)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com. [209.85.210.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe327443sm4232755ad.44.2025.07.25.14.17.08
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 14:17:13 -0700 (PDT)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74ce477af25so1850035b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 14:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8tk5YIYzj1/r1ftChyg6Kf3RIXg/h7C916CL4nY/5WqG0bxkV4Ny5JvxKniCIJu2NXwdTpTw4KmYpqQUUIjVDi/hVag==@lists.linux.dev
X-Received: by 2002:a05:6a21:99aa:b0:232:ac34:70ec with SMTP id
 adf61e73a8af0-23d6ffe455amr5790082637.7.1753478227853; Fri, 25 Jul 2025
 14:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724202338.648499-1-me@brighamcampbell.com>
In-Reply-To: <20250724202338.648499-1-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Jul 2025 14:16:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V65Pa0p-ckGAHTCgkqd00M9gE2Py99QcYmaq13jOdX9g@mail.gmail.com>
X-Gm-Features: Ac12FXxmzjj5lJEikgMEtUTC8c1N1dj-92vpoAep7aMMBdfPQfUJq6k3EPzR0JU
Message-ID: <CAD=FV=V65Pa0p-ckGAHTCgkqd00M9gE2Py99QcYmaq13jOdX9g@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/panel: novatek-nt35560: Fix bug and clean up
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 24, 2025 at 1:23=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> This series does the following:
>  - Add mipi_dsi_dcs_read_multi() to drm_mipi_dsi.c for improved error
>    handling in drivers which use mipi_dsi_dcs_read() such as the
>    novatek-nt35560 driver.
>  - Fix a bug in nt35560_set_brightness() which causes the driver to
>    incorrectly report that it "failed to disable display backlight".
>  - Clean up novatek-nt35560 driver to use "multi" variants of MIPI
>    functions which promote cleaner code.
>
> If there's a reason that mipi_dsi_dcs_read_multi doesn't exist, I'm
> happy to drop it.

It's a _little_ weird since one would normally assume that the caller
would want to immediately act on whatever was read and to do that
they'd need to look at the error code right away.

...but then again, there are places where a driver might want to read
multiple things and then check for errors once in the end (like the
driver you're changing here does). So I'm not against it. I'm not sure
I'd expect it to be universally used, though...
