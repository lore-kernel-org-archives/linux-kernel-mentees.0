Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446DC1F872D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752773803; cv=none; b=laCDvQXTYcN5nmohtW+ybcX07smUrmt40+zvStSJHzXZkDMzjqrzDHp8mLCZlATT3AFKydYoCSYJUNni/Vs9uugbq40WKIALIoaERixhzLp8ZTh40gmTXZWdK/SwlaOiw2OyF5PexFN6oDM5wGeLKefUeKcuNAnb6X8qDDEr8zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752773803; c=relaxed/simple;
	bh=cB6DQZZHGeGf9lhOToyZC9Jks80AC8cDhzlt0qfdW5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qF+7kckPyZNSN6EF7RJGesDru8NSLgUHs/dFtG8Oye/5DHD8dTNZb7fmkTHD1uvZMpn0TtIEs9XwbB6iJdTVlDlbkk9tTEU1J5JzOBd6q9HY1Gq791LJmP/rTmBy0qT/YqVL7qhfDTDyZxJtJLW02pNt5v1qXyIXAgdUkF08DMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYWlJK/P; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYWlJK/P"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB72440E1F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 17:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgSelBuSOeAj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jul 2025 17:36:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30DCB40D58
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30DCB40D58
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JYWlJK/P
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 30DCB40D58
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 17:36:41 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-615a007e2easo540226eaf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 10:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752773800; x=1753378600; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWnTwg7QjqvfjwMKttxZ6TeT8zZsjInkESBYkju/BoY=;
        b=JYWlJK/PZZso0sC3oBLltX57z2LHz6+xcDGhtFsR178sU/LamY3HDuwuH4KS0XoSvO
         QUbrjQ12QpSXnwCmFHsqntHFCxSnfYFrX2WZM/peAZF6LjKPWva6vFZ/nUhAFxvukc14
         di2b7DLq2reG2pixTyINxbYrhRrvBXxNB5l3YcFalegEcrqxHVVm++pAad7gqVrL0B2q
         ERly+Qo2jqLW03tzJrIVEMpzuC5ZqBGtuiTTH/tCwdQyL743MNfV36iHcOCzFjHyPYsF
         lgEKOhbOxEL2MA/a0SfGLXV9lzJT1TsuGWAAIsP64uT+2WeWZqboyOG6IUH2fYE8//mt
         wQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752773800; x=1753378600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWnTwg7QjqvfjwMKttxZ6TeT8zZsjInkESBYkju/BoY=;
        b=k/CUbWS71Mdg4QjmmXKgpbUlcDs6PViA9lZtrBcJuUpJ5B75/EJ934sy0d/eWlRv4K
         fHpNnb4abLYUJ7jGyzMU0AsEiAMKOboWtBNvEidW1qhtZ/UtA8OQkWFFfdpS1KsqRS7I
         GUxDfJPSe/ZmYJEhXaspe9cGkgY5awp+7SnbJPkv6B8mkXyKQ9p+C9f+iSZMvAYkf4xg
         33CfgVKgIifcAiqQJRcUFvdOrrgdHHUxBX27laTzxxt8t5vJQwXvp9w3C3j/Gg58IN/t
         xplLP33ceSxXOr/B1qD9vIDnOMv3b1ql/s/1mcjSuzlDx786OJ/JnjC+XJEiaULDrb15
         V10A==
X-Forwarded-Encrypted: i=1; AJvYcCW6QhB3hZEW8A3L0LqHrVICurUUOv+x84x4V/15OkZh00z0bkHjuWjs52NU4J0bHBHcgy3qCJzzB5nWxBlHXcnmQcWiHw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzpcHSJA/VfLVhtFLWlsGjy27gWpccDAerMQkM8WPlWvoTZT/2+
	c0S1S+D08X28HSgz/usz+0Q+vKlGV3luRxHfcZrMACVRXz2Ec/SvwGUzb0QLZLmLe+cwZr9HZqi
	SjC/AcFQKKoGYaOI7ZlAcG56/OH/HGRs=
X-Gm-Gg: ASbGncuyTkSTeovhCnES9fKIjc+0dqMEn26jJPyCMIJ/8NQwIftVlHxM46Nk1MaEdqy
	QlAngOMH8AK4+UtxCWqaaMWjbyjW0my6jFceBFJ1FgrdwRSa2zyfIOC/wW7N7sPDnVadWsBt6vS
	axdV3jY+9+wJ24UzKOC4PXzWcHBFclU6VsTc3yI8ochlkalipZmu7qZXVefww6CjcytgoIExTDv
	xtD6cdjt9F2UqhAo8o=
X-Google-Smtp-Source: AGHT+IHrb3+kGA/Pf4+/HuAwQiwxkAKO5ok2v8Yqtp10nkrGuuIA/Mbn0z5PrudGEVL+q9uWRjlr6OOW/MUOkxDA85g=
X-Received: by 2002:a05:6820:f04:b0:611:a81d:bdf1 with SMTP id
 006d021491bc7-615ad9d97c1mr2878741eaf.6.1752773800093; Thu, 17 Jul 2025
 10:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250716182220.203631-1-marcelomoreira1905@gmail.com> <20250717163916.GR2672049@frogsfrogsfrogs>
In-Reply-To: <20250717163916.GR2672049@frogsfrogsfrogs>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Thu, 17 Jul 2025 14:36:28 -0300
X-Gm-Features: Ac12FXw5w1_9i4hyD-LbPxtSt7tFawOjHh2b0UFI2vkNqVhxdpsfk6PFyygcq64
Message-ID: <CAPZ3m_jXwp1FfsvtR2s3nwATT3fER=Mc6qj+GzKuUhY5tjQFNQ@mail.gmail.com>
Subject: Re: [PATCH] xfs: Replace strncpy with strscpy
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 17 de jul. de 2025 =C3=A0s 13:39, Darrick J. Wong
<djwong@kernel.org> escreveu:
>
> On Wed, Jul 16, 2025 at 03:20:37PM -0300, Marcelo Moreira wrote:
> > The `strncpy` function is deprecated for NUL-terminated strings as
> > explained in the "strncpy() on NUL-terminated strings" section of
> > Documentation/process/deprecated.rst.
> >
> > In `xrep_symlink_salvage_inline()`, the `target_buf` (which is `sc->buf=
`)
> > is intended to hold a NUL-terminated symlink path. The original code
> > used `strncpy(target_buf, ifp->if_data, nr)`, where `nr` is the maximum
> > number of bytes to copy. This approach is problematic because `strncpy(=
)`
> > does not guarantee NUL-termination if the source string is truncated
> > exactly at `nr` bytes, which can lead to out-of-bounds read issues
> > if the buffer is later treated as a NUL-terminated string.
> > Evidence from `fs/xfs/scrub/symlink.c` (e.g., `strnlen(sc->buf,
> > XFS_SYMLINK_MAXLEN)`) confirms that `sc->buf` is indeed expected to be
> > NUL-terminated. Furthermore, `sc->buf` is allocated with
> > `kvzalloc(XFS_SYMLINK_MAXLEN + 1, ...)`, explicitly reserving space for
> > the NUL terminator.
> >
> > `strscpy()` is the proper replacement because it guarantees NUL-termina=
tion
> > of the destination buffer, correctly handles the copy limit, and aligns
> > with current kernel string-copying best practices.
> > Other recommended functions like `strscpy_pad()`, `memcpy()`, or
> > `memcpy_and_pad()` were not used because:
> > - `strscpy_pad()` would unnecessarily zero-pad the entire buffer beyond=
 the
> >   NUL terminator, which is not required as the function returns `nr` by=
tes.
> > - `memcpy()` and `memcpy_and_pad()` do not guarantee NUL-termination, w=
hich
> >   is critical given `target_buf` is used as a NUL-terminated string.
> >
> > This change improves code safety and clarity by using a safer function =
for
> > string copying.
>
> Did you find an actual bug in online fsck, or is this just
> s/strncpy/strscpy/ ?  If the code already works correctly, please leave
> it alone.  Unless you want to take on all the online fsck and fuzz
> testing to make sure the changes don't break anything.

This was s/strncpy/strscpy/ , no real bug.

--=20
Cheers,
Marcelo Moreira
