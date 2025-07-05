Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9261117B50F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Jul 2025 05:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751692179; cv=none; b=uFD4ryVWZlvhwy0zQGh7avnJMe1eUi8Lm/BX9iPdd24evnq6GPlE8j5dpEl8Bhv16iWiQ33Y3lAeB9huVdTCPatDs5DCbagA4mCnKyC2C7nzlbo/TJNnVigkUWLLHDY5geopMB2UV3xCHtzGwN0zLJ6bG6qxwv8Cfkes4Y1b0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751692179; c=relaxed/simple;
	bh=3C351zXaKNZkvaAEmTZH4DhXiQkWrXqhX8EEeSNlyjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iX+ClguauXzbhLo+7KWSTONHmirc8m5nCCyP7HE14HtUS54zyuCe39MGeOsFAEolO6EKr+kNdiO9rHInfEDv+QYQCkfejgT92dBDk0Lu3trmplSfN/44mH8bIv58p8mwllaLKARU1xtF2RTlVgpqmCUGTMOmzj3MkY4Ulkazc4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwMkiJOk; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwMkiJOk"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A38160688
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Jul 2025 05:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lmLBPkUySR2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jul 2025 05:09:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7221260822
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7221260822
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XwMkiJOk
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7221260822
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Jul 2025 05:09:37 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4067ac8f6cdso1174334b6e.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 04 Jul 2025 22:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751692176; x=1752296976; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMci5qtDxPxCQhNXMosu45LJdV+xYetyKg8i0aR49bg=;
        b=XwMkiJOk18GLKasK6D5Aziv0PGFXiiPMrU8FYngn4uMiz4Auw6tVLy1qMTXgv5GQNd
         tVupiBF5kK5oyunN52Y1k6G2c2StFXP4RW06PxZIeXppp0Pp3qST0nsLAa3/ntBMTLrx
         eDDV1e05aPVfqURm0H7ohT6W1Q5osTV02m29NJzUKw7rkeAf4EYlqkX/sXbHbaIRbVea
         42kbUMV1ssGiOKvet9R8rP1tzesFQtru9JfM0wJlYxx427dDOhsiN0Wq1PK3NJXWhLFz
         Tc+gAp0raURCzkMoHtvk6kkAGIrTsxNZLX77yZLROLTBW7wZHztUSQuNVpK9gdg8STxu
         yr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751692176; x=1752296976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMci5qtDxPxCQhNXMosu45LJdV+xYetyKg8i0aR49bg=;
        b=Mdmj9iwGuQuqEbRE3VQ4UjfkkHvcYMb2jb4VWKylcUbr/noC7/iFoKpQ2PJZ1xQSSa
         undwm4eUbLCAkCspsjFr3HVWOHXdGI+W1PAlfBmfIE9tw/gT71ItYe6U8fBuSjE7CuTn
         TXKeeptQ0g57fgc5y6hYQ8ah2ve4kWwtocBXwYi7KtMBAHMhP4wiP962cpG4zA2y6AyK
         c7r6YXu9BcEwHOq6yhcasEHSzm/Iv1tMnmyU1yMz3+k9BaWcGxiqGEZT8VNxqBLU4+lZ
         Gdav88gGR48VdNNDP3f0CgSQXI2lq+3YzKaTXZYEIiMbXGeS0PtW5JZ7GgnKfg8kpZcC
         7Zpg==
X-Forwarded-Encrypted: i=1; AJvYcCXMOM+puRaXPWLcwcGAynIb31vJqhWR1ScZPw3GQD2n6I80PIBXdldr62TMhqAG26H8xCRQUllrJ+oCJSFfNCitmNT8oA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw52ttQSeGuobzcpLrOXVwpQWkU7xS+Gbc7Sf2TTqP6KOrNfjU5
	zVyaNcKiXfHfJ4gLwyWZ01dPom0DnQUClscxcRFYCAI9xMPy1P9mjS5edWpkuFpj+JpBHTXkqkS
	dttCKDSz6bf8IegMuF1IxgrqJ1MXhsrU=
X-Gm-Gg: ASbGncsea61/hsL+D9p7JiWT94zj7eWfp1iMYKr6eYS6yivULEY7MbDV38azgoOzbNU
	S7PY8NritgfXevd0PY/MGjHBambqzJAS14xc3AUom0j8o+exK7jOtrmNxIRLlL8w97hqr8a02QA
	dtnVKOpkD8xXnTuW0bkByHlTks0rXdp89TSFlnKWp1z+o2ERNoXiDAits=
X-Google-Smtp-Source: AGHT+IEFVAApNVakbH9gnhkeeESDuh0C5GYe1c/ZLqBTdYx916A7d0kUrooJJ4SlCZvqHrb8qJOHZjgmeynsloSVeI4=
X-Received: by 2002:a05:6808:3027:b0:3fa:f848:8dfa with SMTP id
 5614622812f47-40d073e03abmr3463576b6e.30.1751692176282; Fri, 04 Jul 2025
 22:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com> <DB29YAYDK6YW.1NF5I2WSI1BPR@kernel.org>
In-Reply-To: <DB29YAYDK6YW.1NF5I2WSI1BPR@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sat, 5 Jul 2025 02:09:25 -0300
X-Gm-Features: Ac12FXyjwVkGy5wdiL8UlfvZq9uJJjU263ycqnw9WEXcj2hJBVhhlbztfAnAZ0U
Message-ID: <CAPZ3m_iqCRYh+XhMip3h=ZWKpw4VPfnRQ6ofmoAnrzKDbOO-PA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] rust: revocable: documentation and refactorings
To: Benno Lossin <lossin@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dakr@kernel.org, ojeda@kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 3 de jul. de 2025 =C3=A0s 05:24, Benno Lossin <lossin@kernel.org> =
escreveu:
>
> On Thu Jun 26, 2025 at 6:59 PM CEST, Marcelo Moreira wrote:
> > This patch series brings documentation and refactorings to the `Revocab=
le` type.
> >
> > Changes include:
> > - Clarifying the write invariant and updating associated safety comment=
s for `Revocable<T>`.
> > - Splitting the internal `revoke_internal` function into two distinct, =
explicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke_n=
osync()` (unsafe, without RCU synchronization), now returning `bool` to ind=
icate revocation status.
>
> Could you wrap your text to a more readable column? Thanks!

Sure! Thanks!

>
> >
> > Marcelo Moreira (2):
> >   rust: revocable: Refactor revocation mechanism to remove generic
> >     revoke_internal
> >   rust: revocable: Clarify write invariant and update safety comments
> >
> > Changelog
> > ---------
> >
> > Changes since v4:
> > - Rebased the series onto the latest `rfl/rust-next` to integrate recen=
t changes, specifically the `bool` return for `revoke()` and `revoke_nosync=
()`.
> > - Dropped the "rust: revocable: simplify RevocableGuard for internal sa=
fety" patch, as the approach of using a direct reference (`&'a T`) for `Rev=
ocableGuard` was found to be unsound due to Rust's aliasing rules and LLVM'=
s `dereferencable` attribute guarantees, which require references to remain=
 valid for the entire function call duration, even if the internal RCU guar=
d is dropped earlier.
> > - Refined the `PinnedDrop::drop` `SAFETY` comment based on Benno Lossin=
's and Miguel Ojeda's feedback, adopting a more concise and standard Kernel=
-style bullet point format.
> > - Corrected a duplicated line in the commit message of the second patch=
.
>
> Now since we had to drop the `RevocableGuard` change, its safety
> invariant & comment in `deref` is insufficient. It shouldn't have the
> invariant that the rcu lock is held (since it owns an `rcu::Guard`, that
> already is guaranteed), but instead it should require that the
> `data_ref` pointer is valid. That invariant is then used by the safety
> comment in `deref` to justify dereferencing the pointer.
>
> Also, I think it's better to reorder the patches again (since the
> current first one relies on changes from the second one), the first one
> should be the change to the invariants section of `Revocable` (so
> currently the second patch). Then the second and third patches can be
> the removal of `revoke_internal` and the `RevocableGuard` safety
> documentation fix.

All right Benno, I'll prepare the comment for `RevocableGuard` and send v6.

The order now is:
1- Documentation for invariant and updates associated `SAFETY` comments
2- Remove `revoke_internal` (Refactoring)
3- `RevocableGuard` safety documentation fix.

Thanks! :)

--
Cheers,
Marcelo Moreira
