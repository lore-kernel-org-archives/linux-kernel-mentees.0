Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA3127A103
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 16:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753201322; cv=none; b=kkM7R2r08flbylmgF4Gt+DVVqvwRz12FpBHCiCdP7RS4ou+sAVm109hwZA1s9dtiONP1F5j39hZhNVxQebjvZ9S137LFxgjunGG463pPW8xS6bDM5zf7EgEAz/mv/e58Pksp5J4aGrvnvk0Sq6PCVSQYk5/HhXKplET2/60tkw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753201322; c=relaxed/simple;
	bh=gCgFWhgVPls3nS3d3Hjwing6Ok1m6HRQ0NLENS33B5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5/mY57K2Zq6+dYjTnpSZ4lclPJYUzbgC3zBRInikX9d2HruafCwgFrJo1vtQZph0nv7iKhsmi2H1Clen8C0cDRByI/jWu/hRkB9GJQUdrggM9PclWRQM3SmiMzDXcPGR1OrwxrzNuth2cw8epVwSFH35sRCXFKyoNuNCPqkbqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLrnJbM5; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLrnJbM5"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-613a6e39f52so2238128eaf.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 09:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753201320; x=1753806120; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YryPN4yfH4WyEOcopSfR/NDvMlQ6UvyM4OKGNmup5s=;
        b=BLrnJbM5uW0d4iixrqw9dBpeP7uxPKuSU4A08v978G2NN8DI5HfqqMNlZXA6igoHlh
         +QaT11yaB+fDz/QKoNGW4WEjaMY84SkEvtiJxe1zZbqsWy06bxxZJHVFYoI59xz7DAix
         G6+2W+XOWMBKU1avrDEpZqpFZsPsLImaPfYdVlIyYxCEEt3umi5pBNF3LSE1V5mK8NSH
         3dPqfbPdy2C4a+wX4PLnBcvYNOe//lhY/Mj8rbrP/BQwIEkTXuni5WSIVO3ma4jNQNzl
         gHwfrQnvjzvffo9WAqdXLz9bY0pCc8XG98t+bn3xhThDI0zZcrdTJV+xP28Sqp5TP4wk
         PbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753201320; x=1753806120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YryPN4yfH4WyEOcopSfR/NDvMlQ6UvyM4OKGNmup5s=;
        b=BRt1iLfqRvYXNFyVvcnz7qMpuE7c1Bwv0OnQoiyU8HV81GoMeCzCjvz26fx3lgVd4l
         rrwsrD1lBJ3o+MNTMkN6vwsTIzE3jEfG9vv1VN1WRFGCr/stIJ9/2Yg+Znu370mPTxHC
         ehwzx8zb0tZbNXrCU4bzIvJmDZ+PswjZxtmr0BPwfbclMQg+7YxHwrcKCgBVfV2RG+XQ
         i9FY3jmR369CBwZBKfYqj02Jn3ugtjMM2fFOWBoWfy/OUIu2cDgoi36AD2sSOEzLo0xM
         /CRhyAtbtB21atEkNUhi63Uuj1NE/6Zs1zrr/Z0CfkcXBIiJVksJI9Wn5V4peQ1KkSFg
         Sf5A==
X-Forwarded-Encrypted: i=1; AJvYcCVv84/lFLACvv+DhXW1anysPHJCyH0zuSO/waBoHNOEJZsKGOnYTCCBL4xUIct4Eer2FXo9MGsPuRx72F6fBhhxywmQAw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa0zteJGGW7Fcwbff6n1E2e2SKtLj1gjupTcqVxCApkz+1u2z+
	mLYDm3Yw4Ebvo6VjuKiwmyFLW4o3WlOxUTA64QyTjyyu79UIP/z73OA0x7xuZKmawD3jiYxaf1G
	2WO7yX/pGIV+/f7F5UbGTE5wSNpSNR5o=
X-Gm-Gg: ASbGncsH+pxMvaWGDqI257gcLqU4xiJS6Kgh8WAdZzr8V9sUE8DuDDz1EkUbedA6Oe4
	Ezj+rwIFPorI7hqUuoBE3gr/8q4Go/UkpY3ocVogySmYdSpssCPpZGfe3Bx5JGTj7RND3mX4LHe
	qBR1SIlEj+UKlM3cexY5qLDTefR7ZEV39jV0Xwc5dybTPvleSN6eslgNoRgvFt10IblHia29ZUI
	FH54v/+
X-Google-Smtp-Source: AGHT+IEYCkCjgB9Gt/JFQzRKjHqmBKW+mGcW9Q9RRQw2mBGtJaG4K7OEwqB8wQyZTLnDusT3/VRax6jkddmgqLf3rhM=
X-Received: by 2002:a05:6871:7c12:b0:29e:2d18:2718 with SMTP id
 586e51a60fabf-2ffb2461d4fmr19477640fac.28.1753201319966; Tue, 22 Jul 2025
 09:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722071508.12497-1-suchitkarunakaran@gmail.com> <CANn89iJgG3yRQv+a04wzUtgqorSOM3DOFvGV2mgFV8QTVFjYxg@mail.gmail.com>
In-Reply-To: <CANn89iJgG3yRQv+a04wzUtgqorSOM3DOFvGV2mgFV8QTVFjYxg@mail.gmail.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Tue, 22 Jul 2025 21:51:47 +0530
X-Gm-Features: Ac12FXyt_g0McvdgL7IcCP1m3sdm0u0AQxMmgF5qAK_fUZg0rFYpq8SaHTzO8kc
Message-ID: <CAO9wTFgzNfPKBOY5XanjnUeE9FfAGovg02ZU6Q1TH-EnA52LAA@mail.gmail.com>
Subject: Re: [PATCH] net: Revert tx queue length on partial failure in dev_qdisc_change_tx_queue_len()
To: Eric Dumazet <edumazet@google.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, sdf@fomichev.me, 
	kuniyu@google.com, aleksander.lobakin@intel.com, netdev@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> WRITE_ONCE() is missing.

Oops, I'm sorry about that.

>
> > +               while (i >=3D 0) {
> > +                       qdisc_change_tx_queue_len(dev, &dev->_tx[i]);
>
> What happens if one of these calls fails ?
>
> I think a fix will be more complicated...

I did consider that, but since I didn=E2=80=99t have a solution, I assumed =
it
wouldn=E2=80=99t fail. I also have a question. In the Qdisc_ops structure,
there=E2=80=99s a function pointer for change_tx_queue_len, but I was only
able to find a single implementation which is
pfifo_fast_change_tx_queue_len. Is that the only one? Apologies if
this isn=E2=80=99t the right place to ask such questions. I=E2=80=99d reall=
y
appreciate any feedback. Thank you!
