Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA11DFFC
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 27 Nov 2024 03:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732678733; cv=none; b=IsozRCNdWaO6eZLW5RCSqOXwpAYYRCfA+ctDhs5DSSknYmc7JJXdcRKZ2BTiXSHKqQ+2Vk+R3JBSfjwooZ+lPSEgh8WTC40Hb4j4MSOYpxlKfAh6lKEI19Wl+R9i8eEVdfKmOxUliHP2qp3IN4EiZZMXc0zK8zhOAqwRdCxxVVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732678733; c=relaxed/simple;
	bh=fS8NQOHGJ0ogLcUGas01yt4cIbC36qC1c0kAb7nEjj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdDpNDp3PVPOyfG0WiXjkQYY+wXCoRP251BBgTH2ZvmAwetegujxyCDv/AsNseEm7E/zOs8NNxvtWPEp/lLJ3iJT/JBfxhGDoOlz0b3RXI3i/Ky/wDa9JB/YdzKh/W7mJiKYRl6QNCIBAlE9JS4AAHyt4SgugMvsMR5ovoetW2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=NBeWFm2E; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="NBeWFm2E"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3908dad395so3672621276.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Nov 2024 19:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1732678730; x=1733283530; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn2mqiTffvoc/D8+m6E2ss000lrDjRnXwpfuiiix1M4=;
        b=NBeWFm2EEblXWDllStSzRdjcAx9X7Nq/qeShZdb+9sdm5SLG29kd+oAGyMwCPPCUhf
         Z0pOyUUru8ri1n1vl6rEq9cmLXk7fJ9rUKZ8W8er9Zi3vfsI3863NyfZCqutyUdSshqX
         xA8KLvt/YyZS0cIPiLbJPlDzNOqZRHTay7kj7yFNTrGUEyE/3cwGaeDUM7qzEIzqBIEF
         yZfudWie7eslGpMP09tMEvpQ7vWdq4zZw6MhsZrgKmJd8Bkd+x7vemyHgztanj/iwDNO
         T/LenxeYIQXDWwjKkd+DemMTccODzbF7KJ7JYjIeGwQ2I/5AsAzp6ZSBxNeRQJOruOJq
         ZyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732678730; x=1733283530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bn2mqiTffvoc/D8+m6E2ss000lrDjRnXwpfuiiix1M4=;
        b=T4raMGg6SXwGa0169RBrzt5wZiTfxcQwfyMpU+nnX/WK+zFgxjKJDAl8z8bvOLg7yY
         f3F9KtVSHmJ5EX67Xv7ymByVU5IVznkDg4mzRf5GM0b98HikatHhwkyFDloCfmqBswbO
         RuS8O0TBkYpdHeQcXnMvC1czBRoToAzuvjmEcn3DM8CfIEjB8MI3YYKRNJQXeCT8p/fv
         ttXtpIi0rg/uDu4bKpq7ubTCNOuicV/VFXw/KZhDVgRCC00577NMJ96uRNdqn2uQ1/XA
         AgACTnU2tZ9cbJlv2kS7Tzo5z7xLEj9ookCsUhTyWMMdg4YnDlxVj+1NmZP5VNiIN3yN
         8swg==
X-Forwarded-Encrypted: i=1; AJvYcCUZvDXs8gbGWu+e6YTp83wP9J/S7tORk7UJz6ZYIe8LvBKFHwnNpBkhgGLcW0uEN+1Y2rj1HMxqRrWdP0/QfIKrQaF0ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YwImKDMb2qzLYE8jCsaidRQNBLej0qyC2UuknmggayG0OR+sv0p
	Cd3CgPjzRQFsxMut2EbTQOGfS10Bdsm8DfMwhsTvSh8DFkbLE2GwPaCX7STGIJ2ZdTQh9kjniSw
	hW3HIdjb7hHdbGssBIe0yL4lKZA1fqtvF8OHS
X-Gm-Gg: ASbGncslfZ+uBlFotd6QlGpEIzeS4lmz6imo3PMW3POGGGxcmbNFg+kyzibsZ19HNHe
	mkX2JMzqKQcfO0PFzBUpyo7M6LbwjYQ==
X-Google-Smtp-Source: AGHT+IGlxuYZ/LrsjfAgvwWFFpg3oOOBV7K+iujlFrnCdH+8elzoi/D8ZMqcY8qv4XgdvqDdz60wqZKADimRrgR9ovc=
X-Received: by 2002:a05:6902:110b:b0:e30:da65:723c with SMTP id
 3f1490d57ef6-e395b95633amr1331814276.45.1732678730497; Tue, 26 Nov 2024
 19:38:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241112182810.24761-1-av2082000@gmail.com> <52cc8e51-9e85-465b-8ee3-63a7a0a42951@linuxfoundation.org>
In-Reply-To: <52cc8e51-9e85-465b-8ee3-63a7a0a42951@linuxfoundation.org>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 26 Nov 2024 22:38:39 -0500
Message-ID: <CAHC9VhTJERn54qNDDOwNrJ09VWrmq5Qn+sPQV__LyeEUgSi5pw@mail.gmail.com>
Subject: Re: [PATCH] selftests: lsm: Refactor `flags_overset_lsm_set_self_attr`
 test
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Amit Vadhavana <av2082000@gmail.com>, jmorris@namei.org, serge@hallyn.com, 
	casey@schaufler-ca.com, shuah@kernel.org, ricardo@marliere.net, 
	linux-kernel-mentees@lists.linux.dev, linux-security-module@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 11:25=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.=
org> wrote:
> On 11/12/24 11:28, Amit Vadhavana wrote:
> > - Remove unnecessary `tctx` variable, use `ctx` directly.
> > - Simplified code with no functional changes.
> >
>
> I would rephrase the short to simply say Remove unused variable,
> as refactor implies more extensive changes than what this patch
> is actually doing.
>
> Please write complete sentences instead of bullet points in the
> change log.
>
> How did you find this problem? Do include the details on how
> in the change log.
>
> > Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> > ---
> >   tools/testing/selftests/lsm/lsm_set_self_attr_test.c | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/tools/testing/selftests/lsm/lsm_set_self_attr_test.c b/too=
ls/testing/selftests/lsm/lsm_set_self_attr_test.c
> > index 66dec47e3ca3..732e89fe99c0 100644
> > --- a/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
> > +++ b/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
> > @@ -56,16 +56,15 @@ TEST(flags_zero_lsm_set_self_attr)
> >   TEST(flags_overset_lsm_set_self_attr)
> >   {
> >       const long page_size =3D sysconf(_SC_PAGESIZE);
> > -     char *ctx =3D calloc(page_size, 1);
> > +     struct lsm_ctx *ctx =3D calloc(page_size, 1);
>
> Why not name this tctx and avoid changes to the ASSERT_EQs
> below?
>
> >       __u32 size =3D page_size;
> > -     struct lsm_ctx *tctx =3D (struct lsm_ctx *)ctx;
> >
> >       ASSERT_NE(NULL, ctx);
> >       if (attr_lsm_count()) {
> > -             ASSERT_LE(1, lsm_get_self_attr(LSM_ATTR_CURRENT, tctx, &s=
ize,
> > +             ASSERT_LE(1, lsm_get_self_attr(LSM_ATTR_CURRENT, ctx, &si=
ze,
> >                                              0));
> >       }
> > -     ASSERT_EQ(-1, lsm_set_self_attr(LSM_ATTR_CURRENT | LSM_ATTR_PREV,=
 tctx,
> > +     ASSERT_EQ(-1, lsm_set_self_attr(LSM_ATTR_CURRENT | LSM_ATTR_PREV,=
 ctx,
> >                                       size, 0));
> >
> >       free(ctx);
>
> You have to change this tctx for sure.
>
> With these changes:
>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>
> Paul, James,
>
> Please do let me know if you would me to take this through
> kselftest tree.

Amit has already posted a v2 with the requested changes, but I wanted
to get back to you on this even if this patch is outdated ... Shuah,
what is your preference for things like this?  My general policy is
that patches only affecting one subsystem tree should be taken by the
associated subsystem to minimize merge headaches and other ugliness,
however, the kselftest is an interesting subsystem in that it relies
so heavily on others that I'm not sure my policy makes as much sense
here :)

--=20
paul-moore.com
