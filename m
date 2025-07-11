Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A65D220698
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Jul 2025 23:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752275198; cv=none; b=IaUS6kiI6Ekm+BWo3tZvuX/cCEZAg6RlHleY8SJWJWXFSO6EJ+yrikQE0ef3dm6bJsyjkJiFHQf9runZwL7y90BgZtxqmkJDkIISZdla7Q3wFHZKFQEz+g03WHNCGjDzmPIGzaztyIM96gSaKClAdU1tUr9L84HYDW9KS8T03J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752275198; c=relaxed/simple;
	bh=J/++C16moqzoVlTP/lf6R7gUE8NX9kZrPP/iXEkky6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTLLSBVk9+HG+a62/y1qsSCMyexXmTXbUsorvCcBAtjkJb6VFj/rU7htRpsWY5lkoLwsM3WGaBdVXjwUmMmE36le1FFQL10/6heeEbUOhJNA2Nns7O+5XxbjIteSAIdYjjARz02dItLSFVRJw/lfFxij7OrkWdDQvHsdL7BW1Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7xxk7f0; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7xxk7f0"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9A57611D8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Jul 2025 23:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgire5V7WIJW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jul 2025 23:06:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D15E611D6
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D15E611D6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K7xxk7f0
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3D15E611D6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Jul 2025 23:06:35 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-60f0a92391bso1317709eaf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Jul 2025 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752275195; x=1752879995; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWlqIYZwfGa8IZ2J2RwapF8HBfqgCMjaYm1MCof6FIQ=;
        b=K7xxk7f0ugbok/VogGQTZdlUcjSD7B1VtmsTrtg3kr4aGZIIzEjpQBfF8FYnc5tzOT
         Ixme/u8NwjaBEf0L/I27JMYVnncbqnVDOQX01r+NXFJP+mvjTJYb/HOaumUF7KltjnsO
         n9c2DVoeChC/u2VsGLlXTnFP3MCkLKuYY+IfUzVRLr3MO9zCPbS6XQJLi+4ZbMJtBZ4S
         WcEMCRUlzGa7q6l3K6SEjKkBtROXEvkAwaEFy2xguMiZ4apJNxoB6hnNCSI26ffEJEkY
         mA0tMuiThzN/RKBY/MaY4lcAJIw+aH6ZKsk9W5IBg4pqK33rss/B3b7RI80oEwdY7qps
         CaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752275195; x=1752879995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWlqIYZwfGa8IZ2J2RwapF8HBfqgCMjaYm1MCof6FIQ=;
        b=Haiy45AWxHdEyyHRA68PmO56St8RG40Bt/z8MMcTEfhxzND5PAPyWiu7UObzmX/RhR
         pHbISnSFz432dyOViMhaLebiswgpEN6wZKxok63USvh3Xu9eoQLpT/GYS3D7t/5+5Puu
         j8CyMTbNyock7/CN9y3lWU3YX9wfXLd0zQDfUzk7ox/XIl9RcNTMR/u+rcrf6BqF39ez
         GXwiFIK9yHs4e2Mjg/iNwIBrl3x7B4gsI76NlD1UQrEwWS8bOO63U1s4lPN3eofOJeFJ
         qJB+ZZhQWuS3GB5ZmI8MQlCyU4Oq2WFMSUktZUKZ50ZsSlUQ5VU/xe8tEp7Wds8KRyx8
         uTKg==
X-Forwarded-Encrypted: i=1; AJvYcCWwoEHleLkoSbG+7mpTmL0dR8aYFC697yA29JL5f3CajWIBfJrqCTBzsdNn9+EElnZq8t1Xf5xtxXV7OB6j7OcgHnvFcg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzG6Xy1fHWldGAyDAxk2uNnDuPSdyczltflHUpKnmw2P5luiwNF
	uxd9BBh9PAmDdvx3lQN7zLb6dpFMlBlHj9T3bpwyXQ0USpV+mCGqAU7pJgv9OsI6boab+nLNiam
	J7h62DlcrOTAtPxNdQ2JX5ML2lTqHuf8=
X-Gm-Gg: ASbGncvNEs8Qm9kdTc1zMb/3TjprEXKiK8rZXdCSF9L7auFdpE4hYGj5slSha7QBSTP
	ss1W6UNVgEUhOpibny9Sf7s87SmbarfrsjsWE+adDPosM5HR5ptGEjZ1AlLUcbypbIcXdxK6fg+
	nfg/XqRSHpyINk/MCrYEPMyqJlAoWEnyMUpOTErST3a5mmdru8LkPQOVpR6i7+U96rmFJk0ybf4
	XVMQUasCOk3v3dPBSY=
X-Google-Smtp-Source: AGHT+IFJW4CNOJIr7R4b/bnmKJzlSe/8G7kLjgFbHM6LcEoZA2rwemd08UYr0qBm7b6KD/uCu1Ld5IFttmtDdwNIyVg=
X-Received: by 2002:a05:6820:1e8b:b0:611:bdaa:5b01 with SMTP id
 006d021491bc7-613e5fe0d17mr3699787eaf.6.1752275194951; Fri, 11 Jul 2025
 16:06:34 -0700 (PDT)
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
Date: Fri, 11 Jul 2025 20:06:23 -0300
X-Gm-Features: Ac12FXxXlwtkZCWJ5lCeCujefFf1sbVg1hNtETD5qV_PoYfkB3WUhZoxbNybb74
Message-ID: <CAPZ3m_h37mCRO7oZX3qLnc+iFNwUu_wgYqEu_r0g-gtOB0661w@mail.gmail.com>
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
>
> > +/// - The RCU read-side lock is held while the guard is alive.
>
> And this invariant is unnecessary.
>
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
>
> Also this patch should fix any invariant comments needed to construct
> `RevocableGuard`.

Regarding this point, "...fix any invariant comments needed to
construct `RevocableGuard`."

I looked at the function that constructs `RevocableGuard`
(try_access->RevocableGuard::new) and I think it's correct.

In `try_access`, the comment justifies the validity of self.data.get()
by mentioning that `self.is_available` is true and that the RCU read
lock prevents data from being dropped. This aligns well with what we
already have in try_access_with_guard, for example (from patch 1/3).

Since there are no other code snippets that construct
`RevocableGuard`, I thought I'd submit the patch with just the
adjustments I made previously.

--
Cheers,
Marcelo Moreira
