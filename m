Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD92157A5A
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780225333; cv=pass; b=Nc2wdyrNlpdLFkpK05+ISKIYGyp+hhQCnsSEGwLoSc+iGqL00MY8OKYTOTi8A2qbtWsj3pFqGYklWpW5S31XU8F+ei50XGW2kQ3xe33f4SVQO5+y931mkQQRFik8deXJAvwzJHmZ3K29XwVU4fmA98NbqS4csJbz8xyTaAMsfe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780225333; c=relaxed/simple;
	bh=6pE3OdVID1fqMndhmZnX2k+GL466xoFapVqSeSf79rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXVbLkccUC3sm9KpU8omIlIo64CULd0gIkSnEcNJGu2skRoUTWV+41GS7GF2g7y0CwSDOIvw1HsDdBnnlI9qbUlO+oNIs26t0dBUhBFMx/ocRgOLv2A/4exhi75uQgugLTWqfp/KHQllVyB2V+I0l1MvazW6CYh7tpFG/5D3OoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Te6eZd9G; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Te6eZd9G"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69e1f777bcaso307825eaf.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 04:02:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780225331; cv=none;
        d=google.com; s=arc-20240605;
        b=DsJjIS7yqaBJEWq4O0Cs7J1Fv/yPmsMnpfbsqfXh9hVD+RwiX6QoMMKsXPPk/GOJla
         BuueQ+K0JpHLwbt3FMY1RCkxoeUF4XjDdwpeyn5pZueO2/66sjk9N2heLuvOJB5Xivq7
         ae08jtBAlaOv4HdHuOW1/0jhQN1mdXShzu/oyTvGAb11UTa/evPwH0RC1EuVUtjnaxrE
         Rx/Z46D6hc2RL+rHcCCzE9JXBMTtMjRD4wdziM1PeHy1Agtu7wAL/kHueuhsB+ac/XSV
         A1+9Y26IuSjVXKHaIEKc9g2HfkOo3GuaDbL9BrN/DCzYdeK2ioe6A4fW6kBPSxXb29zt
         mjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6pE3OdVID1fqMndhmZnX2k+GL466xoFapVqSeSf79rE=;
        fh=iXKQ3MePsNAEnAUlFGd3m4M1zzOmfs9ACq8tQlFZVuc=;
        b=SmgGAzgZwcpXhibJYf6kOw4M6+fo+l8Sx2Us194gNYnRJzsVgQ7UsrcV0Pl4pB4bTo
         dRgR9UYu25nNptz5BlcU7YPTbz9mmR0+KTgNOI2wi03AYVLkfLMB9eQkXTJ1oa9YnDeU
         ufIulohzPVqClM5ZPtsI6LQ5rTFZhms0L0BCHdOLN8uUx6Ff8NZBdRQNT3ZRma5o+Ci9
         UofR8oE4XtX9C/ROpdy2xJhUy8IkK1UOGeISpdovGsGs2FCnLPf/hE75fNsg034QzDso
         ipojBufInFMzyWgubUS0Xv6L/trjN0ChPP17MSzfOJdNpibfT7qU8A2VIomW5yA2wDfn
         587Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780225331; x=1780830131; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pE3OdVID1fqMndhmZnX2k+GL466xoFapVqSeSf79rE=;
        b=Te6eZd9GOI8ZW7MjK4/hbHO/0Clro5y4WPxjPOTWjTRKXSIpE2pzVQiVKHiSSRuwOP
         pGuFrI3Livam9rEw6htdVJF9QTQ37jADCq0mA8yL1MqXJnsu5Xtm192oHsyS/vJmVAfB
         ium86MCueHOOMu1ksYyYc2xT0RVfxK/1I5Nkdg597htqB65Omi/M9jdrWHCjgywPcur9
         VPaU0r5dD2hgC2uz4mFN69pdysp9AIjZtYjVQ16eWvsCseIvRIdHW/bsNSPkUhKY1sIi
         LvQlgFUnOzRvDvpYSSYS39NcEuZbp3941vdjjtXptxR0HMeAT82arwbyO+N78e7N//4R
         tLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780225331; x=1780830131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6pE3OdVID1fqMndhmZnX2k+GL466xoFapVqSeSf79rE=;
        b=an5j+WNgopIIxLLOmwWcuO6oEQlCCAX3keS4X7JrjsHIu+xjcAiGj2dyDNfSpN+W21
         krmBuFpvq75xx3ECvgEupaoxN8uHjCehIGud0ddsXopvpbFhpPIZXCJ6PmzGXPxB844z
         0qSxNeIo1uBdNlpr8m/wQ6pj6cISO1Pq/Ef+SWnePwipiPnVxaCFPC5k53vRxzCx9k4b
         BKYhryN7A7gAK0aRzv36AR9Yo2+j7hyhK65KbIpkoqyNkm/hLeG1P9iOkV5TpEodoZmt
         h5EogYQTZ15x/mziamwxsZVkHvlZ7jvyN3vj+bgCg75zxK4qJmFcPiqo/HWM1FYzfMuk
         hV8g==
X-Forwarded-Encrypted: i=1; AFNElJ+Drj+eYTHYgUiIhadInC9+nDsHo+4BIKYfyuAct8NngqSzexI1VvK58ixakzFqxprsgu7pGj6N6AZDyWZ4fpB+7oHCtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUAwEr8xhGTti63oPFfuxXUkFrKG8CuWz2h4APBaa3f1HQLgLl
	trP1H0Wx/ZlqndAxIe/8MRo9+UgkP11mYV07DAz1KP0mzqFX3PBPh7m6j57S1q4un7XJkaihswH
	BkrGxKcUPRToqBzxsf3cBcczlBKBtT/M=
X-Gm-Gg: Acq92OFrFRXN7jBv8Doavj30m7SNaVLK3u6EvqhvBcpC2C51nHEFuTwLApi7aIcuv5z
	XMi4C+yugEDlAX7VwRKM6eLdCK8tZejQNmqFYt6hHHPEOWtyYc/KiiUPQ+jXQrn6FXxoHUstDce
	/9M4PWOqAMU2zAeaeAZRdGf9nWWB07npbKOJ9B7Iy2cbe7O6PWV7TS2IdZEVP1CfnhOMHxCIexp
	CS+3+X9/FjpttZz2WkM7JhnQu36Hb12jGXZwWq/VX56voYpj/Kp0fLzrjxFTzzLlilGbl2Xlsvg
	K8HpXX9uF7ZKirLsRUymM/0XwgkUZ9h9cg+ANeaeVIecV3xb5A==
X-Received: by 2002:a05:6820:2982:b0:69d:8481:f9e1 with SMTP id
 006d021491bc7-69e042c2822mr4076172eaf.16.1780225331638; Sun, 31 May 2026
 04:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530113938.171540-1-suunj1331@gmail.com> <20260530113938.171540-4-suunj1331@gmail.com>
 <CAHp75VdMZ-HdJXA0SLpFrs7AZw90v+VRpbHgoiugwooG62cbhw@mail.gmail.com>
In-Reply-To: <CAHp75VdMZ-HdJXA0SLpFrs7AZw90v+VRpbHgoiugwooG62cbhw@mail.gmail.com>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Sun, 31 May 2026 20:01:56 +0900
X-Gm-Features: AVHnY4Lh2dddIjcVcE1neswbhD90KkvzDF9Pfr4tDVYlavlO3_MiTALJRgDuuK4
Message-ID: <CAGwK=3rC_ppQLMFpchdY9uezX9O0z4VCzpcAGpr_vq5cdgmbfQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] iio: pressure: mpl3115: generalize interrupt pin routing
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, apokusinski01@gmail.com, 
	me@brighamcampbell.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Sat, May 30, 2026 at 9:40 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> > No functional change intended.
>
> All the same issues in the commit message as with the previous
> change.

Right. I'll address it the same way in v2: drop the "no functional
change" line, split the unrelated changes, and rework the commit
message accordingly.

Thanks.

On Sat, May 30, 2026 at 9:40=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, May 30, 2026 at 1:40=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.co=
m> wrote:
> >
> > Write CTRL_REG5 explicitly for both INT1 and INT2 rather than
> > relying on power-on defaults when INT2 is selected.
> >
> > This avoids incorrect interrupt routing after a suspend/resume
> > cycle where the register may not return to its default state.
> >
> > Route both DRDY and FIFO interrupts to the selected pin. The
> > FIFO routing is not yet used but is required by the hardware
> > FIFO support added in the following patch.
> >
> > Consolidate polarity configuration into a single code path
> > that handles both interrupt pins uniformly.
>
> > No functional change intended.
>
> All the same issues in the commit message as with the previous change.
>
> --
> With Best Regards,
> Andy Shevchenko
