Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D66225761
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 11:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753527768; cv=none; b=rdKPQDqDHNgagJp0vSJBmO5HIIKdY7VB1JGCAbcznRqAsguMILh6uua5LnJ8GEfX3Op6raKGrXBKfFkI6XzvumRNxolh15yetK2A4baYVxQkncRHmuETCz/1xsDyTmBIY5jkSak5c9IHTQZ44ZErsK6C+MH/Smkbdha6/InLtQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753527768; c=relaxed/simple;
	bh=3HUha1BBOXbxMtlMVmeIcVVQggx5ZsrMvzl+M4e0FMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgF/felt2u71nQJDDG2+6CdQNrnOHj+MiTrlKWmNxuaZoqeXdXjgf3JEklfkmnDrRd2l//XqHq9WCJKWXtMPIzevh6XZ9Dwdeyd4lWP4IRggeTOWXwNNmwz2OiPdX0wCPgVVLOcQTKpL0yLqJDPwtC6oT5ILJhvfnLkSHoiVy1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPn6xJZ/; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPn6xJZ/"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-615913ff67fso1565229eaf.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753527766; x=1754132566; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6N8u7i6bavRtncX2NloOXYK5MdGg/xlO/tgSTQhg80U=;
        b=MPn6xJZ/dynrN/IvGi7lAsVNM8dBArI+cnGECPZKWe2fp9GLEw1RjPg1H2CBJu7qo9
         jh93tGDwPQcdu4f7dGJZ+encLhE2p/9R/ltDpVMvsC9EZ8bFeWNJDnkbX8W/rhhQCs84
         SfEUO3bjXh3A4rLiwev91z+88OjMoAcZ8NWG28ueFdQYLPGRXdvGVwB6PbfADTHQw/cq
         AGRPkUm5jlK2qx5o0jHqrmko1Y9XsxckHn6M/ir/OZoMQ5Gnw7wo7bFelwaxQ5gV6Soe
         v1ZkLpDTh0DGMFrBHZjUYm+jpP0sT9tRtHw+uJVgtLSf6mRdTd1jhU2B+Qm+WtfR5JDt
         sgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753527766; x=1754132566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6N8u7i6bavRtncX2NloOXYK5MdGg/xlO/tgSTQhg80U=;
        b=WG4Vup1v5jn8FkOc8pBAzIz9PW+6fxvOSvIzJNEJf45VoiYJpEolhxuOggFAprMEvb
         +tdC+MIzjVDbNEJilX5E8GnlCgb3zLstE/6rnIvTHFwmYd7JiLLl4sDdmkyKNTQ3PjaS
         cTYY2BDXbmT5TqGcHQpd9duDtlt4MKOG8CkBDZE1TSbvYPEUZoFUjOcabh4A+eowFT+j
         1s0T/QnpEwz6Swtk81XOxmTsLYh2cuF6bgYwMtvoXnhNN3Gw26h9W8NxfucZMhihvIbO
         AQV7k1gzyV1LQmG29VhSqTteuU7brnIncrGJz4g6mLb7f9SeFP31loc/Bejg4B3jaE3e
         57HA==
X-Forwarded-Encrypted: i=1; AJvYcCUXmt47rTMAtBUl7v2KQGhzYpGOyPMZo6mGp1OI5emI7G+bI3tPolywlUkwUJdSL9s2a+v9FvgbHRhGOcFaERIOKEEsxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvK+G71ZQZe49grppecRfly8JWbLBk54gxgo+OrpkXmEqm4YeV
	NgiU08j8tjWe52zvEWc9mdXpwYssdACCW2/midlUylabaHB/V5rmQd5ud2gapOW2WuX3ujhGFA5
	xrb8Svp1kBoU0fR/wLWapft/A/R1oI/4=
X-Gm-Gg: ASbGnct6hU7lD4c60tAb25dKkH1ugveGLC2MC6PmRt1O3fBlNscrGFKeSJAIigfTEWx
	kqLuCI3R1DQNZSfYVi9Eev96g3FAbRFacpzimSW2xRqIlWmzIJzOjuXIPuyJuTSa04JLE6bU9rR
	MLIuwVkDxSGxwoJf+mVqI8OuSUcdGukxpiH97UD7T+1od5pKBu4Ih5mAhDgmee/FjgsU/OR0SOR
	Bzb0r+RrtYTZ6Kx8tc=
X-Google-Smtp-Source: AGHT+IEyf3AoHuWHzF2ZaG4kAT0T62PWcegvLkRfaxx91RgrmAJ6papxbmsO/hpAFgEyYRR1CiVg2Qo6LqpVshWS+nk=
X-Received: by 2002:a05:6820:2103:b0:611:5a9e:51c4 with SMTP id
 006d021491bc7-618fe208078mr5922202eaf.4.1753527765661; Sat, 26 Jul 2025
 04:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722071508.12497-1-suchitkarunakaran@gmail.com>
 <CANn89iJgG3yRQv+a04wzUtgqorSOM3DOFvGV2mgFV8QTVFjYxg@mail.gmail.com>
 <CAO9wTFiGCrAOkZSPr1N6W_8yacyUUcZanvXdQ-FQaphpnWe5DA@mail.gmail.com> <aIPDLjCUHCf+iI1O@pop-os.localdomain>
In-Reply-To: <aIPDLjCUHCf+iI1O@pop-os.localdomain>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Sat, 26 Jul 2025 16:32:33 +0530
X-Gm-Features: Ac12FXwepev2M9q8u7MIGx5HDPwylIpmw4JPzsJiwl_P_EHFyYCSf6GkndaygOY
Message-ID: <CAO9wTFhC=cRvJQro1g2SXiq4Zx-Oiu3Q3c8stbfHSXCA2fi7Bw@mail.gmail.com>
Subject: Re: [PATCH] net: Revert tx queue length on partial failure in dev_qdisc_change_tx_queue_len()
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, jhs@mojatatu.com, jiri@resnulli.us, 
	sdf@fomichev.me, kuniyu@google.com, aleksander.lobakin@intel.com, 
	netdev@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Jul 2025 at 23:17, Cong Wang <xiyou.wangcong@gmail.com> wrote:
>
> Hi Suchit,
>
> On Wed, Jul 23, 2025 at 11:47:09PM +0530, Suchit K wrote:
> > >
> > > WRITE_ONCE() is missing.
> > >
> > > > +               while (i >= 0) {
> > > > +                       qdisc_change_tx_queue_len(dev, &dev->_tx[i]);
> > >
> > > What happens if one of these calls fails ?
> > >
> > > I think a fix will be more complicated...
> >
> > Hi Eric,
> > Given that pfifo_fast_change_tx_queue_len is currently the only
> > implementation of change_tx_queue_len, would it be reasonable to
> > handle partial failures solely within pfifo_fast_change_tx_queue_len
> > (which in turn leads to skb_array_resize_multiple_bh)? In other words,
> > is it sufficient to modify only the underlying low level
> > implementation of pfifo_fast_change_tx_queue_len for partial failures,
> > given that it's the sole implementation of change_tx_queue_len?
>
> Thanks for your patch.
>
> As you noticed it is tricky to handle the failure elegantly here, which
> was also the reason why I didn't do it. Did you observe any real issue?
>
> To answer your question above: I am not sure if we can do it in pfifo
> fast implementation since struct netdev_queue is not explicitly exposed to
> the lower Qdisc.
>
> On the other hand, although dev_qdisc_change_tx_queue_len() is generic,
> it is only called for this very specific code path, so changing it won't
> impact other code paths, IMHO.
>
> Regards,
> Cong Wang

Hi, Thanks for the feedback. I'll try to dig more into it and will
post a patch if I find a solution. Thanks once again.
