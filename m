Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5F82E6133
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950641; cv=none; b=odReXG324oWZAZDoXQdcpSnvH/cpryw3+WoA5MEH14AXKbvfMi2ufau9Wms88r39Q9eqGiPMcxG02uOEUg/snwujocbFCZSeJiuwAzJoZVyIBB1j+8kKmoxDkmcaKOPKaB5/AdzVwCPdhys4Am9XVQhCE7JYSpWZ+QJx3spgPFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950641; c=relaxed/simple;
	bh=Fsz5f/99U5JBaQvbPVrImfkgU9hAjFN83v0YZEnzFrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prqeknzKqCSq+ta6c5/ZgN+9YUzs3DfX3ocT+P3gZ4SRh0L88pu4AV74mswj3bLwi7xt2kLL6hakA3e41P7vQi5bMysaB0N290Jkwz8HVUH1RGVybq7OI3/UXrchZ+2FqDSnVWDx4Yt4vTUTbGfaBxFwFxJgTgGDF1lzdMZ/+58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsdXjJ4k; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsdXjJ4k"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b4876dfecso21509201fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750950634; x=1751555434; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axf5NbpAUzrmzPpqLLrUEqqBeYpEBv2j8XoiaPjeVEQ=;
        b=hsdXjJ4k63oQkxqjLu4oM67+TkTjxnhafzu4zj57dYJCq2dx2/LY1bF3ciQ2Hriimd
         DTmMJGLxLFF2Fw0Nx/67/FOi/7cSn5aVp1mC2X0ubEFzBN2Lo5rxEa/D0IompAfrIXaf
         q2QsKntnwUBenr/EIJuGCuUWlpli85GmqE3Chjjl+V9ZmLpsyZdCH6+0aSmfYukMgG7U
         p2LkEPbaOJyUJBkR3Rto4HbQV9vTNLA5n/0LwR5X/BKvGenKOohHXFs0/dda4MuSM9vj
         QTlPycoWsgqI/SO3VozLktcC6hQsm+5NppvRCBBBr4guWDyJt+DKuoOznaUzyMAvEy5I
         W0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750950634; x=1751555434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axf5NbpAUzrmzPpqLLrUEqqBeYpEBv2j8XoiaPjeVEQ=;
        b=U1+glCT3k6troOKU85rHghjnwkhxAkg0ffFay/NyqijNLmHDXSGgLpTLdS6SoYOId2
         0e6aVUwuzLVlWgINmzWrKX+wc83iVvjkqPwrJvk8i5emqXnlHZgL1svMJQIUp5PMjq7l
         Ltz07zMNztJ1oNEd+udm0E2v4ZXHgAIi7OyWee1RJaaIPg/DnmHZuk+DODOyjh8jmAu7
         m5vuS5IJur7GSc6Aq+ESXEnT9ds2VtZleb3qa+OY02SChMB6suajQQM7J9vUM8LlyLsd
         hyCOrNAwuThS+C+5hsxcdE/mDZ8JBdldT10WVOYsvdjkjC2fyv39rTyETOCJ/kzURXAw
         mg6g==
X-Forwarded-Encrypted: i=1; AJvYcCWhMhkE/xNERd0coA/WQI4ROlwQq7/1uU8cV1VLMePV3n3v+Z6/abCtATc8CRy5tqpeD1ZUkE8cZf8IsmXEwJ9QilhBMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvp5w8XPRI4fCcvP6c4pf1Fj/fOJUvhrGX5PWY/zuiyB52Z9dA
	3lHgNhWpQ/WuZFPtEkvBKn+m20+2R1FSGYUJUAG+nvVp4v5IJKs+4YFoGIGaFiaq5I+4fXkm3Da
	fIqnhNVcYLvKkZrzY3IUzyeab98G/HrI=
X-Gm-Gg: ASbGncsNaZI3pgKN4FImTzCWom2lW3sSmrU9FnzfOoIGZi7avSlRpGsn2slQffMU2fL
	79zGs6PmLeO3Lgv2JzmMnTd+72GZADD4v6B69q1ozzr0RXooef7zj6SUzxRjwuRCCEK0Goj5JIb
	kXJcdY/tbyqmmh0ocfNTq6xFDNy+yuJlR9keT1XUgvZLhqnSjUCubFf+iFBq9Xm5NZiGt/aIHfF
	Anx6A==
X-Google-Smtp-Source: AGHT+IG3aKdtoEX8k5XdMgWvxuQl/T0lmpkWTNORwe1brAkFFcnT7EjGtyotrt42fszQPUKuv/8ziotoOqBGlnuUj28=
X-Received: by 2002:a05:6512:239e:b0:553:2159:8716 with SMTP id
 2adb3069b0e04-55502caf1a4mr1616123e87.26.1750950633544; Thu, 26 Jun 2025
 08:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626142243.19071-1-pranav.tyagi03@gmail.com> <5baab2ed-c48d-41ae-819a-71ca195c4407@igalia.com>
In-Reply-To: <5baab2ed-c48d-41ae-819a-71ca195c4407@igalia.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 26 Jun 2025 20:40:22 +0530
X-Gm-Features: Ac12FXzNyUo0k5FLeYm1nQk0x2e9IyduCv2spuHDSlghF9NcaV2B_Em4IpBcyCY
Message-ID: <CAH4c4jLqQORVWNLmNGAqevbSCnALtkfod6gTuXe-oae0izR9Bw@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Fix race-condition between the hrtimer and the
 atomic commit
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, hamohammed.sa@gmail.com, 
	daniel@ffwll.ch, airlied@linux.ie, arthurgrillo@riseup.net, 
	mairacanal@riseup.net, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org, 
	gregkh@linuxfoundation.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 8:32=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> Hi Pranav,
>
> On 26/06/25 11:22, Pranav Tyagi wrote:
> > From: Ma=C3=ADra Canal <mcanal@igalia.com>
> >
> > [ Upstream commit a0e6a017ab56936c0405fe914a793b241ed25ee0 ]
> >
> > Currently, it is possible for the composer to be set as enabled and the=
n
> > as disabled without a proper call for the vkms_vblank_simulate(). This
> > is problematic, because the driver would skip one CRC output, causing C=
RC
> > tests to fail. Therefore, we need to make sure that, for each time the
> > composer is set as enabled, a composer job is added to the queue.
> >
> > In order to provide this guarantee, add a mutex that will lock before
> > the composer is set as enabled and will unlock only after the composer
> > job is added to the queue. This way, we can have a guarantee that the
> > driver won't skip a CRC entry.
> >
> > This race-condition is affecting the IGT test "writeback-check-output",
> > making the test fail and also, leaking writeback framebuffers, as the
> > writeback job is queued, but it is not signaled. This patch avoids both
> > problems.
> >
> > [v2]:
> >      * Create a new mutex and keep the spinlock across the atomic commi=
t in
> >        order to avoid interrupts that could result in deadlocks.
> >
> > [ Backport to 5.15: context cleanly applied with no semantic changes.
> > Build-tested. ]
> >
> > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>
> > Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20230523123207.1739=
76-1-mcanal@igalia.com
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
>
> This patch violates locking rules and it was reversed a while ago.
> Please, check commit 7908632f2927 ("Revert "drm/vkms: Fix race-condition
> between the hrtimer and the atomic commit"").
>
> Best Regards,
> - Ma=C3=ADra

Thanks for pointing that out.

I missed the revert. I now see that commit 7908632f2927 reversed
this due to locking issues. I=E2=80=99ll drop this backport from 5.15
accordingly.

Regards
Pranav Tyagi
