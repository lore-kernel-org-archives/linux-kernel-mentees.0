Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5851A254E
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 16:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753720129; cv=none; b=KZ2R635zz8SESOubZs+iuAWCWeSRt3h+m+v+mf2mVRj1IGgmnV1tNZz5fnB83YqEN2hatbtMbeLr3EHkdQwUnaWGeD2Z795i5r7IefEfLO52wFWN0G+AopD4bhzeCOCD/CYkuUSd777aia1CVUUhVz7cOQT99qQ1SK/TDRkjGN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753720129; c=relaxed/simple;
	bh=R/IIShAD2JsVpX6JjpWNgQSgana1xyTa7Vr5q3oPYEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSHcCPdvdJiO6TuKZuOP/wukntclRNKGHYusrERkoP9lFcC11hSGdHorvGGuUA3nDsc6XRISeBRRoHjwM3LSUpDrqoD4LvO+UkZ09F3dTkvwRmigoymgetQ29ePZUqyE1G/56NLb8vYfqasO2lVTymcyyCY2xeFk/sZ3tDM888k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dTaBlCBd; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dTaBlCBd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23fd91f2f8bso15309275ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 09:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753720127; x=1754324927; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bV8/1zB02ycKvjRRdDk/ZYTjyldvrl4N9o7GiFyOOg=;
        b=dTaBlCBd2xnskMAyQrZIvIn4ksZoZh84pDi7E6MTZj2ycm20XF3F+HNDeY1pmxQty+
         /Q1LRj9kBJddX1s4E5RpCQEHWTpV7lGIBNbHqRwJlXZToEHQlFPAOVurdVWaWd4gV9Pb
         NLAhL9WiE5zeWUL2afaSNOlrGT603Lx8CXg9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753720127; x=1754324927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bV8/1zB02ycKvjRRdDk/ZYTjyldvrl4N9o7GiFyOOg=;
        b=ujTHpvID+9UhxhuvffIy+OlfmXdLsLwEACEela/xHgv+LXJJaOJ0dPNeNbc0BA+/wf
         XBit1XurTNQnEFhxxHYr5kfzlAADRFO4p2LiJzjuQQE0yfVj1RU2Zxk765uP3gM3tkvv
         2s++r7V8c0A/cier83DOFUrZFVIDYgwmBkafpnXOFy5EOWqu05NAmIOvbUcoNzfB+hUd
         PtqlnBYAbMI+nM57TArc8Y2/qPhiMiDDwzhZl3+UCDTPMJkQrhEOk+vF+DKk1Y5z+jvc
         cwkfwLBeX/xjE/1PulW2VYmJVhytHV5N3QU1/S9gvwxWgb0mS0Q5REIIKuGcKR9dQ71D
         aYLg==
X-Forwarded-Encrypted: i=1; AJvYcCUFKDGg6MgIKFB/FIYBT0I2rSgWb7AqBtSRawWwfsVCTYlIjQij8Qk8pf55NjJCYHEIfvXQt2CdhovgvSz40aHrplvAOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh1wEf6pfSZIsXfWva3In9HT5W7DDY+13624WO0Vw+BhZ8rLfh
	9f44mg3nsFubmHZ++bct3uMsxi6KVszdanTpQopWU0d9iBRKd9zCUZVjyLosfKHlvbjwG2qFXq+
	h0OM=
X-Gm-Gg: ASbGncv1bqS9pcdccY8vuOALgXTHmRCnrVGASpsu2KNkt7Obax5uwZrzDvs1oGpX+FH
	0P5CLVaOY9dQGO80C95Ww+JIllajco7zk/BLXsFvP3a57OPxD9Re1HSxBQXDWPM6rQ8jzDsZlq8
	oXwgOEidiqoFZOXIsN5t/0wJip8o9Gm0SXIf44vdQRuPKlfbC5QMHrnqAp/NHiqkRghFNRdVVTo
	tBq24cecottK5lawdBktZUA/r9XqblXjZxcWkSucZPwpywQGvt3VVykHJqWKgu2ycLadaTfAhZW
	a9ZJsI4nGj8gWCZWiP+F3G0j9eP4KoJWPZQp9+TGKaL13DpX0trRUPY/YEXFbDBXjubOWn8166/
	UbhBtyGoQBL/k0yZUqKWN0ZYlwLNiPv4GPjuzGmV/0omaiLUlltvxDFd/oGPKVQ==
X-Google-Smtp-Source: AGHT+IG6RFRXoHqZNFDQa7rxFEzh8eqCIDrZ/2VqOONGInkWiwB/oV6JgDI70HPME5yE/+JewnAtHw==
X-Received: by 2002:a17:902:ea06:b0:236:363e:55d with SMTP id d9443c01a7336-23fb3145a57mr165489765ad.28.1753720127483;
        Mon, 28 Jul 2025 09:28:47 -0700 (PDT)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com. [209.85.216.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd6f0cfafsm50800775ad.57.2025.07.28.09.28.47
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 09:28:47 -0700 (PDT)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso4344372a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 09:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/WC05oIghfKDoF5hGMXXbjHpco+UDWsK5eGj8RwGO4eRD8oPJ7N8IjC9am89svJCbJY5pXWWsONyA9p2H6IRiOwahcQ==@lists.linux.dev
X-Received: by 2002:a17:90b:3b4c:b0:313:db0b:75db with SMTP id
 98e67ed59e1d1-31e77a24b41mr18438779a91.33.1753720126253; Mon, 28 Jul 2025
 09:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724202338.648499-1-me@brighamcampbell.com>
 <20250724202338.648499-3-me@brighamcampbell.com> <CAD=FV=UGNN68Fu4kJQQ8jO+fYP4qVJYmL0quxa_=Y5GEtS-jMQ@mail.gmail.com>
 <DBNGMHS14LUB.3PDFCB3DI1789@brighamcampbell.com>
In-Reply-To: <DBNGMHS14LUB.3PDFCB3DI1789@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Jul 2025 09:28:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wg_JrwGx91Pek2SC=JH6ksugjFEpDmW5z3qXCUKyiu9g@mail.gmail.com>
X-Gm-Features: Ac12FXyy9q8f7qx9W8K4Oe1nvu_PYnS7rPks79aLouknOlrzwPZQDQBc90Gh8fI
Message-ID: <CAD=FV=Wg_JrwGx91Pek2SC=JH6ksugjFEpDmW5z3qXCUKyiu9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: novatek-nt35560: Fix bug and clean up
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jul 27, 2025 at 11:04=E2=80=AFPM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> >> Using mipi_dsi_dcs_write_{seq,buffer}_multi() in place of
> >> mipi_dsi_dcs_write() gives the added benefit that kmalloc() isn't used
> >> to write mipi commands.
> >
> > Ah, this makes sense. We've seen this before, but I keep forgetting
> > about it. Thanks for mentioning it. I wonder if it makes sense to have
> > variants of mipi_dsi_generic_write_seq_multi() and
> > mipi_dsi_dcs_write_seq_multi() that take non-const data. The only
> > difference would be that the array they declare on the stack would be
> > a "const" array instead of a "static const" array...
>
> Ok, I've thought about this one for a while. The problem with my patch
> as it is now is that it uses a u8 array, mipi_buf_out, to construct MIPI
> messages and send them out. My patch reuses mipi_buf_out because it
> happens to be the right size for both messages which need to be
> constructed at runtime. Not a super clean solution, perhaps.
>
> The Novatek NT35950 has a better solution. See the following function
> from drivers/gpu/drm/panel/panel-novatek-nt35950.c:107:
>
> static void nt35950_set_cmd2_page(struct mipi_dsi_multi_context *dsi_ctx,
>                                   struct nt35950 *nt, u8 page)
> {
>         const u8 mauc_cmd2_page[] =3D { MCS_CMD_MAUCCTR, 0x55, 0xaa, 0x52=
,
>                                       0x08, page };
>
>         mipi_dsi_dcs_write_buffer_multi(dsi_ctx, mauc_cmd2_page,
>                                         ARRAY_SIZE(mauc_cmd2_page));
>         if (!dsi_ctx->accum_err)
>                 nt->last_page =3D page;
> }
>
> The driver has a couple different functions like this and they're all
> for the express purpose of writing out a single MIPI buffer which is
> constructed at runtime.
>
> Arguably, a more readable solution would involve the definition of a new
> non-static macro like you suggest. The macro's `do {} while 0;` block
> would achieve effectively the exact same effect as the functions in the
> NT35950 driver, causing the buffer to be popped off the stack as soon as
> the code inside the macro completed.
>
> We could call it mipi_dsi_dcs_write_var_seq_multi(), perhaps. Or
> mipi_dsi_dcs_write_sequence_of_bytes_determined_at_runtime_multi()? ...
> (Help! I genuinely don't know what I would call it...)
>
> Please let me know if you'd prefer that in v2 I adopt the approach that
> the NT35950 driver uses or that I instead introduce a new macro for
> non-static data.

The absolute best would be if one function could somehow magically do
the right thing. It's something that would be better if the caller
didn't need to think about it. It might be possible to construct some
ugly snarl of macro using __builtin_constant_p() (maybe requiring
__VA_OPT__?), but I don't see anything super clean for it
unfortunately.

IMO adding something like mipi_dsi_dcs_write_var_seq_multi() would be
the best. The name is a little unwieldy, but I can't think of better
options and I suspect this will come in handy for over drivers as
well...

-Doug
