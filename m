Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D00B8488
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 17 Jul 2024 16:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721233862; cv=none; b=GzQe1icE5luHD4X3BObZquNntjUZYXTrMU6OzMgZZcpTjVI7pEI7KmbfbAQVSPuDNKiljDQVPYfQ8sxrQstWfFrIpYwtF6OfTBZlb93txO/S76g4NXetgQD8LTfbzxO/3mxg+13J3umzfheS3kdEy/DaXDkwU+Hngug4srdKU1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721233862; c=relaxed/simple;
	bh=nU+9r4Mm3q+d080XAjsGcioPnv0813i4qpKKRyNwTzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lM7U1gLsQjdmO6YSYerZeLY1g24l4ozeiR6Qdhk2Q8tMHjmpJqAxaFrcaIwqcCW4qaUXkyFNv402V/Lx8TKhJXiQHYxfQLYoRAoYTWSdakWtIqHkVhrxv2vlxwglDZx2knd6etD0/qhOsRFM1eaRNSDmyPMDBW0IxyMlfcAKFsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iX0munLs; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iX0munLs"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43FF880E16
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 17 Jul 2024 16:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WzNkexmU6a4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Jul 2024 16:31:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94BE680E06
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94BE680E06
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iX0munLs
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 94BE680E06
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 17 Jul 2024 16:31:00 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fc49c0aaffso9509255ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 17 Jul 2024 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721233860; x=1721838660; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fZhsh+wnWjt6cLcXDiRXnrrVDVKDoWotCT7UNQJ5Bng=;
        b=iX0munLsY/cDyFXbg9HP1Jgn4QkzfWkS2iAkCka9auajg9dggDt67E4NNPlOIktqro
         n/95FEwrx7XD0zpZNzyGsFg/1AlA60aUVJic7g4LRmZNnIo96a0eNqR/wMiuO4Wftfp9
         AhIeZuBl1ezsOe8iRt76DSIIwrHjQpIjvbAwct6mzRimEFQpvbO2gY18n+7TRyuJNRja
         CsdhBwBjw3+Rs/FVWMPf9HlvqDovcShfU8qxISnOMUB/EJY0e19focQkqjorBTlwHfEh
         Sf38xoOp5wRJN9SBNA4MFxFfV5RJp7+jWuGDh1IU5U8P51CIuEOnVqghe9j9x1pjDWLN
         gr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721233860; x=1721838660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZhsh+wnWjt6cLcXDiRXnrrVDVKDoWotCT7UNQJ5Bng=;
        b=HIUqieZFJ1v5CxOGcPK6aBynBmttLke8CsKhLZ+X8zcrtIvz3hMExD3ap4/qXHRNAE
         tjo9Zug6g7UxYVm6+rhG5yyXiLI7HDwf31w9jRNgtbexa1mwSL9THow7nju5iVroCKWO
         H2QHaKgWCAryhXCzf5hqQq6F6sstX+5RhsjkSM25gZZz5IapGJFjngxWdG0TJtGEzGNY
         YRa0Md2OtjXuR+FQsEJKQ+2KoRsiXBp0Trl/8b1HRqxJ3MWawZqUCxsrhyHGh2tJ8MfU
         FKJZUUrY4Pg5ZDyfP3FTyx1Pj33in9yko+feac8IhGOanX+x6barQ+dufwSl4U1tb6GW
         nYVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1PNKbvPpDI1f84xd9+M7m8nK1r+zHtKylyxIWoSRcyUU9f3WAEnwo7/beWs+yMLyMLXlb5jCgiEUNVGbpaYxnogPSdqQDqXM8IKtlutfT82+JzsByj54C2vFZ23Ib
X-Gm-Message-State: AOJu0YwrHdXdE/eJ9MOJwCDX0JQbThrxqc+nKBQzAhjBAPOnAZS8t8PI
	69B9lW9hv313ZZwyr3Ps7PCk7WTY13HbLFyLp0u8MJGFQgXQiWW+
X-Google-Smtp-Source: AGHT+IGxeqX0fUugMvXSq1rVpJvLlkHouZdSRo4dovsKIrcHqbTZYwptDD/VOC3M9svMeLtuDbRMoQ==
X-Received: by 2002:a17:902:6841:b0:1f9:c508:acd5 with SMTP id d9443c01a7336-1fc4e105dcdmr13989135ad.5.1721233859603;
        Wed, 17 Jul 2024 09:30:59 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([117.98.155.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc2733asm77343535ad.162.2024.07.17.09.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 09:30:59 -0700 (PDT)
Date: Wed, 17 Jul 2024 22:00:49 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, harry.wentland@amd.com,
	sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] drm: Fix documentation warning for read_mpcc_state in
 mpc.h
Message-ID: <ZpfxuUXAjmPJvLgR@embed-PC.myguest.virtualbox.org>
References: <20240712174510.70467-1-abhishektamboli9@gmail.com>
 <fb2b106e-aa51-4108-9d61-ba71935fba00@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb2b106e-aa51-4108-9d61-ba71935fba00@amd.com>

On Mon, Jul 15, 2024 at 05:46:38PM -0400, Aurabindo Pillai wrote:
> 
> 
> On 7/12/24 1:45 PM, Abhishek Tamboli wrote:
> > Add detail description for the read_mpcc_state function in the
> > mpc_funcs struct to resolve the documentation warning.
> > 
> > A kernel-doc warning was addressed:
> > ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:547: warning:
> > Function parameter or struct member 'read_mpcc_state' not
> > described in 'mpc_funcs'.
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > index 34a398f23fc6..9e65ecf1d3b0 100644
> > --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> > @@ -282,6 +282,22 @@ struct mpcc_state {
> >    * struct mpc_funcs - funcs
> >    */
> >   struct mpc_funcs {
> > +	/**
> > +	 * @read_mpcc_state:
> > +	 *
> > +	 * Reads the state of a given MPCC instance.
> > +	 *
> > +	 * Parameters:
> > +	 *
> > +	 * - [in/out] mpc - MPC context.
> > +	 * - [in] mpcc_inst - MPCC Instance whose state is to be read.
> > +	 * - [out] mpcc_state - MPCC state structure where the state
> > +	 *                    of the MPCC instance will be stored.
> > +	 *
> > +	 * Return:
> > +	 *
> > +	 * void
> > +	 */
> >   	void (*read_mpcc_state)(
> >   			struct mpc *mpc,
> >   			int mpcc_inst,
> 
> Looks like fix for this has been already merged via a195f08636f9d7
> drm/amd/display: fix documentation warnings for mpc.h
> 
Thanks Aurabindo for pointing this out.

Regards,
Abhishek 	
> --
> 
> Thanks & Regards,
> Aurabindo Pillai
