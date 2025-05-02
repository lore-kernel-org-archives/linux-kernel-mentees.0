Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525FC256C83
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 May 2025 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205837; cv=none; b=BtNBZCsyoEh2pVrTqsTXqIeNQwyGzh7OxB6DF9iFOvV2Vp2UnNUQFShNX8JOR34l4QVaPt6V/S42otY7nMVSK3GsTnro9B2U8PrzGLHP6xB/1YeQhsGnY3ALvs6FY908+AyAZ3MMLjEOIANwyIYnYBd+pB8Jjly1osGEjCKCW+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205837; c=relaxed/simple;
	bh=+mCW1+76e5xHRuEqyjehg8HmtpCtT+in3WELINhexuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s8yAeBCntHLSCcYMsWhEou8g3sS4AwGyThGkOK6mLOuXTBXR3A6fGi996zjxyXVEDoTH6QOCnc+pbU+wUxiM/gu1OucF+i1w6gc1DBpzQZyOh3bGUtgd+VlinvFpf62AOmD145JhfxXHULykS5NwgclaSEHtfZaAlEeYZN9Zkjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agszOetY; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agszOetY"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E77A0411C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 May 2025 17:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WK3SttADmH9w for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 May 2025 17:10:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE36A411BE
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE36A411BE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=agszOetY
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EE36A411BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 May 2025 17:10:34 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-603f54a6cb5so1419610eaf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 02 May 2025 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205833; x=1746810633; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mCW1+76e5xHRuEqyjehg8HmtpCtT+in3WELINhexuk=;
        b=agszOetYv6R37y1R0GFDjnAXfbThi06mBeH+C8mQh20KNKfPCLEFalt3mWYV2ODPL4
         VxNiheUluri94Bzvx3oHdylUfXjkNnYB+iuZugAL7nGTkNel6lutxjJqTFQOGKKX+Gwb
         myX6Uv9qjetm4nhwjg5G7jZeAxIa2J6jt+SZSOpo0n6aG0bFCcO8V89RqrnVgCn7oE7K
         ey+b/cPY9siiHspCvmwiV5fO1ZnR1ggGEv4YQxr3XUmrFg5s4riX1dDlDJY0QMSDrlDn
         2Pxno5qCXK6X+lyKj8tphM7GSSvJVetr+nH4XbJi7kNI586OLi6Uu6NriyvTpcuxLoh+
         /TpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205833; x=1746810633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mCW1+76e5xHRuEqyjehg8HmtpCtT+in3WELINhexuk=;
        b=aCrZkEdDSPdCD+TxIYj2L5bDjVnj9HdFWyGEmOUsiV/AR9VgbErIs41OoyzXTzN99s
         uUOO2iZPYSJXUgIPbNYojQF+Udw7xig/OvCEX1Wcu4Dhquqe3x4nqtDKx6PCAOG4o4E+
         HhTpSdoM3kwanuAFyzAURQNSxYK6KBJVzuRuMJaY4KMu9krZFd7L7ca3kfCAGNBKE3Dc
         SU/NAYPgLOIubTZhxw5CjfTviknk0qmEJEDeESBEUzzliQ9fLuXwSAXlQM1sUzhasYXy
         WTp0SPl6w4KmjgrcfZdlsQsEqi/hq61HU6ZjxmC6o0YmzqGI83gQkoq1WIy+r6QcjdWf
         nOjw==
X-Forwarded-Encrypted: i=1; AJvYcCVHC7Q2wR+QvpRnzgXcmkCYaDwLVeRulXQ+AwWMGQ0wIAH079LjBnAgIx6QaL/hzHChW+7F5fVUVMFBqbPRu6JhsBG+oQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzgVZVMgE4Ee77tahtFfLliv8XbDLT6xg3/PUiZKbuCcXVgdwFR
	iFKcz9R6VBnQVWvrZfVhKdOQrd/bSTCJ/pnLrETRLo9u+dqzx5P+f46vn2q/hdbJFLKgQUI/3eg
	XRzkzyjKvn8g3KVstgX0LrdLy710=
X-Gm-Gg: ASbGncvBby4Zk1nEVeU2us42jmyXinuSW4Wun1vcKGa3Q37hmPzeBK7+NoN71QKO5aY
	wGszT7pNUIpQYSygkByXkvBqjNg8UTVfgCCCsjIDvBf8NGaJt8xd+DiBLWAYpZYdBhQ/BPzz5hq
	4LnJru+I3P6hB/wuhKXamotkvLyIPVy61GvklWBTKG0qWx
X-Google-Smtp-Source: AGHT+IGBjLoRP5XFi/TybTJQQzDLF855PY1TKjSDiBixDKTgpII8C0WppayNwNQrjDYR7dG1XQHUrDr7c5/KkxDbj0k=
X-Received: by 2002:a05:6820:151d:b0:604:6b0:c259 with SMTP id
 006d021491bc7-607ee7f2061mr1793809eaf.4.1746205833427; Fri, 02 May 2025
 10:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250501005726.744027-1-marcelomoreira1905@gmail.com>
 <CANiq72ncOnDVHCNScjT7Y5+-kXzGvtcia=LpS0h-MfBqBMuOWA@mail.gmail.com> <D9LI1ISOHMV1.2721CU6HG3SRV@kernel.org>
In-Reply-To: <D9LI1ISOHMV1.2721CU6HG3SRV@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Fri, 2 May 2025 14:10:22 -0300
X-Gm-Features: ATxdqUGYAajVGfZ8d16OG8TKp1eikbjQ9YaCNAxeyCnoe_X8b28qvdIp02ngQUw
Message-ID: <CAPZ3m_hZF7yz9OygKidkbmRn5EXdoqC-6HxrKRMxmEHL021z_g@mail.gmail.com>
Subject: Re: [PATCH] rust: revocable: clarify invariants in safety documentation
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, benno.lossin@proton.me, 
	ojeda@kernel.org, aliceryhl@google.com, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Miguel, hey Benno,

Thanks a lot for the feedback! =3D)

I now get what you meant about the invariants: it's not just about
documenting them at the top, but also about adding // INVARIANT: ...
comments in the code where they actually matter =E2=80=94 like in the
constructors and in try_access_with_guard.

Benno, thanks for pointing out the missing invariant in
RevocableGuard. I=E2=80=99ll add a comment explaining that data_ref is only
valid when is_available is true.

And regarding RCU, your comments made things clearer. Instead of
saying it's a hard requirement, I=E2=80=99ll reword it to focus on the
is_available check as the actual safety condition, and just mention
RCU as a typical way to ensure safety =E2=80=94 but not the only one.

I=E2=80=99ll get v2 ready with those improvements and send it soon.

Cheers,
Marcelo M.


Em sex., 2 de mai. de 2025 =C3=A0s 04:33, Benno Lossin <lossin@kernel.org> =
escreveu:
>
> On Thu May 1, 2025 at 12:18 PM CEST, Miguel Ojeda wrote:
> > On Thu, May 1, 2025 at 2:57=E2=80=AFAM Marcelo Moreira
> > <marcelomoreira1905@gmail.com> wrote:
> >>
> >> This is part of issue #1160 ("correct safety comments and documentatio=
n
> >> in revocable.rs"), reported by Miguel Ojeda and Benno Lossin.
> >>
> >> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> >> Closes: https://github.com/Rust-for-Linux/linux/issues/1160
> >
> > I think it was just Benno. :)
> >
> >> Tested-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> >
> > Normally one is supposed to test a patch before submitting it, i.e. it
> > is implicit.
> >
> >> +/// # Invariants
> >
> > We also place `// INVARIANT: ...` comments in the places that need to
> > ensure the type invariants hold, e.g. in constructors.
> >
> > Given the issue, I think Benno may have also wanted that you then
> > refer to the type invariants to justify some of the comments, e.g. in
> > the "Since `self.is_available` is true, ..." ones.
>
> Indeed, we also need the comments that establish/make use of the
> invariant. For example in the `try_access_with_guard` function.
>
> There also is a missing invariant on `RevocableGuard` that the
> `data_ref` pointer is valid.
>
> >> +/// - Access to `data` must occur only while holding the RCU read-sid=
e lock (e.g., vi
> >
> > The "must occur" wording seems a bit strange for a type invariant, but
> > maybe Benno had something in mind here?
>
> Yeah, I don't think that using RCU is even a hard requirement. One could
> also call `revoke_nosync`, since one knows the revocable is only used by
> a single kernel thread. I also don't think that it's needed for memory
> correctness, but I could be wrong there.
>
> The most important invariant is that `data` is valid while
> `is_available` is true. That's what's needed by the different functions
> accessing it.
>
> ---
> Cheers,
> Benno
