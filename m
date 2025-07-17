Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8FD2FD874
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752773681; cv=none; b=Y9NVxyGuAFrt4e3KQ7h7b+FabEoQfyUWDse/HKwBF/csdnXOZxm3I+1YdtdKhLZngyQox/JjswPIfl69zQVdte+HjdqPZrVoOdMIkMtrQr/LhviA+Sc3klOBF6EcGgvhx5Kb0FNasLGAz8VZyLFG8T0SbORZ1nAsgpZr6Kn56kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752773681; c=relaxed/simple;
	bh=rzjxpZpdFlkT9ZgxfexMIxgYZeclHLDfT0xMHlABgPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=conRH7eu2DT1NEHtgAm2KWV4g/MLvw17chFH4ufmDoqAP2x0ZfX/kVoDANGBtUCrORPGq4dGySakQolmU47VPZ+OWx8OdVm4LE9p7QJAUYq8xZ7d0w6mJHI2vm6fTq3uZvd+rXVYSSXVMMXWB3Lze/ILR37q3bjbWE3iM8EnBig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btArdMMF; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btArdMMF"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5E57416D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 17:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWMyDL6nuoBV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jul 2025 17:34:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E392A416C3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E392A416C3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=btArdMMF
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E392A416C3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 17:34:38 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-613b02e801aso654191eaf.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752773678; x=1753378478; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9z8fZ/Z4PsYW9CUMid5zcIc5+awDtRT+VcB1fcwG/Y=;
        b=btArdMMFp6wCjuCpFqUZ0KX7+2CP1NHrcEULE6qEIYtBVZnVIYfIqhhrNcgvpVKYaJ
         Y6+HRCTYQqUsg6BBKvRy5LQXd/Ic2OZm1I/B/cS+ZsEnXDkSHddqzxekh9lMziSlz2NK
         MWuSkTy6e6UVx6tAFXZJRjCw28lEQL5wxypa7V40aTlkLOY548+30kwiW9tDgIV2NOuh
         tg/ZdkzbwFEptsFRMaCqQQ16lM74s6c59zFaw5r6wSKkVN5CcY0v5rOzdcO1KJEdmpSd
         YalOZcYzVwmz7TQb1d6vNHy5VwMe3lcfkrtddfhM6zd58fYNVsafoISqZakRfe7seTA4
         JiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752773678; x=1753378478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9z8fZ/Z4PsYW9CUMid5zcIc5+awDtRT+VcB1fcwG/Y=;
        b=bebvqqUQud681xbTnccOrNMvIFv8hcgEdCQFuw2bJE2bw5H4PniWtnpAYMqu4uSZ4U
         vI2KCYIms49YMWtbt/iSgfZ3IGoZntCQL0BYm5jP4EfSsVP+0QPzpJ5rWq40lAJv2iLN
         X3W/+oz6tkJ83ZJgxv9vMXkj0mxKP0ki+VXo2lxXRin/+Y56DHJoo1GyqDqV8WTX5Dgz
         DW3nJUAOtzXuy58ZMk/AShV07snV3sv68mUjv3NecSPhkXOJAMv4J03Rl0fi2Fls4ZYc
         VlvTSG0L4dJw8lHKIJP/yUv2KAgh3yKUphJ5jxHazrTb19q4Kb8vgqpYafek6oowb3pe
         Cz4g==
X-Forwarded-Encrypted: i=1; AJvYcCU7D1aMaydF9emq+EGuK0PbII39bkZPy9PJRcFAftoikGPCyBLAfFDAeQ/QFgvWhCGvDb1RpNgODcN1Qpw6nYPgEt5O0Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YylOvTt+EtYgq9JT+7SSporRDs1c9XcWbYdCS3658aTb+a8YkPy
	2UouKMBKzTvDv6JjbmdQYiiwAn3LN+Lq/7OszwfVf4SFkyZlj6WzvmUmMF/J7sr00i3S5g4rGi0
	lCyGlKDlQXwKqSEskdQVIGMB8HaJMYBI=
X-Gm-Gg: ASbGnctbuf+mTUul7b+Zduqx7/YarJTuAZNmFnfgX6t6IVZFU3y5hjO2AiR5hbjwBns
	OdknNOaEBisaEx7+e1dLIMnkP92YPtgrJj6S4pbpwfDV5zYKZexXWcTu/geOIUW/jazgPsr+IoL
	yQDP5NbjNSfeId7rwOe3vqj8v1lPLV/T+Vw5vHZYGtX7EA7RvJX2NiZbLK7EMfwo0lUHkhEyZag
	vI8RQ2JJnDa62le588=
X-Google-Smtp-Source: AGHT+IGvMUrKXS0o8uwXJMY4nGdZk/l7ykqW8WTD1nf+Nt4owfT+6veTaykRqIANYiizVItY4C49BFj5HPpqRTlBBak=
X-Received: by 2002:a05:6820:f04:b0:611:a81d:bdf1 with SMTP id
 006d021491bc7-615ad9d97c1mr2873882eaf.6.1752773677580; Thu, 17 Jul 2025
 10:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250716182220.203631-1-marcelomoreira1905@gmail.com> <aHg7JOY5UrOck9ck@dread.disaster.area>
In-Reply-To: <aHg7JOY5UrOck9ck@dread.disaster.area>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Thu, 17 Jul 2025 14:34:25 -0300
X-Gm-Features: Ac12FXxf-emQJTJxwfR0G22Fq24C9KGKAvFGh0x7h9jbGRxeYtkrbZb9arM8jl0
Message-ID: <CAPZ3m_gL-K1d2r1YSZhFXmy4v3xHs5uigGOmC2TdsAAoZx+Tyg@mail.gmail.com>
Subject: Re: [PATCH] xfs: Replace strncpy with strscpy
To: Dave Chinner <david@fromorbit.com>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 16 de jul. de 2025 =C3=A0s 20:52, Dave Chinner
<david@fromorbit.com> escreveu:
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
> > number of bytes to copy.
>
> Yes, this prevents source buffer overrun in the event the corrupted
> symlink data buffer is not correctly nul terminated or there is a
> length mismatch between the symlink data and the inode metadata.
>
> This patch removes the explicit source buffer overrun protection the
> code currently provides.
>
> > This approach is problematic because `strncpy()`
> > does not guarantee NUL-termination if the source string is truncated
> > exactly at `nr` bytes, which can lead to out-of-bounds read issues
> > if the buffer is later treated as a NUL-terminated string.
>
> No, that can't happen, because sc->buf is initialised to contain
> NULs and is large enough to hold a max length symlink plus the
> trailing NUL termination.  Hence it will always be NUL-terminated,
> even if the symlink length (nr) is capped at XFS_SYMLINK_MAXLEN.
>
> > Evidence from `fs/xfs/scrub/symlink.c` (e.g., `strnlen(sc->buf,
> > XFS_SYMLINK_MAXLEN)`) confirms that `sc->buf` is indeed expected to be
> > NUL-terminated.
>
> Please read the code more carefully. This is -explicitly- called out
> in a comment in xrep_symlink_salvage() before it starts to process
> the symlink data buffer that we just used strncpy() to place the
> data in:
>
>                 /*
>                  * NULL-terminate the buffer because the ondisk target do=
es not
>                  * do that for us.  If salvage didn't find the exact amou=
nt of
>                  * data that we expected to find, don't salvage anything.
>                  */
>                 target_buf[buflen] =3D 0;
>                 if (strlen(target_buf) !=3D sc->ip->i_disk_size)
>                         buflen =3D 0;
>
> Also, have a look at the remote symlink data copy above the inline
> salvage code you are changing (xrep_symlink_salvage_remote()).
>
> It uses memcpy() to reconstruct the symlink data from multiple
> source buffers. It does *not* explicitly NUL-terminate sc->buf after
> using memcpy() to copy from the on disk structures to sc->buf. The
> on-disk symlink data is *not* NUL-terminated, either.
>
> IOWs, the salvage code that reconstructs the symlink data does not
> guarantee NUL termination, so we do it explicitly before the data in
> the returned buffer is used.
>
> > Furthermore, `sc->buf` is allocated with
> > `kvzalloc(XFS_SYMLINK_MAXLEN + 1, ...)`, explicitly reserving space for
> > the NUL terminator.
>
> .... and initialising the entire buffer to contain NULs.  IOWs, we
> have multiple layers of defence against data extraction not doing
> NUL-termination of the data it extracts.
>
> > This change improves code safety and clarity by using a safer function =
for
> > string copying.
>
> I disagree. It is a bad change because it uses strscpy() incorrectly
> for the context. i.e. it removes explicit source buffer overrun
> protection whilst making the incorrect assumption that the callers
> need to be protected from unterminated strings in the destination
> buffer.
>
> This code is dealing with *corrupt structures*, so it -must not-
> make any assumptions about the validity of incoming data structures,
> nor the validity of recovered data.  It has to treat them as is they
> are always invalid, and explicitly protect against all types of
> buffer overruns.
>
> IOW, if you must replace strncpy() in xrep_symlink_salvage_inline(),
> then the correct replacement memcpy().  Using some other strcpy()
> variant is just as easy to get wrong as strncpy() if you don't
> understand why strncpy() is safe to use in the first place.
>
> -Dave.
> --
> Dave Chinner
> david@fromorbit.com

got it, `kvzalloc` ensures that `sc->buf` is indeed NUL-terminated
from the start, and the explicit NUL termination (I hadn't seen that)
in `xrep_symlink_salvage()` (target_buf[buflen] =3D 0;) further
clarifies that the data on disk is treated as raw, non-NUL-terminated
bytes.

Thank you very much Dave for your detailed review and for taking the
time to explain the nuances of this code. I clearly misunderstood
several critical aspects of how `strncpy()` was being used here and
the protective mechanisms already in place.

My apologies for the incorrect assumptions in my commit message.

Given that the original `strncpy()` is safe and correctly implemented
for this context, and understanding that `memcpy()` would be the
correct replacement if a change were deemed necessary for
non-NUL-terminated raw data, I have a question:

Do you still think a replacement is necessary here, or would you
prefer to keep the existing `strncpy()` given its correct and safe
usage in this context? If a replacement is preferred, I will resubmit
a V2 using `memcpy()` instead.

Thank you again for teaching me these important details. I'm learning
a lot from your feedback :D

--=20
Cheers,
Marcelo Moreira
