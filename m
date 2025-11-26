Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4D62DCC03
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147439; cv=none; b=kijMPKDfqqg7bpBwF8zSSJqmWikFF2XpIoKoTmImg1srHfnURKRrxcb1APm/xPfubTqdwxpBXd2AkL06V39GC4K502NEu4TJ2ZmxSVKV6zRz2sWhcbYzrkrigzGwQmIMYo9aMV2eMcEoDYn4PBqChHVItbsbbG5TB1j4lN5KShk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147439; c=relaxed/simple;
	bh=nT+9hkMMKO2a0c2dfjEfFHNaAZraFsUcksi/FyJvXog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWzz96NbEfmytx567TL8qPSTlJGlkvnxv71KLH1iV94onbMnHgLxnuu/xLkFNGLgHONLrPRgklFmzws1Kf1npIz6RQDc+vz6ESTlltTr+wz0YtZ2iRynBuESvbI4B7ah6zLXnXGe7mIBkwFMmTCm/zq5C4tpMe71riOSh9uibvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=RGQussBX; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="RGQussBX"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-787f586532bso57577497b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 00:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764147436; x=1764752236; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OM6Ho99eQFd7mP86XuPFjtx25R80Ho6T6bFHAVogBI=;
        b=RGQussBXIiGqeR/s5ZnMqGWDypVPGpyRk/FJaWZUiccLUx6HNgutXORuVCKskFopea
         gahDkvoeyXUvz9nfoa78WZyrDK7R22TF77ni4oG3grXPJsfd9C7NqgOZNU7QkIDva06l
         bVSYanSyNioke2bGsYr3KOvFoWKmaOKI+Rveo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764147436; x=1764752236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4OM6Ho99eQFd7mP86XuPFjtx25R80Ho6T6bFHAVogBI=;
        b=DHju186N2ucXEAFKeWS9ew552JksSXq6aVJXFnFohHFOhAJqrbNzIPPxoFQFpvqeze
         ENu0cCagmZfcwjqXWZe1zWBfS/77AXCOznHns8wdDA9ZHu+5GKtP8qJU4zJmVyr6itPd
         2xNd5o7X31WRH7d3AFOUnVX7cSRTa0Z4Qv3QKWAYCxyCOAOU84I1/fzpw29KWIz6KfpC
         8FEvEUPxBHyFwZhJSEI3LGdGBWVBQlOgzBG9GBzEAeM3KyWKS//CkiskNw2vc9RtZJYA
         RVLoAECKXshyPFrZIbuVJ1i6g1QdZmjejUKKWebUiIeb9dJu0c+L5U9IVClcpkh4SD0M
         m7/A==
X-Forwarded-Encrypted: i=1; AJvYcCUGJcEijnNbQ9bimEGhbN76yXSKG8BR8IBKLWibB8eE7BfXDUwJTe2vvwWd6zjP3sznloHLTw5rvhlhshqGYpjtyRGVnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSTXcEK6Gn5US3P9XzQvYjafSCxgu1KWIun+YyVaAL8O0+7Gj+
	DSRun98K3pA/ke8rInmuKNfEix8mNj7ce5q+uHvsCZMBT/PeZc7flr6o3ItQIx+VEb1JAj9gKvn
	j+VFjnNUNfw0fzFxUc/1GEPAPx4mbf8LUPODAKovorQ==
X-Gm-Gg: ASbGncssM2uRTRTy2Ib8Siw5I7/7D8VSC48ZuDBtSBiF9/cAEKVo6NUuLA1c1GIX4mK
	ys76rLtIP6LRvw2zSmdIIPT9WMovjaOyIm5ntGnBHgTlh6R97iOwoIh0FPFoJlLCKvG1oUktIGU
	HFuxtbXgmg2UNburq0BaXvDwcKnK3+LaUa3jTZaFMyoMQBPI1zJSiIjOiRPvxU1xTKmvwpPTD5A
	2y+88ge1HXgIN095UsV5By1pa7oypkq5lfjWxJ514aKr4v2raj89jx9yQpKO3sSRr1ZlvjBBZMK
	FVBO+rx4U8mL9G/zexr1wDim2g==
X-Google-Smtp-Source: AGHT+IHJIvCtQDQdlog8TUzs2kVVtyqB7q15hp22o49qFK1YOQ1sGDEwLFExhJCLMavAo58rcSOOrmdo7LPuV53mr+o=
X-Received: by 2002:a05:690c:e1e:b0:786:5789:57df with SMTP id
 00721157ae682-78a8b528a34mr142965887b3.45.1764147435965; Wed, 26 Nov 2025
 00:57:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126070641.39532-1-ssranevjti@gmail.com> <9c9e9356-55c2-4ec0-9a0e-742a374e0d04@hartkopp.net>
In-Reply-To: <9c9e9356-55c2-4ec0-9a0e-742a374e0d04@hartkopp.net>
From: SHAURYA RANE <ssrane_b23@ee.vjti.ac.in>
Date: Wed, 26 Nov 2025 14:27:04 +0530
X-Gm-Features: AWmQ_blI3bICHE0wZGePxKvJM3ZGKSLwaqnMni4SAIeax_i_EG-2dclrwCiuaQ0
Message-ID: <CANNWa06P=u44r=Nq5Er+iuJW=aEpaAq0L7HKn9id+KLjy_pEtg@mail.gmail.com>
Subject: Re: [PATCH v2] net/sched: em_canid: fix uninit-value in em_canid_match
To: Oliver Hartkopp <socketcan@hartkopp.net>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Rostislav Lisovy <lisovy@gmail.com>, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com, 
	khalid@kernel.org, syzbot+5d8269a1e099279152bc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Oliver,
That makes sense EM_CANID operates on a full struct can_frame, so
ensuring CAN_MTU bytes are available is the correct approach. I=E2=80=99ll
update the patch accordingly and send a v3.
Thanks for the clarification!
Shaurya

On Wed, Nov 26, 2025 at 1:33=E2=80=AFPM Oliver Hartkopp <socketcan@hartkopp=
.net> wrote:
>
> Hello Shaurya,
>
> many thanks that you picked up this KMSAN issue!
>
> On 26.11.25 08:06, ssrane_b23@ee.vjti.ac.in wrote:
> > From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
> >
> > Use pskb_may_pull() to ensure the CAN ID is accessible in the linear
> > data buffer before reading it. A simple skb->len check is insufficient
> > because it only verifies the total data length but does not guarantee
> > the data is present in skb->data (it could be in fragments).
> >
> > pskb_may_pull() both validates the length and pulls fragmented data
> > into the linear buffer if necessary, making it safe to directly
> > access skb->data.
> >
> > Reported-by: syzbot+5d8269a1e099279152bc@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D5d8269a1e099279152bc
> > Fixes: f057bbb6f9ed ("net: em_canid: Ematch rule to match CAN frames ac=
cording to their identifiers")
> > Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
> > ---
> > v2: Use pskb_may_pull() instead of skb->len check to properly
> >      handle fragmented skbs (Eric Dumazet)
> > ---
> >   net/sched/em_canid.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/net/sched/em_canid.c b/net/sched/em_canid.c
> > index 5337bc462755..2214b548fab8 100644
> > --- a/net/sched/em_canid.c
> > +++ b/net/sched/em_canid.c
> > @@ -99,6 +99,9 @@ static int em_canid_match(struct sk_buff *skb, struct=
 tcf_ematch *m,
> >       int i;
> >       const struct can_filter *lp;
> >
> > +     if (!pskb_may_pull(skb, sizeof(canid_t)))
>
> The EM CANID handles struct CAN frames in skb->data.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/i=
nclude/uapi/linux/can.h#n221
>
> The smallest type of CAN frame that can be properly handled with EM
> CANID is a Classical CAN frame which has a length of 16 bytes.
>
> Therefore I would suggest
>
>         if (!pskb_may_pull(skb, CAN_MTU))
>
> instead of only checking for the first element in struct can_frame.
>
> Many thanks and best regards,
> Oliver
>
>
> > +             return 0;
> > +
> >       can_id =3D em_canid_get_id(skb);
> >
> >       if (can_id & CAN_EFF_FLAG) {
>
