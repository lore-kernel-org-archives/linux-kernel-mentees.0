Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321121F8AC8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Jun 2025 23:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749942725; cv=none; b=utPoZy7pPt9rD+7WICAfG0B6KUUtWNdxNpEhPsFY8NPSrMfzSvzu1E+CD5J0S9utKwPp4oHoc4aPErnUn9IQRQmypi5/qMw/PKaux5dYhSSe+vsV3LdToWY1mLH/8fz5Po1Qq7jVvliDvITUSMG7+wWwhjZekVk0ycFWkEyiNgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749942725; c=relaxed/simple;
	bh=7aQKox15HFRiAgr/Nbk+lF+bGCecZEiP3hzutFWQDhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGKQj+zTG0y43+3xfl1TDOv29Yuaw+J/FK38fshlH6HukAOGhwbypkggjYx98X9A73Pw3Xk3SAsEs2ANqZzgsxLJ1241+TEzZjV55cwjCjiU6QfKmZIRu6xVyU6TXZIBHpmJ/5ZpGcRWLr968xZFlF7KnYV90X/1vHtg9/4a5Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdTQe9sw; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdTQe9sw"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D69A401C2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Jun 2025 23:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgTGp_I6HNBo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Jun 2025 23:12:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED52D4010A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED52D4010A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hdTQe9sw
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ED52D4010A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Jun 2025 23:12:02 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-73884ccffcbso2644715a34.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Jun 2025 16:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749942721; x=1750547521; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8juW6MvzoL4CHD74I1P5RmelwPS5i/WPTaj9xDofQnY=;
        b=hdTQe9swgyot3CYDn50rpUm7Av0WSbQO/l5aLIOhp7Y64xzpKfzSZLTNsyFjysuHO0
         LNtkOSGTHmcvCDplpG7/Q9w/1UVkGvT8CnLRo6qSSowVDjc3toq5pTCshi3CvgRou15f
         xx8f2uPCGFXJ6AszJSoLx8/1szolQcaAXEqUjOkoVZCHPlGkeHuIDzFDMvVNVCQgOFSP
         D94ZvURLF+K6UxLblrIpiVUsdf6NjZczkTNT7/1a0wrvZgz4t/rbwlm/A1m6ef0T2xWr
         avUtRZMG4EwP+Xgy7Th+vVOUvO12ywwy3sXkvYacG/PBT7vn7Rb2cYERwSeQglyxFadl
         xCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749942721; x=1750547521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8juW6MvzoL4CHD74I1P5RmelwPS5i/WPTaj9xDofQnY=;
        b=FAZ5JITd93894SdBBTCPEzSGoTG8p92x3Aqt2QBjZZZRN9LGEn5oMrB5QKp0WxHI6T
         X+SuFwJpw/+QBbfnTrNXvXEXlJzzGHgqhaVP2CG1FU+9cAjD4Pv5Zt/UVV+2iUydke+5
         cnAvt8+2f+YJgmEAmFa6Yl2sivjAwcuSkVNOLRdeWyL+IqwblWhXVX2k6NDyKCBq6RNG
         7OTZjNMM6eMDgTFy0gdy8/ZBsfZsoehkgV1JP03M6hqYEcJp3AgIerBQ1io58/WOtti9
         Th75FgPbEF8eyjAkn2CHullv7F940PhF14a/zsQAMpO/HXKmq23WE7OuypRnWDr/P9iZ
         dY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTtZ0ZGns/4H47kxMSWq7eqAefzBk1lv59OzA39Ic2u/gKU5TW85WEvl6XsHx3+ylVb4tSQnaAR6jpIRyInyN24c5N2g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwYVlgNOi8eLHffR1AlQfVqcTmwnFk9w4lfaJv405BP0jvpkVCL
	Oyab/ILRa2pMGDyi0litgm6c+M2BqePCgV+iDI9EhmtdNGz5wm2HCYH//BraySWFnbR5P5K0inz
	m3Uw1q7EGc6GcCpi4fkZ5Kx8rDCG6bLs=
X-Gm-Gg: ASbGncs2DoRes+Mk0/7sP6IERSwgdy5bfwRocvXEG08g2TMHeXIDPfcYO11ONdnu2+3
	NAaxeHz+5yQCgPCIzf/SGF8nYWJTuytmlq/gYqffgZALzrkOZJBLo98fyD3mIwQU/zq21IPgoUb
	DqH/rpEKsCwJPEAkd/Htowd/gZ48vi+Ox1Rr7GNIHxmiCex4NysPleFC4=
X-Google-Smtp-Source: AGHT+IEd5xY4c2prQ9C4gYVGOVpAHJ53a+IaKWmwvPYKKLqQ1iX1xB899yr6bzGK54Sf3LESREd/ByttQmLlJxMKoZY=
X-Received: by 2002:a05:6808:1a03:b0:3f7:d16c:e283 with SMTP id
 5614622812f47-40a7c131ce4mr3047730b6e.11.1749942721648; Sat, 14 Jun 2025
 16:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com> <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
 <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com> <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org>
In-Reply-To: <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sat, 14 Jun 2025 20:11:50 -0300
X-Gm-Features: AX0GCFvSfb5qmS4mdJFH70NZ_cFHGfdoEtoaG87ivfr7m2yN7xVweMNueL4RXKU
Message-ID: <CAPZ3m_jqnGJtOxff2cJre_qFLyOehbhZ+XVvE0BjzFv7ADqOAg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
To: Benno Lossin <lossin@kernel.org>
Cc: dakr@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 14 de jun. de 2025 =C3=A0s 15:05, Benno Lossin <lossin@kernel=
.org> escreveu:
>
> On Thu Jun 12, 2025 at 9:22 PM CEST, Marcelo Moreira wrote:
> > Em qui., 12 de jun. de 2025 =C3=A0s 06:02, Benno Lossin <lossin@kernel.=
org> escreveu:
> >> On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
> >> > +            // and because this `PinnedDrop` context (having `&mut =
Self`) guarantees exclusive access,
> >> > +            // ensuring no other thread can concurrently access or =
revoke `data`.
> >> > +            // This ensures `data` is valid for `drop_in_place`.
> >>
> >> This last sentence is not needed. Instead, we should mention that sinc=
e
> >> this is a `drop` function, we're only called once, so it's fine to cal=
l
> >> drop (since that also is only allowed to be called once).
> >>
> >
> > ok, I thought of something like:
> >
> > // SAFETY: `self.data` is valid for writes because of `Self`'s type inv=
ariants.
> > // The `&mut Self` context guarantees exclusive access and a single
> > call to `drop`,
>
> Let's mention that no thread can access `data` *because* of the
> exclusive reference.
>
> > // making `self.data` valid for `drop_in_place`.
>
> The part about drop should be separate. We usually use bullet points for
> that.
>

Hmm, ok.
I think I understand now.

what about:

// SAFETY: `self.data` is valid for writes because of `Self`'s type invaria=
nts.
// The `&mut Self` context guarantees exclusive access, meaning no other
// thread can concurrently access `data`.
//
// - `drop_in_place` is valid to call because `drop` is only called once.
unsafe { drop_in_place(p.data.get()) };

I'm not sure if the line break in the comment is okay...
