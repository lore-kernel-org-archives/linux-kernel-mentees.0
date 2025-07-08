Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE4525A659
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 22:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752013487; cv=none; b=pN7RyW5sw43/+MnHOgIkDFH//y1/w4aHBpdyJcbiZTGuxIBWk04ZxKpaAsBJfjL/l1LdMhYYq1Khs23VFBIqTVBBrHG8lqgRvySi/RkCokEppGRfcY5xwvJS6k9cqbt76wB766FYrMvwCahbG5rrz3JR9GaV0GmMIM+nyCPqAVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752013487; c=relaxed/simple;
	bh=1IG7fym2wnRXLJOMKB00X7u5L7eu38piDlH6pEzjL/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVVvqPb/j0ZhBUK1AQ1g5n35SmhX/Jrol6O0mfMs2vDGQyYSbyFlrHSl5kh3/XZB9r6fNmI3dBnx/ozJMIZ5U273YQMf6HKTgHUlE+ddsb5P/Mxw2ODzkNxjxP135CE+SGs7uX86nGVYr2EKLQvl31Vb7GGoMP+skM25C2W2uKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJQBoZFI; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJQBoZFI"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C5D816EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 22:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wG444DSGjb_j for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jul 2025 22:24:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D219816E7
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D219816E7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MJQBoZFI
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3D219816E7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 22:24:44 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-610d86b3da9so1222467eaf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 08 Jul 2025 15:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752013484; x=1752618284; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwCnPHpixWh2MxDiEiUT8nt+4FfPoK+sTsuqRzuBJhI=;
        b=MJQBoZFICTrDP0PxP9w/Jnaj8hEK+5zqapIM3DmE7JrHhbD6Me5v8WdX2UFLZF3SD7
         DYwHWyJXA6fR9SrOb/cAewSBGy5gNFu5ddwP03gica/yPTM2q3bXSIOuvEgd0C2DMuky
         UOG3hgomEvGf9TXzGveq3qEXFfs1sklmHFikITVIIRfhCcEdG5+tBZLRItFPAoqK3Za5
         rfp+v/DXw0hIKyqBAtYzrtW0+B5K7y2WUV2tF7cWJw841ofVi3oyv5/ZIoRbcquo45HK
         239rC+in8fZKPuU1IO28eN8zrLlXGIZGAZSttw/6x1zRJlVMFYHWXNcRXLQoVW1qamSq
         ISPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752013484; x=1752618284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwCnPHpixWh2MxDiEiUT8nt+4FfPoK+sTsuqRzuBJhI=;
        b=IkPPLVt99cflDJ8kF4ayOxNJpbpq1C3ZtkES7bBjXu0Uhx/IVVMRtLJSorc8M195xt
         8Dc7p7PMJ4h8egJUXiGdYlS2gNyBE7BYi9+6FTvTD6/BuPSO29Lv0YDwW5VrJZMusTWp
         pAChdu35VIhqiOBc1huRAXCvdFZrzbnFnFVEr01zZva6dHy86fz4qswh6x33s919P6TD
         d83XXZ0IV0HfT1I8AoeO9YgWQbrIyiI7rfaGFir5JanjnPH6idXMNNnIJMqr3ifVjqLW
         Jy6ieYVLuttxYjz67Fx5gQhI2eZo9PM9MZTkAiD4SzK8FG2JgR6WMk4VAfE7hjYnvjfm
         j2/A==
X-Forwarded-Encrypted: i=1; AJvYcCXnurFC9qs0SFXgZlfZXnCqaEMZVrVl5TYRdiYd82R/8EOC1JOIPiZKyaVNMnFgetw9mExntUkhr/VAH2pEWISVVQTLjA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxmJHqPyRJsRwGJ+HqC94rvQpENIj6pDCw3EIYvl49e+CFXKE7k
	RoBTK9I5EnMZjTJv0yMN0UVTBqfFkZCMQv/vNrlyM/tRDVxhVfUzL0eDEvQAwQURSWFUOvmwwH2
	Da8TDkXprzknfSHsKcFcfHuFhyppPVU4=
X-Gm-Gg: ASbGncu247rZ6U4aK6nqp1Ex8ja7m/4YZvsoHA988tvA/qiXFrhcyjgcwN5Ymt+QIon
	bTI8EnH/mvxZsJuT8gT9KtDg5mgbb9AVlJBn6W0NRCJA260PN17l099TanLefjqWx0wLAcugnis
	hVwAbYXbwogLgd9tLTttbvWaBZVNjROW5YC2y52ZOwleJB837rAb8Bjtg=
X-Google-Smtp-Source: AGHT+IHXuecyrSKj57EyW4OksWUY/S1xTwgoQX541RUX9ZLBb2rY2uaGobqt+FiwxgvLteid6oifLoyEpnXA2/UEq9E=
X-Received: by 2002:a05:6820:138a:b0:605:f34d:7e00 with SMTP id
 006d021491bc7-613cceda6e7mr88768eaf.7.1752013483820; Tue, 08 Jul 2025
 15:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
 <20250708003428.76783-4-marcelomoreira1905@gmail.com> <DB6RKSNTHUZ8.DW0EBFDU6L1I@kernel.org>
In-Reply-To: <DB6RKSNTHUZ8.DW0EBFDU6L1I@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Tue, 8 Jul 2025 19:24:32 -0300
X-Gm-Features: Ac12FXx-fqgCn77oYJv9TW6Ruc92PZPIwM2ZiFegyDapKQeHs_V0sX1d4fV5QuE
Message-ID: <CAPZ3m_hArv5MA7H4RYRj1FHUaaFF9+2QAuo03xhUKGQ-YZ8uFg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] rust: revocable: Document RevocableGuard
 invariants and refine Deref safety
To: Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 8 de jul. de 2025 =C3=A0s 12:04, Benno Lossin <lossin@kernel.org> =
escreveu:
>
> On Tue Jul 8, 2025 at 2:33 AM CEST, Marcelo Moreira wrote:
> > Improves the `RevocableGuard` documentation by explicitly stating that
> > its `data_ref` member is a valid pointer as an invariant. Additionally,
> > the `Deref` implementation's `SAFETY` comment is refined to justify
> > the `unsafe` dereference based on this new invariant and the
> > `_rcu_guard` ensuring data accessibility.
> >
> > These changes address feedback regarding the clarity and completeness
> > of `RevocableGuard`'s safety guarantees.
> >
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> > ---
> >  rust/kernel/revocable.rs | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 6d8e9237dbdf..64fe44b4f5a3 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -233,7 +233,8 @@ fn drop(self: Pin<&mut Self>) {
> >  ///
> >  /// # Invariants
> >  ///
> > -/// The RCU read-side lock is held while the guard is alive.
> > +/// - `data_ref` is a valid pointer to a `T` object for the entire lif=
etime of this guard.
>
> This should be:
>
>     /// - `data_ref` is a valid pointer for as long as the RCU read-side =
lock is held.

Ok, I will keep only this comment. Thanks!


> >  pub struct RevocableGuard<'a, T> {
> >      // This can't use the `&'a T` type because references that appear =
in function arguments must
> >      // not become dangling during the execution of the function, which=
 can happen if the
> > @@ -258,8 +259,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
> >      type Target =3D T;
> >
> >      fn deref(&self) -> &Self::Target {
> > -        // SAFETY: By the type invariants, we hold the rcu read-side l=
ock, so the object is
> > -        // guaranteed to remain valid.
> > +        // SAFETY: `self.data_ref` is valid for writes because of `Sel=
f`'s type invariants,
> > +        // and `_rcu_guard` ensures the data's accessibility for the l=
ifetime of this guard.
>
> This also needs to be adjusted.

oh, of course, &T is an immutable reference, mb.

What about:
// SAFETY: `self.data_ref` is valid because of `Self`'s type invariants
// and the active RCU read-side lock held via `_rcu_guard`, ensuring
the data's accessibility.

--=20
Cheers,
Marcelo Moreira
