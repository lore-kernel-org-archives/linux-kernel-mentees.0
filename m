Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C2E2EFDBA
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753465650; cv=none; b=KWsO9DZcResgvQThIIuIkusIbV7Qg+ibFEbKibPdZlHZjXxd2d2ueb61Am1a06zr//ibE9PdHi67egG1mj2QfIldeTuSb52lUWvjYKu/Dv0ED4KtC1UQK6pGuctK9OhQVfwZDwG8if67TSe/HpI7chJ42BlU/wwFwYVQOHGXd9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753465650; c=relaxed/simple;
	bh=uK+Zu0KO0atqx4ZnWxOihGDGVV7isMfzF77SakOG4+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBZa6Pv4KjrVks+PMq1a6h57m+oc8TuNdnY9e2eNUkDtJx5Lp0EwXN+Pj7bSqJ5GtRO/JvtcFdC6F/9i1UMLgErbx6oyTwSwVPQ0HgutckCwi4cEUFGESYdwg5SO41bysPtspM932hrFPtiKQqU4aPJTCk1QrmU/bNRnIq+ZXNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkWzE6WA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkWzE6WA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234f17910d8so21689825ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 10:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753465648; x=1754070448; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QjbxMN7ETyQPsztoZorLELWE0JXnFSJjRTr+H/q5haI=;
        b=EkWzE6WAZhbyeiWAX0Z90SkwkuohvxxKFnlLM3tMeQejmx81uOQXgzbPD3rAUZ+uq7
         g9iVHtPXJRTcVZiWw6EnJ6k39Sz2zgRYJDfEleyuDZm5RRuUHbpFlryFA7v14L9Z0GCY
         0Bce7MA7b0p8Ue0f5sBnwsPFk7pJeemZznVrobgJqt2rBF8qIoPC7ngzhbZZq67ayXak
         o2CjXBhIovjAlMAK8XcTT2CgSuAqfB26GTGfwfYQzCYJtObIGXrv6/ov6XMc/Ln/6i47
         XDgCeniKxYzbAOLZHCqCX33cfzlWaaZk1w1T7DpEuN43Crso/Q9RNxiSZRoDXKoE+DxF
         015w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753465648; x=1754070448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjbxMN7ETyQPsztoZorLELWE0JXnFSJjRTr+H/q5haI=;
        b=HK7YcIXBG4uON5JjtrB516gxoufDdM15GH89LKmRT+j5FGXRJBgmLiykqgXRSsCpk2
         COjNBrgmRhfh0RyYJ6EQZyZfsVok6QMbBqcbWT+z1TmOWr3K5n6if6LILXyNz7qmfJRL
         mz5Uv2m2LgdQAwHvg6WYWK25v18Xy4qZjPBboVJLpGxkzhxOIyw+h+HXXe8txfR0W8lR
         EIX/+g8EXWFGPStOUceB7Nqzt+l4ZhWxDBrIqQYROO3DJJ6PPBo6ZwbIQTXxs0W8uGIW
         rr9ohFKsGS4Eu92C35YySmc+glacD6YTi0RH2rgNeXPtnwGMM+vVBGhG2vKotCaCrzHq
         OphQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvsdlDGzTqH+7h1UUSUp9i63izdLGlggdtQ0oA0HJDyEQZAWbaauMiWw3cOh3W9CeH5SN8L8xnwBZ3C9vSRCwmbk39gQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxE96k/52kUxllCR/sZ5sXAHJT/gX/Ev+k7KmRHbefqNyO92nMM
	FdmkeEivoU7g08cnstToNlKRukG+92SUj9GS4ZXu5IuYYH27puVRu6XI
X-Gm-Gg: ASbGncus7NHzc7UJ/8jnx08eXHJuJlpCGRU5LX7KBgKn94D0adlP1ZRRC6+3xqZjBck
	HYnENDrcXn0DiRWGFW/rcJZOJEwSeaaQYJLoYLrgIkIYUaNox9O+baMB+o934ozWqULO3L87vsU
	vBEfoFKgDJ5Fu1D1/1sSD92XjFqEa8DrU+8e8AC/MC18yJDx7Ge3zim0LA8dNjqWQrInPPYIEE5
	6OK2L+di6zPRKTltQV7vc3yEq3yAjauJ93WdFvr+1EPUFTnLAh/CKOFl/pZ4yhKrbik8wdmc4Qe
	Nb+C79x7VtNDJ2NwbH1R+qIfGJWcg1q3WBf6ISsP/GXHzF14j36ig35H1dYZABWhW6D+o4oqAyY
	hH1jMdkXCby7p2sUKkeipuZ4CVw==
X-Google-Smtp-Source: AGHT+IE9MofzC7clK4UzDItX3Pfjz8HqZyGO9RqSZ00cu4R7rGR7UhjqTFipsz0w9DeGBPmkgngZeg==
X-Received: by 2002:a17:902:d487:b0:235:f3df:bc26 with SMTP id d9443c01a7336-23fb2fe067cmr47444175ad.3.1753465648272;
        Fri, 25 Jul 2025 10:47:28 -0700 (PDT)
Received: from localhost ([129.210.115.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe53b52bsm1809945ad.170.2025.07.25.10.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 10:47:27 -0700 (PDT)
Date: Fri, 25 Jul 2025 10:47:26 -0700
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Suchit K <suchitkarunakaran@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	jhs@mojatatu.com, jiri@resnulli.us, sdf@fomichev.me,
	kuniyu@google.com, aleksander.lobakin@intel.com,
	netdev@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: Revert tx queue length on partial failure in
 dev_qdisc_change_tx_queue_len()
Message-ID: <aIPDLjCUHCf+iI1O@pop-os.localdomain>
References: <20250722071508.12497-1-suchitkarunakaran@gmail.com>
 <CANn89iJgG3yRQv+a04wzUtgqorSOM3DOFvGV2mgFV8QTVFjYxg@mail.gmail.com>
 <CAO9wTFiGCrAOkZSPr1N6W_8yacyUUcZanvXdQ-FQaphpnWe5DA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9wTFiGCrAOkZSPr1N6W_8yacyUUcZanvXdQ-FQaphpnWe5DA@mail.gmail.com>

Hi Suchit,

On Wed, Jul 23, 2025 at 11:47:09PM +0530, Suchit K wrote:
> >
> > WRITE_ONCE() is missing.
> >
> > > +               while (i >= 0) {
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

Thanks for your patch.

As you noticed it is tricky to handle the failure elegantly here, which
was also the reason why I didn't do it. Did you observe any real issue?

To answer your question above: I am not sure if we can do it in pfifo
fast implementation since struct netdev_queue is not explicitly exposed to
the lower Qdisc.

On the other hand, although dev_qdisc_change_tx_queue_len() is generic,
it is only called for this very specific code path, so changing it won't
impact other code paths, IMHO.

Regards,
Cong Wang
