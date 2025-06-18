Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EEA2EAD1C
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 18 Jun 2025 14:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257162; cv=none; b=UlJaacDGEDM86yujy9n152wi0nmt/QC/jJv1tL02oruGUIf2GDAensb7J6k8u/xWmFsuPKgdLCxWG3nGx61d40y+JIFWfzCetk8WsLRVwADDtjiETpx77re4/1TSyfI83nfUFqH53xxEIZNfWfqVSf0UGqwsowz8eX/P5wB6w54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257162; c=relaxed/simple;
	bh=rUMIy7WMDIqMX5nqHFhcWEJhMU/5V3MUoPXR1atiSL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RySqOiCIV4HJGcvZNi7bBmVTCs93W/c1DpILXrRaiqUrsB+Z5o7PictnvFl7MGG2VM15fn3X53y61LxcydNUlli7elGR29ulAf5M+XwdicNAmP7eaGXZKo4RQIWrKDUJwZRT+FMsipGdJ9euAA5SmOR2NeFk7I6+ethMfmN//tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak/KPQRE; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak/KPQRE"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553644b8f56so7206028e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 18 Jun 2025 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750257159; x=1750861959; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihCXHRZ1nufqzjmG/TdDihkEo5FvL+VMlNINtJVdES0=;
        b=Ak/KPQREtN1hDQ5iSvJUOaMDl4jCkfpVV+B/XkHKJtbJ86K2dWGrCfbeILcfMDDoeM
         vYuBJYwDO9SoUXR7bgbJS/9YOhN9qmRdpRxqv3QnKMGW8E/oTv1JEflD2pAouD0xZ39E
         ILRXyqsywvlc8JgvC4dCjurAVpfQ2S18PAuVMJ2lJlW4ISn70c4y97WPg/Lg9KuGdWTx
         wm1YeyxeXMg4kItQMCtd6GcXmJ7y1mwbDg8GLN4/UHCItlMjV6m0EAp0jgMt6OyyETD/
         CHNdoYLdJuj47u2BV2IzDEMyH3kClwpaiKt7NwxVzDII2JO88rn/HTV9EqIFJLic45dW
         qVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257159; x=1750861959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihCXHRZ1nufqzjmG/TdDihkEo5FvL+VMlNINtJVdES0=;
        b=DEpUimx5HfVZrAqhin6y4tX+sBXszieIrZH1tv1axsAuJdhSq+BzlaXAtMFGIvJIHp
         bT3YtImfWThS8qYTEBeqmcuzveb4jOiStAdTHsnRX1wFuwyBd+o2m6bpK7vg83P3mWf9
         1IDFB0sSQBcx4vLMnMtxaX7ntJFuWOmh68aQleQWMiw6z6ta+2bM68JBcwBbhCbwS5Vx
         dufgxRwfvWVOaeTfdguVO+kfhH5S8qXqxmdIsgrBwflqN6k4KNFwQm55QaLQLgOsRIQO
         Lo0q1umpvXMARk77kHdsKGQIk8597YA0/rETcZl135hPtpyv3cK/HlDy+b3ouUsBHepA
         eC2A==
X-Forwarded-Encrypted: i=1; AJvYcCXoDttlm5zvT9DzapKfP6fF1YAobdXcU4UYycNILXrCaBTWjuPlBmRzqF8JZkYrCjS1puRMmd/kQKU2DKCCGy2mKlrzXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDaobgJCws93OPyh566X1uFFnmXk5qOJPQ2yENIxnwjLtiaszv
	PpXoa3eT34nVzhhQ64O9bKw2NHTmxOD+0B+evNDlnGgfxB/k545JzSYS7wrTlfhg2VXxT4ES5yO
	Uzblv1tPE8IyOml0j8JeYHI9Tvr+Omo0=
X-Gm-Gg: ASbGncs7sNg6q2DCRW5NqCrOaj3bKUZMrscAj037Zl2p717/O1YDZBoQVhJYEDlcrJl
	uj5AUgz5OcG/spr1CnpbWFqowvZIWQ2IntFyspOeGArIRnipJCCruflq3MzmscTaLIYlU4J4Y6k
	++DHYLJkFeKVF8LyT+YgJDANdEhEnUnbrfdYZc/50Qy+vOkQocpDqXAE16/jZabYVEvLCHszeIh
	tzXWQ==
X-Google-Smtp-Source: AGHT+IE9LWXuzf5K5WiugQZzr59mWmBCSO8Dngn+hDqQ+L7WD83q+dR609mZpacuubkSA72ZHmRLknqpUnl4K69yegE=
X-Received: by 2002:a05:6512:39c3:b0:553:23f9:bb3b with SMTP id
 2adb3069b0e04-553b6f43089mr4423414e87.49.1750257158310; Wed, 18 Jun 2025
 07:32:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250617122512.21979-1-pranav.tyagi03@gmail.com> <20250618105039.GE1699@horms.kernel.org>
In-Reply-To: <20250618105039.GE1699@horms.kernel.org>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 18 Jun 2025 20:02:26 +0530
X-Gm-Features: Ac12FXw90DPxRpXgVMbGiXurWYc-LHuM_yqfq7DYOEEK79nbIo_aIr8UtNR_8e8
Message-ID: <CAH4c4j+Cx3gTh0aBjBVJqvZjETR6ijphi=x1rQAy_S9fA48NJw@mail.gmail.com>
Subject: Re: [PATCH] net/smc: replace strncpy with strscpy
To: Simon Horman <horms@kernel.org>
Cc: wenjia@linux.ibm.com, jaka@linux.ibm.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alibuda@linux.alibaba.com, tonylu@linux.alibaba.com, guwen@linux.alibaba.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 4:20=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Tue, Jun 17, 2025 at 05:55:12PM +0530, Pranav Tyagi wrote:
> > Replace the deprecated strncpy() with strscpy() as the destination
> > buffer should be NUL-terminated and does not require any trailing
> > NUL-padding.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  net/smc/smc_pnet.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/smc/smc_pnet.c b/net/smc/smc_pnet.c
> > index b391c2ef463f..b70e1f3179c5 100644
> > --- a/net/smc/smc_pnet.c
> > +++ b/net/smc/smc_pnet.c
> > @@ -370,7 +370,7 @@ static int smc_pnet_add_eth(struct smc_pnettable *p=
nettable, struct net *net,
> >               goto out_put;
> >       new_pe->type =3D SMC_PNET_ETH;
> >       memcpy(new_pe->pnet_name, pnet_name, SMC_MAX_PNETID_LEN);
> > -     strncpy(new_pe->eth_name, eth_name, IFNAMSIZ);
> > +     strscpy(new_pe->eth_name, eth_name, IFNAMSIZ);
>
> Hi Pranav,
>
> I think that because strscpy always results in a NULL terminated string
> the length argument can be increased by one to IFNAMSIZ + 1, matching
> the size of the destination.
>
> But I also think that we can handle this automatically by switching
> to the two-argument version of strscpy() because the destination is an
> array.
>
>         strscpy(new_pe->eth_name, eth_name);
>
> >       rc =3D -EEXIST;
> >       new_netdev =3D true;
> >       mutex_lock(&pnettable->lock);
> > --
> > 2.49.0
> >
>
> --
> pw-bot: changes-requested

Hi,

Thanks for the feedback. Apologies for the oversight.
The size parameter should match the size of the destination.
Anyway, I will now use the two-argument version
send a v2.

Regards
Pranav Tyagi
