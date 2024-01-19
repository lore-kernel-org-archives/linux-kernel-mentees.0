Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517C54F1F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Jan 2024 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705669243; cv=none; b=lbe3hi8FIVy/KHz68cTiVuBuBEpUJVHC5OEgGDzVPtnp3RBRO72Sen47009SDFsoIMVu2r+EARrBa25d0DbgZknQMatew4+Gas4it485ZcTSgnQ8I22nWKGOSMEmHtVe9N8k1wDp/+WDRVTuppqvuw4/czUqGqdoTdlVnXbS9VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705669243; c=relaxed/simple;
	bh=mdBmJE5htP6mGHoqmVAD72lO+X8fEp+UZKSDLsltcRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQEtB/c9xkG4VYj9dGDsYqs18OeDT7fMhC6jNjvXF77hsWcBAWaw784m0ZHDlnDDwGOWjKQEA52zU2v6njLTuhw4i8ZTWTwF/KDf2Oef4yhypU34uWWdKzG6nf3KAjGWUX9vXuZMxz49J3YRJJKXsjTx2SlkNgSPjIelYvmDMAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZ6QTJjm; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZ6QTJjm"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB55C42D43
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Jan 2024 13:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB55C42D43
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bZ6QTJjm
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlSf5PgVUVNF
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 19 Jan 2024 13:00:40 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8CE0642D42
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Jan 2024 13:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CE0642D42
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a2cea0563cbso110405966b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Jan 2024 05:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705669238; x=1706274038; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siajBaaFqK44x1k/dWoEneNkoHYdap1//tkVoA2vxzc=;
        b=bZ6QTJjmBvVgcr+8jM4rK32bk4RD93FD1anvFxVwGwdFsx3rgmE2nvD6cR6RHMGChx
         o8b6Glw101e7p/hvMjaFOUUk1sO7xI8JOuUpO2sKwL6qO/FZ+NmYGpziSj0K7NOondfw
         m5WbCJV5EKrjNMooeJhGy2F4SoGapTjwjFDXn6R+CNaBgUSTzXItfB2GXTXqiJxGIrh4
         CbhjATUffKGN5NHoOwznylHo+zD4gI30gZdQ2bOPKPtNqR8Ui7HKs98i1W382foCa57k
         rwECWQhtGIjwK/sZ0zKs7gBObaWWui3Fi2cJHwhTf7fQOlv872QNVA24lSjHB+01xb1e
         JuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705669238; x=1706274038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siajBaaFqK44x1k/dWoEneNkoHYdap1//tkVoA2vxzc=;
        b=B+zjmRlwDFXEeOVqQQeY64t45sqCCSeZuL2knYwmtnHJqrt/zp08IinmT5fltZhqXB
         cVrgWewVaDesjVYN2uWyW99DQfY7gruvPLi/dvEm6y6VuujUWZQ/azkV0EgZuChiaSdi
         Di2sTNcHMdUW8iMlRWf5/ON98vH6oDxZb/vVKHo3ujKCyfIr3jTZCuqn9DyUEK4pZwp9
         XFbEoFQKB1iJVIPDRt0CXWB3gJAU6gd5nV7q4JGEonOwcldqVuCrtL9UYY2s3AuCAtS6
         gtfiu83ArdNiKh1Ug03sZCVPBfKxAgl93Fq5vlWLh8cBuGGDtC9xi0xLBUbyOzVayNn8
         SwdA==
X-Gm-Message-State: AOJu0YxLNir9S1NfxLfswS0Q0gJqOwsDCw7pAwEzsWir+C9vlkqXExqK
	O7jEmZQugmozH1q6d4JTFpZoDoQCbBAHWRyOnXsKXkDAiMjzpy6Mf7c2r69mVqbxF9BWefBRgcM
	eJifjtitQ1/KXZA8Z/lTc+bPXUTg=
X-Google-Smtp-Source: AGHT+IEQ1BqWJ+lTrBmjsBDQf4pc86I2Zj/8lsICSt1zZdDCtTmggLXlX5TemcpbuMaFraoNhuIS+PQqLeRnofyL8eE=
X-Received: by 2002:a17:906:84f:b0:a28:fa55:3597 with SMTP id
 f15-20020a170906084f00b00a28fa553597mr1237981ejd.98.1705669238281; Fri, 19
 Jan 2024 05:00:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230803052238.12147-1-rauji.raut@gmail.com> <20230803052238.12147-2-rauji.raut@gmail.com>
 <f739cc15-dade-4f69-a17a-30242026c099@broadcom.com> <202401181217.1D75C32E@keescook>
In-Reply-To: <202401181217.1D75C32E@keescook>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 19 Jan 2024 14:00:26 +0100
Message-ID: <CAKXUXMzjGbO0U0pko1rg9=q3j6xS5rbzmLnMPeT3g9fMhBr0hw@mail.gmail.com>
Subject: Re: [PATCH v2] brcmfmac: replace one-element array with
 flexible-array member
To: Kees Cook <keescook@chromium.org>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Atul Raut <rauji.raut@gmail.com>, 
	aspriel@gmail.com, franky.lin@broadcom.com, kvalo@kernel.org, 
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 9:20=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Thu, Jan 18, 2024 at 02:53:28PM +0100, Arend van Spriel wrote:
> > + Kees
> >
> > On 8/3/2023 7:22 AM, Atul Raut wrote:
> > > One-element arrays are obsolete, and flexible
> > > array members have taken their place. So, in
> > > struct cca_stats_n_flags, replace the one-element
> > > array with a flexible-array member.
> > >
> > > This fixes warnings such as:
> > > ./drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:119:6-9=
: WARNING use flexible-array member instead (https://www.kernel.org/doc/htm=
l/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> >
> > I think this correct, but maybe Kees can give definitive answer here.
> >
> > > Signed-off-by: Atul Raut <rauji.raut@gmail.com>
> > > ---
> > >   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg8021=
1.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> > > index de8a2e27f49c..fff32e54833d 100644
> > > --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> > > +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> > > @@ -116,7 +116,7 @@ struct brcmf_dump_survey {
> > >   struct cca_stats_n_flags {
> > >     u32 msrmnt_time; /* Time for Measurement (msec) */
> > >     u32 msrmnt_done; /* flag set when measurement complete */
> > > -   char buf[1];
> > > +   char buf[];
> > >   };
> > >   struct cca_msrmnt_query {
>
> Normally a [1] -> [] conversion needs some details in the commit log
> about why this is safe (since it runs the risk of changing sizeof(struct
> cca_stats_n_flags). In this case, there's only a single user of the
> struct, and nothing about its use depends on its size:
>
> #define BRCMF_DCMD_MEDLEN       1536
> ...
>         struct cca_stats_n_flags *results;
>         char *buf;
>         ...
>         buf =3D kzalloc(sizeof(char) * BRCMF_DCMD_MEDLEN, GFP_KERNEL);
>         ...
>         results =3D (struct cca_stats_n_flags *)(buf);
>         ...
>                 brcmf_parse_dump_obss(results->buf, survey);
>
> So, the allocation size is big enough for the struct, and nothing
> depends on the struct size.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>

As the linux-kernel-mentees mailing list is in CC, I assume that Atul
is a linux-kernel mentee. In that case, it is certainly reasonable and
at least of educational value for Atul to take Kees' explanation and
add this to the patch's commit message in his own words. Then, with
that, submit a PATCH v3.


Lukas
