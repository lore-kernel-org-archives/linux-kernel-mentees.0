Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACF7DDC1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 00:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328196; cv=none; b=FktXZXHVmqGa05eHsmefNkvaex3tZPu5mt6T7TmbR+Od8Vp3pWG1qmRs7rHe97a9UgyQoe8jOubVeOB6bnbR1yDFEYBVvbt35H/yawe6mdtvgsQdboO7RjvUrq9zCFTBF4NnAvz/A5mSxfwcNPXJVEC16s5UO3KlnEIvtBLvEPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328196; c=relaxed/simple;
	bh=r3HO+OmwgBy9rHu1SO2ar2a5RsyDb8ikV2VwcVG1RBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nM+2uqaUt672aaFPNBVjomOucmYaTm560B7bFg5zm4ZDUQ/0c7mfGN0j8Jirx8EtssUyRyFsto10Mq1FMpxfYaUz3sPZ2HQlEY7PNuTzpv/M+UFnXKbIUTCyeVBpbFEX8ykjtvr3q4WnJ899xk4UIbAoS909FGiib3rbH43iR+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJquy4jb; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJquy4jb"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C74941895
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 00:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlmAv84xuwKl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jul 2025 00:03:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64B7F4020F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64B7F4020F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aJquy4jb
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 64B7F4020F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 00:03:12 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-40ab5bd9088so3213446b6e.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Jun 2025 17:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751328192; x=1751932992; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ENsEpAeVLDs9lQsTFPW2zvKgMcTyFgJZvhlvMb6Kpk=;
        b=aJquy4jbCy0UrKhuXMiyTE2gUVUr2ooDOrJoAxpYAPkcBza3SdSvFOYnc6XgmpKjh2
         xA5wf6WMaSrMiZre+b7K8WWgel7YQtOREEiKTURVnCgMIYhJIdTENzzXcHXzBVWqE2Gr
         PKF867/SgZIyU9QNu+OTj2XidHA1WvBz20WQhRwdJav1VutmkO76V/NahiIqn1K1p6L8
         biwiOkCJ7W9CzFce9J+D9yKaXdr4BDwp/UZdHExrFW5b/wCIfjzLnALhwt+KpFbLk6+K
         3q+luvyHJdBxBvlzvHmqAQpT9yU252iMp5f5jRf8wqfU0fAwVCV+0rMd40Xs/FvI5SLH
         BA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751328192; x=1751932992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ENsEpAeVLDs9lQsTFPW2zvKgMcTyFgJZvhlvMb6Kpk=;
        b=eR/87pOPo5wS0EyDz+ICVuG7ZpbZq3fQNKud7UGJFzXmDjN4O2XO9cG3c6pMcgG3lG
         jaALDLQOgUVD+aKpgOcJzuFtN0MLg9QPH9XIjx04/oCVhocDv3gKgGwLYD6FU3YRHzom
         fjeT4YYUaPFvMsBO9Ll0hy1TJFYcg3swFDdGxB6Q3hF8Mep+xlP5ytyNToGPUDCy4tej
         w7hphvtjS10xM8C4PfSlKQHDrUx4pg8nz/dnb5P0goqjX2jhwOOROo4qAYhjZksL87XR
         dSxu/X1gzWVKhUKWgDioYFvHD/9C4MUpJlVSUQYfMuAD9+ZuZdDEyiQltkIcUITl1hrX
         m6Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWIf2xVpZpIlCegD34JLVOVGuCazHKVmLtJWVYidh5XsuHrA+FMEG6q7wFvovOSv7UrJ4uAZ/Na9QvT+1/oGoe4dwg/Bw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YziTcnixTxYrKJUetXZZTcNDlHEGzhhrmuFLcJBKI1JiopduTDn
	orH8BVB/ax/I/JjPFyluSXWSjoatg25UJQSQ4jlg0AV2dKGbruWdNBjuhbedIff7RCWRQY0ITb6
	FbIZSx8Cupndz4o7m0HgbAjD9A27vNEM=
X-Gm-Gg: ASbGncsMabO0WIxWz77+a1HfTgDowwv/KXb2r2vlQ2fZAIQXF2JOUBrSqn0k+TT6GM2
	UIWmwtXOZcdEYZUk7zbUMq53V8ltCMMarMqzHgoHhXewA1bSrKnwuwoy+EwQMNXln8loetgV2Lh
	tti3u3+79TSlellOtHEJ+j6ksbPRcfJ47XmtY5N4FR+wA=
X-Google-Smtp-Source: AGHT+IHG3LB3qgHlRcmTBxxBoMm0+Rmi1QgY4I9XqPAvIJm4k3s7YqMw8buhpfA4dYy9s20bpx4JN0bsyTV65Ag6KLw=
X-Received: by 2002:a05:6808:1206:b0:406:1e0c:3196 with SMTP id
 5614622812f47-40b33e5ea83mr12052103b6e.28.1751328191746; Mon, 30 Jun 2025
 17:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250629182448.265407-1-marcelomoreira1905@gmail.com> <2025063001-marigold-renewed-6361@gregkh>
In-Reply-To: <2025063001-marigold-renewed-6361@gregkh>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 30 Jun 2025 21:03:00 -0300
X-Gm-Features: Ac12FXysXiINyh4vhy75pryO5gVlJChGshOynnHRZOmiISFWcogSj31YiL2CQ-k
Message-ID: <CAPZ3m_jo+28S-ouR0DBL9gXEmrM7RjY74MSHx=DE9G4KpRZ4Pg@mail.gmail.com>
Subject: Re: [PATCH] EDAC/amd64: replace sprintf with sysfs_emit in show functions
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 30 de jun. de 2025 =C3=A0s 02:07, Greg KH
<gregkh@linuxfoundation.org> escreveu:
>
> On Sun, Jun 29, 2025 at 03:24:48PM -0300, Marcelo Moreira wrote:
> > Update all device attribute 'show' callbacks in the EDAC AMD64 driver t=
o
> > utilize sysfs_emit(). This change adheres to the recommendation outline=
d
> > in Documentation/filesystems/sysfs.rst.
> >
> > This modification aligns with current sysfs subsystem guidelines.
> >
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> > ---
> >  drivers/edac/amd64_edac.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> > index b681c0663203..b6d211255ef0 100644
> > --- a/drivers/edac/amd64_edac.c
> > +++ b/drivers/edac/amd64_edac.c
> > @@ -552,7 +552,7 @@ static ssize_t reg##_show(struct device *dev,      =
                       \
> >       struct mem_ctl_info *mci =3D to_mci(dev);                        =
 \
> >       struct amd64_pvt *pvt =3D mci->pvt_info;                         =
 \
> >                                                                       \
> > -     return sprintf(data, "0x%016llx\n", (u64)pvt->reg);             \
> > +     return  sysfs_emit(data, "0x%016llx\n", (u64)pvt->reg);         \
>
> Why the extra ' '?

I didn't notice, sorry.



>
> >  }
> >
> >  EDAC_DCT_ATTR_SHOW(dhar);
> > @@ -571,7 +571,7 @@ static ssize_t dram_hole_show(struct device *dev, s=
truct device_attribute *mattr
> >
> >       get_dram_hole_info(mci, &hole_base, &hole_offset, &hole_size);
> >
> > -     return sprintf(data, "%llx %llx %llx\n", hole_base, hole_offset,
> > +     return sysfs_emit(data, "%llx %llx %llx\n", hole_base, hole_offse=
t,
> >                                                hole_size);
> >  }
> >
> > @@ -602,7 +602,7 @@ static ssize_t inject_section_show(struct device *d=
ev,
> >  {
> >       struct mem_ctl_info *mci =3D to_mci(dev);
> >       struct amd64_pvt *pvt =3D mci->pvt_info;
> > -     return sprintf(buf, "0x%x\n", pvt->injection.section);
> > +     return sysfs_emit(buf, "0x%x\n", pvt->injection.section);
> >  }
> >
> >  /*
> > @@ -638,7 +638,7 @@ static ssize_t inject_word_show(struct device *dev,
> >  {
> >       struct mem_ctl_info *mci =3D to_mci(dev);
> >       struct amd64_pvt *pvt =3D mci->pvt_info;
> > -     return sprintf(buf, "0x%x\n", pvt->injection.word);
> > +     return sysfs_emit(buf, "0x%x\n", pvt->injection.word);
> >  }
> >
> >  /*
> > @@ -675,7 +675,7 @@ static ssize_t inject_ecc_vector_show(struct device=
 *dev,
> >  {
> >       struct mem_ctl_info *mci =3D to_mci(dev);
> >       struct amd64_pvt *pvt =3D mci->pvt_info;
> > -     return sprintf(buf, "0x%x\n", pvt->injection.bit_map);
> > +     return sysfs_emit(buf, "0x%x\n", pvt->injection.bit_map);
>
> There's nothing wrong with these sprintf() lines, so no need to change
> them, right?
>
> I only recommend making this type of change when adding new sysfs files,
> no need for churn on old files when it is not needed at all.
>

Understood Greg, thanks for the feedback :)

--
Cheers,
Marcelo Moreira
