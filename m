Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133D7205ABF
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 18:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753295805; cv=none; b=MHSfJSjGlGwtAtANVal67TdKMAfo3K4xUqpbNPKlIRCs4rwiN/Cr7a/1zLjzF/6vYOSjh1Sme9YRq9chSv29AzKGaoGG0xc3o3Tl5CDhCmidBAFoO2klwHzh0Rmo4YvZ9MT0UGMjIPmLBJq3F/Jbi2ROlzhz9CUv4fCtrKio8FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753295805; c=relaxed/simple;
	bh=5hi4WrE71marHQiRuZkE2QbL/wCvNDBks+dUnwx2Lx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uz8q3FYBkDWdeIxJ5/HQb28WHsH+iLQ85F2EO1ANH8s8OQ1qxB497H20O0gLinCSn0cpOyeDnl5XlTZGenXP2SO3Gd2gttHgi4OBYFFjVBjzDzULqGBxelbtBg4uim5BjqiN6aFsSbO0BZe5eVtaTj7gdt82Ag+hxsiq2l7c6VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qYFB0Xnf; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qYFB0Xnf"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4abd3627e7eso3848431cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753295803; x=1753900603; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2895cOJRgjiK1NbActFOWQBd/8gPRhRvycIhI8MYzeg=;
        b=qYFB0XnfGKMCK5e3+heFG+E4qk+qEA2d/pYIVkXm7dyuBJtZNWmWYkTBeovq4709EE
         a3WuC2lY6rk9uyKUcO59k/LdWXG6vW+u06ua5iX6iOuqG5AzGu2YsRI6HRxZGQmWNqjY
         xvJlPi3hJe1u69OstPossORVP0xbSA8wv6kmF0uLGP9ppMYTsaBP+09QiloRN6KF+NJq
         wEUchelxz+4O6zL47WG+XOcsKCyUesCBjzIjNNTE3aoxYRpZTETyMT05rDALGJsaV6MI
         V083ZZuLNvuX/qAjiVpwEDFqMvmZY7JxBx72lfCpYm1LVMy0pu1WjfPMeH6+fts8rS+c
         V5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753295803; x=1753900603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2895cOJRgjiK1NbActFOWQBd/8gPRhRvycIhI8MYzeg=;
        b=WLk8N+4To75Z+6OEu3yepo29vlLhgqKQILod/8oMNfVDN4BzXU7HzFUgqcKtjezlQV
         wge+pcccNHftLs31CFeHrSNuedh+DtMiAUIqrOgySVEVmMMwhQUtcHk5TqzrHpeu20gx
         yCKMsu4JqlDwZD7wm8w35mobdaWj+eX6a99QGXW1tO1JtFlDXT02WPVVZAVSUWnTUit/
         24kaQEISr7d9/McRnvJvqK0FGWYYVRwWCfjHVhTBjOcdTwybUV3QqXgxw64iwAf5Zitc
         qC0MkcQwtyVnNJq9EtZAoVxXA8rb5ty5nWJE8MiErZ5FdxF/T/yCXiBhZjnQgTWF4Xr8
         Xwtg==
X-Forwarded-Encrypted: i=1; AJvYcCXCT/8Chj9vqXgYVodYCL+ZwLsDbsZk1B+LIwKgwF1kiq+dpX0ki+yYd3kDfE4qWIaWAYfW1iRkaPnWpHLxqqSYTnVS7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzv6U5ZDK35hw6u0RN/KVOB9RHo++K/EZrRdYzh506NvZwTMlr
	g/qGy/DN6GoSGoFo5WX9D7RoaDlH/B0C+w4Oap9xsIeAksXVSv39AIcXexvz0ntDBaRl1QawIfk
	I3+qw5WFDyFXkybPQfMRqS406ncEWXvfhxL9rhysb
X-Gm-Gg: ASbGnct7yS2/dEVRjso8ucdQ3ghsM5a0D+fIiYH9OvHRU9skEybRtrxqtesfj6efHgl
	3C0MQBdQbtA9ACAHpmi4f3RcvbfxMZ2hICIom/rSh0qsVjygQtLPbuFpFqur1DvoxNZEbSnFqsg
	RB4w2A4VDhAxo6NDHB+Rp7pr+9cBN41pU/kMLkIMMFvyiqAvhX5sKSigTF8zrASpy9iNGtVqLKJ
	e0VBbE=
X-Google-Smtp-Source: AGHT+IFt8r1/bn5aE5w+xjp/KZnjhjjB3CgH2KGrcYHKkd+BtH2rkKXI/86jZpijEYB+DXMkCkZr0IIHXXxPnA3Mb6g=
X-Received: by 2002:a05:622a:189d:b0:4ab:3ff6:f0e9 with SMTP id
 d75a77b69052e-4ae6de3d55fmr49370301cf.1.1753295802557; Wed, 23 Jul 2025
 11:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722071508.12497-1-suchitkarunakaran@gmail.com>
 <CANn89iJgG3yRQv+a04wzUtgqorSOM3DOFvGV2mgFV8QTVFjYxg@mail.gmail.com> <CAO9wTFiGCrAOkZSPr1N6W_8yacyUUcZanvXdQ-FQaphpnWe5DA@mail.gmail.com>
In-Reply-To: <CAO9wTFiGCrAOkZSPr1N6W_8yacyUUcZanvXdQ-FQaphpnWe5DA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 23 Jul 2025 11:36:31 -0700
X-Gm-Features: Ac12FXxlhlhqW8vDJc_oByEs7Tt3_KF9XPplKKOxSHqunQfLKrXinLUbIUzJieg
Message-ID: <CANn89iKwrp0j1bYQ8yGsbj_B1+eEv8BaWavHAuWpYdQVg-dqsA@mail.gmail.com>
Subject: Re: [PATCH] net: Revert tx queue length on partial failure in dev_qdisc_change_tx_queue_len()
To: Suchit K <suchitkarunakaran@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, sdf@fomichev.me, 
	kuniyu@google.com, aleksander.lobakin@intel.com, netdev@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 11:17=E2=80=AFAM Suchit K <suchitkarunakaran@gmail.=
com> wrote:
>
> >
> > WRITE_ONCE() is missing.
> >
> > > +               while (i >=3D 0) {
> > > +                       qdisc_change_tx_queue_len(dev, &dev->_tx[i]);
> >
> > What happens if one of these calls fails ?
> >
> > I think a fix will be more complicated...
>
> Hi Eric,
> Given that pfifo_fast_change_tx_queue_len is currently the only
> implementation of change_tx_queue_len, would it be reasonable to
> handle partial failures solely within pfifo_fast_change_tx_queue_len
> (which in turn leads to skb_array_resize_multiple_bh)? In other words,
> is it sufficient to modify only the underlying low level
> implementation of pfifo_fast_change_tx_queue_len for partial failures,
> given that it's the sole implementation of change_tx_queue_len?

A generic solution will involve two phases...
Lots of core changes, for a very narrow case.

Most of us do not use pfifo_fast anyway.
