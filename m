Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD86274659
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 04:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764133171; cv=none; b=IldmFqAVgPj8GylUjuQMgzKFLxrf0O85b6Pt5g8DdVpiuiyun6LNMtT1antM9UOcldnA20dcQKCr+phfJoR1FmVm+AhM6XVbOLGXpCO/R9RmFhpIjXwxJIRUn8uQwl/pjlGABjrZots3Ontz4cwD0RD87AR5yaDXVL9SyyQDkDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764133171; c=relaxed/simple;
	bh=3S4lfFMj7q+YBgrmDA2SP6irVZkPQyrV0keK3iUjdKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=efCj92uDMOaoEu/bLwbD0uSrz9rWENxBkDCHkxQ45MwjJV3p8lJVNWE5xXGCfqshtEaD6qsA7XGUgeOZx8A2gS0QaFTO4k56XdRVfsJ42xX+kAvgNnrJP+gjSqqEKjNQcY/cKHgwovRLvhf7mguulpvPq6pf3lf+Lm3ZK3HMvrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=I71ApCCF; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="I71ApCCF"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-786a822e73aso64258087b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Nov 2025 20:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764133162; x=1764737962; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SstjdCULfreZEVFZNj/IhPpujFlsaGB4XKF9NC1FxsM=;
        b=I71ApCCFD9YZbnMzQ7AHrx0R2rlET+jF3UDD+MF9gTIsUc5eEGLZ9L2efeP+RzXLek
         ngIgKdVyeb6PzYKUnDbtFsHJsECwvgzHVKa2x6zjuTy80mDfs5kXNkTbqTup8guIf33C
         GrKsmgTDsrqjAAsXGiLrsA/XBodVWJPd4mczI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764133162; x=1764737962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SstjdCULfreZEVFZNj/IhPpujFlsaGB4XKF9NC1FxsM=;
        b=bi5+z8v9yAhQ1MyBbTI1eG3rPMsZUUbJRiUcDA4XP4Azju62Gmxblqyu9hQj9dWCGm
         Tqd7MObXbel8Cc9gXDyf8T0f3Cf1zfUTzDTodyV3+QdvZjpkNEofcKIA9p2Jj3vEKa45
         Zqt+iyavOGhYtMMpNj85AfPwUjYMEszWzFfTklpnSJcs4uBKZHcY15l92zwCXvUpalg2
         4aD2V8ImuGRkrAGpsNnh3PeaValY2tj0PDEYo42K0bzj6fDKmH9fA50FOv3jKEh2VTvu
         T5Q98L6w1p3OBrGt2FQkhArpox7D+/YAXTRuu42gqzqau1T/jq4jNtFlzuB6vEemZJ+h
         pS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBZySX0UeTG5f4Ei/fJCdQwlvoEW/gPFhELEcZhwwqiP8GTiBnxz7xEhI1+N8TkGetNTK+THdxo1j485R3US/RiqtP6g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz61/orcLpK517tDmG8n72PNfcErGPSa58QVJhaVoqw0jCsa07t
	t1IurPIus21cxanCNfOJFXwki2xA/ZyjRqGpUGv4s75U5RiIWMlaYYyPZ/+rVcEmP5bTic9jbvV
	rey2yJEym1oneV0U5dlGzNXEONHSv3wkH/nHlzUEtHQ==
X-Gm-Gg: ASbGncssJ56fj2nKOQnVx/foOiJmEUywAbc3/AvAGl5LBvn9LER+HxzK2YzbY5oHJYj
	8HurGuqjHqCUe0IkGBzG3VRi7QVJwDXZ5bhMSfXjyhGhOUKGrTeo0CbDXnLfKtXvCr0zeFd+gMz
	5+RixRbG94IAqmDQYXC23+lM7YuibRmooqJB97H5Y+PyOwRBqciAUrG7dhl+pO90Z7eTwsbWCyL
	VMkVIZiJ+EzNSUpC7AXYhwRJ17nLTE1Acit44VwzQtozBSTuQhG9JwxH9jj2KX4pMLkUHXg1LQt
	NrY3Z8PMQb5fSk4hzuV1ovWRVA==
X-Google-Smtp-Source: AGHT+IHYV24PR1HmviDhOvHoIdpU4OrMzkDvxo9kIkiDVSrc03caPIiSxNEOTLnfxjOyc6l8KWVp3xgTJHsj5IfiBRI=
X-Received: by 2002:a05:690c:a8e:b0:78a:7ea3:2051 with SMTP id
 00721157ae682-78a8b493c91mr166553187b3.26.1764133162219; Tue, 25 Nov 2025
 20:59:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126034601.236922-1-ssranevjti@gmail.com> <CANn89iLiCh85_1Ah6O_rTOCGwLet97f7DyfyZMDgfTV==iUVUw@mail.gmail.com>
In-Reply-To: <CANn89iLiCh85_1Ah6O_rTOCGwLet97f7DyfyZMDgfTV==iUVUw@mail.gmail.com>
From: SHAURYA RANE <ssrane_b23@ee.vjti.ac.in>
Date: Wed, 26 Nov 2025 10:29:10 +0530
X-Gm-Features: AWmQ_blSv9rz5XKF93QAC7OCn16_tZDGSLCqlVOse-qgbGV4NCIMipFmQ3Y0fNg
Message-ID: <CANNWa05qyDYoCe=PQT4nx99CxFtwLoNtJoNKicLUG0A_XT-Emg@mail.gmail.com>
Subject: Re: [PATCH net] net/sched: em_canid: add length check before reading
 CAN ID
To: Eric Dumazet <edumazet@google.com>
Cc: socketcan@hartkopp.net, mkl@pengutronix.de, jhs@mojatatu.com, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com, 
	khalid@kernel.org, syzbot+5d8269a1e099279152bc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right, checking skb->len alone doesn=E2=80=99t guarantee that the
required bytes are present in the linear data area, especially for
fragmented skbs. I=E2=80=99ll switch this to a proper pskb_may_pull(skb,
sizeof(canid_t)) check to ensure the CAN ID is safely accessible.
I=E2=80=99ll send a v2 patch with the corrected validation.
Thanks,
Shaurya

On Wed, Nov 26, 2025 at 9:46=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Tue, Nov 25, 2025 at 7:46=E2=80=AFPM <ssrane_b23@ee.vjti.ac.in> wrote:
> >
> > From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
> >
> > Add a check to verify that the skb has at least sizeof(canid_t) bytes
> > before reading the CAN ID from skb->data. This prevents reading
> > uninitialized memory when processing malformed packets that don't
> > contain a valid CAN frame.
> >
> > Reported-by: syzbot+5d8269a1e099279152bc@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D5d8269a1e099279152bc
> > Fixes: f057bbb6f9ed ("net: em_canid: Ematch rule to match CAN frames ac=
cording to their identifiers")
> > Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
> > ---
> >  net/sched/em_canid.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/net/sched/em_canid.c b/net/sched/em_canid.c
> > index 5337bc462755..a9b6cab70ff1 100644
> > --- a/net/sched/em_canid.c
> > +++ b/net/sched/em_canid.c
> > @@ -99,6 +99,9 @@ static int em_canid_match(struct sk_buff *skb, struct=
 tcf_ematch *m,
> >         int i;
> >         const struct can_filter *lp;
> >
> > +       if (skb->len < sizeof(canid_t))
> > +               return 0;
> > +
>
> Please keep in mind that this test is not enough, even if it may
> prevent a particular syzbot repro from triggering a bug.
>
> Take a look at pskb_may_pull() for details.
