Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E21C4607
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724768337; cv=none; b=OkuUhcn3Qpgpcp2pkmicmHlZAO23Y1/4oPNr2tukypjOK35kwMMsaEGf0xCj2NadVnkV9vm06DOOjgQZCQ1ERBU/PrylQ8x10hBZM3n5/lRCAHv/bZ3PTWwDQKf5FkqNJocIZaaW5Ih2odhcsFuB/KtY6i2H+1U/DoWEbYGEKOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724768337; c=relaxed/simple;
	bh=15ORNTWxPQZbHScIg0ExMWBB3te8D8b3ZSi/1xE+1x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riFg27+X3st2BRAyUCgwrSfEi35t3XP18BdRJTinbj/QSAremJjG4PmmNc3C4c1zBBm5/o2N0aoeBp1DI85iiYCxi7EgnoOiG0ta2hcpMs6mnkCDJuY+knvD933NS0yazJnYPlrxtBCppPxe7w78DW+6On4/MAfoRr+kEwFNavU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rr360WlN; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rr360WlN"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E88540519
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 14:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNCDWGi9sqM2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Aug 2024 14:18:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33575404D1
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33575404D1
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rr360WlN
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 33575404D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 14:18:55 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-714226888dfso5000599b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 07:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724768334; x=1725373134; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JSMiJ5fVqnyKb+9n4eHykIt/ocg8tbqo6X0nAPTgvIk=;
        b=Rr360WlNNalalQX2gtTKwvQKZap3lXQ2DMy8Pj7gvlLwS3tSohY25k2ExxKGuUZ0HW
         JuIqdDK/gjquaI6yZD0VpQ76HNbU3K46VZUCrYa9EaA1TO3AfEc9F3UVZYjCP7i/+iES
         UW7VRAVtXw9JHGLMUk2fybsD20U3KeGcOyY1MPcc94l1Uwl6WjjUFyFPxlcHalfJd+ol
         bJOEETFUoB2sqVnSV/XmafZuObr97nVTjP2Rg5gmsqfTaEpjGp3SrizoVlxqaWdZAe3D
         PMrpJGDbk/by7QbryL5C6EwgsKRViAtWL6xRKDY3xejuk0+Box0EpiDbp5v9gXYDyUif
         vZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724768334; x=1725373134;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSMiJ5fVqnyKb+9n4eHykIt/ocg8tbqo6X0nAPTgvIk=;
        b=i1fL0H5dWfSY0f6uIuhbxcG4URX3jy6Up+Hgn8Rkdu0BYUBcXqCG1FrijVx9rac5HF
         Xk5pr3vqeMtft0l/nhrsYsf263FYQfo9eDDZoNuPeJgda84xTLxNxTsKJAH+/t8H4G+B
         zvnxamds1JNFazRjQsqBcu9kV+ujRQFAajYUi4hQMDuBlMytXh5k+tp51wuLb5TLEG1X
         CwHpNpYMkYpoF3pdv2nBTedOFlSxD3JTdeT0VMIX7Nq01+1pK35pC3RE8soTVz54sFD+
         XXEeqILrRimTk3/Gn3EQd7kNZQnOr2azyXMd9E2rr+4Iv37v/he8zpBmvVe2UVVOFzFq
         kuTA==
X-Forwarded-Encrypted: i=1; AJvYcCXVkRC5EhEJSSmEavMOjqF2ADrpsNbDU9rTY0sCfYbdTzUQuSFwWjVTV1fL61AfwbxYSWQc1w1FmpjoBy1Pe8WiIuhO5g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yya3pLLVBDU+UWstsMEWyy5YeJAL0AMfv6+6y1G+E2xezDMNlXD
	nBD3PjO9GFn7LyFaxotMIl4NtGMtucXwDUcXWkKKS7Ohw57Vy5pS
X-Google-Smtp-Source: AGHT+IFC8drrJmM4s4TDlAOrYOIKUf05TrbsTxNGNy/4YT441AzNhYGWwAjlpKQO3LwwXX8KcqVrdQ==
X-Received: by 2002:a05:6a21:3987:b0:1c0:e629:3926 with SMTP id adf61e73a8af0-1cc89d6bb9amr15486459637.16.1724768334086;
        Tue, 27 Aug 2024 07:18:54 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.235.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d6136fc523sm12117848a91.9.2024.08.27.07.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 07:18:53 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:47:24 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: kernel@puri.sm, neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	quic_jesszhan@quicinc.com, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: mantix: Transition to multi-context write
 sequence
Message-ID: <Zs3f9LIS1PenwMMX@embed-PC.myguest.virtualbox.org>
References: <20240826160328.12685-1-abhishektamboli9@gmail.com>
 <ZszDipyk1Ey8M0JZ@qwark.sigxcpu.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZszDipyk1Ey8M0JZ@qwark.sigxcpu.org>

On Mon, Aug 26, 2024 at 08:03:54PM +0200, Guido Günther wrote:
> Hi Abhishektamboli,
> 
> I think this was already handled in
> 
> https://lore.kernel.org/dri-devel/20240820091556.1032726-2-tejasvipin76@gmail.com/
> 
> and applied
> 
> https://lore.kernel.org/dri-devel/172414629205.2571141.13215409630895562248.b4-ty@linaro.org/#t
> 
Hi Guido,
Thanks for letting me know.

Regards,
Abhishek
> 
> On Mon, Aug 26, 2024 at 09:33:28PM +0530, Abhishek Tamboli wrote:
> > Replace deprecated 'mipi_dsi_generic_write_seq()' macro
> > to 'mipi_dsi_generic_write_seq_multi()' macro in mantix_init_sequence
> > function.
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >  .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> > index ea4a6bf6d35b..f276c65cc9bb 100644
> > --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> > +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> > @@ -49,22 +49,25 @@ static int mantix_init_sequence(struct mantix *ctx)
> >  {
> >  	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> >  	struct device *dev = ctx->dev;
> > +	struct mipi_dsi_multi_context dsi_ctx = {
> > +		.dsi = dsi
> > +	};
> > 
> >  	/*
> >  	 * Init sequence was supplied by the panel vendor.
> >  	 */
> > -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
> > 
> > -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_INT_CANCEL, 0x03);
> > -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
> > -	mipi_dsi_generic_write_seq(dsi, 0x80, 0xA9, 0x00);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x80, 0xA9, 0x00);
> > 
> > -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
> > -	mipi_dsi_generic_write_seq(dsi, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
> >  	msleep(20);
> > 
> > -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_SPI_FINISH, 0xA5);
> > -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xA5);
> > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
> >  	msleep(20);
> > 
> >  	dev_dbg(dev, "Panel init sequence done\n");
> > --
> > 2.34.1
> > 
