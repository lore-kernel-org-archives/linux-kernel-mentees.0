Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDF14D8B0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 19:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721937297; cv=none; b=h5pTHkfnhE4WYc4Sjk1ETgTfkNrHAsuHuY3O57B4QesFClxxYxpB+mS/YRMCoApAiZcj0XzlEEeYsU2bRAI2zdnou6aoPUxnfh1JjKqhPV1hqrrbtBOxMXFZn2InjyKPvzwRyU64jatXU/rQPIHQK6+UdoFGB2jdCEzZvvLOLAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721937297; c=relaxed/simple;
	bh=i22y9vddhr0t0nQH4v8iBs3EFXZyHGLI4XhcmFo1aO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwLC26L+RC+pdr2cpNzw19GSxgGUQIQRGvwK9vK0872sNHyB6jzAeIw0sH0/YJlDoLjcyzeP62sO6ccobjBjH596FNYpgmJbbC+y6wwey0Q8G2XZjDjwB1tol1wA1uYGoCU7qewkarQrFzmhpNUw5tgqmTQLqSj3eH4zLVRoIZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4SZyDPr; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4SZyDPr"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21089402E4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 19:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTNsWZ95gSWp for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jul 2024 19:54:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=alexdeucher@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF36340195
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF36340195
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d4SZyDPr
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EF36340195
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 19:54:54 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fbc3a9d23bso9919045ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 12:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721937294; x=1722542094; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ2/3q/bfgdLQ2SKF+xPcpuZtJ5O3OCCf8lNzI6xqq0=;
        b=d4SZyDPrhI38lp/UFrTahwtdNXzWzoRKeR6Km3DV6qaKMBR/wV8Yo/j9kJpbBV7E/f
         26jboo3evHafM4QPeBuq9Ut4MZFjMcgxDf+vYKUdC/77EOZIjGqtEMBNcWoL4Wk6PIN7
         X7ef+RGHAZL/Ty2GqmC0sQCp8rBSnW0nrekVD41FSOWi3TZvwo2CR4LkKP8PV/SlVdKZ
         X/kXztRuurrT4QiU/UYI0YOziDR/0X83Wp4Hy7W2Dia7ApLEIcDd7YCkT3GnW/iyyylg
         Q5IUVWeuDPGVd3e1K0SngabNwYXte4L44RO7ixVerykcIXZwGdf44/pycbUCGmCuL7/v
         CE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721937294; x=1722542094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJ2/3q/bfgdLQ2SKF+xPcpuZtJ5O3OCCf8lNzI6xqq0=;
        b=p/GdQk2dL6+RpfmSpbF1/LSHhGmLtDxWqHKANdNNEbUOJApEwIRh9d1fcLEkHHC7sV
         ld4Lpt9aP69ySh6h/A8ZsXONIuhdBqgdxbGKylrmC0TJD72fYO7TVgx3KZfAQ5tFMyo+
         9PfaNX6J9Gdx9rPGRvmh49zz+xiajDeSs/INJkqs858aJpXL3o6qcEqI6UMTIgm+fQOd
         PFrWBUimFQ5ZeEniP/pSeyE1lpZmxxe5YRz4YYxVHX1rDOYXu6Gfm/Qq7QkDmMdN0A+p
         UayI4xfcHFkHYW2MEtAcAO12LlUXqd1kKFjOMUVRzR7ZdcgyE4vguwYTLN5kW+295Sw8
         D6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXVaCeuG+XD5q9uFghCc+aWWs/utHPr+MgnZozSnZ0y717+xeJVoQ+1MpA0PkhRwoN2kNmAKG6KxR7sfaaIDrZGuNTtzD+PLq2Z6AvTxqObrQFSzQBVUmFx9b2bBHKH
X-Gm-Message-State: AOJu0YzoR1C36ca9KVFEfKH9L11bSH6bsbGL9IK/i0UPB0/0jB3mygcU
	B2Nlu/ikHpaUz/K8MNA9V7mrDr4GFbopl3AJciiow0XxVaJ+LRa0L2rfBpjTBdpX8ZA7i/a6uXt
	4D42qHv6CuRGGewokJ7ABX20mdi4=
X-Google-Smtp-Source: AGHT+IGlHXz1aSbMBuuCXDUVMJbNQOTZlhgtwLY66bzlvs53OORi8u2Ewst7irO4S9i2tcQNqCkaFe1Pdt6xXP0DHFA=
X-Received: by 2002:a17:902:c945:b0:1fc:4bdc:d413 with SMTP id
 d9443c01a7336-1fed3af1d80mr43778135ad.60.1721937294112; Thu, 25 Jul 2024
 12:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240724175423.18075-1-abhishektamboli9@gmail.com> <qyoun6sfdpdxxzwystaimsiw3o33jwvoqxm3kpawczju2b3dl5@ytjpgyabbzet>
In-Reply-To: <qyoun6sfdpdxxzwystaimsiw3o33jwvoqxm3kpawczju2b3dl5@ytjpgyabbzet>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Jul 2024 15:54:42 -0400
Message-ID: <CADnq5_MHtyUENJGk=f+i-3ODJpGiZc1QFpQuvAh=uaFc9x9-9A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix documentation warning for mpc.h
To: "Ricardo B. Marliere" <rbmarliere@gmail.com>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>, airlied@gmail.com, daniel@ffwll.ch, 
	harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
	alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	marcelomspessoto@gmail.com, aurabindo.pillai@amd.com, adnelson@amd.com, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is already fixed in:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/6e169c7e0f842c48c7bf683=
fb789dbf5a8b1dfd8

Alex

On Wed, Jul 24, 2024 at 3:55=E2=80=AFPM Ricardo B. Marliere
<rbmarliere@gmail.com> wrote:
>
> On 24 Jul 24 23:24, Abhishek Tamboli wrote:
> > Fix documentation compile warning by adding description
> > for program_3dlut_size function.
> >
> > Remove the following warning:
> > ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1043: warning: Function p=
arameter or struct member 'program_3dlut_size' not described in 'mpc_funcs'
> >
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/=
drm/amd/display/dc/inc/hw/mpc.h
> > index 40a9b3471208..615c69d966e7 100644
> > --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > @@ -1039,7 +1039,21 @@ struct mpc_funcs {
> >       */
> >       void (*program_lut_mode)(struct mpc *mpc, const enum MCM_LUT_ID i=
d, const enum MCM_LUT_XABLE xable,
> >                       bool lut_bank_a, int mpcc_id);
> > -     void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int=
 mpcc_id);
> > +     /**
> > +      * @program_3dlut_size:
> > +      *
> > +      * Program 3D LUT size.
> > +      *
> > +      * Parameters:
> > +      * - [in/out] mpc - MPC context.
> > +      * - [in] is_17x17x17 - Boolean Flag.
> > +      * - [in] mpcc_id - MPCC physical instance.
> > +      *
> > +      * Return:
> > +      *
> > +      * void
> > +      */
>
> Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>
>
>
> > +      void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, in=
t mpcc_id);
> >  };
> >
> >  #endif
> > --
> > 2.34.1
> >
