Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1F81384BF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724082075; cv=none; b=KVgGw9VEWwLpDZAPeoP72Zlx9/+di/upqnHrRUraLm1JsTMyQKXuZZInTG684drQI/KY8Zk5xT7omc0NSNU2Bs1zHos6JtesP4kG8aXsggO4enTBg2slvZsYEerkpWAASu9grVe/fvZgSVh/FMbuYsW4zNR4iFBlqEC5o7+ZRqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724082075; c=relaxed/simple;
	bh=0D1MH02bz6Vy5wol/7/ekCDY5+vHDaQXLy5SNPCWagc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ca/59kGD2OyQIx8Er0+8KienXkG3XeWCz7LylSOhP0+BMbiUUTcppGqikMXSIu4Soer7+J++hl5Ic4Pd1eurFAPixE8ZGSI4jkm+Tuw1fsjLEo7lvaV8UaXOxvYeuxar7bf4bNPCWjWwCmoA4CzraSDl2PaM4QYsu6lRxLcyCZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cKWQSxPq; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cKWQSxPq"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65A0040403
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 15:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZZdxdmaPSky for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Aug 2024 15:41:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=neil.armstrong@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 194D040372
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 194D040372
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cKWQSxPq
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 194D040372
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 15:41:11 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso34829695e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724082070; x=1724686870; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrzATe8rYIud1EQmdYYD4F8xYF1fCvbf9TZacojasoA=;
        b=cKWQSxPqr2r8g8wEU109uFKN3tgZSadE7B3vos1YzneEJ8ho7Ua+Qq5EkSpYQL0q2K
         kuBr63C/Co/jIt9DFM+6XLtBeEFUSuFfUZsUY5FBIE4vDY6JPQxB6FFoy0MU9wXNMFiX
         PTZP/Aom15I431ksY2oxAUcsTJScPVeyTNwXqyqyUQjhz/6IJ6p5ZsXOZ7uhRNKbyVda
         tuSiojbSKCJWUi3Gnm4R2EUqzsyPFbRo0VHSgxPA0ErWNTYzTFue1pEht+MoAU3usEZ8
         AUcH9BSnReYeWnsfD75iHP2U50RVnOHhi071J2oz59dJKm424ZM1jrb+PU//zr/bHffw
         /d/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724082070; x=1724686870;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MrzATe8rYIud1EQmdYYD4F8xYF1fCvbf9TZacojasoA=;
        b=aFw1XBkG4sajqoUNTNIytJ44Ujdw7tBRvHbDMmniNsIfJ4YaABr5/snJWfRlslJKu1
         KMqiiMQABiR2JtU0ojvSpEhPKWgCKA+zoDXe22htsh4B1CGSDi7vUwFkKsdv6HpDa884
         XtkNxy9RKApCZ4K2Wzju451ZH72U3Cx+4Sf3UBsZoE36vScu01rLnA/1/TCA9r6PRK+3
         KbNYare1w9opGKVukwRkkLWbm788B9WVKY7b7r5GS7jVLHpf5/Ff5eRfaX1k3oB4rtdU
         tf7G1c362mxT2ZVCllyZpq6QqjyjfvY2S+LcCsKdqTBmINCJs4NtEGytymPAF6mCQF1b
         gdGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5Vl9/tv6T7oNdPBTIkRokZ0B1taeddKLzwhTp4ikoxKwbyg+EEzQ6RsuB/cRgdvBRVxVKkujjYDCCl6RfUjpydcZubg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzxSpyuv873qaRsF0gTHi4QqvAQDXsqMB6ms/6HDCBHgGhfXD2X
	dIrQUUBIFoi7TODZmIqwRmmC3KFzQvunYlWhA775LJ2mGFAZxgEgm6lj9x0a9eY=
X-Google-Smtp-Source: AGHT+IGbaGgDjlkcjOOxjw1s5hMx81Sydj4FWl7Oz+csh+yXsVHvtIbKTUYageb60ZuUGTwv5aH3nQ==
X-Received: by 2002:a5d:408f:0:b0:368:5b80:b8d with SMTP id ffacd0b85a97d-37194456508mr6323850f8f.21.1724082069174;
        Mon, 19 Aug 2024 08:41:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a286sm10817742f8f.54.2024.08.19.08.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 08:41:08 -0700 (PDT)
Message-ID: <b783f932-851f-4ea5-a2cc-d39061c60652@linaro.org>
Date: Mon, 19 Aug 2024 17:41:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: ili9341: Add comments for ILI9341 register
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240812171019.561321-1-abhishektamboli9@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240812171019.561321-1-abhishektamboli9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2024 19:10, Abhishek Tamboli wrote:
> TODO : Add missing comments for ILI9341 register definition.

Please rephrase the commit message, and explain why in a proper english sentence.

Neil

> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index 775d5d5e828c..cba6a6952568 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -121,19 +121,19 @@ struct ili9341_config {
>   	const struct drm_display_mode mode;
>   	/* ca: TODO: need comments for this register */
>   	u8 ca[ILI9341_CA_LEN];
> -	/* power_b: TODO: need comments for this register */
> +	/* power_b: Power control B (CFh) */
>   	u8 power_b[ILI9341_POWER_B_LEN];
> -	/* power_seq: TODO: need comments for this register */
> +	/* pdtcaower_seq: Power on sequence control (EDh) */
>   	u8 power_seq[ILI9341_POWER_SEQ_LEN];
> -	/* dtca: TODO: need comments for this register */
> +	/* dtca: Driver timing control A (E8h) */
>   	u8 dtca[ILI9341_DTCA_LEN];
> -	/* dtcb: TODO: need comments for this register */
> +	/* dtcb: Driver timing control B (EAh) */
>   	u8 dtcb[ILI9341_DTCB_LEN];
> -	/* power_a: TODO: need comments for this register */
> +	/* power_a: Power control A (CBh) */
>   	u8 power_a[ILI9341_POWER_A_LEN];
>   	/* frc: Frame Rate Control (In Normal Mode/Full Colors) (B1h) */
>   	u8 frc[ILI9341_FRC_LEN];
> -	/* prc: TODO: need comments for this register */
> +	/* prc: Pump ratio control (F7h) */
>   	u8 prc;
>   	/* dfc_1: B6h DISCTRL (Display Function Control) */
>   	u8 dfc_1[ILI9341_DFC_1_LEN];
> @@ -147,7 +147,7 @@ struct ili9341_config {
>   	u8 vcom_2;
>   	/* address_mode: Memory Access Control (36h) */
>   	u8 address_mode;
> -	/* g3amma_en: TODO: need comments for this register */
> +	/* g3amma_en: Enable 3G (F2h) */
>   	u8 g3amma_en;
>   	/* rgb_interface: RGB Interface Signal Control (B0h) */
>   	u8 rgb_interface;
> --
> 2.34.1
> 

