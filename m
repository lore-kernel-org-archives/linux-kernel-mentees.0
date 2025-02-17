Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF0B224AE4
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 19:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739820486; cv=none; b=d+8x7vBKxkkQBjXw1u+lW/1CI0mBzD7FLf/R1ct0oR6Siw1Qfxsbt4kc/M9MENNthHEiQIiljCpiXMoBkekjOaIx2n7DkON5VkXt6YaFBc5OVtB06uVdKSZZn6oZ6cqmBpnjJ9Wru+pAG+2fDbYiKZekHGnzudN7KYUE+UO1fH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739820486; c=relaxed/simple;
	bh=LyT3d6pl8dOc75wJyXTBCKMnpWMCbXDQzq4dj6p5KzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O9l49PIzsawZLsL2jrlyb2ELC4klYPjlV+IWE3Y18+UrHmqqzwqX4zXvmgLidLlHSHczExlKbGYf0mDPCHUGtF7ge77VpWnuuYv6gJoarnf0AUCAh5TBIEXBS7gEXte2k7zZFXolbIbgG4wuUAYWZPnW1UzQEfgtgVvUnpmiPlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IupELpjl; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IupELpjl"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f3fa5699a1so551444b6e.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 11:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739820483; x=1740425283; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSJoXMSD/BhPuUY7LHZWqmM96m17Q8MN8Qrypab4Q8g=;
        b=IupELpjlcILqswvlOhjCupZL+sLOA7FF89P2Z3A4rirO1ZEVAZeVBXyn7OVGxvuRn/
         FOKN8ENtkF9YfWmEIYf0gqIwiG4BeaK77Ts7JTT+ujrNRegeGYonaTIqbsbzmZ+9byNK
         sGf/m5EU5wihiIgV/+C0PJf69ArYDMIJd16vVd5oQUv7i1KOdnA6PSmsG2WXmVyhX88S
         EIN0xmv60ZCx3VBv9pPK4/swajspY+8fSJWEbOp+9of4oYFA+xihj/CuBKuyGIdFU/pW
         GFWDi9H3SVlz7hKtBEMw4fWQA22lzh8xqh2KhMh5UHSri4/81sHEFuQmQ3dH/i7XECtI
         o0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820483; x=1740425283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSJoXMSD/BhPuUY7LHZWqmM96m17Q8MN8Qrypab4Q8g=;
        b=FsasTN1funuI53KPJHPCgcowtxN6OgLXfipNP3yyv36XD4Jce3/6/jkUkip5BJHHn5
         JUdptAZv3HUXKQo4ubcpFbVPjjwB6q0vWSLyitJHbS4Beg7e/OfjY93d7qWBaD0DS+aa
         iHSIO9YiOVTEXD5sA2S5npJCcsFHiHRmtVbAliVxij0oT2pshKd/6DD/JKDUGSN/Zee9
         49lyoupgJY834UxMJ3N9foGYJZQGQbo0vWF7T0ZJCE8zdeEg/XyX0lOZS5v9boQ7Dnv1
         QCKGGMhWQ0vAI0A22ZfZuDUUy7Mdt08Xpf3vtJItKyQnFvAMq1DgCgXo16cl++mofLO3
         Ci8w==
X-Forwarded-Encrypted: i=1; AJvYcCWd+YGgcwzcszv85NdBQcjAyfvkYGdj05YrTezP6GeA0iSenBaIa+elFY7d6bvlUaWdtKu9i0sv6sKPlvxLSRv7pPFVkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCptSl1IKR2qxYk/x6vq7UiE2XR1TekuJ0C5y4LTUWX+box/Or
	jjLUU3wQ/mTE3xGNwE5K7QHvYpmdzvlKjOpRCtJ7JoLyetYuAGnIi9mjCTzjPMS9DVhxqjuAW6g
	r8O6DDLpuCwRgMnsVpi4nd1ihJeA6vRd72ix57g==
X-Gm-Gg: ASbGncuuUcOeYpfdOTtDhNyP5r9g9LjHP4vD6riRYQqjmbU8A+WTOY2g6VyCaMZ2M1E
	RZPbwAkdjlrsG59rWAUU+GGcsZpUSsVSI2llHYh2LfcQ/E/4WlPPUjkhOEEE4OrXNHipRtGWIoy
	v9hnVBSAaANq8Wjw==
X-Google-Smtp-Source: AGHT+IGm9ugh/+vpeMXgXD2bHB5XzwZQCk7bMHiXA+RGS1g0x8Sg2j2oG3t6qoSbMODV4oAyTqQJtgMhF+ZMFpErejM=
X-Received: by 2002:a05:6808:38cd:b0:3ea:6533:f19d with SMTP id
 5614622812f47-3f3eb14109fmr6828138b6e.30.1739820482207; Mon, 17 Feb 2025
 11:28:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO9wTFgtDGMxgE0QFu7CjhsMzqOm0ydV548j4ZjYz+SCgcRY3Q@mail.gmail.com>
 <CANn89iLjxy3+mTvZpS2ZU4Y_NnPHoQizz=PRXbmj7vO7_OGffQ@mail.gmail.com>
 <CAO9wTFjaLBbrT7JKBBN=2NMhSRmxzPk_jLSuG=i6Y5anZJnvEA@mail.gmail.com> <CANn89iJmOKiALL9r_9+nyy5bdYwMUEX+LAkmswMyWwNC53yEew@mail.gmail.com>
In-Reply-To: <CANn89iJmOKiALL9r_9+nyy5bdYwMUEX+LAkmswMyWwNC53yEew@mail.gmail.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Tue, 18 Feb 2025 00:57:51 +0530
X-Gm-Features: AWEUYZk6r48x4i6IsxlCjOkM41q_b0hCqVHzJlcqW8Q7g_cEV57CFYtfCJPJNiU
Message-ID: <CAO9wTFhbK-Ckc3bq9X0qdKiyHVqsQgtzSu4RGzkd1d1aAK0vwg@mail.gmail.com>
Subject: Re: [PATCH] net: dev_addr_list: add address length validation in
 __hw_addr_insert function
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, horms@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you so much for the feedback. I appreciate your time and effort
in reviewing and providing feedback.

On Tue, 18 Feb 2025 at 00:51, Eric Dumazet <edumazet@google.com> wrote:
>
> On Mon, Feb 17, 2025 at 8:05=E2=80=AFPM Suchit K <suchitkarunakaran@gmail=
.com> wrote:
> >
> > Hi Eric,
> > Thanks for the feedback! I'm new to kernel development and still
> > finding my way around.
> > I wasn't working from a syzbot report on this one; I was just
> > exploring the code and felt there is no parameter validation. I went
> > ahead and made this change based on that impression. I realized my
> > changelog should have been more generic. Sorry about that. Also since
> > it's not based on a syzbot report, is it good to have this change?
> > Your insights and suggestions would be most welcome. I will make the
> > required changes accordingly.
> > Thanks.
>
> I think these checks are not necessary.
>
> 1) The caller (dev_addr_mod) provides non NULL pointers,
>     there is no point adding tests, because if one of them was NULL,
>     a crash would occur before hitting this function.
>
> 2) Your patch would silently hide a real issue if for some reason
> dev->addr_len was too big.
