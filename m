Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63EF185E4A
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 16:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753201939; cv=none; b=Fx6QFFm+zXZw5VHkZ2gB9B4mxdJZiGTa268M3eOt9hfCoZl2vrpSHZif/JZcJxEMK1HePkyqHzdn3i5vP0vXJfyI8pFq8Hcx+PgpIyGwppvRnT+Z6fWZovlmIgxvRvuWj9u9mxE8MwITMJjAS1YvtMo6BAyanWsEPhN2nXH1HT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753201939; c=relaxed/simple;
	bh=Pqs4E5LUI8mWz/IsLr+Bi09UwKTqd2EriMVrdlnD4Fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZ7vhDlzpfVuebqHDhh1ewud+8LfMYJ8ERs/xeJWPrlqKf2v1u4ZNnxpzVgMkMji/z10OfwcMuXq/t+PJICIY12AV/4bkQM1VYIz7pQ5hlFyI407xuVo0fGzcaotNrfKPH+HoYJ16CVySBVPT14D4HLJ5IutpbxbBwUfNVhmG04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UuIvTleQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UuIvTleQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2353a2bc210so51615925ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 09:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753201934; x=1753806734; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5dIDnAxZOX8ng1HhpeNVCkuVrJFpRO5masWNAnQ3RE=;
        b=UuIvTleQ/SN5ZblMesJxgJ9MzMvexVCyhdU74sDWxL4TSK1uulDEhdIxDmxFO4p+P/
         5nOmhAuEyWg3EjaT85+fWZp8OpiQvjULEivcsZ5m2eAA7VOZyFnia3Q24IrD0uSvXYjJ
         nPzwmvNAOTZ98kKZK2LebFcn5DoG2DXphoI9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753201934; x=1753806734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5dIDnAxZOX8ng1HhpeNVCkuVrJFpRO5masWNAnQ3RE=;
        b=qambOYDiPks5G3PzmMhvGXo6d2dAbIx8QDLFpm0WSSJBxxsmY1gRbodss3FHSqOSoM
         ExZ+iQ5SSntbwhhsGB1c7SrqfEkidUIkH8d/M6uz701wNeyvUhxLvNVb48KYnIX2gSlX
         TgBsosJmb0RBUdBaEXgTXvHPSm0hkqvYo3F0ju/uoT6sdqGg25qk5C4Wo3UeJdLji9Fp
         ZGQPYXNw1HqSUNbbxJgpyM/Dj4WlEjh2yWDOmdzD6J/DxN3Pi7AVkyrA1hq0y3eyhMgG
         07yMMCRC/kNR8NXqMF86qr2tcTpFb5DXjCww4PID4B9ud3bbRcYcBrI2aG6RugXeN1og
         hXfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEaveMS862DKti1n2ILgZjA5/QHalQNOyGF+22m1iAQM+HrwtV8949T5iQbTaDudnhZPrXq2AccdaVOw7RTfQoSQ62Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvsPH91wnX8CYosCUeAs/7+dDvhiN5DBKffKWYzZCWMrgiGgoe
	Zg+L6zx0bVEUEIKFZMRCMeGtewoEs4cyTuAxVgj4e99vzVuklQy7g0/7aHCwuRGHCR7DO7KCxRy
	oaTU=
X-Gm-Gg: ASbGncvDshV4IGpsp0oyHLt/6bZprA6SXjXq4VUhvXcarOL6WpGugKLhy6pV9yVgnmI
	9idb0aPlrWWRA7TuJLn5YqKxLTd4hbgSUaHeep3vWGAyQCuklQUB83OEAhy0ly9n4rsqk19qNxn
	B3mFUQMLDihc9KtM6cri+RaMQdl8Sz4AiclaVx//lraDI0nwlnOHKsbKTnLTBHlSp3Yvv7zpEjw
	To2RlwsvqpngQhHVqkrwViD/Q94nuHrjkKKdAnBZNecV+5QGPRdgPNG3kVoLTmcmRKIlt1j7Wvd
	g3OukbVopMkVc2A47tKsbLewGWmYcySvV1psVPxFjI5epcyRmqeaid4ecqxVmi/lICgOz9E6II3
	32lKDj32MnxhUWq3kd9nW79IRNTdc74WpCqYhGOcwoR9f46GLWVq9xRA3axiPcNLBu0ebrQo5
X-Google-Smtp-Source: AGHT+IFg2mYhxC0Rg1cSfGv5DEBQ69jeK0nxzEEjVwySeqBMz/AcOFlTRjImi1e/cQR6bAX+yTwa/Q==
X-Received: by 2002:a17:902:ea11:b0:235:225d:30a2 with SMTP id d9443c01a7336-23e2579156dmr363800875ad.48.1753201933697;
        Tue, 22 Jul 2025 09:32:13 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e2d06sm79428565ad.43.2025.07.22.09.32.11
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 09:32:11 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313a001d781so4735693a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 09:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOp0+eZATUt5CE/PlgyEMPqEbiQ+PebB9TvAgv+ZgADQ5gzDE8x7+bBo+TumhwOMhgonv+wn9dR7OeugryXVNn2bu8fg==@lists.linux.dev
X-Received: by 2002:a17:90b:2247:b0:313:283e:e881 with SMTP id
 98e67ed59e1d1-31c9f3ded05mr36938957a91.11.1753201930387; Tue, 22 Jul 2025
 09:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722015313.561966-1-me@brighamcampbell.com> <20250722015313.561966-3-me@brighamcampbell.com>
In-Reply-To: <20250722015313.561966-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jul 2025 09:31:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vg6LoPzOHRj=XzCcSb7rPb=vPuCZngrf4hROZNwfj2Pg@mail.gmail.com>
X-Gm-Features: Ac12FXxeoQ5h83qTRHx6WqFmrhVxXb5TjaxOWmVQAou0S7ba7bXolm4shfJMxPI
Message-ID: <CAD=FV=Vg6LoPzOHRj=XzCcSb7rPb=vPuCZngrf4hROZNwfj2Pg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
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

On Mon, Jul 21, 2025 at 6:53=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Fix bug in unprepare() which causes the function's return value to be
> that of the last mipi "enter sleep mode" command.
>
> Update driver to use the "multi" variant of MIPI functions in order to
> facilitate improved error handling and remove the panel's dependency on
> deprecated MIPI functions.
>
> Use the new mipi_dsi_dual macro to reduce code duplication.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 196 ++++++------------
>  1 file changed, 59 insertions(+), 137 deletions(-)

Just for fun, I ran bloat-o-meter to compare before and after.

add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-217 (-217)
Function                                     old     new   delta
jdi_write_dcdc_registers.d                    10       5      -5
jdi_panel_unprepare                          312     260     -52
jdi_panel_prepare                           1020     860    -160
Total: Before=3D4908, After=3D4691, chg -4.42%

...not as big of a savings, but that's not too surprising in this case
since we don't have the whole pile of "seq" functions. Still the point
was making the driver cleaner and the space savings is just an extra
bonus!

-Doug
