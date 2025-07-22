Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF37C279335
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753198922; cv=none; b=AvS7ZAhDJDn4cB5Ew65yuuuGADdB9y+eQ9K4TCHAdeHrnatXUTkF4+yTQZ6gbJJcd+yvvEKBRN+ETmgAyweXDmaH6n8mbjAgqBr+i3dWZzSMw1hZ3JeypDA6Xrke6AdqQURveGSaXnFNHxqmoqFBqvcIiCUVBpo6jBrpxhnun54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753198922; c=relaxed/simple;
	bh=g9EEklXk902C8ofxuE8rx2WBA3m7abatvb7woZ+cMsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WG5WiJjuAa5+oDpNfxJzC3qt1J7LhnJOO/FKpUerqw6EpraPCu/nU7NmU4MfkMiruy+JRy1/Put0fCSUi+vhZWZZMnhy0oQJpUs9GWnHAY0ZrWChzGPSsV0QClJio9OYu3KvJCW4T9ndVXkWz1pE/drniZa7cQ8WjzHGdeMh8EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PEJI2R5C; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PEJI2R5C"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ab8e2c85d7so78749411cf.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753198920; x=1753803720; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qBHdKmYPMFtPjBkykZtOEGhLmANMjG/wOtN6adOqo0=;
        b=PEJI2R5CHBiKrf2/+O7zZnRKYSwdI11WXXdbhtFg2k3iq7xRace23TSrpnXOPy2Jzy
         64cq7lA/faSSkAKGyJ7jBUsUY1nqmhI972Vi6KHVGv6bQw790zx5v8dv5xtedJ0YdE3B
         PVY4NFuKPApesETWKJl00zpNGgHE5a10pfmMo1s5wpfGmRJLywfYYQotwviRpblgLKgZ
         6xDe7Jy/ZPNmoB4pyt3erinrOwBIS0fSGuHq1SHt7RUv3CXN3ImtjitqCCnrSm86Zww8
         9Yw5u36iy8/IgNdLyqLX0B7OoKJKTRilBp2ai29ZGO5TKQUf66r1hp+n2xP7p0z+C5wW
         vfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753198920; x=1753803720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1qBHdKmYPMFtPjBkykZtOEGhLmANMjG/wOtN6adOqo0=;
        b=gVigeyWdhcBdBmCNhPg0qQNrcuEmjcFzxfpovupNjQeEZ+2sgqd+qO/jrpmn5Ijuwm
         HtKFethIMZWPWHWXHCc+aY3GAJrmFPxolXiRd25MttWWcdhiO8j/pjSp+prZH4JwMaBF
         CR4aHth8MYF5vO1u4Tl+1FmnnyrIPHvT9IV0JmOV4rc16Qw/izE8Mt4d+O8wHaHivfqI
         l9DAvBF2THe87mtODbzh+WN5eq1NrO6I3bnK4I15n3bZG4BwZT+jTUWRE82/4SdaidVP
         PepSW4WRJ83t2qochVmfOlAIdAbGSvq4ULWVcBDcDH2QN3MuFb1mTtjQSyUDZAZYUIHX
         fYug==
X-Forwarded-Encrypted: i=1; AJvYcCWjbO8zILPXaxvHEC1ZkhxI+ZoZVlEj/X3J6isTJmbswiai7jEsI08zfXq4DptGIZH8nivDXH/PgnkB6fLNrNKTur0nNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOmU4ozcQzAXV4CnXVkkXbMQiEP34cvJZrieUIREyGZq9WUG5a
	dTEdmFgurkT7Rv9DWIxw0miVSAQO6JRuOqfaiWB/piikyf96ME5POKGDk/MXLp8otc3LsQT2qxt
	V+jRHK9Y4J4YWaqyelBHfi0hf3xrxlW379veCXCI0
X-Gm-Gg: ASbGncvkFyWGGbfzbzT+/MIlcowVFLnLZD8ZHclvkTnWKQo4a256oam25sb1Ln9jF+M
	p8hjLSJRh6gWEabNcaxI/t8idB3ivSJtBgKWRxlv53528UERsBy3/0VUyaO+z4TFJtWhPjIE/td
	a/e2yRueiqj9vUiFs1YssDi1KDmL3iKL7KnQNaosfXs+Tn8zt0WnSDRJOScLjGLMgW06aDV0ho7
	6YAIQ==
X-Google-Smtp-Source: AGHT+IFz3i1EtapV0IvQfMG2OwnY161D0xKDC7JwKfOL7HxpCFq49fqtCqXRwaiQlIgHTAbfGBWChoDUfHIlflY9Vnw=
X-Received: by 2002:a05:622a:190c:b0:4ab:3ff6:f0e9 with SMTP id
 d75a77b69052e-4ab93c430f7mr382067691cf.1.1753198919441; Tue, 22 Jul 2025
 08:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722071508.12497-1-suchitkarunakaran@gmail.com>
In-Reply-To: <20250722071508.12497-1-suchitkarunakaran@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 22 Jul 2025 08:41:48 -0700
X-Gm-Features: Ac12FXwxZbJIBYib8fr6Oyem19af1On_m2X-wW_EUa_K4ODkvuxy53heJa_cUR8
Message-ID: <CANn89iJgG3yRQv+a04wzUtgqorSOM3DOFvGV2mgFV8QTVFjYxg@mail.gmail.com>
Subject: Re: [PATCH] net: Revert tx queue length on partial failure in dev_qdisc_change_tx_queue_len()
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, sdf@fomichev.me, 
	kuniyu@google.com, aleksander.lobakin@intel.com, netdev@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 12:15=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> When changing the tx queue length via dev_qdisc_change_tx_queue_len(),
> if one of the updates fails, the function currently exits
> without rolling back previously modified queues. This can leave the
> device and its qdiscs in an inconsistent state. This patch adds rollback =
logic
> that restores the original dev->tx_queue_len and re-applies it to each pr=
eviously
> updated queue's qdisc by invoking qdisc_change_tx_queue_len() again.
> To support this, dev_qdisc_change_tx_queue_len() now takes an additional
> parameter old_len to remember the original tx_queue_len value.
>
> Note: I have built the kernel with these changes to ensure it compiles, b=
ut I
> have not tested the runtime behavior, as I am currently unsure how to tes=
t this
> change.
>
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  include/net/sch_generic.h |  2 +-
>  net/core/dev.c            |  2 +-
>  net/sched/sch_generic.c   | 12 +++++++++---
>  3 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
> index 638948be4c50..a4f59df2982f 100644
> --- a/include/net/sch_generic.h
> +++ b/include/net/sch_generic.h
> @@ -681,7 +681,7 @@ void qdisc_class_hash_remove(struct Qdisc_class_hash =
*,
>  void qdisc_class_hash_grow(struct Qdisc *, struct Qdisc_class_hash *);
>  void qdisc_class_hash_destroy(struct Qdisc_class_hash *);
>
> -int dev_qdisc_change_tx_queue_len(struct net_device *dev);
> +int dev_qdisc_change_tx_queue_len(struct net_device *dev, unsigned int o=
ld_len);
>  void dev_qdisc_change_real_num_tx(struct net_device *dev,
>                                   unsigned int new_real_tx);
>  void dev_init_scheduler(struct net_device *dev);
> diff --git a/net/core/dev.c b/net/core/dev.c
> index be97c440ecd5..afa3c5a9bba1 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -9630,7 +9630,7 @@ int netif_change_tx_queue_len(struct net_device *de=
v, unsigned long new_len)
>                 res =3D notifier_to_errno(res);
>                 if (res)
>                         goto err_rollback;
> -               res =3D dev_qdisc_change_tx_queue_len(dev);
> +               res =3D dev_qdisc_change_tx_queue_len(dev, orig_len);
>                 if (res)
>                         goto err_rollback;
>         }
> diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
> index 16afb834fe4a..701dfbe722ed 100644
> --- a/net/sched/sch_generic.c
> +++ b/net/sched/sch_generic.c
> @@ -1445,7 +1445,7 @@ void mq_change_real_num_tx(struct Qdisc *sch, unsig=
ned int new_real_tx)
>  }
>  EXPORT_SYMBOL(mq_change_real_num_tx);
>
> -int dev_qdisc_change_tx_queue_len(struct net_device *dev)
> +int dev_qdisc_change_tx_queue_len(struct net_device *dev, unsigned int o=
ld_len)
>  {
>         bool up =3D dev->flags & IFF_UP;
>         unsigned int i;
> @@ -1456,12 +1456,18 @@ int dev_qdisc_change_tx_queue_len(struct net_devi=
ce *dev)
>
>         for (i =3D 0; i < dev->num_tx_queues; i++) {
>                 ret =3D qdisc_change_tx_queue_len(dev, &dev->_tx[i]);
> -
> -               /* TODO: revert changes on a partial failure */
>                 if (ret)
>                         break;
>         }
>
> +       if (ret) {
> +               dev->tx_queue_len =3D old_len;

WRITE_ONCE() is missing.

> +               while (i >=3D 0) {
> +                       qdisc_change_tx_queue_len(dev, &dev->_tx[i]);

What happens if one of these calls fails ?

I think a fix will be more complicated...
