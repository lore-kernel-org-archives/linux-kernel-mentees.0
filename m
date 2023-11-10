Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC06D269
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bQ1eN0Fu"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF1B9822B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 08:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF1B9822B3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bQ1eN0Fu
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dE18YgsrgZa0
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 10 Nov 2023 08:53:15 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 84215822B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 08:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84215822B2
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so27778a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 00:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699606393; x=1700211193; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo3Gaef76iZdXuhsx+7+Om1O4tE/oq1eo+uule+ERTE=;
        b=bQ1eN0FuB+s2KHpLndsVebLhJEAXYLT409YFQsOQl+zczwneOWeLGixHiRMrCpg48B
         jr/SH8qEpU2MASJZrDqhXVRcgiMmdF6xrf3DAw6Mr/70ovdzqRzSdvFFgv8xX6JV146F
         C7y/U/UqEkMkLoXkAZuH4CE4Hg779mn+gvsXV4e7eH2aK8DYvKW7NxXWsCw+JAG+5Jq0
         rRAQ5ms4CrARoh0mb/u1mHpjdAWPO2qVAfyZJ51XbVMzUzxYYAceBLd3hKTF7n+mBU/x
         CBEkuymI4bfUx6R/31GIut0nwi4zZg9z5nFOYH8E3Tvgc8Xg5Ba/dJgDmIkVNlfNSNQi
         u7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699606393; x=1700211193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo3Gaef76iZdXuhsx+7+Om1O4tE/oq1eo+uule+ERTE=;
        b=LG5WOBSPgK67LoNuCouFUo/h3OdYWT3x7i3/vfxLeNk9pt5uyalx3mKzOOxHkQZ7dS
         vV2Tz30vhMUgceLmRR1dx9i0CRbu+Rc4WKcwL7NxPakcHQYW9D8JpjGJc2jea9s6C9wE
         grnT3PXXKRrXJQvQdm7EqamEfJtzMaxOLkXxs4cvxDvkNaFFBLxGeGYd80CK0EkNHZRp
         7Om/dwMyvYRbQxiP4IJ/vycXMeXoQ8fArW84r6HFm8dS3a+hpo88toidq1C3ROLaNP/k
         S7JRXqmyS5+OLcqALGjmqhgSaWgbfzXZ9z49Bp3UMHCrXO0zn9WYf5gRPEO5RvmsMc86
         6A7w==
X-Gm-Message-State: AOJu0YyMPhM94eRjQC+4BTgd7yl5ukNYtQkIJmmFNZTUUgL6QMF6142C
	ZBhWzisfrLgmw4gH1RmETR4RW1hw0EN8HzEEuOJyYw==
X-Google-Smtp-Source: AGHT+IHNVwWCLTN6LjcqqqgM7vGdwZcOOORDqp35sP4CzTDGxBSeVzCT91zZD4uIiqV2QAN4HgA7DtSL0ihyPu880ts=
X-Received: by 2002:a05:6402:497:b0:544:24a8:ebd with SMTP id
 k23-20020a056402049700b0054424a80ebdmr327482edv.4.1699606393272; Fri, 10 Nov
 2023 00:53:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231110084425.2123-1-kdipendra88@gmail.com>
In-Reply-To: <20231110084425.2123-1-kdipendra88@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 10 Nov 2023 09:52:59 +0100
Message-ID: <CANn89iL34Yiuas__P5WbtVM-mN5=ga-RhZV7Kdqo4a6KDxTv1g@mail.gmail.com>
Subject: Re: [PATCH] Fixes the null pointer deferences in nsim_bpf
To: Dipendra Khadka <kdipendra88@gmail.com>
Cc: kuba@kernel.org, davem@davemloft.net, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, 
	syzbot+44c2416196b7c607f226@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 9:45=E2=80=AFAM Dipendra Khadka <kdipendra88@gmail.=
com> wrote:
>
> Syzkaller found a null pointer dereference in nsim_bpf
> originating from the lack of a null check for state.
>
> This patch fixes the issue by adding a check for state
> in two functions nsim_prog_set_loaded and nsim_setup_prog_hw_checks
>
> Reported-by: syzbot+44c2416196b7c607f226@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com./bug?extid=3D44c2416196b7c607f226

Please add a Fixes: tag, and remove this empty line, thanks.

>
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
> ---
>  drivers/net/netdevsim/bpf.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/netdevsim/bpf.c b/drivers/net/netdevsim/bpf.c
> index f60eb97e3a62..e407efb0e3de 100644
> --- a/drivers/net/netdevsim/bpf.c
> +++ b/drivers/net/netdevsim/bpf.c
> @@ -97,7 +97,8 @@ static void nsim_prog_set_loaded(struct bpf_prog *prog,=
 bool loaded)
>                 return;
>
>         state =3D prog->aux->offload->dev_priv;
> -       state->is_loaded =3D loaded;
> +       if (state)
> +               state->is_loaded =3D loaded;
>  }
>
>  static int
> @@ -317,10 +318,12 @@ nsim_setup_prog_hw_checks(struct netdevsim *ns, str=
uct netdev_bpf *bpf)
>         }
>
>         state =3D bpf->prog->aux->offload->dev_priv;
> -       if (WARN_ON(strcmp(state->state, "xlated"))) {
> -               NSIM_EA(bpf->extack, "offloading program in bad state");
> -               return -EINVAL;
> -       }
> +       if (state) {
> +               if (WARN_ON(strcmp(state->state, "xlated"))) {
> +                       NSIM_EA(bpf->extack, "offloading program in bad s=
tate");
> +                       return -EINVAL;
> +               }
> +       }
>         return 0;
>  }
>
> --
> 2.34.1
>
