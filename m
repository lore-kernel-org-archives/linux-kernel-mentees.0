Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E76279358
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 21:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753824891; cv=none; b=j1YzN4kVYHd4wobV+4sgekYd52YMEbfMYC158l9KI4Aqw7Zt3B8yqOTjkf9ItyeSATQMv7r9Ybi7PE5jgxFX2pJf2yEogct6kAgKpVsHecDDt7VNvNXMewqMs73hJQKkXbKsY+UH2Z50HiMWWYr/es9uV1IMg1L5h9NNPKjKuTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753824891; c=relaxed/simple;
	bh=asM7fngHyyI3nRO/iTKLn4aH3b2mzIdrwvR8GNXPljw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAJ933E/ZBk5/2HOsIFOIGzv0kd765bTlisCqR7Py/0NgnxGJTff+wTh5cC0qG4Q9cpj7H1hPT6rr6CAtheLIe+VxHb0cXKzdyg/8RABq83bh+7FTHwxDnusYF0peciWWNuum/l3bQqxX3N1ryX0L5ttzV6ugsZB9m+eYc7UF0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I5g+tvob; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I5g+tvob"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23c8f179e1bso69432745ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 14:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753824883; x=1754429683; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xp7eLWjLlPUY2gLZxRm+MGuoAxS9M5bnsTC/FZdxS6c=;
        b=I5g+tvobRD/iVElVhhV/mrTOU2Yg89gWro/9G+UubwKnDHm9gy1a+BVSahnPEReMJ4
         +wc+qgr/NoXwQ3F8d58YcKpTAHDPCtwYvhN7BCNacYJ5x7Hxju6IkKb4KGEpZy3CBxjy
         YrCh32PCtX4g8aCq55e0Mfqpz9NlkE/BawkZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753824883; x=1754429683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xp7eLWjLlPUY2gLZxRm+MGuoAxS9M5bnsTC/FZdxS6c=;
        b=vYTX8uJrD3tANUk82i+zvoMB0S2QM8HRPgZW9V59VvM6blPVffSfJW8F1L4ivM5PW7
         b+xanKgzqb44cacarqR+n4Hge7y+4qQUp9ewsvW6WPP2Q408i+soGpnffM8M8x3W2vat
         RxJ3sa30CgEqln4ON6qAHWpkMs12ws5kICdE0U2B/wJJPqYfNq8E+GoctU3crx+C1J3J
         qkD4F0/2SRGOEjQ7fVn8Kk5f6OhGb7EIelo/lRa99neVZzWyeLAVpNKa0C6QzGl/6bQK
         vRZVAihpkuR1w6z/jMa+dNhMGjcNJR0VR+5jDdsX61Q0N7qzvdO2KbelNOprcs0ZQCQO
         m+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq15xmKy78vC2POTcZEdDGK9pzd+KSOopJnZq5CHQjTr2THye+p5i64HA7VlCdRViAJSag6RkIeZxYBunuq3/VN7mtvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCSoFqZ2UQrts1w8Bh73dyMSvVm6o2obdl4DAQiKOCqWWwfnw8
	tzJ1QJpCZV4SI4MXhELIV7dWQVEcJ47R3Q1ADV2RV0IGoS5b4Vxwwbo4fzV00YyWrwNAWiag+Zo
	xakI=
X-Gm-Gg: ASbGnctRjpwKtt5h97Bn5BKHUtOfxBLnNi20Boch/X7VQ7O+1t40WfshIgNEe2WS+BU
	YwMPVwaP4V9yFW28jwmJJrEuJwXDFYcq7uuWQxjXD7oJbDtNM4Trorlc4XE7rxW/9RqE9FE2fym
	6q8x7xB/LoAhepO7WI0YJo3OIMxLQhaq/00kO88C1T9z3oWf3E3Zd47MA4V6rEEkcU/3zYDmwTl
	kLXh5H75XyOUdbs57yl6CYe370R04tRLfgqErJ+7aDI9wrSyGT4IlPt07b3AMOCi8pS9uIzKbIe
	whRPNuZurJ9LgLmEeWT58rb1UgEuMujhKWkHFjOfBhwbrv3eS2XfoW7jLHFqEjpHUKLjniD5GEL
	/Uayh+bCC3bq9mMYkfhPFSWHPgASK3iPKKfZ2RDJ8ltQDEmasWBiztg3rYeiTag==
X-Google-Smtp-Source: AGHT+IHHAlbY67S1Kwi9XAXZQ2HayQPd3ncxEkLAJF8lkT7RZAt0BfzN84XpmpGzNejPXlW406wirw==
X-Received: by 2002:a17:903:2290:b0:224:23be:c569 with SMTP id d9443c01a7336-24096ad18c9mr13791055ad.22.1753824883305;
        Tue, 29 Jul 2025 14:34:43 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2403e020d7asm46172345ad.16.2025.07.29.14.34.36
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 14:34:41 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31ecd1f0e71so3233842a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 14:34:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZcq4j4BprWG8cMIKgA/Our5VX/DKKNvMZNHkHKE0PX5W+Qy/y0ElYvIL2byhbCKJ8RU1NGGcjAxyNTzaNNQK9lQcXzg==@lists.linux.dev
X-Received: by 2002:a17:90b:17d2:b0:31f:12a7:da67 with SMTP id
 98e67ed59e1d1-31f5ea4c8a8mr1070193a91.32.1753824876205; Tue, 29 Jul 2025
 14:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250729054435.1209156-1-me@brighamcampbell.com> <20250729054435.1209156-3-me@brighamcampbell.com>
In-Reply-To: <20250729054435.1209156-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Jul 2025 14:34:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLoMenu22F_VeoHyfXwRO7JfXL8peQLEpkqeZ1tDOmEQ@mail.gmail.com>
X-Gm-Features: Ac12FXwuRPQLnCei2aPWgGqgkhJiepLnrrXfiREPquhd3zgNcTNh4R-TaDAM560
Message-ID: <CAD=FV=VLoMenu22F_VeoHyfXwRO7JfXL8peQLEpkqeZ1tDOmEQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm: Add MIPI support function and macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 28, 2025 at 10:44=E2=80=AFPM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> Create mipi_dsi_dcs_read_multi(), which accepts a mipi_dsi_multi_context
> struct for improved error handling and cleaner panel driver code.
>
> Create mipi_dsi_dcs_write_var_seq_multi() and
> mipi_dsi_generic_write_var_seq_multi() macros which allow MIPI panel
> drivers to write non-static data to display controllers.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>
> I looked into using __builtin_constant_p() to extend
> mipi_dsi_{generic,dcs}_write_seq_multi() to accept both static and
> non-static sequences of bytes and store them accordingly, it looked
> promising at first, but I found no such solution ultimately. At the very
> least, if we find a solution at some point, my hope is that cocinelle
> could be used to replace each of the new var_seq_multi() usages among
> drivers with an improved seq_multi().
>
>
>  drivers/gpu/drm/drm_mipi_dsi.c | 37 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 35 ++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)

nit: maybe make the subject a bit more specific, like:

drm: Add MIPI _multi reader func and two new write variants


> @@ -415,6 +417,22 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi=
_multi_context *ctx);
>                 mipi_dsi_generic_write_multi(ctx, d, ARRAY_SIZE(d)); \
>         } while (0)
>
> +/**
> + * mipi_dsi_generic_write_var_seq_multi - transmit non-static data using=
 a
> + * generic write packet

nit: "non-constant", not "non-static"

From the caller's point of view the difference is that the data is
compile-time constant in one case and not compile-time constant in the
other case. It happens that means you can _store_ it in a "static
const" in one case and not in the other case, but that doesn't make
the parameters "static".


Other than nits:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
