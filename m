Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072354502A
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  3 Aug 2025 15:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754235238; cv=none; b=F9x4ScgTt0NU7dn5wujT9VZqC55KPz7i4dJSfQvRzZRcfs/6+Z5oeJLodBISDy5NnLtCG3WfXgBilbFv4Zt0XI1ks3vrSgJ1OV8iQg4kFgxEgyo5PkekYxn0PtSbB9DGX05gZnhMFFvNSW3iqO73Wg2g+XUSL6mzUHoH93J9IGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754235238; c=relaxed/simple;
	bh=6plFrRxfu+8N14R28roKX/MHWOfxITkJEscV+Weov4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Icpl4DT6usILIdhddlpZfh+ZEDhQnEIeis1sg5i1WxakFwAqYvau8JmYODawtId2dnRSq0grQ9KhhHjFbzXC0bi3b479AZ1up4G0F8iqW+cj9rjmvF4dLd3wSBIRYc6QSPayPE54PqxUjVRIniVPKHHgqHZxhU1ZNQ+Wdr0Lz4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=FFZkZu3V; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="FFZkZu3V"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71b6ab52e8cso24292387b3.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 03 Aug 2025 08:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1754235235; x=1754840035; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSwmiYk+M5RmmFXBcZY5LfJlQfD47hJoEsHcQyHy/YU=;
        b=FFZkZu3VXsInUp8g2RC2dmid6KXUhWiKpkPSK8kD5X+IiqP1KphSm6/cVgBZfLml5A
         HxEXFjTvMIqFJ7KxKIwb0JB5qkeOvrDq765ejr+CeGqly3iKPLHyZwBBq1rXgB8ZSlL5
         mCScFrLGFPFvEOOVhqo7n+qqmmVcEH8UhcMAuaWgkKNeLk6z9EfJ+f4q70hwoN+3iSuj
         +QfqJEsb1YbAg+h/KSvsV3tLgGs0yYbCF6v5GKhRxaygQz+xuwQstde8FJ7X8d0qwbW9
         YowVig6XXvT6W7zib1D4Lbw8aIP4wyvR03hEHTTVuh3BFKO7b5u2a1s54C+9KVo1R0Sp
         zZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754235235; x=1754840035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSwmiYk+M5RmmFXBcZY5LfJlQfD47hJoEsHcQyHy/YU=;
        b=PVeHW6Icyx803aW8Z6hcsOZ7YGYVVbbo//m69A+hjkTnZ53p2Q3FgUWmM+ncSqaf/t
         /jWs3veQ0ua3XQ8TqLm6O3hLLk9fjwoEn2PdCVT6vIBv14pA1VZLSKfBPqRgUyDUPztJ
         WNOS/QHVB6iu/eu6uDxNcOps+wOhztl5PnhvR5hhWgAWMElap7wNRJ5HNk+sqnSt4z2A
         0esQfs53TJ0dVcU9iTz8o2+3TvaQ2KO9+Y646uHEULIvdXwR1/CmcfZNpRP21Gaj+qJK
         RR35Vd+tm+MpSDVIQuIgyVimRA15x41ozBgp42ZlsK7uWU58LDuGbIedCLWK5/GDlaCx
         mnbA==
X-Forwarded-Encrypted: i=1; AJvYcCV6+yqeN2IVSrWQoRJXMf0xFTeycp33Q14lCm04AEEEU//VcHSle59r7Wub3ngOoR6bhpte7EVdiBJDRd1nXFWbadqTSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSCskEFceDfd/o786H4WFXG6q7fudSZqk6Egqc5lqXffiiVRyJ
	TEzEGlv65vkBMEUAmm/kUk3S9XqzAu+MfvU0khnRhgJnaM4ThLn7FynMTMiwCZVAFvTDuoMMlGw
	2BhoNqq4=
X-Gm-Gg: ASbGnctzWNNoYqjfemrh0XsjbHlSXai3D1l/UHO4Lso97ndcVO05SSm2aCCdS/QUCx/
	JtnjIhoOWbqi3GB7PGsM5hWdKRIiWo5y/VPokKTTh+XxpxdRjnngkgH3y7rDORyC52qXelrFtGB
	mkmUgBzbBWZTtEvT2G8XpS5f3n5y/epI9Wp84POMxIBYw0uI8pgjeN99rnqEv/CTqMevMWgmo4T
	jtcMW4Bg0wVRc+s0mQCly7IH917bOsdS11driRgbuN2lK8JA0oxUcRt1T2YpsEv249uUxILsb61
	6La+14eB+Lf1J67Ziwqzh2TALo86oIWe/vzI7RKh5osvpLaflg8Yr58znRlcNbwR8lttjqEWLNz
	DhP4J0umRdztaxMSxKEUvvOd9ZAmVQL+1iCQNjNe2g52R5HUi7E3T6a0LWj7FZLiLkQ==
X-Google-Smtp-Source: AGHT+IEBcj6rbRnfJ+WSqyw5KEnZFR6sK09iDlUn4e9ue0Q/V7C1atZSfX6Mmw+oHaURtWQ2jCU8LQ==
X-Received: by 2002:a0d:e3c5:0:b0:71a:217e:4dc1 with SMTP id 00721157ae682-71b7f0a64e8mr58591717b3.41.1754235234738;
        Sun, 03 Aug 2025 08:33:54 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71b5a3a9986sm21066777b3.12.2025.08.03.08.33.53
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Aug 2025 08:33:54 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e8e0c6f1707so2676553276.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 03 Aug 2025 08:33:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWvI0OMbmIY2Dqu/vOCUsHmZ5NoznM+vKKM20JABd/lTgRX980VcaYydWAlIFRZaktV5BgKIdYnSSrN2RlHk3JPO0iHQ==@lists.linux.dev
X-Received: by 2002:a05:690c:7108:b0:71b:8cc6:6d41 with SMTP id
 00721157ae682-71b8cc66fecmr55025047b3.17.1754235232707; Sun, 03 Aug 2025
 08:33:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
In-Reply-To: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 3 Aug 2025 17:33:41 +0200
X-Gmail-Original-Message-ID: <CAAObsKCUs0yn=S1PzGDKu8nNnTOkxqMMYzep-QhG00X1CY3DjA@mail.gmail.com>
X-Gm-Features: Ac12FXxPVQwjDAIVgxnyFNwyCiKtQqDmuUpUnwaIigvKfVmO2D9Sk5m8K7Mojy8
Message-ID: <CAAObsKCUs0yn=S1PzGDKu8nNnTOkxqMMYzep-QhG00X1CY3DjA@mail.gmail.com>
Subject: Re: [PATCH 0/2] accel/rocket: Fix build errors and sparse warning
To: Brigham Campbell <me@brighamcampbell.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brigham,

thanks for the fixes. Will pick them up. Hope you don't mind if I
change the subject of the first patch to something a bit more
specific, such as:

accel/rocket: Adapt to changes in drm/sched API

Regards,

Tomeu

On Sat, Aug 2, 2025 at 9:25=E2=80=AFPM Brigham Campbell <me@brighamcampbell=
.com> wrote:
>
> Fix two build errors in rockchip NPU support code which were caused by
> the integration of recent changes in the drm subsystem.
>
> Fix a sparse warning regarding an undeclared const, rocket_pm_ops.
>
> I tested these changes by enabling DRM_ACCEL_ROCKET and recompiling with
> `make C=3D2`.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
> Brigham Campbell (2):
>       accel/rocket: Fix Rockchip NPU compilation
>       accel/rocket: Fix undeclared const rocket_pm_ops
>
>  drivers/accel/rocket/rocket_drv.h | 2 ++
>  drivers/accel/rocket/rocket_job.c | 4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
> ---
> base-commit: 01ac6e4e53b6351df42c97d217b0d2dbeef5c917
> change-id: 20250802-fix-rockchip-npu-build-ca759ba8da06
>
> Best regards,
> --
> Brigham Campbell <me@brighamcampbell.com>
>
