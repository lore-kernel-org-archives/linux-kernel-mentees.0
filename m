Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE1B2114
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 11:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443832; cv=none; b=EQEUSBTQsnIAhJketcDNVgw1d5t8K8AX0JiSb6EG3OJ5N3D5fjnSjcsTvc//t66w8IlX/hShkbe2kf+f1fZLFKHyITvgMzeU63b+CrupkWRiuWc6JKW5TEy/9Y7eCw4KvxhUmMfYOj372CuxIFnJnk6sT5wwx84KfpTd0Qv3zc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443832; c=relaxed/simple;
	bh=SX27gt8WGyTc//pddi/5lVAJTYadDFPS22964W7q9kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMWepFT6DDce7Iq4JAGq1bVxR16PJC7Y9Yn6/8lbVX8JQnVNVAWmhOdVrTf726Oy8QduEfvnublvtjrgbteceswUFSfJIB9pOiej9bGbwDMxb1V0zr06orKnV2oEDRsa1sA1zAyCQ6DC3wyp5J8OfF5dkz5fic2ChEL8buNqpZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8ej320M; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8ej320M"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b2f5d91c8so17677501fa.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 04:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753443829; x=1754048629; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SX27gt8WGyTc//pddi/5lVAJTYadDFPS22964W7q9kc=;
        b=k8ej320M9zwc9c6wrUqmvHNI44uLjaB+Way/1/1BCAGoJHTjuQ4e3Py11DvvvvG0lD
         PQhjs7m9SDezQ01Zru4aEUTy5IyQOoPVS7C6NmwpI1+KJ2PbS2SeVH11gYa/OAj7BtdW
         ZmNp5KrcYhsa36VG2JTornWYSrjx5ZzZmBwO9TmgT7gtz3SzWxDJIKMp07UOwWzzmCFw
         EWbbzdM70ZzPYcU8sq580QN4s4dW6EDcZxC7lOnwa9w1ViCvaqB0l98NqJn1Rh80c46W
         W0oflbr1xD4R1q2dEwN6dDWjzqpbdLqUT70BsvIkM0URSVkquAsdrjbuPUR5CXnM26zc
         SE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443829; x=1754048629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SX27gt8WGyTc//pddi/5lVAJTYadDFPS22964W7q9kc=;
        b=SVghva5pJ5weIQgEb4cruGWi0nQPIF7qYXC4zb2hrpSkmz4ZszDuth+5XDzcQUGRS8
         AajHXxxIcEbxGuy3T7+5ivRLhL/XUfbruEFZITjbPoy995+ilbbXvASZCIufVss/N3S+
         8f2bjuK3bwdnoqHc8OeUqEYIaDONKoHzflMabMBVPdX/4+XPyYSOsaNIIbwjWK9FF3YI
         zg40IO+9EX8qHgB1tcheAh+UKM2+bJzFYEIo7a/Np1+vTAwZdwx4hbIhrGwNEsxr3Giv
         thNRxUOuugZM12jO3uOUSB4PUIR1d89omF3bV7REV33HcW5FI0UdawGbsUaQ7wtWcteN
         wRIw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ5W/Nc5A0zpIBIxTj5qzkj6fgn4XQEgL7GhlpCeOrV9VfVkWza6hEan8Mu87omyO1WJ1PLaoktXCPwHX4GaYCm/X52A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3vbGHwG8zRUnqlM9tCHBYuDFi2W+K2PvFEHzjeyMFGFzQm2RP
	87DrqN1zLkfrIC9gdSsCdqvtv6Nxaclk/R78MmOqh/oP4KiEWhZukmvdPYjAcll1OvCqSRQKZFI
	6MVT+zB/7Kl/WIYT5m52UXVLOlyxLyIY=
X-Gm-Gg: ASbGncujA0KPHI5Zo95VmgQyZtpzMmjoSytM5f3I2tpjJ8lQCKw+PHPxx2u8fIrWd5n
	g3CSh8Q1mILKruZNiCormYRZ7EL0Jag7FsMv8M4YVDQH0uWu6cuq9C4XK6Huh05HbNUEfyv4R7z
	Ms4l6Nm2sXZsAzLaecK/M07Y0GKuHTO2xrs8q6+YE5rI8oBwbl/sgmeuNosKYqj4v3tP67ugg3G
	fIca76X1do1OU+SqU5Y2XxkwiMYjMEdqNSJqhYGcw==
X-Google-Smtp-Source: AGHT+IF/uTq5VolVx8xgOwqCd67q1dDNjXpPQtZ/butMWQ8g+APYueKGfVZvFlHLNNPJ4DrX+vkmJhbG0cC9gN2MfJo=
X-Received: by 2002:a2e:a90c:0:b0:32f:1df5:aca1 with SMTP id
 38308e7fff4ca-331ee7c68a3mr4979891fa.22.1753443828658; Fri, 25 Jul 2025
 04:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250607064444.4310-1-pranav.tyagi03@gmail.com>
 <87cybdp7to.ffs@tglx> <CAH4c4jLjSBxbd3bqkdgcCSWqXURratANgnbq9negrSU283xHpg@mail.gmail.com>
 <87frg3ss9s.ffs@tglx> <CAH4c4j+P2MJWZWv6M2s+wOdfCF6q6Wyq3=VsB=uNCtEH1LMp-g@mail.gmail.com>
 <202507241036.20E180AAA7@keescook>
In-Reply-To: <202507241036.20E180AAA7@keescook>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Fri, 25 Jul 2025 17:13:37 +0530
X-Gm-Features: Ac12FXwLzkH5UZuvU38crMxGk5nW6M3q3H-vJxGUPtSXw36fA455ThldReWsSs4
Message-ID: <CAH4c4jK45KVB7Zg_-xk6zYDgS16yq4Zrzvg1dTGxTaVQTMF=bg@mail.gmail.com>
Subject: Re: [PATCH] futex: don't leak robust_list pointer on exec race
To: Kees Cook <kees@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	linux-kernel@vger.kernel.org, jann@thejh.net, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 11:07=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Jun 18, 2025 at 11:50:31AM +0530, Pranav Tyagi wrote:
> > I hope this explains the consequences of the race condition. If it is f=
ine,
> > I'll add it to changelog when I resubmit with the helper function.
>
> Thanks for working on this! Are you still planning to send a v2 of this
> patch? It'd be lovely to make progress on closing out all the items in
> https://github.com/KSPP/linux/issues/119
> :)
>
> -Kees
>
> --
> Kees Cook

Hi Kees,

I will definitely send a v2 of this patch and would like to work on all
of the issues listed on https://github.com/KSPP/linux/issues/119,
as it presents me with a great learning opportunity.

Regards
Pranav Tyagi
