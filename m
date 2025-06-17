Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C75238166
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 17 Jun 2025 02:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750128585; cv=none; b=b0DLQcgpsRTwqKmZvMj8oZIeeMP4gzmx6ITLqOJzEZejs7Gl7xugvtSi/IXPKN++M5/opZ6HjfBtyZC1FFN+f2BkGiaDem2tuTmt+azxFpG6HPbRLDvT5DXTaRtp9Nlv/lA3HYqWO0Wsr2aYDKTQ+5k7CdTUaFWJtn3TFmektZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750128585; c=relaxed/simple;
	bh=FXNUw7yeVY2NYEpWwul/C0fMJY2N+bxoURgNldXvuXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8JeVEO18ZPIzeVqEZnnJH9J8tgJ5gaIv2ZQUW4XU1MwfvlFZoi7F8oGJYzY0XuScStlUX4jy9ezUhtIPXnS265ov65OME0Dl38BVKOhi2v7AsfGUbqdMzK8Myk1Y7z1kwVTDM73Q5zCCd3TTZq9RSLfmEsyrkmnu8PCVzL7n6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVensHkD; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVensHkD"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97AC78136D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 17 Jun 2025 02:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbY7hUae4XYt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Jun 2025 02:49:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04AFB812CB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04AFB812CB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VVensHkD
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 04AFB812CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 17 Jun 2025 02:49:42 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2db2f23f174so3678235fac.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 19:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750128582; x=1750733382; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrKuZoLKQyVBE3G7oUkrN4qf87bU7RKtVhLBpZ59b0I=;
        b=VVensHkDeOybdrOcNq5Up0RTBskw95j0nap3NqdCZXFSGzGscIzKU0dFOGuShTyoOB
         ZR2jgTMZwd5B7c2elsj7sxjE8dthUeAsQQMIVP98MLdLKIDQWB755m4GmYuK/Avx9rsa
         sj1kEurUwDadIaEmzXPqTjUE7BeOqd+sjVg5BmoRvmgz4JoFVEjTr5BkuJsvARWx9jGs
         QL3w3+pv4+bFDizFf49L7m4E+pVymcE/IpUcfSMitCTd0RrRLOAq3MlmjCrGFLmb22cX
         T5L35vcrjgriwkcn+9tHis0272sg2f7RJm19IP7Y4eFXYvSSkznpXqPm7nbb3uKqQ553
         N5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750128582; x=1750733382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrKuZoLKQyVBE3G7oUkrN4qf87bU7RKtVhLBpZ59b0I=;
        b=lLkOiV7xa5UVUMq+T2dCMuEU4WmEOJCNZO55wgRqj4UX1198YmZstu7aLfTb5zmYa2
         JuZU+h/8ALMdOFqEqAGcd1un4Fut/xpz8X3BbUShS6+tTHbApQ2T06DT9QiSdxUQTQWj
         iWkNoctEJZ6htbKi5PoMtOmx5MizbXYxj2ROksgc7sg3KSGDzvgvBXLlT6Hp4wtYC8+c
         D4dY3uDft7EG53bz+K77bMwl18SBotSKSsq8PKu28G2AqH6Aobq9TLyl4sRup353oOUc
         Xv3oIYCB5sbKkcwldLiFlA9or8wDkHXLBf+KW0SuebwSsZ0Fw3U1aURlQJ8YnEc1bR4I
         y91w==
X-Forwarded-Encrypted: i=1; AJvYcCVlm9xWkVdk+tNYU0senZVwEn9VrZWgSiQ2bwbYeobMwZbqErk4GYVnFGbq4vz2/Hdn8infsOaLgfT9W0mBOQrXrC+0fA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywk73p4ExKW3EyQTfYd4B6hn6rLSBW/Kvmr14wP6pZHuRGkqICg
	AdLVJ9psnUxhhwMjsIDtSFbDXIeSSSqpt4gcQmagmo33fQANzt7F+hg4e8iLlus885WJ4+XgP2+
	A9G8GqYjRotZmVQJAnSInPV9+3+E8vhA=
X-Gm-Gg: ASbGncs8YNa0KBh6mwCsC2RxZoRnfTHeOr+VL7VmTMLPpJdJYSwqmnVv0nvkpXOQnoD
	vgQD3IixhlbhBPAJAQYKL31/9W3cOCdBdbPPOHXMbM6w2qmEL021c5ICZZOwswyC6gZ3W0rolB6
	PAaANXd6dCWzyppa4TIcQ39aIeqjFFZT2ANmqdPp056SUYWL+4uMRZIEU=
X-Google-Smtp-Source: AGHT+IFejwIO9dY6XMEp/bdu/dNgvpFr+aI3J2fz6U41JNYwobKmy0algWqFcSrkPWQ0LDY1vrdNiJRwcZ7mc7a6oV0=
X-Received: by 2002:a05:6871:4048:b0:28c:8476:dd76 with SMTP id
 586e51a60fabf-2eaf0a9d1b4mr7228167fac.29.1750128581858; Mon, 16 Jun 2025
 19:49:41 -0700 (PDT)
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
 <CAPZ3m_gGOy2XsiVaVbbAivwO0JBpgqMke68LV4OD+i2L1Z5PEw@mail.gmail.com> <DANRU0TC3F11.30DUO1LQZUE42@kernel.org>
In-Reply-To: <DANRU0TC3F11.30DUO1LQZUE42@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 16 Jun 2025 23:49:30 -0300
X-Gm-Features: AX0GCFskDokQSpAscfqORglOnrGXP8TDoaZnyeqw65DQsMen0LygTqSdrvhxOO0
Message-ID: <CAPZ3m_gBEBfnCHtcFoga=HEi_acr6-eJ1a71VgrZDJbfrCz=0A@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 16 de jun. de 2025 =C3=A0s 04:15, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Mon Jun 16, 2025 at 2:36 AM CEST, Marcelo Moreira wrote:
> > Em dom., 15 de jun. de 2025 =C3=A0s 05:38, Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> escreveu:
> >>
> >> On Sun, Jun 15, 2025 at 1:12=E2=80=AFAM Marcelo Moreira
> >> <marcelomoreira1905@gmail.com> wrote:
> >> >
> >> > what about:
> >> >
> >> > // SAFETY: `self.data` is valid for writes because of `Self`'s type =
invariants.
> >> > // The `&mut Self` context guarantees exclusive access, meaning no o=
ther
> >> > // thread can concurrently access `data`.
> >> > //
> >> > // - `drop_in_place` is valid to call because `drop` is only called =
once.
> >> > unsafe { drop_in_place(p.data.get()) };
> >> >
> >> > I'm not sure if the line break in the comment is okay...
> >>
> >> Benno likely meant to use bullet points for each one, rather than a
> >> bullet point after a paragraph.
> >>
> >> If you do e.g.
> >>
> >>     git grep -A5 '// SAFETY:$' -- rust/kernel
> >>
> >> you will find examples of that.
> >
> > Cool! Thanks for the command Miguel =3DD it helped a lot.
> >
> > I'm ready to send like this:
> >
> > // SAFETY:
> > // - `self.data` is valid for writes because of `Self`'s type invariant=
s.
> > // - The `&mut Self` context guarantees exclusive access, meaning no ot=
her
> > //    thread can concurrently access `data`.
>        ^ spurious space here,
>
> This argument is actually an extension of the previous one.
>
> > // - `drop_in_place` is valid to call because `drop` is only called onc=
e.
>
> This phrasing feels a bit weird to me, but I can't put my finger on what
> exactly...
>
> > unsafe { drop_in_place(p.data.get()) };
>
> How about:
>
> // - `self.data` is valid for writes because of `Self`'s type invariants:
> //   `&mut Self` guarantees exclusive access, thus no other thread can co=
ncurrently access `data`.
> // - this function is a drop function, thus this code is at most executed=
 once.

Ok! =3D)

I thought about using "so" instead of the first "thus" so I wouldn't
have to repeat the use of "thus" so many times.

Final version:
// - `self.data` is valid for writes because of `Self`'s type invariants:
//   `&mut Self` guarantees exclusive access, so no other thread can
concurrently access `data`.
// - this function is a drop function, thus this code is at most executed o=
nce.

Thanks! =3D)
--
Cheers,
Marcelo Moreira
