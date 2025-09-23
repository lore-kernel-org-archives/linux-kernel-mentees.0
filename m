Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5094B184540
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758635265; cv=none; b=GECVuTwmx4jCXD/7CqxM91kiWBW4S2AO3V+q0lOMmGYZIgUWgx0IUY2aRmXE7CsXXQcrCF2ofFT6TF64+FeozySqkIOySThAjJXmnRsquyWPItI/pPauMkhxNmdb8ut+ifLJ8yQdm2MkGJEBIp7Zr1hsAwU8rx6ouvlO7q+cQ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758635265; c=relaxed/simple;
	bh=PN5La3hlg/fG/Y0BOwtDWuC1k9ri0pHOmQFdLr9on8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QX1JmY1YqSLGWgculShTfINymAzY3KMOktT2f6+CslkUPXH+0Z7h9gC11gsPvgDA8bFFJhnuQbWDd9Tarm23J9WEsj2MvYoyaeyfo3YfRR0fdsiYSNBTlz7v7I3rHq1BETts2nsHnorM3X8pCz3Bql2cglg425MJYKCmJJhmWtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWmumQ6A; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWmumQ6A"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9A6D40ABF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id js18aAlXCseK for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Sep 2025 13:47:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=alexdeucher@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C35640917
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C35640917
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NWmumQ6A
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3C35640917
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:47:43 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32f3fa6412dso381170a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 06:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758635262; x=1759240062; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+po0DuJ8bRdPzzhrYcH1IZFck7dYEJX09rufKPUvgM=;
        b=NWmumQ6ACXfnd9nIB9rFNnrF3/sTRs+XxTiHehjzGB5W3dvSTVCag7JAUDfumb01+7
         X6+4KSGwBTBwjpg/avLR0RsLZ1TIH3JsgAyaumYhXSV+jxqkN61AWYl+8rPJpbuHwoXm
         fY/IKDG1im6Vw8a/1BZylkFackD/yJa4teOKsqZVu+zAGAyAufx4DqGzn50sBiTY3/Og
         Agxaqapb+ObqgyCHukj8ZCQu2RRxuJMZp3pwE8rcRA78CM4tQ4mDVCJTFL0698yWs3ol
         K7fHeTjjUB4q5+gfsqtHSbiCws7zWbXeFZhFNF9bxIF9Xi7DEzLwza3omyo4DUyMQoaJ
         Q61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758635262; x=1759240062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+po0DuJ8bRdPzzhrYcH1IZFck7dYEJX09rufKPUvgM=;
        b=c/JsxcWzr4F0kj7GF1CW/zzee7jkkf5WCcNAWnHH50xL0oZGF9iWb8e28C73UYCD7P
         wo1RRB/6udYXd/JZsKG57kaCUCW8CxYzQuLCHbgmXiHUGYY+FKmhyx1qyuBc0bkYa3G7
         AE1GJgDgbtgN93k6JeKszDAvqhSmtpjFGHT1Crp78wPTQrESQrLIXDBo1fkCejzCYuD4
         utNhttyMGbcvraWHKD5nFlsdMxLFmk9TlQfno1Y320qqir+sq7BiNtlKaH3eCAaXLyeL
         +zjaFkeREnI21s0JYBX5EbbLe+RvyDbeMoFgr1O2v2FWlLh9N/tnlC6n5pFYK8IqT5DM
         mzTw==
X-Forwarded-Encrypted: i=1; AJvYcCV6ZE+omInrbaUvD2rxSSkkrRmCyNixF9v47dfc3EZK/qzDIZZXXDybDvCog0BYnIcRKN19BpfcEbpde1aUPKqRgfjW0Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwuVZ6nlHFnbuxP+ecigPZSTstqtJktpel8BxIIuHTBBFQ4kp4Y
	Oc7IaR5fhv+sbhL2LAgsgt2TwawJ0vRpjLZARKa/M10ZWKkycRx1u58iss/H1dkGQ6aINnk2sc0
	YwLr4fJ7wz8r/jNuxmKfsiCN5IW28aks=
X-Gm-Gg: ASbGncuuTxqglJRjYZAKa0pjzUWkaCMi5mjenQmeaJUxvlJZBzAsATCr1LDizZvle3T
	hJEC/Of5A1BZfr3fsDwb5+FH4qs8wG11by1zuLVH1judosa4AymQXi24xUfnGR1MzM7DS2C+TVi
	wkvzjsVw2oD6krCi0su2HB43RtlD3KdRptxoEtCDV+JtpdlX9PDkHa7fekfMQn2jpGnoiNzJka/
	BtYe10=
X-Google-Smtp-Source: AGHT+IE/H1/LM/bDZyCRJ1SbbgyS89k2lbuqITBp5GxChyBOLUjXoVdvHa8Vm07RnfxnHIveQ+ckEYOUfRTxnACyGUg=
X-Received: by 2002:a17:90a:e707:b0:333:abc4:379a with SMTP id
 98e67ed59e1d1-333abc439ebmr456440a91.4.1758635262421; Tue, 23 Sep 2025
 06:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250922185635.50828-1-smokthar925@gmail.com>
In-Reply-To: <20250922185635.50828-1-smokthar925@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Sep 2025 09:47:30 -0400
X-Gm-Features: AS18NWAhbcwLf_A_aG2ayW-fXVW1NiLJzl9s_xqIndnigSUTJI1g12Ie2ZqAKe8
Message-ID: <CADnq5_PnEJYpw2Zu9hPVoKk24YBmZfcSNst=Enqd899eLvpWOg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: use kmalloc_array instead of kmalloc
To: Moktar SELLAMI <smokthar925@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, Hawking.Zhang@amd.com, tao.zhou1@amd.com, lijo.lazar@amd.com, 
	ganglxie@amd.com, victor.skvortsov@amd.com, candice.li@amd.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 4:14=E2=80=AFPM Moktar SELLAMI <smokthar925@gmail.c=
om> wrote:
>
> Replace kmalloc -> kmalloc_array in drm/amd/amdgpu/amdgpu_ras.c .
>
> As per said in the Documentation/process/deprecated.rst, dynamic size
> calculation should not be performed in memory allocator function
> arguments due to the risk of overflow.
>
> Signed-off-by: Moktar SELLAMI <smokthar925@gmail.com>

Thanks for the patch.  Some already supplied a similar patch which was appl=
ied.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ras.c
> index 540817e296da..8dbb9e349a8e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -2566,7 +2566,7 @@ static int amdgpu_ras_badpages_read(struct amdgpu_d=
evice *adev,
>                 goto out;
>         }
>
> -       *bps =3D kmalloc(sizeof(struct ras_badpage) * data->count, GFP_KE=
RNEL);
> +       *bps =3D kmalloc_array(data->count, sizeof(struct ras_badpage), G=
FP_KERNEL);
>         if (!*bps) {
>                 ret =3D -ENOMEM;
>                 goto out;
> --
> 2.34.1
>
