Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A639C39659A
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466351; cv=pass; b=YPTV2sfH69MthKQK/IQ4NvgtlY10KfgRk2xreYqA2R+F7fFc+7widVjfWvL3aACi94XH9+1XXQvgy5N9ifylebxbs/irSoNyzumDWISSCIVCzJsnCtrEzSU4LTv5wOvU57nnw+Oe10CmjrXeYDDHgoTBBkmAifys35dip9Rx++Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466351; c=relaxed/simple;
	bh=hvftE3gW+EeAfsf3Zx0Bp0RTxgvmF7fWDRfmyNP2yNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQ2ZAyID0vPx+D7Yvwv6O33rBmPid+/49lkH2+prTB45QJtbo9cuYxX0N5qmeKBeAV85SkCsKjbemTr+tsvrRYmrzvN2pA/kbhTY83+tsIe9WnzSGF7RY0O05INyx+tAd/MlIgwtNk7pKYO8p7JG5kYkoQIk5Ytea+EzddDtTtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzxeFiQD; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzxeFiQD"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92ed19f4d60so6236185a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 09:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786466348; cv=none;
        d=google.com; s=arc-20260327;
        b=LGmIMPv301Kg0nbfJVbdSWfZqFyVcXIsuoAHyK5oPDIRHI8RcLjAvW9kw63JVb045/
         8BZeOB6ZrXc/ug3cX0q49PM0wAKTWg9zRFnogozTx1GbnhvKslsYkbcaA0gpI6chBSF6
         mTYqj+zy9Wabu7lMzQhXjrJqb4+0+eoGcaeK+XG5JHk6rXr2UTCRPHDiL1ldOAouR39K
         uePs5dJPX7TBIOu1WYjzfnBpoFoXWRUczL7grIDFpfZd3uxHVeLUjgSk4fYUgBKaIPeA
         ZyziEKdd83T90qTK/zd7YgXepMv/pmTWNovw/x3Q8sPeucKyz1J094CWk99NVIIL46to
         ssQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4bcFHmkU9nSJ0MDbVyrPBqiYyAs1hPGT8G7FVHkOHZ4=;
        fh=6T0/MOZpoz7Rqavu+qeexFYqUpFRMsHyvdRkAakjB+k=;
        b=l6b0AupP7OaCbOhxG0Vz/M6D6vgReFT2ZePFG1+koSGmkhdX9oPIjJA6SQuYNB+r1S
         +T8KNJwQDxC2fbfpfwz7MFfJ6XydoUGw3Gs3IEulxb3hpG+qiXly/4mHxC7qWUjkI2hG
         EmF3jLjjdMsv4jPIp3Z+Zd1/3m7948obQQg+Jo8QVxwKKxEmZ/yqC/HYAkfLyFRgXF2U
         ssM1jIfGj80LuYVF6C/Cu35FZb5mpCwe5V4qCR6cBKDyCwWExxi163rF4/xlUsP1Wzcq
         vsTRXcuM6GS72iATB/+tN+sQZ7kVEUVG6jnmTKM4qv+3uUXYParSgidgOkPPhdqeamre
         rvtw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786466348; x=1787071148; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bcFHmkU9nSJ0MDbVyrPBqiYyAs1hPGT8G7FVHkOHZ4=;
        b=ZzxeFiQD6MJPYBx9QMXsJmdXQQKZKS7q/DJ8XKdQUcXsZsjUyFYLtIELiw+r3j2kxL
         kE0y18zhhHlAhOFYCoMeh4/QbNZT87Fe8SU1VRPeQFXgN83pbNZN4mJw73/PR6ADgUL5
         pE+6377Oc8fr+ZlX/ONfBxsURDWgdIgAvRckgvkekIXsS9J707AwuoZXAWbEW9MJlXFC
         csWTcbYQjE7BUpvkkgXIMtg75vDp2HfOrWrUClIDzdY0XEMaFMn4rF+h/Ugx9mQttaQX
         OTZnJ3TyQJ9yJxLdX+016DevfBc/EC/fCxLa0cM1Z9nUJVaDzMclUz9ws27IBHZxaEbR
         fp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786466348; x=1787071148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bcFHmkU9nSJ0MDbVyrPBqiYyAs1hPGT8G7FVHkOHZ4=;
        b=KOtKbbpYi+2F+IUfhCic7DbZCWNSQwdXYh5Yqod1QnadBDm1t+ZMtXSyq0hk4364T2
         bKwSEZVzszfpj59j2bmNGhHuPnzMBlWzPIXx2SNhXpgDnrWx3HfgiXeTOCSm8SrGPP0d
         eLvsQHAm5Qtf9CRL416chm00YOFjIXGQfbUGuquKURxxoQXTJWAKmtSe/OdDgInzk+/X
         ju8g9qctE6CUz7xY5h0FveVtTUCLrxyHJHq5+vaCNdIDGRnAo1NIT4Vz+Ewe5fEut5LP
         RLMYoj118DmmPMY+gvt8vqWFrqsJss9LMF3HZP+l24pIW//7RrweyPgoLqlC31fRetnL
         Lh2g==
X-Forwarded-Encrypted: i=1; AHgh+RpFxJHO4K+p8ImTkpA+wQPyZpOkYVJJKwkq0c2B74vTBJmBk14pFAd3Z5UGIzB4vkgGC3ZhMvWpKwtACUTXzXYiMHgfcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyS80scZe3vtcdi5Tv3DoVVCmz5Wy9o9eALartWmd4yLk3keUxe
	1Kv8f764KckNPfonnWK6/xyXTtXOH/84OAykc7kTRtk1wE3FqNlcEjNMbjB72jKHNEtLmTRs6cj
	EBQcIwxXiF/eD+28Y0Zh0ioDpbpRpSc4=
X-Gm-Gg: AR+sD12qCbpX0nmUPHwqb49SyTIrBETkowIRBrOO5/lssqwNW4gcvNXyqqrWVimXJaV
	J16OmGhK8jPCNDtsTC5xkPFVJAYqZcGhqPB2iGp/Yf6CzJiqc29sqBOab1SuGxmfLtecAxgxVEW
	EtiPh3UiulJNK+quK/kMwyG41oHg1YZJTjz1gjMXREXSm1PNfZiDjDOvjAMdbl9gybrTNwRlCR3
	7ThP3ylgCLnMxZQWcWwK68ocBhDzJ2K5SIz4RX7olj0xrdJIocfW63QaY0wR3xisDiB3vGnJcNo
	AC0+6x4U4TEpW++KMRnW8a5zAoDBAz9f7OsBf+nUO07phb9/EqIjsxp0xtfAKweYeETftNGSAem
	mIC6HiY4QTvsigOKBJBFuAuS//XDKhIF+/Fg=
X-Received: by 2002:a05:620a:6018:b0:936:9f49:69ca with SMTP id
 af79cd13be357-936ae1b6195mr122622585a.21.1786466348494; Tue, 11 Aug 2026
 09:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730153603.5721-1-tharitt97@gmail.com> <3cfca6fd11f39c6ce161d5a2e7fb650b2e9289ec.camel@collabora.com>
In-Reply-To: <3cfca6fd11f39c6ce161d5a2e7fb650b2e9289ec.camel@collabora.com>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Tue, 11 Aug 2026 23:38:56 +0700
X-Gm-Features: AUfX_mxbavY404ZnMz9OyorTzYiN16EACxukLGAUaARpCgqkofGP15kHe_8MlHk
Message-ID: <CACak8wPrEJ6hj2hL=5yQVY1oUPcJV0GwZChbVGT+n0C924jR6g@mail.gmail.com>
Subject: Re: [PATCH] media: rkvdec: fix v4l2-compliance failure
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thanks for the suggestion.

I moved the default out of rkvdec and into the common V4L2 compound
control initialization, making V4L2_CTRL_TYPE_HEVC_SPS default
chroma_format_idc to 1 (4:2:0).

I'll send this as v2.

Thanks,
Tharit

On Mon, Aug 10, 2026 at 9:05=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi,
>
> Le jeudi 30 juillet 2026 =C3=A0 15:36 +0000, Tharit Tangkijwanichakul a =
=C3=A9crit :
> > rkvdec fails v4l2-compliance in two tests related to
> > V4L2_CID_STATELESS_HEVC_SPS. The Control ioctls test reads the control
> > with GET_EXT_CTRLS and writes the same value back; TRY_EXT_CTRLS then
> > returns -EINVAL because the VDPU38x rkvdec_hevc_validate_sps() rejects
> > sps->chroma_format_idc =3D=3D 0, which is the value returned when the
> > control has no default.
> >
> >     v4l2-compliance 1.33.0-5491, 64 bits, 64-bit time_t
> >     v4l2-compliance SHA: b32589c51481 2026-07-16 08:51:38
> >     Control ioctls:
> >         fail: v4l2-test-controls.cpp(942):
> >       try_ext_ctrls returned an error (22)
> >       test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> >     Buffer ioctls:
> >         fail: v4l2-test-buffers.cpp(3102): node->streamon(q.g_type())
> >         fail: v4l2-test-buffers.cpp(3157): testBlockingDQBuf(node, m2m_=
q)
> >       test blocking wait: FAIL
> >
> > Provide a control default via p_def with chroma_format_idc =3D 1 (4:2:0=
),
> > which is the only value the VDPU38x SPS validation accepts.
> > This fixes both the Control ioctls and the Buffer ioctls failures.
> >
> > Tested on Radxa Rock 5B (RK3588).
> >
> > Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 v=
ariant")
> > Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> > ---
> >  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/=
media/platform/rockchip/rkvdec/rkvdec.c
> > index 1d1e9bfef8e9..37603f049788 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > @@ -236,6 +236,10 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls=
 =3D {
> >       .num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
> >  };
> >
> > +static struct v4l2_ctrl_hevc_sps vdpu38x_hevc_sps_default =3D {
> > +     .chroma_format_idc =3D 1,
> > +};
> > +
> >  static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D {
> >       {
> >               .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> > @@ -243,6 +247,7 @@ static const struct rkvdec_ctrl_desc vdpu38x_hevc_c=
trl_descs[] =3D {
> >       {
> >               .cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
> >               .cfg.ops =3D &rkvdec_ctrl_ops,
> > +             .cfg.p_def.p_hevc_sps =3D &vdpu38x_hevc_sps_default,
>
> Thanks for your patch. Have you considered setting this default in v4l2-c=
ommon
> instead ? Monochrome is rarely supported of implemented in codecs, so set=
ting
> the global default to 4:2:0 seems like it would be valid for all drivers.
>
> Nicolas
>
> >       },
> >       {
> >               .cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,
