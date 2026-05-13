Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F136B3DC87F
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 08:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660131; cv=pass; b=ZUgxXURepmVlVL7KWSKVVLHuI1k7DZOJ1P9CmSZ+nhbzcUSpFbD9BcpbWBfIf4VimSPlm/QbguSdFvHbezDPkbiGXnPbhiO5eL20Q8RpeRMYM5zBeXWtkyQhz4cQmqzJUMzz+e3YTJuFQNnIRqligApPDT13p9jBjshgFLsXyTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660131; c=relaxed/simple;
	bh=lYv8a8ENVmLvpG8SK0wT5vDJT10Y+Y5S8ekfSoBh9WY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olalfxwV6YvFgPXdZFiMA+7KfiSwC6lLRhWw5MWpQA1a4CNVEFcij9gpiG6lB7nHTDaxHyGLTg7ZTttOaSkuUUKQmgyDCwblkT/XgtcHCyYVDqBhZP+Hq/lN9uPbWFyLUfpCY7O11PnTGNTNwq2wzdqXt3m8RVbwaHm7Mxkbmk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlWz4EAL; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlWz4EAL"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so5524820f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 01:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778660127; cv=none;
        d=google.com; s=arc-20240605;
        b=NCZMILeKQdwcNleICfHKD57Bez7ZrKEHts3cs+m/RSO5N3zd4hJCWf+aI81+6aHkZ1
         bLJ+SLZsICdN9ngpiZ6iT3ozIBwLxcQUF9UNQGIUtXx2jDmJF4dHNBVbe/m7D9JTMPjB
         kb7E651mADFu+NllzpJBPozYDCcYxNg1Qyxqek6MBudlfYNjl7silKhqEqkAMEzg70wy
         M7dc6JkYA7ZJ5ASwpoB4tPfXR5O8suz9DjPurxN9JkRPhEgZSb/4vzCNH9Sa1A5pCd8f
         rQkMLzw/3jug96T7Od3uxOEiFnh/A3uTqbtR73RSglUC8xjFn4qI5N0v72PvMSCJ+Pjg
         04Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ihd6IIZewTAFs61vT8dRXOpRuE/aFWajhj8VCrvf4kU=;
        fh=2GHTAzsjKo8+mmkhV6y4EKQHsWlekGI/NzwRr4VavXY=;
        b=bepoXE1mH5SAaCemPWZUC/+djSaBX8o63ThRvmTBRqHp1zfq/f7iAlQPplgBnPnRWQ
         3CZJdbUUEQIpLIr85fFXVDjqvdNEv4TbdXEXi6YexARdnY/YTCuPWE7K6YKka15LVA6m
         OIYslK3qAtGyp4HaiuScQSMLAXLbYk5sfkHqhkd8jxae8cJt1EaxhK0+2uYBMrKOWlLN
         gPKTKbuTNTFioYjZysvdlGGEpPvtva1O4w3PSNIRz9te0VABA9uoY4FTkwdmzYbGapXj
         VGebDi5HUxHu5Zvau3w6pJ+It+tuBVNe9dlP4UDNAsQ0n66iUiyAVcIe38GmTzFOLOmK
         MSnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778660127; x=1779264927; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ihd6IIZewTAFs61vT8dRXOpRuE/aFWajhj8VCrvf4kU=;
        b=LlWz4EALvX1WxLJAzHRzPG7CWljcu2hbSoxlJTvfFtWAS9/+np8i1nxaKUiByAXNb2
         RmvaRnhy4vHc2uO4ZFvlGEzkHVJO3J8b44IuhPZCQDJ8R5JvSRI6SSD33jU2uKFjK8H3
         cfySro31CoTT6YBfSDY2HIC2fa01Zd0+XthzW/CsG3EkgO4iG7VPogJolAV/pqXesV+k
         UP3XKMg5LgycpFjt0yU8XZrRJ60vdFK6fS+yqraYOgx3qnWbjD9ct8/Aeuu0MABRKCzz
         zSDE28oldeGt8jGxuVadWBYqMA6l5QlnEWn04nnps4FsnloVMLLNwQup078kgoFH4WKA
         kiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778660127; x=1779264927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihd6IIZewTAFs61vT8dRXOpRuE/aFWajhj8VCrvf4kU=;
        b=QJIK2uW20XbaqUpc8pMQfTYjaGsOOa+7V0q6OwQ/mwGOmGAhE2eTvAZ09G4SvI4yGZ
         wpB8o2CCajL5lRumFim54FpLluPiumduKplP1YUDW6ZfQ5tMZ8OZn2zcMGvEucnq1B8K
         ZauxeHSgjlcTz0vLPXsBX6YxweAzDACEMBO0dUf9vc6vxPolo6kvMcimM0h86VS5z8iO
         hSlMVGRG5y71V4WSFgDYIf4oOwtVlIsyPIBOteptUmZobIQwd/ZlC78LZxG8qxLMAUDp
         +Sl0mjPeH1OVqgPa/GO+UTG3pRJVkDLqwZe0CecHgToXQ8WBXb/qEXlnutyCyql7753h
         R3/w==
X-Forwarded-Encrypted: i=1; AFNElJ9ruH3ixiABqjikC3+ogeUBe30Q5mUqGrWo2aLN/p0YsdBxdSnsYMNRk5Ry+OsR9MBOdluRrmP8IpXyFPug3nawCz/MMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4i0TV+mAibvNFIuz3Xl1jn9gNz14yL5ghnPa+R6GXpMx0xg6U
	kJJIKJQrbbWCfxfK6hJbvPvyFEvlL5RD1TmTAMLjRR6xAhMvFgwApunUXK2LeL7Uv/ivJV5K9H4
	rMNmtiNzAzN6xb3jUJp26ssbXhHH1fKg=
X-Gm-Gg: Acq92OFxodMgllX0GGHkQ5mYIdKO/2aZg9Egs+F3LW8PJCA2b5gEW5yiGj+g6tXp4UT
	Py7ph/I3nkSWkqhdM3k5C5adAqftp3/JQqzREmi0+7Smrh1KGRT/PJl1lf5doMg9AQlnb2xT7YV
	FLxOMltOCUm3UP5Z9GWnoo7ueLNd//xJ92Z9H52+8g4W7vrj7ZL4F4iw7vpFokV68sDjQs4u1j6
	ABHMwQixy/aRjHmU5hEhGg6GgMdDH4v8XfiMLodJPGpCG1UVbmqi10TMh9U2HXoltLCHbzbJ8zH
	kyWmMGdztHQMZzDJgw0LL4uMT9Z53KORFmRP5QtliPg0GFAh6gZScOB3ZSB7PftMEjOn6QKEWow
	zCLhPxRqFNUboji+XiCFmpKMAQHedm9owcCrolJAqCh8xICTpYGrDKGNeIVoRoKZ3zyIFad5AFZ
	HGakBZUb6z37dhfXYo
X-Received: by 2002:a05:6000:2481:b0:452:a209:560 with SMTP id
 ffacd0b85a97d-45c59bd69bamr3403676f8f.28.1778660126733; Wed, 13 May 2026
 01:15:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512223215.25596-1-aldocontelk@gmail.com> <20260512223215.25596-2-aldocontelk@gmail.com>
In-Reply-To: <20260512223215.25596-2-aldocontelk@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 13 May 2026 10:15:15 +0200
X-Gm-Features: AVHnY4LREJDdBCiZ3UmbFhMT9ufyew7p-sRgEBV2Un7SA8xGSShNpr7DliqBzw0
Message-ID: <CALoEA-zype4pcy6dPNa_EPnAbTYLazdsZ7d_zEbbqGPrk9=HFw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] iio: light: tcs3472: sort headers alphabetically
To: Aldo Conte <aldocontelk@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, shuah@kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 May 2026 at 00:39, Aldo Conte <aldocontelk@gmail.com> wrote:
>
> Sort the #include directives in alphabetical order in preparation for
> adding new headers in upcoming patches.
>
> No functional change.
>
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
> ---
>  drivers/iio/light/tcs3472.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
> index 12429a3261b3..9b0f64cd9c50 100644
> --- a/drivers/iio/light/tcs3472.c
> +++ b/drivers/iio/light/tcs3472.c
> @@ -13,16 +13,16 @@
>   * TODO: wait time
>   */
>
> -#include <linux/module.h>
> -#include <linux/i2c.h>
>  #include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
>  #include <linux/pm.h>
>
> +#include <linux/iio/buffer.h>
> +#include <linux/iio/events.h>
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> -#include <linux/iio/events.h>
>  #include <linux/iio/trigger_consumer.h>
> -#include <linux/iio/buffer.h>
>  #include <linux/iio/triggered_buffer.h>
>
>  #define TCS3472_DRV_NAME "tcs3472"
> --

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD
