Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5600A1D8DE1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 May 2025 10:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746094698; cv=none; b=rZysl/iy1WK9am4u9SZDUnBeGr+SEwdVQIM6srJWIv/+DehPCMGeliPoRDOATYBdyqvf/VUSReQh/wrsGuGL+JBr92Q/VJ7X4UcGw4l8ewjyYWsb84GBk2g0x57pli0tEm4B7COrROQ4B0oOJFIj8dC+Nd4pDRjXF5zSx0LWwjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746094698; c=relaxed/simple;
	bh=ZTR7TBqMTX7X33aRZ3YzhN7mSRAkRoo586SaX//XPNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3clRf4jmk2/LyN3q95gbD7yiW+nSA91fGCxr58LL8V28D7AmjCCFXDZJSNkKETHfFcoaK+VQshdaBglBggcXRV3p9IX85nytmUjtMKw8gdsfBAAK4XhxUT/6kBT3SX/ohTA2Y7s3uTsofnfYQ8nGFxshYOzvzHXcYnPrYLJWEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlwrXzRD; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlwrXzRD"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7CD06106E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 May 2025 10:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9HDm4JZwOpo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 May 2025 10:18:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 095166106B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 095166106B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PlwrXzRD
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 095166106B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 May 2025 10:18:14 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3087a70557bso113396a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 01 May 2025 03:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746094694; x=1746699494; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTR7TBqMTX7X33aRZ3YzhN7mSRAkRoo586SaX//XPNg=;
        b=PlwrXzRDkI7KgkINzNfdk61MSKsZDuz6EWEJDlEUSkRFF+0HGT7uxTBvEcw8AcyBia
         ZPQqHF1TGlqVGl1q4Fk/swmhyxtHaW4QX+HNG0Pn3T27g5MSBqYBcIDQ/WhgS5kcZzxY
         n1Zxrxt0VZpm9k0eZKVSmDxy8LYB2VZuxX+gKQ2giLqfsV2hac7fbhpOGS8r7pbz+1Dj
         mClhrJ09zH845uD7nTOcipNnUvCxz+t/EVUCPsTcxuFfk7xEdKgieK2dDpI3pgMf21oc
         TWqWRYYdxrAAkTk9CvmRAeBRPt/BuwsP1RH94wg54krVoGDXEPSjDIuU0FviGK+KgR7V
         jKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746094694; x=1746699494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTR7TBqMTX7X33aRZ3YzhN7mSRAkRoo586SaX//XPNg=;
        b=R9+tGhsYysCmHqBg9Hr2eQInkX01LwHSId+XiaC2f3DRZwBWnwYpNibg8BTx8TSt1q
         GqBViAf1Hf8tODULjQeNDgdOsgRWbMAGyGWOpVKF0KOHQu9bIebMKKTOTv0af1LjRxqE
         tCqDQsuGRv2Wz+8rfE34wdJ9N7sFvMsCuQp/5fe4I/iabteWpH/4Fs6/lS8t7GaF/gm0
         aWeDcVCL/XGMIau7EpOSnxfmbqs6z5QKFtfauFSL9uhyYHzDnZIVJELvtUjX4/z3MNv9
         F53FQnN8jfKUWoQsPQgNVGd7jrPgKhGjTD0Ie5rVObRwhJLbgtlfkcYqJeMGO2DZ27lx
         9HYA==
X-Forwarded-Encrypted: i=1; AJvYcCVGNbj7zRQtxnW/eT3OvR1FnkPIKXNVDL7P3ONGlu3uYJ3ZjyXK5JfLEuO4+9jSTB7vekxkJKulYAW59ROH6EWvXicSzA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwyS3xZ/L9iaOsXDwSM4aa5b8TlX00QbBgzzI/bFKG/bmw1hC1/
	Ph8stUcBbB5ELbVSFX6KQQydUZJyi5SJLVgYJRTY31/H0yEyBXj69eZkyKqvwwH7xWbYb1qzQYW
	AWYpJC9KppJXaxXNJIiGl/yYdWso=
X-Gm-Gg: ASbGnctU7Nsj3gMobFqYTOe5dtHGXcjc7MK9XXjIi+aEfG0kNTZQvXIqn4Uzjr+4tdI
	75PJOiz0OmXktaImlZs+VgZW6t5evNguEsElBSxA821w9GR1UJy+fM5iS+nqke+QPtpVhf2hZdK
	TPFKWcH/Es57I4VrU3KADN0g==
X-Google-Smtp-Source: AGHT+IGdHKEyiXVXMkjdaheAfVA2kO5dlFuZTgEUICeZq73db6TXDp1Aw38l3nbAxKnPn7InpuDfDrqwmL5yltprn4I=
X-Received: by 2002:a17:90b:3852:b0:2fe:b879:b68c with SMTP id
 98e67ed59e1d1-30a34a97f37mr3274976a91.6.1746094694231; Thu, 01 May 2025
 03:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250501005726.744027-1-marcelomoreira1905@gmail.com>
In-Reply-To: <20250501005726.744027-1-marcelomoreira1905@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 12:18:02 +0200
X-Gm-Features: ATxdqUE14tgzbLCtmjP9zN2Vy1kaFEOoat9wynq3EOaGc2VPivCQX72Bvk63x7Y
Message-ID: <CANiq72ncOnDVHCNScjT7Y5+-kXzGvtcia=LpS0h-MfBqBMuOWA@mail.gmail.com>
Subject: Re: [PATCH] rust: revocable: clarify invariants in safety documentation
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: benno.lossin@proton.me, ojeda@kernel.org, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 2:57=E2=80=AFAM Marcelo Moreira
<marcelomoreira1905@gmail.com> wrote:
>
> This is part of issue #1160 ("correct safety comments and documentation
> in revocable.rs"), reported by Miguel Ojeda and Benno Lossin.
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1160

I think it was just Benno. :)

> Tested-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

Normally one is supposed to test a patch before submitting it, i.e. it
is implicit.

> +/// # Invariants

We also place `// INVARIANT: ...` comments in the places that need to
ensure the type invariants hold, e.g. in constructors.

Given the issue, I think Benno may have also wanted that you then
refer to the type invariants to justify some of the comments, e.g. in
the "Since `self.is_available` is true, ..." ones.

> +/// - Access to `data` must occur only while holding the RCU read-side l=
ock (e.g., vi

The "must occur" wording seems a bit strange for a type invariant, but
maybe Benno had something in mind here?

Thanks for the patch!

Cheers,
Miguel
