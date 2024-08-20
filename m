Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2026118A6C2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 08:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724142215; cv=none; b=VNbF5LNyhnqRN3YUg5QPsAKiuIS7v0ta0sBGipjngOMmrWYuxq+TSQv0BEufczovC7dCXZRAC0aR0emhALZvhHSHAdOTXJPyuqc9ypy6a4g39r0aFFQlY2YPS4kfXx+GR2Hzggm2+HTK3129+I7dw++bZeSIliYGPm6dWCuGipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724142215; c=relaxed/simple;
	bh=B19sqoBycUry/vO0YXIA83O5KOHUsudpw3pBkwmo2TM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rNS7HPwoOcPmsZjqsSMJwthrF2T/nEbmsa451g4xQFS+iREDQA+5mJmtTypqKYD5RojARxnBL1XKJ3IGslw9c7LR4Fo+QlNYPRGcfJaV5Fz8ReQASsFUYnssJ6zjR/sGAsdOzSZbgePePaQCzWj43dVed/T1iSFovksm2cC+BL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VSHTrIey; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VSHTrIey"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A698360637
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 08:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1B7chjXkTPk for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Aug 2024 08:23:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=neil.armstrong@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9498760626
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9498760626
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VSHTrIey
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9498760626
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 08:23:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-371c5187198so448991f8f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 01:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724142208; x=1724747008; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g06wDPeU9MjglcJ+z2m0ltRmTby8o0NBa3/IUMX4o7g=;
        b=VSHTrIeyafEOac9kAhX4vQP1qs1AOfJ5IXsHJ/H/I+NztR+LcbNMMemv6vSdH/bv5h
         PF2A0uDL5YUVvdp21J8Gu+YQ1rVzsIF4n8mbf+UKPnTlxAv6akDYTxDPMboqqGvcPkuW
         AEFuxvHol6IuP2EG0x9fh29JIMCqrfsk1f5Xa/mMr5hA+dHC1q1GjVznswbimddeT4bV
         rqUphboxhOgOerkxoMgtX/iXm5socuoWgv3lLVtDXAVLEdjwvxjnT8wlCaKjnaidxl0M
         tRBWGBab+DspLalsx2zICLWjLGwASA+RQKideDGRZVy3Ot7FUeWBkQSk2RRdBkbqzVGq
         Yv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724142208; x=1724747008;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g06wDPeU9MjglcJ+z2m0ltRmTby8o0NBa3/IUMX4o7g=;
        b=AsB2QsuBV2kOltGq2KYUrFEl+dbG3ltSjTNnffZocD7+W0Wj4+9LVdNNsSAyGMVO2r
         LmBzzopqbaV5tXsReow0ncQwclmDi+gpI72gMMslJNlcBj3nYd8jViL+aaMJ8oAqKfWz
         O0UxL2p2CNWc0/A8TuNDMp4VSWVWrLoEYG27YEeNhmIVqgWY4Upl6/9UGWhS0rVBVbQ/
         SeYjNmARnyozUBKpXaqfAXAu7htrKTIJ3f5R6NOxrdDMOULNY70ZiIxFz4ScMV6g3ljL
         ayH5d39GydmlAMmZyXza1DSxx7lBGGSH0def/GerjJixX+lMzbZ+iPYhJ5yacEH5XgML
         KrqA==
X-Forwarded-Encrypted: i=1; AJvYcCWknecFdyP9rKbdDw9cLpBLwjq3mvIT1L/fUlD9uNq4sE5SXiEbYhJWPUXSX36sTmFLqlhv48tumdeIpsDK8+C00Gdhp1zN+CMGs0KbWO8I89coklUk8nB/i+/m36ha
X-Gm-Message-State: AOJu0YxMjIbz2jZ3J0u++FBxXcqbkYrqrWDrHC5epFznU63t8LZ2Cuol
	0TEHwD6NCQWHBxcJv80/9vCb6gp1kCWgi31iU5giz5ar2boE0MBByaaBdSOZ970=
X-Google-Smtp-Source: AGHT+IFakWknGdMxRWi3g0r4IjYM0bu/R3OkJs3pCdC6FIiuXXQwaNsN80cLj+C8v1Pj3hYfWLpd7g==
X-Received: by 2002:adf:9bd9:0:b0:368:4b61:7197 with SMTP id ffacd0b85a97d-37194453122mr7643625f8f.24.1724142207730;
        Tue, 20 Aug 2024 01:23:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ebdf:8de4:37af:6aad? ([2a01:e0a:982:cbb0:ebdf:8de4:37af:6aad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497ffsm12435438f8f.27.2024.08.20.01.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 01:23:27 -0700 (PDT)
Message-ID: <5dc32819-a794-40b4-95bd-ee05c0c395e9@linaro.org>
Date: Tue, 20 Aug 2024 10:23:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/panel: ili9341: Add comments for registers in
 ili9341_config()
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240819175122.33176-1-abhishektamboli9@gmail.com>
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
In-Reply-To: <20240819175122.33176-1-abhishektamboli9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2024 19:51, Abhishek Tamboli wrote:
> Add detail comments for registers definitions in struct ili9341_config().
> Replace TODO with comment for each registers.
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
> Changes in v2:
> - Rephrased the commit message.
> 
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index 775d5d5e828c..1fbc5d433d75 100644
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
> +	/* power_seq: Power on sequence control (EDh) */
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
