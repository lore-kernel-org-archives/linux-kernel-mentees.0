Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFC9280027
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 18 Jun 2025 14:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256644; cv=none; b=LNlnh/LuDmtX9pVDJGFt8AjCcSr+ZvgyFw8A0h4hZRbRvzMW81SNNxfOUPmhJjz6KVCEtzMc7+x6M444w4BhgdXHVuEOQKH5e/aD5xUhI4cqdCTGlbgcPKzjN3zrKrswE819aGwl8bV5Rl5TRMLlkHMTrhw79aUrICZ7QTAIsiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256644; c=relaxed/simple;
	bh=jbtwj0PcQl52Hf+ECRiBFoySeNQq1NFpX1lg20GW3Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OfI0/csh8LHSLWwSo9drJFmKiZ6EFijt3PS+ajsq9bpClodTMQ/Tq/mPPEtdi2g1Ls2J2MAtMLUaPyScG1kpN2IZmMLpEpxfTQlYv3VzRKNNoICYJVzouIi5BC6f5oC0i+P+Yad5i9+iKBlL9qgq0Kc13yQEciuYBeKVL1iMhWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/huXptV; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/huXptV"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553241d30b3so6174537e87.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 18 Jun 2025 07:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750256641; x=1750861441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IcyrFiwGOWpE62gt/B9Io7YT03yFKnIKHU1p3jqjyk=;
        b=F/huXptVz0EwKPJO8TiMMgLdSJC4Ls3Nm7ki6kd7iLglnQjIkk81feVhiOyQPXqkl8
         FL2C+QSR+pe7bvZQtpuc5CpPVH1vXz7RHjTG85oTVdPb2JJDvkH7IMC4SbX2sfbr+3/n
         BpiswBOjEDLVmn+1QxojzFy5A8K1EAaeyYL6R3cg4IjiaI05qXjGIUV3kveiWAB4owRk
         0xu69M3k8nuEftXbK0GIhgMIHV/NGcbC8UgoJdUXXw0pVSOeKTiNmrIE2vc3O6dmVRxw
         O6f3LgSFWR7puvQQwJCTJHbnhTXfBKVxJds4RYhbV09IYmhWjTL26Uu0H4iWSFIyk5kQ
         iMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750256641; x=1750861441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IcyrFiwGOWpE62gt/B9Io7YT03yFKnIKHU1p3jqjyk=;
        b=stz4Yb/suiSqicoqSNaOTtY/l2XqUmNQvfa9s7h/QFZKmHlFbPp3+idqhv7xuT3aJv
         4J9yJdAWxc12e0J9xSrdJ+ge4SURllc/Gy5C+LYr4c8HQ0YokXfh+hdaxiaBGOWnnVyO
         tavvjeyFDFICNiGxP0fpH6D6yd+WY3PbErWVwI+Oe+I8LO4XgFs1/gKmyhADFy5L2DiS
         yZ8GoiFKIRA9MDC3uXx6vLvOnsYpCnT/MV+lVyEDLUQpJLLtaOsCYUlfhVJxRUXUfVYU
         zgteQ8jDtBkPZNQ3NtGDv09UqQmmUA5yimIldQ6xPmbO5feGFiK4T0kixBBto/3Aqoq0
         zEuQ==
X-Forwarded-Encrypted: i=1; AJvYcCULZU2VvI7pYoSp5vxfpjW0VpAGE1eA5+Xj3d4LRzKcMu/Fr2ImNP5Zv113DRWjzlxlbqCLiSB67yIQ9yd3hQ8S0FjRrg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw26HCF5vJv1kLsHyprRxtUnHT1DAgxd/vDThyWHTF7S1a9f7lx
	8Clafd0sC0WzH42UXatcZJcTkvk2VJj5W5D5EJmZ0QjdUS+FlT6h2eSaGnip+TplAH09ONF7+t6
	sRsKySpzWzoMDtPrHukLBXAQvXbEGNb8=
X-Gm-Gg: ASbGncv77zUnupeSnJ7I6RRQHUxalpQghXJidhIlRUIWQmijjur7Nh+SdmmYgWQIdfO
	ksNVt7+kX+IFLRV1ZggI6zvm9hCpIep3jLv7WUZMCAZbDmtW45itFBQz0kdSQKGczPZHOkhmsYE
	KtEsWBU3rPjdn1Q9+RYK3XcM3v6S7l77IsTPrXidubboSaBcca3moN/Mvk5irckt3Z49zCo64N8
	ZKl8Q==
X-Google-Smtp-Source: AGHT+IEZh5GJLMzXVURg6y/wUKcSU6h1BN8I6BhM2UM98yCfN6NMmxeH65p8HJYUiGNaknluPkCqmJUBhgE91ih5+FI=
X-Received: by 2002:a05:651c:2120:b0:32b:4773:7a80 with SMTP id
 38308e7fff4ca-32b4a4b1834mr62679451fa.25.1750256640657; Wed, 18 Jun 2025
 07:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250617123531.23523-1-pranav.tyagi03@gmail.com> <20250618105413.GF1699@horms.kernel.org>
In-Reply-To: <20250618105413.GF1699@horms.kernel.org>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 18 Jun 2025 19:53:48 +0530
X-Gm-Features: Ac12FXzbQSWSku9aQkLDSeV-_P6DV8Ph-V1X5OS2vHElwTOgP6u_-N5ZVzKDCk0
Message-ID: <CAH4c4j+CN552qxSy8OpSzyZysTMW=gRKjLR-GPYV9cPuvduFkA@mail.gmail.com>
Subject: Re: [PATCH net-next] net/sched: replace strncpy with strscpy
To: Simon Horman <horms@kernel.org>
Cc: jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 4:24=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Tue, Jun 17, 2025 at 06:05:31PM +0530, Pranav Tyagi wrote:
> > Replace the deprecated strncpy() with strscpy() as the destination
> > buffer should be NUL-terminated and does not require any trailing
> > NUL-padding. Also, since NUL-termination is guaranteed,
> > use sizeof(conf.algo) in place of sizeof(conf.algo) - 1
> > as the size parameter.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  net/sched/em_text.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/sched/em_text.c b/net/sched/em_text.c
> > index 420c66203b17..1d0debfd62e5 100644
> > --- a/net/sched/em_text.c
> > +++ b/net/sched/em_text.c
> > @@ -108,7 +108,7 @@ static int em_text_dump(struct sk_buff *skb, struct=
 tcf_ematch *m)
> >       struct text_match *tm =3D EM_TEXT_PRIV(m);
> >       struct tcf_em_text conf;
> >
> > -     strncpy(conf.algo, tm->config->ops->name, sizeof(conf.algo) - 1);
> > +     strscpy(conf.algo, tm->config->ops->name, sizeof(conf.algo));
>
> Hi Pranav,
>
> Because the destination is an array I think we can use the two-argument
> version of strscpy() here.
>
>         strscpy(conf.algo, tm->config->ops->name);
>
> >       conf.from_offset =3D tm->from_offset;
> >       conf.to_offset =3D tm->to_offset;
> >       conf.from_layer =3D tm->from_layer;
>
> --
> pw-bot: changes-requested

Hi,

Thanks for the feedback. I'll update the patch accordingly
and send a v2 for the same.

Regards
Pranav Tyagi
