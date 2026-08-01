Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D540618859B
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  1 Aug 2026 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785597530; cv=none; b=nIa/i2FdbyoBS1s3gF9PeS+kFJwAeIFPwahYK86D2eRlz3U1zVaJ4r32JjFnU9rSwttNCGwTOtFwJqDxBgkWx33C2M1TVwes7WPpAdevRz4ItiUGxXf7kXnllCeznw4dGAEB4tuO4saDURzjtA0zNo2GBWVTN9ueB7O9hkSOkTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785597530; c=relaxed/simple;
	bh=ZD6WFg3E7WMeQJ/6siAitoDwF8pIbMsF6e9YFtv4qQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8TZziBKTSGBnwBvIFTjKSi7n99+QpSLpVjyYy70EIN1s5uHrd3TIG/H6q7nnq/pbQx+kUHe4bLeflVqgi/LcoAugOIMuX8zg6A2P7DPTmn9DEHOQee9LyOJNPFy9lDYP1o+wrHXTf8sdmqTzf03jNMIS0WH0cZoKwJTUtesOLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TjzHHH4f; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TjzHHH4f"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4a483a552efso748935b6e.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 01 Aug 2026 08:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785597527; x=1786202327; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkrJvX7ruNCnFu6Nri8nnZ3AJjvtpseq0lUs6PITb4A=;
        b=TjzHHH4fQ1LzEbbRjtLSLyprQ653CxqS2vLBjV48yJp/2NMA0y6EkTv/eOTop/xclT
         aJktFMRnAOd81rAtsS/JNcsc739vw8TXpgri65sNLz+boXjKszeiwFD7NdV1E4ty/QQL
         92FBsjZNwpoZhe9EqUBNdCBWNWXWO5tAgB/8JIYgIBZ98ufE2R0e0vR8iL2cnoOfHPqq
         OH/ObAurOSoLgyda3O7WfRN4fSYEZKvDkKD7KMAi4r5TR8QKTtbj1pcTvbeXkCceUl3w
         OfZyFoRA9ESwdR34m+uDF0dFQGmkM/EU6NYOJ1ARZB974jkGoN8Pk5B/dKhGn1d3LYW5
         xMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785597527; x=1786202327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkrJvX7ruNCnFu6Nri8nnZ3AJjvtpseq0lUs6PITb4A=;
        b=qzt1ufzDIUfF4p9G8Z1k6oStNSN8hg/X1MwuCxGy5f7utASeBfiqA9ieLRQqwDQWk1
         0+RiT2DTGIWciKyntpQBo902C8lgf8uWL4UOXGi6gAmV7UFjzBQlcdY3rUPX3ScZEzhR
         xtdUzT0AG3E3wha15X9vSZGNJKj8bXNx7/yn94cX79GxdEHRGoyiXJHhOCbmTjTlzxtB
         BYlpjy+fkg6R+iAekF/+VisrqfVKztDkFsaqNop1+vVxsQ8prGxOSHCaN4XuqLLbcsTy
         yXFlaxtpfhLLCphm9dp3u5oZnqCZQqfKqIVQGvuzhKv+xuF2Ttd8UXm9e/TtZ6rFKSjl
         WN4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqlIkoIYKDZq/cJ4x3IZ5+P3EuwHpFK5wi3E38ZsxtiSORKFzpb1dR2sI1aSP8gaKLYUz8fgg0eg0zCzVDYNO1ZGSQi6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZA4pJzbBSXiomvqHojEjaW7Pnqw3N5poSt96IiIZsGCm5yx0a
	KYpBBQuQ1Z3NwnXSRMB3L1mbaGL27mmsaFuYWPTtwV60YN/uowNYhy3q99cbbfIEusI=
X-Gm-Gg: AR+sD11NQOAd9U5ITyVVEmxZrVoqanoQGiqtIP5iAa21hcnm08PYPJWU+TsSxOXlBgS
	QZt17NNOnGfIZ/5fco+zg7fv9YU4u+lebbiJEzvU3UfO8JeHdi07hJIZuntiKDUHnUmdYojI1Ip
	4jHn7LYjukyTWSVNrUs7M8yFtVzYfnN2rLXVLcEpV12gDHESk83Gx0+JtKxwPDeZrATEVnj9eft
	x5viRNIUvFPIzGloWDK2UoAq2SQNqaOjqmvq7o76Jlzt8PD5et+cnD8uUnvAwtciZyQEEHto9MI
	+U8vg20KQsqALQVbJ1NkSv0r1WfNwdaavP/jfloUX2DTifMJxFGGS8WbN4+hPGkJ8iaaIPVEMCE
	vuH/N/KU9X9wDn7TlNcmMJhzYF4QcBgtObpTlRg1o5Sj+o8jHwGVzfUoodM+cxNV5fE0XSXWk1m
	vuY0mQ8Gp4c9t7xyGDMWNlFdzGFk6lfGKWSADhzscl05vElx0LgDNFT3upsTHbAxU178C2jCPNY
	R2pP5h+H0TvO7X0n1aqYfnkWkoK/nkbDsEIAy8=
X-Received: by 2002:a05:6808:1b98:b0:492:973e:1c23 with SMTP id 5614622812f47-4af5e30f381mr7473132b6e.15.1785597526617;
        Sat, 01 Aug 2026 08:18:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:359b:17f1:d4f9:4949? ([2600:8803:e7e4:500:359b:17f1:d4f9:4949])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58933884sm3013821b6e.0.2026.08.01.08.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 08:18:44 -0700 (PDT)
Message-ID: <aca9bdb5-f068-491f-a651-d24a80a2786e@baylibre.com>
Date: Sat, 1 Aug 2026 10:18:42 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] iio: health: max30102: fix NULL dereference in
 interrupt handler
To: Marco Chen <marcochen.dev@gmail.com>, jic23@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org, pmeerw@pmeerw.net, matt@ranostay.sg,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
References: <20260731184124.112124-1-marcochen.dev@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260731184124.112124-1-marcochen.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/26 1:41 PM, Marco Chen wrote:
> The interrupt is requested in max30102_probe() and stays enabled

I've always wondered why most IIO drivers seem to do this. It seems to
me that requesting the irq with IRQF_NO_AUTOEN and only enabling it
when everything is set up for reading data would avoid spurious interrupts
like this.

> for the lifetime of the device, but indio_dev->active_scan_mask is only
> valid while a buffer is enabled. When an interrupt arrives while no
> buffer is enabled, the handler dereferences the NULL active_scan_mask:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 
> 0000000000000000
>   pc : __bitmap_weight+0x64/0x98
>   lr : max30102_interrupt_handler+0x48/0x160 [max30102]
>   Call trace:
>    __bitmap_weight+0x64/0x98 (P)
>    max30102_interrupt_handler+0x48/0x160 [max30102]
>    irq_thread_fn+0x28/0xa8
>    irq_thread+0x184/0x30c
>    kthread+0x118/0x124
>    ret_from_fork+0x10/0x20
> 
> Return early when no buffer is enabled. The interrupt status register is
> read before returning, since reading it deasserts the chip's active-low
> interrupt pin. Otherwise the pin would stay asserted and no further
> edges would be delivered.
> 
> Fixes: 90579b69e94b ("iio: health: max30102: Add MAX30105 support")
> Signed-off-by: Marco Chen <marcochen.dev@gmail.com>
> ---
> I ran into this while interfacing with the MAX30102 over I2C on a
> Raspberry Pi 4 running the IIO subsystem tree testing branch and
> learning the IIO sysfs interface for the first time. When physically
> rearranging INT pin wiring with no buffer enabled, the kernel oopsed.

This is one of the reasons why you are supposed to turn off power before
moving wires. ;-)

> This happened because max30102_interrupt_handler() attempted to
> dereference active_scan_mask, which is NULL because no buffer is
> enabled. With this patch, the same situation no longer oopses
> and the buffered capture was tested to work normally afterward.
> 
> Some things I am unsure about though:
> - Is IRQ_HANDLED or IRQ_NONE preferred here? I chose IRQ_HANDLED 
>   because of the status register read to deassert the INT pin, but 
>   I am not 100% confident on this choice.

IRQ_NONE would cause the handler to just run again as soon as it
exits, so it is almost never the right value to return. IRQ_HANDLED
is correct.

> - Should the regmap_read() return value be checked? I did not add a 
>   check because I do not see a useful recovery path from this I2C failure, 
>   but I can add a check in a v2 if it is better.

There isn't anything we could do other than log the error.


> Thank you.
> 
> drivers/iio/health/max30102.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
> index c37316c86f14..c30b029ba8aa 100644
> --- a/drivers/iio/health/max30102.c
> +++ b/drivers/iio/health/max30102.c
> @@ -290,10 +290,23 @@ static irqreturn_t max30102_interrupt_handler(int irq, void *private)
>  {
>  	struct iio_dev *indio_dev = private;
>  	struct max30102_data *data = iio_priv(indio_dev);
> -	unsigned int measurements = bitmap_weight(indio_dev->active_scan_mask,
> -						  iio_get_masklength(indio_dev));
> +	unsigned int measurements, val;
>  	int ret, cnt = 0;
>  
> +	if (!indio_dev->active_scan_mask) {
> +		/*
> +		 * No buffer is enabled so there is nothing to read. Read the
> +		 * status register anyway to deassert the max30102's interrupt
> +		 * pin; otherwise it would stay asserted and further edges
> +		 * would not be delivered.
> +		 */
> +		regmap_read(data->regmap, MAX30102_REG_INT_STATUS, &val);
> +		return IRQ_HANDLED;
> +	}
> +
> +	measurements = bitmap_weight(indio_dev->active_scan_mask,
> +				     iio_get_masklength(indio_dev));
> +
>  	mutex_lock(&data->lock);
>  
>  	while (cnt || (cnt = max30102_fifo_count(data)) > 0) {

