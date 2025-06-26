Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A83018871F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 16:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750957168; cv=none; b=i3Gn52ZEBB00PIcBnbYBqav7mwYa+qqJuDS7M5ky2tBdMdnVvZC5eScz008cCjwYuj6yBh5t7hdUZaHT5UDN+GO30iK3NdGIGQgWX6KdG97SOXrIEH6cdj/ax1FjqcQfEZYkO8E4NADuUT7ZXKl5zTPcKzqKCxFZoi0m24CpmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750957168; c=relaxed/simple;
	bh=PvI5gHUwVIhFv2dtw/qoLeiyWDGk8BjmnnuVTn+txO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRHWMC4cq1w4OnG8/EfkSP/7FtxrKg55izSTa29xlk9Oz+qvAe7W2y59smUM6ZXiuCgvgtJddbVZRHhbWg7ezD6iOI+iKbBjTgc9MDf/2OPh9D2saOaUyeSci1O/bjIDQ2yj8DGeMuwyeU21XovXVVRc5+FhPTq8BVCBpSrmivA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V41ZoYpr; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V41ZoYpr"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D859840269
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 16:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4ATOTkoa3_5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Jun 2025 16:59:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1412D40261
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1412D40261
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V41ZoYpr
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1412D40261
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 16:59:25 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-2ea65f5a0easo743540fac.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 09:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750957165; x=1751561965; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3IEyo9WONKfEiyTgck650sXXAAvZTgQqrZBF8o33MA=;
        b=V41ZoYprXEEhFZxWLNZevKY3H2u1sU+YAymr1U4ie+zk+NsGowv5/GoSOnWzbHEzJ3
         1Ol2ddPCI8HPaV8foB7nLfi/aUAfk/ijHaWNcjeBvw3YuAqJLNc5ZB3ccuzdZr7Fd6/d
         2D9MHKqFXyvg9++N/lXOp5OiabnwSnrs/kChvhcrWuAB3Er/Z8BNIWKyWlTwQqSLKFmA
         RBSUAJCtUaB1fhGfFWI2PGqU1a24OrMuALdphtgfLmik5aDXmlSQrwoSzvocoR+rBv/s
         OFRWXf5jcbs9svKIPx+wg+jRAE2sKlWfgu3qgLsjQwMtPYUHmki0H5RD9fwDamXhbwLu
         nsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750957165; x=1751561965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3IEyo9WONKfEiyTgck650sXXAAvZTgQqrZBF8o33MA=;
        b=I2UIAhMFo/uChbHH8rMAPZaNU2O0A02mpj3GFY4KCZeE7dGRO7sxnb8lLWqPA9Jyqg
         C9LIA350PsHDUhDecq6hVXkuPRvjTktidAPACZg/GzMtBCrd5ZoZo7qFfleZUgeDLXmR
         0XyLsfzDPfl0SuhuBtlTnWLZNbaj49EGO0hE4QqYIAWq6Wve4HxweRyNY+6UugImfCv5
         EQLSn0x4W3hjUAAr88ROvHm7/xayOSrWmdhcoGxHF6PeEJyLBYaOfUgn7Ydd4AsIbRuI
         OmPMZffyuJtLsIo/rQ5GuchaghLiXwzpl+59T3hlbze16szUvOYjJNaHFztenpKz1yUP
         +BRA==
X-Forwarded-Encrypted: i=1; AJvYcCUNK1N+SezCgdbKfdlMRAESk3LTFhSxn7Y1+Q2A97NEql0Th36ekKUEf3GNtU7+OVl3Q+eHv19qucZ1NVOpNu13dW3IxQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxaaB2eXVn7Jex2wzxqqMgroHIpVltKTWCAtuu/7y6eZ1YzTZrU
	0FA3PGISnfoioe6iF2FkkMlMGx6ntWCIkLZ0zoX4cjw/cXvHABTrapxMIZd7Kl1d2VmGO6+yvoC
	46C3s5OEjjxqUp8/qkr+NITvMi20yciM=
X-Gm-Gg: ASbGnctb0AHQO4shfZngLkKLH7PPsxblSuFBq5XJgfI9FAQTYkTzLCtRhS6P8nzO6uc
	zTOPe6ikS6nNms47aFCE0ufAYT/IhBY6Ltox8KT2+KBmVcf/0GArXM0F55d/nbCkisZawRp3M5v
	zjTCw58+Q+OE4zNuHKU+jV8f92164ZbO95dj+nL6+Axnz0bpM9neLnWSQ=
X-Google-Smtp-Source: AGHT+IEmGOFpoBJAharVpKxEGP+kT3JHv0GhBnEjE6VvCorsSJEK8B6zcLb3kqary8KNh3C0IHg1H1hO+wnnQ1jZlEg=
X-Received: by 2002:a05:6870:304a:b0:2da:b440:5b1 with SMTP id
 586e51a60fabf-2efceee0bf5mr3184497fac.5.1750957164792; Thu, 26 Jun 2025
 09:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com> <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
 <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com>
 <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org> <CAPZ3m_jqnGJtOxff2cJre_qFLyOehbhZ+XVvE0BjzFv7ADqOAg@mail.gmail.com>
 <CANiq72kmjEEsBjbmJ1rN-OYA7Tt7N_0j6mEB0=DPK9ng7uyuDA@mail.gmail.com>
 <CAPZ3m_gGOy2XsiVaVbbAivwO0JBpgqMke68LV4OD+i2L1Z5PEw@mail.gmail.com>
 <DANRU0TC3F11.30DUO1LQZUE42@kernel.org> <CAPZ3m_gBEBfnCHtcFoga=HEi_acr6-eJ1a71VgrZDJbfrCz=0A@mail.gmail.com>
 <DAOMIWBZXFO9.U353H8NWTLC5@kernel.org>
In-Reply-To: <DAOMIWBZXFO9.U353H8NWTLC5@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Thu, 26 Jun 2025 13:59:12 -0300
X-Gm-Features: Ac12FXx7be057Up6x4A_gcxS91ot4-C2g3HC8fYFf_Yj3AZzUoT-Zesxpl6HZYw
Message-ID: <CAPZ3m_ge=epGKTuQEVqr81Aq_xTa_e4Yjo_Bn0Ox1cb+zEZctQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 17 de jun. de 2025 =C3=A0s 04:18, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Tue Jun 17, 2025 at 4:49 AM CEST, Marcelo Moreira wrote:
> > Em seg., 16 de jun. de 2025 =C3=A0s 04:15, Benno Lossin <lossin@kernel.=
org> escreveu:
> >> How about:
> >>
> >> // - `self.data` is valid for writes because of `Self`'s type invarian=
ts:
> >> //   `&mut Self` guarantees exclusive access, thus no other thread can=
 concurrently access `data`.
> >> // - this function is a drop function, thus this code is at most execu=
ted once.
> >
> > Ok! =3D)
> >
> > I thought about using "so" instead of the first "thus" so I wouldn't
> > have to repeat the use of "thus" so many times.
>
> I personally don't care about repeating those "filler" words in safety
> documentation. The clearer it is the better :)
>

Ok, thanks Benno!

> > Final version:
> > // - `self.data` is valid for writes because of `Self`'s type invariant=
s:
> > //   `&mut Self` guarantees exclusive access, so no other thread can
> > concurrently access `data`.
> > // - this function is a drop function, thus this code is at most execut=
ed once.
>
> That is fine too.

Thanks!

Guys, sorry for the delay in replying. I traveled to my parents' house
to visit them :)

I'm sending v5 now!

---
Cheers,
Marcelo Moreira
