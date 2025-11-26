Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7364631283D
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 04:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130599; cv=none; b=lKsgr2tywWJ+xGT33pBoF/RN83Z3GUoaorWagrg54AcKnKWLrUOUl8zeFwV2cZHB5gkAC46D2uytht37XZCdE2YIxof0DNH4og0qUYGsDLeiA13b0P5s8BkzC20zfeWekp0BL1RG332+oWgCoKvCoOTyEZn1LOyv9uchsHwYmDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130599; c=relaxed/simple;
	bh=CHLkD+aCMnLB3JeuX6yr5VK6fKzG/6EU7wOFsVdfWiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjEzNbpfM/AkwwavUCSQGsGoZ8zt6mbkh85yOAITzGW5mvEzpi/zNdNw1XWUS0lX4XywoaXlLULQq1wZE+3WoKlWJPotKDtc6k0QXkmfB/opcPb5VnRooYOORgvbtGQe76wjHchFLJ9VCtMWc1jlH/+D8+Sprjq2TOA5BkbrraQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HbKpPKvm; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HbKpPKvm"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ed82e82f0fso59848111cf.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Nov 2025 20:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764130596; x=1764735396; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdoEAjvZ4ZMhSlfgYvRSVu1/48BFEzmIWIiWiBCSYaA=;
        b=HbKpPKvmLDWXtKz+rOq/ssLdu68sDKT75loT/ssEqXficIvS67hIm+0xs8q7o8AkC8
         LtFTg2491Y01fFe9zIxBi1Av1UFB2fNQzpMTZWk7h22pyooPj0EzoeXZ6pFo1fPAkBYw
         FhN/Ot00yGjhkVjwgygSKGJRbTTt1TcYCISF0X+TzJDaw6el7t8rTt1m7T1Lb8JxF3Zh
         PVGPE0nnZlPKFQ2quuN6AWEAotgHPpMZOrFrMvlTPz7Q8n/YoXxrOwWJ4AzdwOb1hL8w
         FlMTGlmLoawPIXCMGptkQRUl/D0BKFAO0+h90dY9/Iafqfzc9iPXymNr/7RsrJKh2hx4
         rbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130596; x=1764735396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DdoEAjvZ4ZMhSlfgYvRSVu1/48BFEzmIWIiWiBCSYaA=;
        b=uo2qlQGd+77gYxasJUYmeg6gu1M1cP107fa95vULcofDeYOZg0NKVmx/QzkVOY/qzp
         3OGAoBUKTtaFyCD0jqJaoBH10KOyGeO0fc6hAjAE8J9xm2go3Z8odHlwaXkWbchOUb/U
         WoZ3Md0ytVNkuPipDCxcXb6HUPuwbW9jBA7jxRgTbiF4oubll/1NLHSwvo1eiqm1Q29a
         ta0pzL6XWcbeS3BYN8CfHMzZ9kjQkPOUW+HDP7W4tPW8VhUeuyN7Lafp+9RhQEYSPO/e
         KGRKlZqDYS783lLyHYGkWFiuLVGkwX7JE/5zVlhLP7JppIn+Brj47FkGHXIP9EwqKusw
         4Juw==
X-Forwarded-Encrypted: i=1; AJvYcCWCoNMtI6N2weFQIycC32esdxANayPvktCpLJ8i949OXEtZTthTiESWs5At7YDF4/oc2ipxx2YfeWgaxXGiOX5V+jrYPg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyiv/a0HtLm+0yn6/oJL5MwQnvUfuN+GJX6+rjvY9yExzAXRXie
	kWd/9whgBeYqa4LmzA6kVd8thcEp6jQKukbL8ugfF6ElkEImFBkxLycW8YUznAiVBZjgQO5E7S3
	VuNp6RytXMVu4se+Z81b/Kd5q+N5OxUKs7Sn31Imf
X-Gm-Gg: ASbGnctNS5Mp9hQVVJGRE+c+jbV0QXIpp8l245ujE3oZ07zHyvhOWokXXgxIWdp1wXf
	2SHxEy4zMagYjMZ1tzv0lshCksZY4GaDGi3WfvrVga8J43VpmA2BmnTvMNMJKeTT8KGrsTGamLt
	njdWMH4P5XSnBeJHrGLBwrJ22/hJxlMWmhVRSGk5KdG3LmVTRZrdGcb6etolhp4WqGvRhUNZDDo
	bJsel2bNFgTWkRWkgUbyBu+G8zpW2pUbas6Qai5iJ6xolJHBFNtfYGZMySTswV8E2aCsrg/L4ux
	4f0Y
X-Google-Smtp-Source: AGHT+IE9gYYzPKMq/O39jU326Si2Akb33AeMLL8cubDSQ+2vBeBEBeXGI8bDW2mpHwgpdpq/zpV+YJvvgAelV0Pwp60=
X-Received: by 2002:ac8:7d86:0:b0:4ee:1d76:7341 with SMTP id
 d75a77b69052e-4ee5877ff3dmr253456321cf.0.1764130595900; Tue, 25 Nov 2025
 20:16:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126034601.236922-1-ssranevjti@gmail.com>
In-Reply-To: <20251126034601.236922-1-ssranevjti@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 25 Nov 2025 20:16:25 -0800
X-Gm-Features: AWmQ_bmXarSOp81Ve-cbGptK6TBCaEvFMNlJhTrWzIKShnh1fEGLw1ykQvp60is
Message-ID: <CANn89iLiCh85_1Ah6O_rTOCGwLet97f7DyfyZMDgfTV==iUVUw@mail.gmail.com>
Subject: Re: [PATCH net] net/sched: em_canid: add length check before reading
 CAN ID
To: ssrane_b23@ee.vjti.ac.in
Cc: socketcan@hartkopp.net, mkl@pengutronix.de, jhs@mojatatu.com, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com, 
	khalid@kernel.org, syzbot+5d8269a1e099279152bc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 7:46=E2=80=AFPM <ssrane_b23@ee.vjti.ac.in> wrote:
>
> From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
>
> Add a check to verify that the skb has at least sizeof(canid_t) bytes
> before reading the CAN ID from skb->data. This prevents reading
> uninitialized memory when processing malformed packets that don't
> contain a valid CAN frame.
>
> Reported-by: syzbot+5d8269a1e099279152bc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D5d8269a1e099279152bc
> Fixes: f057bbb6f9ed ("net: em_canid: Ematch rule to match CAN frames acco=
rding to their identifiers")
> Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
> ---
>  net/sched/em_canid.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/net/sched/em_canid.c b/net/sched/em_canid.c
> index 5337bc462755..a9b6cab70ff1 100644
> --- a/net/sched/em_canid.c
> +++ b/net/sched/em_canid.c
> @@ -99,6 +99,9 @@ static int em_canid_match(struct sk_buff *skb, struct t=
cf_ematch *m,
>         int i;
>         const struct can_filter *lp;
>
> +       if (skb->len < sizeof(canid_t))
> +               return 0;
> +

Please keep in mind that this test is not enough, even if it may
prevent a particular syzbot repro from triggering a bug.

Take a look at pskb_may_pull() for details.
