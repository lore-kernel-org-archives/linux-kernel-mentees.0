Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E5F1F4176
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 17:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755970470; cv=none; b=FtDch2Bj4zscUYRBhwW/QjPQgUa/CeGTMER42LpLfmmexx7dE6vW0y4FMLwnDi+IFwA7JPv7bSCKjuqDvv/NELewLXTOwUU63B+fjVhvVxJ/afTtohzYaMUa8It3YloWWw21OE4D0OiTp9ZfBtCJAhpaT8IsuJYzDhWLBczJ+pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755970470; c=relaxed/simple;
	bh=tBH6auSAE4OXD74KbmL4jIt84sIrdk7oKfzCqhk3a0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5C/za/DSr+6h1wgA3wt1Zr+O9/+rt4AnqtqvjCY1nhKf9tafdiOrXAvqfiUfG2axZm9Nk5AADOFf7djzbHojuubwc5vns5rCw6nUupbwKDbvNDy4lv1+vHZfuUOpbAg+kTORqnxaccM/nveGcWvBuXRJB8+gJpxXMtgRGCDuBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCVLKnqp; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCVLKnqp"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 662E54125B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 17:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0SjjNCyYw6gM for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Aug 2025 17:34:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77DEB41217
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77DEB41217
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OCVLKnqp
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 77DEB41217
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 17:34:27 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-61c044ff1ccso536993eaf.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755970466; x=1756575266; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p79RiCkjXWLUASsdJ5DgtzttInFEX17Obcr/BXMTYnY=;
        b=OCVLKnqpEAalXqshK105hRd+0NtsKvVs54vrM3x5DRrKb6YMg/OLPgDicUV3q0Jg8o
         e6fZcuDcmolPwf3YRoL65a+3X9T6lPGYVIY+UVc1aCiY0MWtBUys11VYQNyA44HrzheQ
         AqAsLN4hfgCkSsGvUBKEfU3DSRsvBtASzr1x+vUE+f8U0jNYS0K5Mo9x1xRsyLtd/41+
         iqMhshYRWkIhLbJwSIdJzrvPVWrcZxtTyfTJmTqoyoyGVgoVgldCgfWHN7bNCjoGp62t
         XBe+Bw/UvI7PmErkbRF2n1U79XUKml1BiYUfLLb1bYwBG86mgSYkniRJhkaTOT6LnlYS
         RETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755970466; x=1756575266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p79RiCkjXWLUASsdJ5DgtzttInFEX17Obcr/BXMTYnY=;
        b=XX16EZnV6NIBWDAVGdR/5GCpXDDp52UVBwPf1yBswN0FtIS7PVRt57evd0zhy2VwSz
         sTFAEVuSnh05euFsam4LCy33CUOuPtZTRZgGQ9Zzh0KFp4O5dbogQwCuD0CvQQiNMq4j
         Q3xUEQSDzpoVPLQTlBS6iwAm3MYyNeoKMxVNZ20sEAI+jymVl3lPCkkOodjq+5wpBhIa
         wWh+eCpxbkFxKx600D8IzBeCLUuFC4bVms/LPzpTCaM1zC9lNq+q+Em6b4jInQx3zKIl
         DRuMRH7vnzFKj++RGY1T/JhBk1Js3OK75ONCS59t6OcuNqgByAjnyOq/sNBNVszxmPU3
         NlLw==
X-Forwarded-Encrypted: i=1; AJvYcCU84pD2TES+gjQ/C6PVOpdGy3I6Ua7F4+Ro6U5fVUWxmfYa8nMP6lQ6F5EWXVLCqf/kuwFUrlX5FoNJlszie9JhFQpOgw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyzCnlobV5BjbsXkK1QI2uXXhyshqRhaGGrp11X9Z8a+0u0ZErA
	YnR7dMzwjJqm25NVZ4Ny+clyv9elVz4JViu52lcbSQsasjV1fCkCPdiNi8z8+Ep6xaHp2mBwDEx
	kjKjVp4FafCmquwSY4NY2R3WkX6tiCig=
X-Gm-Gg: ASbGncvDa6iene2z1uAs61PtTJo3xHtMTClpMLye1rmz51kiIVedNDzAVQvgswxoGCX
	OTIR9tF+KWfXHwFrtcoeFbMDkQNJxQAgGm64WcJeBvXHjr0LjcrbL2/Divnw2MkA3aJZFYZs3fF
	bxEU7UlvOXtYNN/geeNQrpzlUVyyYHZLbKMwajFJPuEMXV/Vm//pfzApJ7kBsg/uJUKeiHSFL5M
	n7/HvgyAtqPc8KFfTQ=
X-Google-Smtp-Source: AGHT+IHxiBRiuMpJ7EqZBfQD9DGyW5DeRno3nnCyer5o8dqLsztFHLgzy9OFP6aS9O4+O9Cni7wDhcQwllFqXWMoqwc=
X-Received: by 2002:a05:6808:8516:b0:435:7380:5b7c with SMTP id
 5614622812f47-437853412bbmr2713428b6e.35.1755970466106; Sat, 23 Aug 2025
 10:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DgC9ldLgYmvzXaAZpH-XsBCKhwKSRirv1SdyNKAyWkv0buVk8ZXruCVWp7pYeSa6Ogg-jj6hxYTLAxC0m0FYeg==@protonmail.internalid>
 <20250817155053.15856-1-marcelomoreira1905@gmail.com> <hi2bosmnbbqbsrxydjqh4w7ovzggfdvpafubqbzdovuwzwqlfh@z2wbwjaqizzk>
In-Reply-To: <hi2bosmnbbqbsrxydjqh4w7ovzggfdvpafubqbzdovuwzwqlfh@z2wbwjaqizzk>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sat, 23 Aug 2025 14:34:14 -0300
X-Gm-Features: Ac12FXwL9MRv4pRL09Pu0iTzs3q4OMT6afVV2IdGC2Zw0TVyKwdTvxyopZ14-jw
Message-ID: <CAPZ3m_iNj2zwpAovv3BTz8gNp5XzdxSRHBFonM9sJvaSjYVBeg@mail.gmail.com>
Subject: Re: [PATCH v2] xfs: Replace strncpy with memcpy
To: Carlos Maiolino <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 21 de ago. de 2025 =C3=A0s 06:39, Carlos Maiolino <cem@kernel.org>=
 escreveu:
>
> Hi.

 Hi :)

> On Sun, Aug 17, 2025 at 12:50:41PM -0300, Marcelo Moreira wrote:
> > Following a suggestion from Dave and everyone who contributed to v1, th=
is
> > changes modernizes the code by aligning it with current kernel best pra=
ctices.
> > It improves code clarity and consistency, as strncpy is deprecated as e=
xplained
> > in Documentation/process/deprecated.rst. Furthermore, this change was t=
ested
> > by xfstests
>
> > and as it was not an easy task I decided to document on my blog
> > the step by step of how I did it https://meritissimo1.com/blog/2-xfs-te=
sts :).
>
> The above line does not belong to the commit description. I'm glad
> you've tested everything as we suggested and got to the point to run
> xfstests which indeed is not a single-click button. But the patch
> description is not a place to document it.
>
> >
> > This change does not alter the functionality or introduce any behaviora=
l
> > changes.
>
> ^ This should be in the description...
>
> >
> > Changes include:
> >  - Replace strncpy with memcpy.
>
> ^ This is unnecessary. It's a plain copy/paste from the subject, no need
> to write yet again.
>
> >
> > ---
>
> ^ Keep a single --- in the patch... This is used as metadata, everything
>   below the first --- is ignored by git.
>
> > Changelog:
> >
> > Changes since v1:
> > - Replace strncpy with memcpy instead of strscpy.
> > - The change was tested using xfstests.
> >
> > Link to v1: https://lore.kernel.org/linux-kernel-mentees/CAPZ3m_jXwp1Ff=
svtR2s3nwATT3fER=3DMc6qj+GzKuUhY5tjQFNQ@mail.gmail.com/T/#t
> >
>
> ^ All those Changelog metadata should be below the ---, so they don't
> get into the commit message, but...
>
> > Suggested-by: Dave Chinner <david@fromorbit.com>
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
>
> ^ Those should be before the '---' otherwise, as I mentioned, git will
> ignore those.
>
> > ---
> >  fs/xfs/scrub/symlink_repair.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/xfs/scrub/symlink_repair.c b/fs/xfs/scrub/symlink_repai=
r.c
> > index 953ce7be78dc..5902398185a8 100644
> > --- a/fs/xfs/scrub/symlink_repair.c
> > +++ b/fs/xfs/scrub/symlink_repair.c
> > @@ -185,7 +185,7 @@ xrep_symlink_salvage_inline(
> >               return 0;
> >
> >       nr =3D min(XFS_SYMLINK_MAXLEN, xfs_inode_data_fork_size(ip));
> > -     strncpy(target_buf, ifp->if_data, nr);
> > +     memcpy(target_buf, ifp->if_data, nr);
> >       return nr;
>
> The change looks fine. Once you fix the above points:

Ok, all points are clear to me, I'll send v3 soon. Thanks Carlos!

> Reviewed-by: Carlos Maiolino <cmaiolino@redhat.com>
:D

--=20
Cheers,
Marcelo Moreira
