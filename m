Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9504536F902
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Jul 2026 02:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783391531; cv=none; b=pOYBpHXTEWvHxnwsnHkCDd0koHmr89Ttdbhf+EemlySriBs3WrS1EtfWrIojok9d5yVwtIP2q7zCzykopckmO0CdfO3A8Xq9cZTqAIm6aRKJXgXqG8GFRBZowoHDCB1it/uhK+jlg5QwDeFryLoXNdSZ4Xxf1k6GQ9yCcAO28vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783391531; c=relaxed/simple;
	bh=qrCzzfAoJOWqHGcmXakXv4hV01J1GN2MQWj19kFT8Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqD/ugwRmyoqVc+s+dw0Ll0EO1JEk0h1ySzX/ZiGCfU/ykz9AsZl1KkE9Q3XBSdSEkGKwVE2yOL0WKBtFzD/rORHQqBjNyTaOoYEkrx4doia0o2FOmbdgLl4wJhrQqNECycTcduwal9E50/m6qmBC6yPs6LEYCZRWmmx9W9lGY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GAjgjgHn; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GAjgjgHn"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bd742e0c20so2649656e0c.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Jul 2026 19:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783391527; x=1783996327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hpzU4IzOiJcEhtdFeo7xYB0H/JZhSu55bWlqsKkTgM=;
        b=GAjgjgHndCipK0RJl5dkBIbdW+cpU7yAX8SQqJPCoabTNioyWm1MG81/4iBB2s112q
         e1TQj2y2H6z8zGKcT1ua7PjouyzKlT2NA4zBTNKtzNh8lriX33NVe92LrWuwSZ6OUvEq
         oPqi/MpTzzzHUBcRbQ6i1eFh6WRrvBZqCgypo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783391527; x=1783996327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8hpzU4IzOiJcEhtdFeo7xYB0H/JZhSu55bWlqsKkTgM=;
        b=Gjmhmjckhl9CC+wpjcqDiomqauEta4z6lCX7F7jtaTW7tz3GGfbdKLHA2UQ0Q6tl+p
         mq/XR4mXOLB38XYcMvM0IYQg1jXHgD3xdiwG/8x2uTc2o5+ZfS6ssM7bHMfmM3DekASz
         RHss2QBItP3SIYrh5kjhy0Q7p+0ef0i2OaajXz3gKybHjCJnX8BABeTWxgb+pTi6WmZU
         eB9SVQAv22Qxeb6GwX7CiblgBGqvFaR/lslLsKNN6XlcZFFkOfAPGnPFQ+K8qasds3p3
         pqIDLMEW2j86EwhIJCD+SfA9rHQWzScbrv65wrM1fccOOfmtKm9wD4TRxi1D77SDxADw
         +gKw==
X-Forwarded-Encrypted: i=1; AHgh+Rrwe5yqFbuoNcKxGukO1XecguDMBOyVkRlyY1LTCTTSRo9pk7i8DRwAzvuLG+RUvVJFEot20SBLxXuqz7lwILZ1ZEm+Zg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4mGsYOzTjbM8K81+TFBeiXpaV8ZYw13r3xgr/EmW1yKITtELJ
	+4tk2OvbEagj7hNLwyXzP8ppX/2ZNHE1uqLej7kCBCP3lDaa9Xa2uYFajn780Ca3vaWBIPxcdJJ
	56Fk=
X-Gm-Gg: AfdE7ck81hDmW9DRBr3PXqLWH78YhkT+IXG3yAQquDYYwA1B0g2aBnWxtiGAcIMvlEK
	7c+68UpsmbRWQVdFXlJh3CwRQgZ2/5Xlnrmq5VObndwfbDCy6i85rJ2KeY1JzLKjE2xwQMKzZJG
	fWyaDPIeccMCQ85SKoauEJtn8ktNPj/LjoclGkHbaUwthu+q9SCxMMnRi9vSr1SRS7IyRvPaZB0
	j/oUW6iUnkjibJ3tQseAfUizGeWBDMq5XfzL2/4C8VBeiGy2XEeL0Har7OicBEpZvUbezOTv7n/
	eaKPn0GriRzD5jpxND1+ibE/D4s/MGpkV6bKaQLCSxDwQnSumrTw0NT509jHY9xfaiqfOWF/RSD
	0d2/vWdRTVgDLZnKaOzxbVb2KAYMq9REY+Nnm9cnuFbsWP2W39zlphK+TcrshEvkwxv26oN7fKK
	w3POKnZypXyaktsI2w5qG8VeSt3mRjMJh0Y3FDXESQCana1fvI3Xy6b5I=
X-Received: by 2002:a05:6122:3b81:b0:5bd:cc32:280a with SMTP id 71dfb90a1353d-5be907438afmr1968786e0c.5.1783391526948;
        Mon, 06 Jul 2026 19:32:06 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be03ccd55esm5909387e0c.17.2026.07.06.19.32.05
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 19:32:06 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59d07df448bso3365251e0c.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Jul 2026 19:32:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoMGl0uwypJeKp+Av8uEbTeq16Tgpse06AqLlipBv+t2ae94A+ODri0E6L9PhLOjP7D36G6yPaC1DZeLTvlM9qPZqzhQw==@lists.linux.dev
X-Received: by 2002:a05:6122:218e:b0:5a0:2018:4dfa with SMTP id
 71dfb90a1353d-5be89749afbmr1949268e0c.3.1783391524570; Mon, 06 Jul 2026
 19:32:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706224414.1015766-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260706224414.1015766-1-nico.antinori.7@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jul 2026 19:31:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UTtNdi_cUaqDXXWWFzZADh_HB=sJuZqKV=VB8tgFTwEg@mail.gmail.com>
X-Gm-Features: AVVi8CeklK9TVcONBAUOBdeOyJD3ulzKuDFRIZUSZ2dDsrDnn4NDm00o4a5te_Y
Message-ID: <CAD=FV=UTtNdi_cUaqDXXWWFzZADh_HB=sJuZqKV=VB8tgFTwEg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: novatek-nt37801: Use mipi_dsi_*_multi() functions
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 6, 2026 at 3:44=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> Replace mipi_dsi_* functions with their non-deprecated mipi_dsi_*_multi
> counterparts. This change reduces error-checking boilerplate and improves
> readability.
>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
> ---
> Changelog:
> v2:
> Implement feedback from the previous thread to simplify code in the
> novatek_nt37801_prepare() function. This converts novatek_nt37801_on() to
> return void and passes the mipi_dsi_multi_context struct directly as an
> argument.
>
> v1:
> https://lore.kernel.org/dri-devel/20260701125624.199786-1-nico.antinori.7=
@gmail.com/T/#u
>
>  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 110 ++++++++----------
>  1 file changed, 48 insertions(+), 62 deletions(-)

Yah, looks great. Thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...barring anything else coming  up, I'll plan to apply in ~1 week.

-Doug
