Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05891224B12
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Jul 2025 17:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751907755; cv=none; b=PHyh/lB7TRVC/ErHPtGMufShPh3K15SZIn63eyiu2BvzZRHGyanQ4SxX6K69Z4P26OtpW8U7uhhddNCMTGmNSXXJJAMUg5W1ud7S6kv4sqyGQpfhWN+XoTRm1nI73N/FCgxqLKLbUibeGZUDrRCftQ6oTA2qP74CEyVYpa2SjYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751907755; c=relaxed/simple;
	bh=qEpcMyFiKfiNP7wV30h27bvrbTZ9SYrfEQ5szRtfEgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qbQ6GcGj4Lmi+m3BofnsFE1G3dzWS5PYiVrpkRxmA655YKluTbL8iw3EsnmPVjEsayWoc+IFe1gyfZCDeaEo4GsWdnOn7DaJsYjkBMPfXJxjRW5xVj246TU+WsEy3aUHj4EcPQm++6iBJSQ6Rir6yA/oofEuzIrsoC2XnmGpSGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfobaSeg; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfobaSeg"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234c5b57557so30951255ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Jul 2025 10:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751907753; x=1752512553; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sf7fXWM8cJOpPopwpN8BZiyBh+hJ95cXslAdvwdcSo4=;
        b=LfobaSegZdsSuOQY9ndtFpTwR3dMaDqJDIXjXTG027Mtt6R2eVl8ud9WoXYQMf4x+7
         2CWhNpjRAgu1UhpZAv47KoN03+0Xyny2TXaqIgxtFNnsS/OPvsyXq9Cqahpuhm3+M/k2
         +a0uG4td/3Ne5A/q8v+Q6+cJmhiBpXKPiBvdLix6Ww4WTD2pbVsPF4Rj/sh1Yzcxms0c
         lh0ZxDExreCb/ittaGhZhQwndIu9cjqGWlGUytSqd9nat6BAvRFIGJ9io+3hFQ1cf7K5
         6UOZteElJcOkVrQTdc12YeN/V5n/27mcaMOI+rfQdlHhLwaXnrT4dooOiXDH7Af2jl5K
         +xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751907753; x=1752512553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sf7fXWM8cJOpPopwpN8BZiyBh+hJ95cXslAdvwdcSo4=;
        b=sWZcybAmr5d/VrWzqp4NFzwj/ReLQS7Ao/QMPZT4v1mT7/hf694QiU8qVpNUy0Ddqw
         qZoCzKXfGDVEwNdmCH+fyiHWdevZFFKL72DG0tknuLxox3TS8O5BgRs7w71k1hlE3Tup
         gmfAgJJ5ZGLAqH2hPIow78AlfRZKmBR4GpwappmqI0DwswYiq69GC+aWop1U2oHYAT5c
         YAJKnFB0m0y9ywXL+dNJxCPn+qI6yfhTC+Ih6dKJwW4De8xI240lDOT3TlJfm2YTWncA
         CQrPOUbL62eifwxlFL5MLGPmHLRw24tWODHE2I5NfNB6z37YlMR281CgtrTm5ttBJZUF
         4c7g==
X-Forwarded-Encrypted: i=1; AJvYcCXBWEUSuBkYyYlz0l/QH6lPAI57OhJCvinb5w6/r95h/Gi0291bYGo/gM2wQh0EnWVe2CmsE6PkGwYyfAwwjYcTnHATRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGVuUhhQsCFyvRf6SXqmeejESFKdlKJgqQgCop34CXh3fPmymj
	G4xkcvcweQsD8Pj+p9Z+YAmGmViv//Zh5S02uB0fOsWRFoYrPt6qDMCB
X-Gm-Gg: ASbGncvpHg0tzeXtnY7ns2Vm8FGjZqs5I2AmVbdkVFHkyiCV3gMbnmI35E5HlycRDJy
	ZBlj/ols5zodzTxenpUnnD/+fgB0X2Rirpr7fjdNXf5T7xXzNhQil0dExBTS9fzxhkZ1PSdMCVz
	aNWt7eh/yDOq+ANCaHXlONtA7NSJhjk9ZzMwoHkewcvRaQ2AwCbFyWxn+tFyQns5MXkNUoBrij7
	evje3mRI8ZsTaDT8Fx49d8lXYXlhtGdHHD9XBuHOnZeE/tCiv1H1sAeZfZzANCNoALn9EdLeix4
	4Hjcswl4FDwx077gFMr/92YobD+XNot91ZyG8lM7WJiPpZ5P8wJLpq0xczlzXcK2
X-Google-Smtp-Source: AGHT+IG8yMUXenYEn60fkq7ok6nf8gr6qJOoaMZCKEBtHTYasFnNHGVKtr5hAhaAnpN5pj44sUjrvg==
X-Received: by 2002:a17:902:d512:b0:235:ed02:288b with SMTP id d9443c01a7336-23c85e745c2mr174825445ad.30.1751907753129;
        Mon, 07 Jul 2025 10:02:33 -0700 (PDT)
Received: from [10.0.0.86] ([122.172.85.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459c6e5sm94885855ad.227.2025.07.07.10.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 10:02:32 -0700 (PDT)
Message-ID: <2529b1e4-390f-4459-b7f4-82a9cd005da3@gmail.com>
Date: Mon, 7 Jul 2025 22:32:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: panel: Replace usage of deprecated MIPI macro
To: Brigham Campbell <me@brighamcampbell.com>, dianders@chromium.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250707075659.75810-1-me@brighamcampbell.com>
 <20250707075659.75810-2-me@brighamcampbell.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <20250707075659.75810-2-me@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/7/25 1:26 PM, Brigham Campbell wrote:
> Replace all usages of the deprecated mipi_dsi_generic_write_seq() with
> mipi_dsi_generic_write_seq_multi().
> 
> This patch's usage of the mipi_dsi_multi_context struct is not
> idiomatic. Rightfully, the struct wasn't designed to cater to the needs
> of panels with multiple MIPI DSI interfaces. This panel is an oddity
> which requires swapping the dsi pointer between calls to
> mipi_dsi_generic_write_seq_multi() in order to preserve the exact
> behavior implemented using the non-multi variant of the macro.
> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> index 5b5082efb282..777a8ab3a397 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> @@ -161,29 +161,35 @@ static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
>  
>  static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
>  {
> +	struct mipi_dsi_multi_context dsi_ctx;
> +
>  	/* Clear the manufacturer command access protection */
> -	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
> +	dsi_ctx.dsi = jdi->link1;
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>  				   MCS_CMD_ACS_PROT_OFF);
> -	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
> +	dsi_ctx.dsi = jdi->link2;
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>  				   MCS_CMD_ACS_PROT_OFF);
>  	/*
> -	 * Change the VGH/VGL divide rations to move the noise generated by the
> +	 * Change the VGH/VGL divide ratios to move the noise generated by the
>  	 * TCONN. This should hopefully avoid interaction with the backlight
>  	 * controller.
>  	 */
> -	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
> +	dsi_ctx.dsi = jdi->link1;
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
>  				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
>  				   MCS_PWR_CTRL_PARAM1_DEFAULT,
>  				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
>  				   MCS_PWR_CTRL_PARAM2_DEFAULT);
>  
> -	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
> +	dsi_ctx.dsi = jdi->link2;
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
>  				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
>  				   MCS_PWR_CTRL_PARAM1_DEFAULT,
>  				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
>  				   MCS_PWR_CTRL_PARAM2_DEFAULT);
>  
> -	return 0;
> +	return dsi_ctx.accum_err;
>  }
>  
>  static int jdi_panel_prepare(struct drm_panel *panel)

There's a lot more functions that should be replaced in this panel. You
can get a good idea of which ones by looking for the keyword
"deprecated" in drm_mipi_dsi.c . Here's a good reference for what a
conversion patch usually looks like:
https://lore.kernel.org/all/20250319183106.12613-1-tejasvipin76@gmail.com/

-- 
Tejas Vipin
