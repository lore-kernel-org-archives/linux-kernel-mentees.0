Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424F130DEB5
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509150; cv=none; b=dq8A0ZkieAUgP7qVR1Zgu4yN7RwR8+skxiW/mJZbZS6KrADcX1NfqZ99CAL0eIiudSEWPCxwHWd3WOI+dB27c6u/fhmkPwi5iyTQ8ef5Wshd8Jrs7kFpxunsJ+Wjv74SOZrw963pgR3WdpjnEjbxGKOb2qFdsPxlGE0eAI7ocjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509150; c=relaxed/simple;
	bh=wo4TENj/CKIqy8SYXhJJLguOY5BaEq786MRtklI+vUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ydn7sUsLm0Ekpz6QxJ+T2IzxlWZJmG+QmLRblCUHwpu4wNbgQdNgSXYXcav84rBvD0AUHlwOtfPE7O05pH+sUrWtsoVPgzDe4VVYToX2MDz2J1Z292UmvkUHzjvyMkuUbIilAWZjU9oiKCaqUiDiZ2CbvpKhwoT26VGFNTlLLew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nzo/yo0W; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nzo/yo0W"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-333f8db5aedso28358621fa.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755509144; x=1756113944; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wo4TENj/CKIqy8SYXhJJLguOY5BaEq786MRtklI+vUA=;
        b=Nzo/yo0WFI4ZebcgKk3SIOzYInzO+zidMF59KhknPYKKzIem18Fn5HQzGOhHFcQ1Bj
         Q9uzeDrbpL+cLM/UTblhfX7uZyU2nH3KKiEdZinZV7Ms0ykfXmfpZlzFdFqiGTGfQAPM
         Z6SWgqa+wplPe0I9TGOi+H5EkRYylmlc6oAPvNrwpst6VE4dyI+7NOMAqzVz/k5IxuCu
         prXI+/iZIqct1edYtuGt8bHCX+ygeYBk37Fh3/8w+t+Zn7Ih8Ks5K7/MnaH5UeRhy72e
         N9STVQHDHim4QzLBC9i0Xi9mTUspL7O9PmU+e5syNmi2KpIquAqo7Gdr8PcOIOYW/Qow
         QyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755509144; x=1756113944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wo4TENj/CKIqy8SYXhJJLguOY5BaEq786MRtklI+vUA=;
        b=nPYxAtEqjxg2Kpct/MKj8PtCDpsIbTMD29lRpsLH1vEugu/TAUOGDKWYGivYaQ34oU
         UGNSasuWz/LfnHYI6ckn3CQCs398rzd1wWsGHPk71xwMA7Q9LwgNxwBDY8DwujZGBPlB
         CpVDVvzVpGL8usPeGSkm+xnm6WGoHk3fVYc1ebRotMaGM5klpQeWMWlTFjmEInX2zBPS
         h+97FBSs5/27wbDOqYpsg4zsZKP/qQ8f6Q8QHJp3MoVIhM40UfFAEmMn57c0+8NtmOyx
         YKT7gqrv2umoQrAyGzDdsuQYMtiybaHeinwGSUjpNu5aWg4F1IwC9mgN1W8gj4a17L3G
         2zZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsxpOOUBLbA+zOIFVeEGY6X7/UbK0shFtOUcrWnWZa0/v1+Q0GccKYSffT59Nu+gfJ1+uBjQe4VGsoyojcdmvDAA84Kg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn+32Ht8NPHRJplvogKrDvoL10alpteomUjrGuBGqg93+0FPTG
	vFepnDpHfaseIGI1IrMWX5ab6Jn3EYs/1V4qfQGiOybNaehF+HwtqQ7AntTnyTSZSRUScdKFatr
	tWcTNQ3owOMsYFUdEp7HtJZ9Yp76Lq3u/xpwS4MTWWQ==
X-Gm-Gg: ASbGncvP7d07q5SrDutW1YmSsABjss5o19q3Z1jem4blHjjJFK/6hFXMKO32RrTucqI
	8AJNk46gFleai4UZ+Lo5eoEeyLbSwJ+7C3gpGzLK2pIq5tO0taAvh6xAeT5qt7/exLv1b7mrFxc
	OIfW7XMhstfUDWB+MCWHsj2eK30wJBZGPtdV3WTNVc5PLunb6GieaEOCuWEr0GSevlHlgPBxRXm
	gAo51o=
X-Google-Smtp-Source: AGHT+IHNbZouPA+9w/Eg1wGgKXMzUtJ39CaSfzmACFke7a6lYkpcnvTkjJpS7aaVbzjtwG3r/4970mFH4ZdlzWsxTU4=
X-Received: by 2002:a05:651c:555:b0:332:3691:a50b with SMTP id
 38308e7fff4ca-33409963f8fmr35371671fa.33.1755509144347; Mon, 18 Aug 2025
 02:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730061748.1227643-1-me@brighamcampbell.com> <20250730061748.1227643-4-me@brighamcampbell.com>
In-Reply-To: <20250730061748.1227643-4-me@brighamcampbell.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 11:25:33 +0200
X-Gm-Features: Ac12FXysXacOEMS_v8Dyu_3gMUa5CFOxftr3HHbH5tzkVfiT0eAfebU-wggGo3w
Message-ID: <CACRpkdYZrBze=MrixPpp8psUus+i2h_iz7CPfYtRCjspVGC9_A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/panel: novatek-nt35560: Clean up driver
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, neil.armstrong@linaro.org, 
	jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, dianders@chromium.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 8:18=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:

> Update driver to use the "multi" variants of MIPI functions which
> facilitate improved error handling and cleaner driver code.
>
> Remove information from a comment which was made obsolete by commit
> 994ea402c767 ("drm/panel: Rename Sony ACX424 to Novatek NT35560"), which
> determined that this driver supports the Novatek NT35560 panel
> controller.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

(Maybe this is applied already...)

Yours,
Linus Walleij
