Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5691AC88A
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780635; cv=none; b=EPtK3jrx6LBXd4Fxr+78O09E4khylWCXMEr0pJ3SQJZeArUEcSN0zIN6IeToj3V2fGoy6UiT3cyqXYi1b9HOPHKSJpRoXapg443E+I6Nea336xucHraYuSsMIFVNNf363CitDUzHCZAdXOcjkXxmsZqhBbz5Jvsg8VZyxqY81jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780635; c=relaxed/simple;
	bh=M6rFzmVVrJYTEDtPq6tO1uhk8mTDCIssB7aBkjUROs0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=N0t5ThqmiLqhYGmManBFJCLcQo+5rNDDhYd2ffS+2S6WGSbaQ5kkVf3B5wi8NzlkogMzL0gFGifpEYK4rGHvIDtVNc0JnEyjmjnKO57Mfo1KnkJVlBHFAEG9PYQMRR4WVjYvllGnrTx2F7X/0kttXJ7APiWfkppusDkr6HqRuwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BOtGYqwi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BOtGYqwi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso55846085e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753780632; x=1754385432; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d60OURvTslskqUGqUM8qPLgQLo0x++CgR9duN5Eh1VM=;
        b=BOtGYqwioeLOqcU2f+/hJS1WgKz5R2vUY9uNXTvg0K1ToxPhdE4xFQX6DTA3SohNd+
         +bOdrLaVvXvLxdzhXPumGTPiHgR0olSkVPqLVxVBfECWOKesKW42UbEYbQq7rMhyWnKS
         yEflFP/DY5Bakzf6tLd6Hf+iIu5x9pwbWD0Yzb/+t8XZ4M/q9f5/RwvkZFJtb48+LNCn
         yX8J0pCc2Pop35yE8pOmay41+iv9w7Ziv+c64DqyhXa2a/RSMNoKSV9fHwXKVtpdiciU
         VuQNQAbYXEw+c9KG9dq3hHY/Bj43M+lem5TYNvd9nOqvErfysTz2/9tASDUADcRNee5B
         KFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753780632; x=1754385432;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d60OURvTslskqUGqUM8qPLgQLo0x++CgR9duN5Eh1VM=;
        b=nxapaEij/0AH6Mg50H/mv5bwzTKmrGq6b9FmYxq6rgZAM4noL0BCYaMDIgfkvD9O77
         /TUXl1xHItDFmAB6UY9ktj3KTYNnBCzPVroFNWiNMV7k4Zv+ixmMtNVenZfzMhfoC+Dh
         fTw+vtVCqP4gwvZnXzS1tJy7R9DCmguk98rxNOGbOWL9uRqgrlCSRT9UaMe3eXg7Xf2j
         P5cXV/AXnwN1spp/Ud8/MM/Dm/nrnF2lo1mjCeMyG9sIHHDTMuiR1aAcygnqvn6Hx8SF
         2z4ZIcA/y0Ui2rvbdOqlXQJ7CveKG2xiCWX+I4eos0a1wrRZjViREjiYPyQxReZ5dMuW
         5DMA==
X-Forwarded-Encrypted: i=1; AJvYcCUGw+vE3elO+UhE+v3eAqaYwnlCU/OvZebp3RSzjJhnL7Kw5d+Pou6bvA4v/UKfH+FS41fd04nk9cb671bavgD2TIcNTw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5u3fTfUERWHm1zOukrH/ShxjM4AFilQ6x6ChWWwBTAaM1v3xO
	oZ38kUWpqEMkL1MskbdrJt2CTzT7wHJDG1r1N97BHSNZPq1YjHcYiYEk4+WeF2CtcLw=
X-Gm-Gg: ASbGncs8n3+fItKvJORUHHiftT/8aUhZP0IiejrdHd1204UKfTLMNufD+5acbPXiAcL
	O1wgVLiV4HpCjh827Hz03jR/A7nvzikM39EalMA0LLFscR+nxiAqWvw9gnTwyfsR+rW6P+Rq0wk
	mqfrO31Hfvit0SN8MIa1PwuPHvbtDKZgkVDpVZtMmW35nBBDIZMJ+NA4NwlYpX/UjdIgAM19wlI
	FBU5Bm8P1L9CA05GOM3w6F5dFf0Nwx1QTR+NA8KaZskxNZotkP9lBcexp0KyRsHOuWJcaysGj51
	WZIeUtztUxJtTeuNCUA2fV74BYh1Q8t55dmn54IGTGq2HN6cmd5u41uMJGNvMGIvy8u6qsPl8xQ
	HmxZ3Xw2tgUUc4cgPjWZ0MKbvKhTJ3hLUdlQKnkYdguXGFygXWXEGYOK3krrwDllSAk++pAT2
X-Google-Smtp-Source: AGHT+IHy8IlF5EsVFcN+ZeaLeXgccCzDTIMzFkralNzOHDs6W5E1jDZ+/O6pm9Q3S5ZwVCt98dtyVw==
X-Received: by 2002:a05:600c:1c07:b0:456:2397:817 with SMTP id 5b1f17b1804b1-4587c530cc4mr82620185e9.13.1753780632006;
        Tue, 29 Jul 2025 02:17:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3ae8:20b:c783:9328? ([2a01:e0a:3d9:2080:3ae8:20b:c783:9328])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705376d2sm187799235e9.3.2025.07.29.02.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 02:17:11 -0700 (PDT)
Message-ID: <8cbbf5f8-84b4-43af-89b9-0ee4bc0a2591@linaro.org>
Date: Tue, 29 Jul 2025 11:17:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/3] drm/panel: novatek-nt35560: Fix invalid return
 value
To: Brigham Campbell <me@brighamcampbell.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250729054435.1209156-1-me@brighamcampbell.com>
 <20250729054435.1209156-2-me@brighamcampbell.com>
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
In-Reply-To: <20250729054435.1209156-2-me@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/07/2025 07:44, Brigham Campbell wrote:
> Fix bug in nt35560_set_brightness() which causes the function to
> erroneously report an error. mipi_dsi_dcs_write() returns either a
> negative value when an error occurred or a positive number of bytes
> written when no error occurred. The buggy code reports an error under
> either condition.
> 
> Fixes: 7835ed6a9e86 ("drm/panel-sony-acx424akp: Modernize backlight handling")
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt35560.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
> index 98f0782c8411..17898a29efe8 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
> @@ -161,7 +161,7 @@ static int nt35560_set_brightness(struct backlight_device *bl)
>   		par = 0x00;
>   		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
>   					 &par, 1);
> -		if (ret) {
> +		if (ret < 0) {
>   			dev_err(nt->dev, "failed to disable display backlight (%d)\n", ret);
>   			return ret;
>   		}

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
