Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D65C1C7017
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859074; cv=none; b=uDN7KB55Nsurm62+v6sLDo418NwUqTD4wtFsJq/E/++xqNndgwQo248bwkXlwYtkUfXbJF/11xka2br8oZrjr2DZXP9aXqcNuXiYAAXtyOs4ui4c1jk6jCig+sMO3MZq+SrY6bl0goq9cBChVrgShEiU3xySJT7NS2WbgbAWuWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859074; c=relaxed/simple;
	bh=JUlQrI+fknuidygvc0QVhNjmP0Fn5UPuVWMQ9E41q1s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Kmv7RswOUg3vpxjiwTuISZVuWCQSStnaVsLRXeJRBv7OT3lrmednUuzlLxuWVllsoXukEYoWZbEt9v4sOtYdjBjqvxAzdQpuXv8EyQkDr2VV/qGXY8biE8wLDm59MVLd/CoCICOIwATR7TIFfkWBuOV8b5W1cTG0P7xsMgAwycI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=S2U22JGG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="S2U22JGG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23636167afeso24400945ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752859071; x=1753463871; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQsUdI99uVdv1G5VrfovBfE2ouV4UkpQzyyZDykQuDw=;
        b=S2U22JGGH1qOxvietm/Yga1LH/aJdRGZHYFkF3Vp+ta7l4vsVW5uxHBTt8WXKYZ0sw
         CgUPY9YAmL5FosgGs4vuB92Hq+y/a59RWhTFYMwSGoJNHjpaGwPsHz63F5E70VEu/8Z/
         wl1eQzFr9BYwO+DMnbEBgaTN5l1sI9kt1K2N7Uk/c2sX2ReCBQQ8uiXgjL5bQEvkuxyf
         hobhPX0wp1vezpPiOyFrVx3Ypz+3qOfDEKhn564/IsTa7IZjtS0z8QkzhcU8HMQU1qHL
         ixi+p8jjwFophsXMVWGpq2Qg24DMTyzPC0kV7WEdcOis7ppNwq+O1UAl705NmYrMmRpq
         eQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859071; x=1753463871;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQsUdI99uVdv1G5VrfovBfE2ouV4UkpQzyyZDykQuDw=;
        b=SFYY3tXD4r1/hc5Cym4eFc1Y1xXBUYBvPBAtalXCa4R9OB2WOAr5mDOmQloi0H1hDi
         1yLajCSy2MEsVcOz9GuD3Rv/LpqD13iZU/O0gW48VC/7G5BOpD6pSKLD97fIjHGRBN8p
         yJRkTjzWoCNaazwYKynr9I81Dxv6BR7wa4VBtkUaeIQK07Ftub7cynqJtZsI3oi2MEqb
         pY2SBQi2kUm+sF6ApyY3nctniBZzG2Bd2E13p8FDplX1iUpqaZ3TaB0K9+grbwqBNorY
         e5I1+KjGExFfaf2txkhwRPZAZ4W3NTAxwzGHxpLfqcZVWVHArhScfRnXFYEQAHvHOw5L
         TVlA==
X-Forwarded-Encrypted: i=1; AJvYcCVWtmiGOnPZ3wkn+8NwZmu0jP5Far6IQYa2rYOPZapJKT9ohG/8ajqRgPgHRr/dx09DloLyssOaN8VsMA+o1+p0OYGhMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzM7HNnb1CZQzVijMceeDO0ih9iR39U5PWxWPQI5Vcj6ReViJLE
	Fq300xmmJpM3Q2XnRKbMqBzKKtUgFsWTiTbkIZ4Y8rvGBENxHRn+TDTJwkCFtI0ofLo=
X-Gm-Gg: ASbGncuDXiefbYQ7ShCmzck+jfH8t170FUyErv8HzdWJMLaqQfzzxDYLC888BcWtgdi
	fVJOyme/F0Hv+wUwH4dMNAa2K3hfLQ9YsSYe7LbED59eSfKH9EZq+KpAdYEKKHu4f2c5Wgxh7Vd
	+NtKU2gl+PZORf8n/FYyCSCHA43XaqKg/B0Q22nryYIvtMEUFVRHmVcJIZ47uiGHGfSWbnAHYOA
	isKDsqtIjYbHylg+SaSNFLdidk2Sc7ZgRB5/Qa9efdQQt65desfOK4w/LKbGTAByVOIuvpWP4WD
	GDEpDjUk9eizIGRqMdxgEcd5P8fGAgffmH3S3Kflqx+sftbCsenu1cUwZo7J5t+Ls15nB+a/0BE
	JPSWv+ORjZROzSSUNT9w=
X-Google-Smtp-Source: AGHT+IEY9VDKHPJfWeHWvEU5wqF+TlZwRpsDoYx13B2warjVxgd6exSsfIi7OB5Q426MGYSgEP16xg==
X-Received: by 2002:a17:903:8c8:b0:236:94ac:cc11 with SMTP id d9443c01a7336-23e2566b0d9mr164068795ad.7.1752859071385;
        Fri, 18 Jul 2025 10:17:51 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6f2184sm15987755ad.224.2025.07.18.10.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Jul 2025 11:17:48 -0600
Message-Id: <DBFCOJFGI5HB.1RNJBDPNTEL2U@brighamcampbell.com>
Cc: <tejasvipin76@gmail.com>, <diogo.ivo@tecnico.ulisboa.pt>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Subject: Re: [PATCH v4 1/4] drm: Create mipi_dsi_dual macro
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-2-me@brighamcampbell.com>
 <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
In-Reply-To: <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>

On Fri Jul 18, 2025 at 10:10 AM MDT, Doug Anderson wrote:
>> +#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)           \
>> +       _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
>> +
>> +#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
>> +       do {                                           \
>> +               (_ctx)->dsi =3D (_dsi1);                 \
>> +               _func((_ctx), ##__VA_ARGS__);          \
>
> nit: shouldn't func be in parenthesis for safety? It's unlikely to
> really matter, but just in case it's somehow a calculated value that
> would make it safe from an order-of-operations point of view.

My assumption is that wrapping _func in parenthesis would cause a
compilation error in the case of _func being a macro (more on that
later...). I'll test that later today.

>> +               (_ctx)->dsi =3D (_dsi2);                 \
>> +               _func((_ctx), ##__VA_ARGS__);          \
>> +       } while (0)
>
> Can you explain why you need the extra level of indirection here (in
> other words, why do you need to define _mipi_dsi_dual() and then use
> it in mipi_dsi_dual())? I don't see it buying anything, but maybe it's
> performing some magic trick I'm not aware of?

I mentioned this in v3 after the changelog and prompty forgot to include
that information in v4: The extra indirection between mipi_dsi_dual()
and _mipi_dsi_dual() is to allow for the expansion of _func in the case
that _func is also a macro (as is the case with
mipi_dsi_generic_write_seq_multi, i believe). Compilation fails after
removing the indirection.

There may very well be a better solution to this problem. I'd appreciate
your thoughts.

> Reading this with a fresh set of eyes, I also realize that this macro
> is probably vulnerable to issues where arguments have side effects
> since we have to repeat them. I don't think there's a way around this
> and I think the macro is still worthwhile, but something to go into
> with open eyes. Possibly worth noting in the macro description? We
> could probably at least eliminate the need to reference "_ctx" more
> than once by assigning it to a local variable. I think referencing
> "_func" and "__VA_ARGS__" more than once is unavoidable...

I'm using _func, _ctx, and __VA_ARGS__ more than once in this macro and
I don't expect the indirection to fix the potential issue of unintended
side effects. I believe we can use GNU extensions to eliminate side
effects to _ctx, but especially since _func can be a macro, I don't
think there's much to be done about it. Not sure about __VA_ARGS__.

I fear my inexperience is made sorely manifest here.

Happy Friday,
Brigham
