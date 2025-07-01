Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8196222590
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  1 Jul 2025 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359708; cv=none; b=ICd28YzgN712TZqec+wZArRVK6Xti0dhrQL5qVm6oCAWz2BTKTIrYBw/b57+UKhWJ0ZzNeXsYUhvyM3tarMVK2DYU9s3U8NDcZQXH+AgXdQZVXcvFjNkY4mGWCAcwWcHbUwakkUuJWT0nt6+531Gj6FEMJ58HauS3/s6SQ8K9E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359708; c=relaxed/simple;
	bh=bUYUIt7n5OcwxqVw8g8uXUJAIxLA66GdHxIXW4wbQ7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAREsp3hDwPrpQIuRD7XB+Czz8wZh0hJLyaN5PDsQ6qkiNAI9M5gry9gwLh0WUpUrmNh822+i3xfe9l3wUW7u9ZZ57YZzB6l8cZdvs6RY6D5bTJSi04i2AlVNLP0w6UA9eSkX7e3Aj7revotW7Mpa6D+JbSe4qEPVzL11cbOyZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cx5i/GLO; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cx5i/GLO"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32cd0dfbd66so23171061fa.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 01 Jul 2025 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751359705; x=1751964505; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlz9G1EGtx3NEnNnxuRUfIX8nol1KFsq1PaL5R1mF/A=;
        b=Cx5i/GLOREtqXDOO+KFZCGOW1aps+I0TwpoKUuIwXAO9IQT8tk5qLtC51wUe9DQ0ef
         KQEQcBQia2vYDFV8zUlwiEoYHdzn1Hn3mTZdTob3gs6jWIlTkXO0xQdJFERcCcqipoUJ
         T3UwCkaqDJ3+eQ3O24oyXo0H5hpD2qIvcHDO4TaXXn3D4WCL7uQ47UkQGPVuGLRT3ruX
         ldVbHQ4tuunsWKQ8sdkCxNHjFQyEMUZIK1egRHtRXR2TJayDyeUzcdc1QzQymaajoGcZ
         yJpvoYJpV966AOoci93SEiXSgCWgS0J2OOB4BJSrsndg8U5OQSry+uahNIGOetPZN9Uk
         ByKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359705; x=1751964505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlz9G1EGtx3NEnNnxuRUfIX8nol1KFsq1PaL5R1mF/A=;
        b=XFXuLe70V9MwG+twXaW0dkxq89EGlPzhrXjfuMIX9isBe7ZPtZQOOa29u4paW9vApM
         5FT6jkjNVPJVRfWI05qaC4GQ/wdJ0r5gv8rw/ZvG8NSRis6730x9pr5e56Hj5iBX9Ky/
         cC+RFYdQ/BJDQqUAdZmqyPEz1oR0XHJtad65mXu2rdKnl9TrPdsVq6Zs2Ef05M2sgx2K
         nEQjBfyU9QKPScAet+iwGICkA/Tf0V2rG3NaTco8VLh+9PdceQsx54w3OQgaic0/D659
         uyUMhdxs9tdIjI8+jLi01uCCXLbN9fjTnb82URHaGyvBChs4GMdoyvUjTXhpFEJTgvGO
         5XHA==
X-Forwarded-Encrypted: i=1; AJvYcCXA0s8EktDUROdjM84397Vf8dZ9I4Q9vhTDSd7Recs9M7NSg09LxZTsHeNtG1VpHf1r01kIcKDHINMMxUpnGLMXcJZ/Cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsGgvMfD8hIRrjIPtuc01e0Gr+5SN58p4KvO13uDaNj7fgtAkS
	KquLq4v+n2Jg9Fz/G62Eezvo/RKvXbtmmJ9NeF9SrcFTm9Kmxo/5euuOQMA8E0e+DrToVWLWmMR
	gnRfXrQVUBxbnn3vsvQCkGL+b3vo/et0=
X-Gm-Gg: ASbGnctLZJqZaJ5iI6m1/7qj1El16FnR3peTVS/bASlU0DWpc/nirOm6bnQ9xedT5en
	pCzQqNT2BiMaYyFv9M37BCGCsMZR30Kb5UBw/IXuOhSJlJz1OpGtHKkefc+rsAX+4bu0/3fzqNN
	oJg9ZQq3KLXkrFpD8poTDz1BnglYr5iqCZKcWeJaFc4jB14aRHtzV6ZApwYrnkyxG1AcG9HCrLI
	MZ3e9dd8mEfBwc=
X-Google-Smtp-Source: AGHT+IErmMRan+sKmTTHK37Vk8l1nc2SvVeFF1R3OUSqouyPhRnqa2qhw9hJkcrN1a1c7VkhUpmiklz7WxPFHCxWJL4=
X-Received: by 2002:a2e:a239:0:b0:32a:de39:eb4c with SMTP id
 38308e7fff4ca-32cdc4991cdmr30441751fa.18.1751359704426; Tue, 01 Jul 2025
 01:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BgUaxdxshFCssVdvh_jiOf_C2IyUDDKB9gNz_bt5pLaC8fFmFa0E_Cvq6s9eXOGe8M0fvBUFYG3bqVQAsCyz3w==@protonmail.internalid>
 <20250617124546.24102-1-pranav.tyagi03@gmail.com> <qlogdnggv2y4nbzzt62oq4yguitq4ytkqavdwele3xrqi6gwfo@aj45rl7f3eik>
 <CAH4c4jLjiBEqVxgRG0GH37RELDp=Py3EoY6bcJhzA+ydfV=Q1A@mail.gmail.com> <ldak3a3zmqlkv67mjproobt4g7pe6ii7pkqzzohd5o5kyv64xw@r63jjlqzafzp>
In-Reply-To: <ldak3a3zmqlkv67mjproobt4g7pe6ii7pkqzzohd5o5kyv64xw@r63jjlqzafzp>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 1 Jul 2025 14:18:12 +0530
X-Gm-Features: Ac12FXwKv4GTEJXH-cF4nonvlMBRj4FNPI9VATuH549AH0Rji8nOLlaLVC8Pjmg
Message-ID: <CAH4c4jJcyA+=x5y3BrW7dQkWOM3bVTepH0W16cm+_CLqHr4hfw@mail.gmail.com>
Subject: Re: [PATCH] fs/xfs: replace strncpy with strscpy
To: Brahmajit Das <listout@listout.xyz>
Cc: Carlos Maiolino <cem@kernel.org>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 7:48=E2=80=AFPM Brahmajit Das <listout@listout.xyz>=
 wrote:
>
> On 30.06.2025 14:36, Pranav Tyagi wrote:
> ... snip ...
> > > >       spin_unlock(&mp->m_sb_lock);
> > > >
> > > >       if (copy_to_user(user_label, label, sizeof(label)))
> > > > --
> > > > 2.49.0
> > > >
> >
> > Hi,
> >
> > Thank you for the feedback. I understand that my patch is incorrect and
> > it causes a buffer overrun. The destination buffer is indeed, already, =
null
> > terminated. Would you like me to send a corrected patch which uses
> > strscpy() (as strncpy() is deprecated)?
> >
> If the destination buffer is already NUL terminated, you can use either
> strtomem or strtomem_pad [0].
>
> [0]: https://docs.kernel.org/core-api/kernel-api.html#c.strncpy
> (Description)

Thank you for the suggestion. On going through [0], I see that,
both, strtomem and strscpy require the src to be null
terminated. As far as I know, sb_fname buffer has a size of
XFSLABEL_MAX (12 bytes). This means no terminating NULL
for the src. So shouldn't memcpy() be the right function to use here?

> > Regret the inconvenience.
> >
> > Regards
> > Pranav Tyagi
> >
>
> --
> Regards,
> listout
