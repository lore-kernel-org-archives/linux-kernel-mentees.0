Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A3C2C9
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753890980; cv=none; b=Tzk33YeYPpep4SoCchgx4Sd/gNxCu73x981vqkJgBN5TbvibXvVPvJb4AxTTBPHlRbZbAUtpvGyysTIqZhgP7w53Q5uytDcDqKW8jBYzipG6uecVHMag2m2YtLVsWynRpkexivjyPVVSvwGalJs3JCgzmme1bKbHHdURkOJ/UH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753890980; c=relaxed/simple;
	bh=qPRfPAdwxSF9cJgzAeKxMbGmeL4lpPBLEqUlY8pDLms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJw6RAbvzaK85GM1PK/WXSybXDSQOs5WUL2n/a8eWg0l79rlcfpLMROg2+IzfTiPSILxcXZKCwSpmz0D06wYACZ9+iaCpLuw+87LsdFeIm06OhHVmMWBd7Wy16kaScM7cJ+HaLZBFbhuLb8ML61i88ooIGwuhn2z7YH3brDW8HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b2smwqOm; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b2smwqOm"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23c8f179e1bso442255ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753890975; x=1754495775; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac5jc5iSuVh5ffwFsIe3xf2fxESMA6NIz6igvIuJEDk=;
        b=b2smwqOmnk0Zw4yVqn7YfP2nZQheCr7b9BzFurU/tBub0zgPPw2uMQMMAoMgsJRBOB
         wZYsRGd2rK3dEACZy8Aw1rtHGLLqf5dixF7BDDozAyvh6EzksIhO77uRlIhFzZGZ+4In
         r5b0ESf6DCOB8GQnqTG8//e2W2LY+xehHvgJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753890975; x=1754495775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ac5jc5iSuVh5ffwFsIe3xf2fxESMA6NIz6igvIuJEDk=;
        b=DCncbbv17tI9N/COqA0XFLiczv2gTAb/dsoV8A865rQcdpsYfUjx/0E+B8rJOeccEh
         tcrCNPI+111ccZG0Mw/mq5QzHT6oRt/zo6JLtUKJRTa6Ni3P4aFfZ5TcYLbAIamhDdqV
         S4Gp9EZ08+zDz0rUhInX6T4ZKrxi7TVsXO5VI1b4nMvIjUw98fewSPG4IKRPZLP0FiEr
         ryahYj0QX9C/vRvHZlWygPr7zaK86uVHOfGcQq27QhFmVgrXtyCvN3zzcw4ynDr5V/Si
         YD1NcLgrjlh2kAbXiRsgnflBfrbxbaz315BqyKYS7THZt5B42cFzFQrvpO5hKYnYGoeu
         9dsw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3Kjhwca/s6UgPPmdbzayWjV9bdTGu/3tnHwh0Q4UFqiO+ghDdtDSg7R5we0bMM9Ibx1NNMr6VIU7DSbzAGhWkBhA4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcfPJQgIPYl8HMYx7srCBiHqZJ5aWZ1y2tG1c23adYyxoFWH5k
	18Sc2z+idlWp07FWBYVshUzuGASI3vwe8HjIkdRQpaEfvzd6l7EDbfSx0AGnv34F8Ts8PfKHPkS
	aJnE=
X-Gm-Gg: ASbGncskgI6bJhzXcdqdgi4Oe8UjeGHjy7dvImTkutbkFMOur5EvyZq08n2NPTcBJ8l
	JwGUW0otcJbqcFgjMHIWB2Uzqt2kZYsacgKBUHTWU+gki8L7KoGxmXHnLBJpWHkKUOtPnVAlHfj
	OvRxB1CjOEGvPTeznIXMpgIYJpelXwP9QZOhEEQH2WR2LDEGoeuY1dj0R7vUo31mlVXjYMJJ+dh
	HsGlrinjrPEGTnYMGD9R4mqIussisTUFc9ouXnI6T4RzhfhkInezuAVtFbd2BvFg7aYRRaPHz/5
	MCSBmrlklU6/kn3xv/Y/WkQ0p8MftLAvxWROepRB7Peo/FXvte4HF/oZkJXSVSl6+pT934apRI3
	TuHrJiYibHMwmx6nX7FqBpl4sCzaJJkgyOiX4cI6Uu0CewrsG8p25OEc+V5uPgA==
X-Google-Smtp-Source: AGHT+IGEqDKWdSRo395otZxb1U/UKisNsgdeGkA5lP6APUqggjMseWBKF9waIvU/apX+yihA2CCXDQ==
X-Received: by 2002:a17:902:e294:b0:240:3bb7:fdc3 with SMTP id d9443c01a7336-24096b4c4b9mr41933855ad.28.1753890975051;
        Wed, 30 Jul 2025 08:56:15 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fc1adcd24sm103478255ad.167.2025.07.30.08.56.13
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 08:56:13 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so34235a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 08:56:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2ANzNwFT+e3d879PIdj3LSJhAF06WUo9KliMFsmSfaN2z2N0BLAMEuNFMN4fdhjmfHExk3Yfs/1807J/o2R0ntybC9Q==@lists.linux.dev
X-Received: by 2002:a17:90b:1b48:b0:31f:4a91:4e97 with SMTP id
 98e67ed59e1d1-31f5de1ea3cmr5307381a91.7.1753890972855; Wed, 30 Jul 2025
 08:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730061748.1227643-1-me@brighamcampbell.com> <20250730061748.1227643-3-me@brighamcampbell.com>
In-Reply-To: <20250730061748.1227643-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Jul 2025 08:56:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WpbU-iuEDVRuMm87H48PKQ3pz5aBwTRyedguFQA3dvTQ@mail.gmail.com>
X-Gm-Features: Ac12FXywEUfNlazykPXpS0so8Utrbf7RYxdVRu4_QjEIfWrjs2DXSKQ83cwp0WY
Message-ID: <CAD=FV=WpbU-iuEDVRuMm87H48PKQ3pz5aBwTRyedguFQA3dvTQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm: Add MIPI read_multi func and two write macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 29, 2025 at 11:18=E2=80=AFPM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> Create mipi_dsi_dcs_read_multi(), which accepts a mipi_dsi_multi_context
> struct for improved error handling and cleaner panel driver code.
>
> Create mipi_dsi_dcs_write_var_seq_multi() and
> mipi_dsi_generic_write_var_seq_multi() macros which allow MIPI panel
> drivers to write non-static data to display controllers.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>
> Doug, you had suggested a slightly different shortlog for this patch. I
> adjusted your suggestion to fit within the canonical recommended
> shortlog length of 50 characters. I understand that the 50 character
> limit isn't a rule as much as it is a guideline, but the current
> shortlog seems to me like a good compromise.

Looks good.


> @@ -431,6 +449,23 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi=
_multi_context *ctx);
>                 mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
>         } while (0)
>
> +/**
> + * mipi_dsi_dcs_write_var_seq_multi - transmit a DCS command with non-st=
atic
> + * payload

I should have been explicit, but the above "non-static" should also be
"non-constant". ;-)

I could probably fix that when applying, or you could send a v4. Up to you.

Speaking of applying this, I'll be on vacation next week, so I won't
be able to apply the patches until the week after. That will also give
anyone else on the list a chance to comment if they want...

-Doug
