Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100C03164CA
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 16:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756225603; cv=none; b=mUPnnKlzVATRtdxBAOVfmGb6SfwBQrOGrRc2Dgbg5pqdwkH7oTCnWbLE0HvIXe9TghXvghL+JL94wjeu9+Vt4/vBl7bZmjVlVdhXCfdutvRZnxGqmI6iV+l4oxLFvzp3W54s25P8T9HR7bU0Nzk8+FV2uYN5dlkCClxVRvITKaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756225603; c=relaxed/simple;
	bh=KIUHApQZBeG3sv1gBKAzcJWc3aNcc0ib8FLAyWN2igM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ot7uztYFRp6CPnr7nCCXmMZmyw5pkKocHJmVsWoXf9q8I3xy3TDNFMEINPgujjrnwUvBg7dg3P15Yo3Qojpn80WiUwp/TTuCoT+iQQRdhVbBmUASjRZmC7bruWyJYYWizig9t/9x9KZQ0KgK5H1qvNpMPOXPFI/wb3161SZeroI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ojn9OLKI; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ojn9OLKI"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-33685e3b16aso9737221fa.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 09:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756225599; x=1756830399; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5zGMY0B+wsQd0Wnquc7Hok6cqc/WBPDwGcUcIfHRhk=;
        b=Ojn9OLKIcHU7kgsFw9NmhLOhN7eaNEYCkwVASoIZQ/2QJeqLW5icDrCXiP4uGUli/z
         HzPKIvgkknvv7o3Xm6enDa3me+p20n9L7YPxpHevenqG1vnnW78TVmdxNi4SLY14fiSt
         s+QunRIpxRH57cwB0eyLV+8vhv6wlU3hSb4vt8EgttPTiPOrEjzRXvl3Rpwyu4DWVfOo
         Igo3e5n/pBKzxNUrgpZh8u2S43v3KC+rBFSSQS/hhAvoEFycRtoMM4ezLAX35mzJJSeO
         OlwnN5CccY/hHdZ/q3BJv3uS5TxEaDXwDhJVMd2dyL0QOYuLXMskzIcKTWyOlEVcg5Kn
         IWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756225599; x=1756830399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5zGMY0B+wsQd0Wnquc7Hok6cqc/WBPDwGcUcIfHRhk=;
        b=PKzNmDiVFlwlZbr3LtMM6nYw050j487NYwKKpEuwQgeCZJw+es1lKot/SVAspBLYjG
         87OafOW/Lu/qbLu6sgivsiFTxlHbo8sKM4lauGBR1zxXb5RPa0sd15SrPRZmABUYHVya
         qBsMARAQFLOwa8maLJs2UtcqbMZifPoehSRDP88Sl5pgs9maYJEoHfFRQQ41Cx3NyXMn
         Y7s3538tnfCKP/w7n8yDtlNgX9Ho54GRCPdSe8Ie093KlBYM0cPkF8isskkI2MvC+rIK
         sx1t/hrU197Q0JAtU+t8zqDPRgP7Bz4VeJxShMJHtNPhhakCPOHDCx3UuMtw2dGKJ3I4
         +dAg==
X-Forwarded-Encrypted: i=1; AJvYcCXV1+xx7mb9Op5bW4GuFODoEyf5sMsdqx/SfVvFzmzVtSs9pAXTHogsCHIzribyT3CJmXrCRnCAut6fK9YODSr1FcccRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzI6pyFEDqjAEXXHp4eqI+ZDi7TKSbm1VVwAfyqUfjxfWsnIRXl
	nkVdi3xPqvE3HlOaUX/XMIZnx8zMNf78ISuOGltDyu0lPjl++3SHhJNRwiSeVzMlZzRLCKPzU1y
	A3/R1Sd138JQlFQh1T/AE3+UVwh3ZBhI=
X-Gm-Gg: ASbGnctCC0zosebIKpHMqlLsj0+5It9UUw1QLHwYiJxPn+V827UYofAqdWHu2Pf6pJV
	paXNmcTLHM1hR185EF82MamloImCFqq60gc4oSeYkepJsCc9V9mANk/GynNjc5OTZH46dKfxzlz
	mdXodGm/JTWtSSq0OnH1tNfMnuzy4yNSdIuRpzLUTKHsmNLZjaGPDSUGzlzh5sNmiL4iGzC52ts
	wkTpHwHbZ3GgfH7FtGjh53279xFVfwUOctmC+bR/A==
X-Google-Smtp-Source: AGHT+IHkb64c4bZS+NGaeP4VCluu/PBLB8BKBtdaSeEYU+WxbjYgL2JboP1sxe+Bh7hVlYsMPO1uy+hpvD/0fQSHB0E=
X-Received: by 2002:a2e:be92:0:b0:331:f04d:e689 with SMTP id
 38308e7fff4ca-33650fc8436mr45721141fa.41.1756225598840; Tue, 26 Aug 2025
 09:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730142301.6754-1-pranav.tyagi03@gmail.com> <20250806164841.2907972-1-joshua.hahnjy@gmail.com>
In-Reply-To: <20250806164841.2907972-1-joshua.hahnjy@gmail.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 26 Aug 2025 21:56:26 +0530
X-Gm-Features: Ac12FXydsbaI3ePxtk_Pq8B7Slgn4iz04KSeXyYj_cYZPkXFV1_OSHzZmmvB410
Message-ID: <CAH4c4jJmCP8w8mbeTpOhNvWCgb9U1A+ssny3nSw9Qg5tEnqVcw@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: use __auto_type in swap() macro
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: akpm@linux-foundation.org, peterx@redhat.com, shuah@kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 10:18=E2=80=AFPM Joshua Hahn <joshua.hahnjy@gmail.co=
m> wrote:
>
> On Wed, 30 Jul 2025 19:53:01 +0530 Pranav Tyagi <pranav.tyagi03@gmail.com=
> wrote:
>
> Hi Pranav,
>
> Thank you for this patch! Sorry for the late response, thank you for bump=
ing
> the patch. I just have a few comments about the commit message.
>
> > Replace typeof() with __auto_type in the swap() macro in uffd-stress.c.
> > __auto_type was introduced in GCC 4.9 and reduces the compile time for
> > all compilers. No functional changes intended.
>
> From what I understand, the compiler optimizations from typeof() --> __au=
to_type
> applies when the argument is a variably modified type. It seems like this
> internal definition of swap() is only used within selftests/mm/uffd-stres=
s.c,
> and in particular is only used twice, in these two lines:
>
> /* prepare next bounce */
> swap(area_src, area_dst);
>
> swap(area_src_alias, area_dst_alias);
>
> Where area_src, area_dst, area_src_alias, area_dst_alias are all char * w=
hich
> the compiler knows the size of at compile time. Given this, I wonder if t=
here
> are any compile time speedups.
>
> But this is just my understanding, based on a quick look at the code. Ple=
ase
> feel free to correct me, if I am incorrectly understanding your changes o=
r if
> my understanding of __auto_type is incorrect : -)
>
> With that said, I think the main benefit that we get from using __auto_ty=
pe
> has more to do with readability. Since __auto_type can only be used to
> declare local variables (as we are doing here), maybe we can rephrase the
> commit to be about improving readability, and not compile time?
>
> Again, please let me know if I am overlooking something.
>
> One other thought -- while this internal definition of swap() is confined=
 to
> selftests/mm/uffd-stress.c, there is another identical definition in
> include/linux/minmax.h that may be used more widely across not only mm
> stresstests, but across subsystems as well. Without having taken a deeper
> look into this, perhaps this version of swap is indeed called on some dat=
a
> structures with variable type, and we might be able to see some tangible
> compile time improvements?
>
> In any case, this change looks good to me, but maybe a new commit message
> that can more closely describe the effects would be better : -) Once you =
add
> those changes, please feel free to add my review tag for the mm selftest =
change:
>
> Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
>
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  tools/testing/selftests/mm/uffd-stress.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/s=
elftests/mm/uffd-stress.c
> > index 40af7f67c407..c0f64df5085c 100644
> > --- a/tools/testing/selftests/mm/uffd-stress.c
> > +++ b/tools/testing/selftests/mm/uffd-stress.c
> > @@ -51,7 +51,7 @@ static char *zeropage;
> >  pthread_attr_t attr;
> >
> >  #define swap(a, b) \
> > -     do { typeof(a) __tmp =3D (a); (a) =3D (b); (b) =3D __tmp; } while=
 (0)
> > +     do { __auto_type __tmp =3D (a); (a) =3D (b); (b) =3D __tmp; } whi=
le (0)
> >
> >  const char *examples =3D
> >       "# Run anonymous memory test on 100MiB region with 99999 bounces:=
\n"
> > --
> > 2.49.0
>
> Sent using hkml (https://github.com/sjp38/hackermail)

Hi Joshua,

Thanks for the detailed review and I sincerely apologize for the delayed
response.

You=E2=80=99re correct =E2=80=94 __auto_type mainly provides compiler optim=
izations when the
argument is a variably modified type and in this case the compiler already
knows the size of the arguments at compile time. The motivation here is mor=
e
about readability and consistency, as __auto_type is already used in severa=
l
places within selftests. This patch has since been picked up into the
mm-unstable branch.

I also looked at the swap() definition in include/linux/minmax.h, which is
indeed more widely used across subsystems. That version may offer tangible
compile-time improvements in cases involving variable argument types and I
plan to follow up with a patch there.

Thanks again for the thorough review.

Regards
Pranav Tyagi
