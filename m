Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2FCA31
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750034225; cv=none; b=TB4oCumiivHgRDvTGF9c+ekdUAyUS7gzTyom1lGoczPCQwmnmvNERUogjj9VHIZ660QAJD0raM5hDvXFcvfyZfXbzKKJKtDUqCWrOJr74W6MXOo4AGTPcwtxJsG0gzcpY1MaUyQ1ZMDLnloR69uhIaZQS/vSaWPqMw0MWYpnI50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750034225; c=relaxed/simple;
	bh=joLQgy7THiby9YEil2XE+UIzDZdO5ZO1IDZZdJ4KNFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhhzXhUAXM7D+24NmkoHezAVDYKTw7bs87+DVLTRy47Lz3M6T5uyR3FrsaQfUJM0dZ5gQMQXiuR67K56YQBrCQBmT3WsPb4mXqPmtamulSx90c6m/knDc2tH5D8cI4cpdocr8rz4E4wTA4Dc++sKOZjrWEDz3X/WiUOeZozoPtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kI0idj8J; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kI0idj8J"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACF9D404BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 00:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RurIr4plb_63 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Jun 2025 00:37:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C90D40473
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C90D40473
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kI0idj8J
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1C90D40473
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 00:37:02 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-2db9e29d3bcso1425484fac.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 15 Jun 2025 17:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750034222; x=1750639022; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mVUACo6+9Gx4ugBjFoGWxOae7iusvYWHl18i97oElg=;
        b=kI0idj8Jeud5snPAC+Jomu0CCrgGwgMOglEgirfjDMC407LqCLV1RB9yVTbkt1dXFc
         D6QNy2cuHXNVECUX3xBXPO+TXcM3IV+JkICdY/yUzTJWZmXRm9fl10CN5HF2BdFKL629
         l8BnjOtrZjdumTkVnx42qzPZLcrfku7xSLLzLctgB+Po6Gp8pqbGxDDSxKjPkdKwXlGd
         CnynZW26EWnGQTemjtfblRqzpPzsDmbjbeu4mGFd9OMsggBDlmNO1x07r5/VHG7mkbak
         R6t6w4jHr9yMC2sBN2Ys36IPGke9mDfxIMbPej0DKrUfI3i80RZKmJ9c2Hg+DWR6mI6W
         CApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750034222; x=1750639022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mVUACo6+9Gx4ugBjFoGWxOae7iusvYWHl18i97oElg=;
        b=kbDtVlvDq+G7CXWBBhR5bNzuzBzGItNK/rhqz508HHxRzLePtMrleHrw/VovuQTMB4
         HXLJ3kuIXk7OFY4Efv503GULEuqjBoWgOOfqvTrRvHHxbvj+JvMw5h7htzbBWFCsMWhC
         tmROO2ONogHG7DNjCixziSWMyOGJkamUJPMBjEr4b4u/6ZvDjQr1Oi0oC9hygpNhQDP0
         4042oomW9WDmdRW2CvIQNk/xO8i07YIQbaZoiFZO4Lk8L79KkqphL/RG++rJcMNZGTIs
         R0EjPRDTYM14r3M5/oO7DbTx9lhsYKYe5lAGfIkj1qUbTEQ7nBa0EX6+p5l4Jwe7t7Li
         gBwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTmiNNoxeqPLiQTV6n27NRpmM+FfzzxAh20X3tvFUVpF74Un2B1uYsVcltV01/sLXIgvMsBzvGe/auViao1klpLJCJGA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwD+sWNgwmby9ljlQ1eeueVbuyVkgfGLohpgmCkA7YCI21YWhNg
	Sp37h0vrAt2q0J2AZMcjugN2TpPOsEMIDZJjuLfAtQaw78RffQiKz8iPHR3Z9L1F/gPqhQuRWlW
	vrof9PN/ICtbtDjKVLSWoO8t9SR2jUx8=
X-Gm-Gg: ASbGncvRoTjGMZnA3nlVhWDOSAqEVfgus7BNExdeABkTbW96gSLNFtC0RQiNAxyjQzQ
	3bq3dsCD82dctbv9IcCALa+T0pEXAbaW318G5hXu3VFqDamUXFJKZ8vRKiUkLvQYnWU1BNGFsp8
	rQneCsm6hZyfulfVZ5FR+fTfzjPB+X4DusN0dBz/WW6cLqdIyRzR+7G08=
X-Google-Smtp-Source: AGHT+IGOCMr7c17nTnYwUqCUXcZIVYQ0teU95JAAq8GgJ/n6VY0v3t/yjPcSZ74yez7WQNGIcGpkX2yVzpHSb2jQPiM=
X-Received: by 2002:a05:6870:788f:b0:2c1:62e9:584b with SMTP id
 586e51a60fabf-2eaf0c3601emr4231533fac.39.1750034221910; Sun, 15 Jun 2025
 17:37:01 -0700 (PDT)
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
In-Reply-To: <CANiq72kmjEEsBjbmJ1rN-OYA7Tt7N_0j6mEB0=DPK9ng7uyuDA@mail.gmail.com>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sun, 15 Jun 2025 21:36:50 -0300
X-Gm-Features: AX0GCFsVQqQkD7Evd8g0Xb8nPlD8DXHyXbZOmujybNwPgKWP9L9F2HDN-WGqnzg
Message-ID: <CAPZ3m_gGOy2XsiVaVbbAivwO0JBpgqMke68LV4OD+i2L1Z5PEw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 15 de jun. de 2025 =C3=A0s 05:38, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> escreveu:
>
> On Sun, Jun 15, 2025 at 1:12=E2=80=AFAM Marcelo Moreira
> <marcelomoreira1905@gmail.com> wrote:
> >
> > what about:
> >
> > // SAFETY: `self.data` is valid for writes because of `Self`'s type inv=
ariants.
> > // The `&mut Self` context guarantees exclusive access, meaning no othe=
r
> > // thread can concurrently access `data`.
> > //
> > // - `drop_in_place` is valid to call because `drop` is only called onc=
e.
> > unsafe { drop_in_place(p.data.get()) };
> >
> > I'm not sure if the line break in the comment is okay...
>
> Benno likely meant to use bullet points for each one, rather than a
> bullet point after a paragraph.
>
> If you do e.g.
>
>     git grep -A5 '// SAFETY:$' -- rust/kernel
>
> you will find examples of that.

Cool! Thanks for the command Miguel =3DD it helped a lot.

I'm ready to send like this:

// SAFETY:
// - `self.data` is valid for writes because of `Self`'s type invariants.
// - The `&mut Self` context guarantees exclusive access, meaning no other
//    thread can concurrently access `data`.
// - `drop_in_place` is valid to call because `drop` is only called once.
unsafe { drop_in_place(p.data.get()) };

--=20
Cheers,
Marcelo Moreira
