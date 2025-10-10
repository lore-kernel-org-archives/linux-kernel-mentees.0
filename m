Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B296320C004
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 10 Oct 2025 17:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760118576; cv=none; b=becTqrMb6VRrlPYfFmZIFtd+CkDbMfqKrREeIkUOsJWYVTlfU0BxTXmSpPHj6lxSllS3G8t8gzFEX9V9km1oiJ2MpABMbfP+wFD+lDatrxFX8kQ3lMqvv67PSsE4Am218T05fnRgKixbKPu57p7uZJMvUdzy1WaEvgPpbAnzfgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760118576; c=relaxed/simple;
	bh=SydbU5kjGr/3xovWC/nOqIpKErTuWjsdiYfkq7oCez4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKQWCJcNMnhsGdBDiVSfCT2TBu3ci8mr5FK9Zhr551nu2n5A2MICAQfUKblLIJplBpDyPl2UUvw723o/Z4IJ8Uadijw5jxTS3dBJmccB94S2gt9gHMn/B51/BR/HHlkfdd31xCSm9zoohiDBjIuYzZTNXDW41c6RXF2qZPhT+/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ObHAPfjo; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ObHAPfjo"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c0dd405c38so1514614a34.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 10 Oct 2025 10:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1760118573; x=1760723373; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YMaVmGxlRalQkaTOQI033Tgz8Btw2Xvfuv/0peF4wpw=;
        b=ObHAPfjozi73ch37d5GngBoXs5ovohC+TI4IveQAdvkSYUo3XR0/krMEGI1E3KX0tB
         lwxGo1Cu3ObnSYBvXKS7F3FsWuEjxbkeLQIGuosxZadnBRoXSe9pU6V8pqXECEamIoiE
         7WA9XwAaBhgXjf8YlA9/+no/bCRPFDQrQaFjCkdFuqXkCtr0tkiVzSjV1uHOISsDiAZK
         AQzn/bvlVe4M4jsz0ChLMboM7sl/nUOO0TGOZ0JO9gzwVQJRt9fJIKi0xGSzSbwC3xVX
         Kn4sthhDgGPlK0eYsayotF2bwFCvwjPF/0+sA7Aiqm/0pqEuVLBrO+6Q0wKzp7Cwy14d
         PzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760118573; x=1760723373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YMaVmGxlRalQkaTOQI033Tgz8Btw2Xvfuv/0peF4wpw=;
        b=BL4uIwE2RZt4OYTkO4divR50VDfx+95jVDciGuJHCeS1mrBREEivQJUoK3C/c2C5++
         u5CU6MHl7k0rrG7rTJKMpx+61e598TJtfw1v7lpvOYyl8oo4DFPMgQrjo8ypW9RopRlQ
         XVsoe2MLNfVXoXpMFRAGsC9XRTZ+U0HUV1W0O9ybkVfCD+5exE8ouc1NiJe7qUy0RvMN
         eE1ARE2CDylIWP+lRTlncHYi+xL3khz4XVMyBb8260XV5Ncfxe/cmixs+PlLLTv5lfnd
         BOcgTGiJA5NwhsULfdHGE9ijL81nHAGs5fvC21MxFWsKCdQIisGm/aV7OTzo/Wtfr/J2
         RrTA==
X-Forwarded-Encrypted: i=1; AJvYcCWvRI0F5D+DjL5++5xouWrdDKFsZGGldMYR7UqWtUH0hSE/SwG41iY69VxGZitXh1cb6/6PrAZAhzYiqXoeTuv9jHXLyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKNuJErM3ndGfevo0m1tj4bdjdNI1lgEV5vy+r0W5X0fW0SbFf
	ZAHDXfAx4EZPvK7rcI5RGgKa1Czjuiw33o8jO0wJw7jNpdEYq9xUw07r/Jy/bG7hM8U=
X-Gm-Gg: ASbGncvAjnVcnVbVFsJPpcUPtv+HLDDEsHbce3QahkRv0wxXur73Del5J/UsIeBP4nX
	cFpw5UfxjEOzFIsOx3bF5jWrz4Gys10v9Ha/OuDJeljzbH4RxAh66YGUrdSeiF0EX1e/rVobzOB
	QxqxkKX59ThJ3uhB9PZI0wXsR+8KWgKlzO+OwwmB9a/yMgaxM+3OLm/Mj9xqV9U2Z5tCm8arAp7
	ryh2KRMFNJkhGv0pSxKWQWX+dKgyaVgnFVvwQLWjxZl73pYL2TmLPIGIX0Mie9SA3qK/wFVcBRd
	R9hi0cWlurXRCikztbpB0OTqGwZX+e9wZZqjlEWdcTvHSRgoUPQ+Ejl+XIDdXwXElscWvK8h0+v
	dWNsyt64YB34IBwjmCoj1qiMwx/wemRnTUHOUHd9hGh0t+K2v6Uo9OGQThPwfnIeMV6cdrp0AKs
	/EgGcNkhwqZFRWrbc=
X-Google-Smtp-Source: AGHT+IGFvMx8K8r1w2LJGI0aj1BdaxgMV07DhEGKjg2wLJeOFKBXNf333S18rFWDt7E0konUyv4QMg==
X-Received: by 2002:a05:6830:620d:b0:79e:f086:3aca with SMTP id 46e09a7af769-7c0df62378fmr7546589a34.10.1760118572753;
        Fri, 10 Oct 2025 10:49:32 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6d3b:e3bd:4210:32e2? ([2600:8803:e7e4:500:6d3b:e3bd:4210:32e2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c0f9067887sm1027295a34.9.2025.10.10.10.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 10:49:32 -0700 (PDT)
Message-ID: <fce1c905-1c64-47b5-91b1-0017809ec12c@baylibre.com>
Date: Fri, 10 Oct 2025 12:49:31 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: max30100: Add pulse-width
 property
To: Shrikant Raskar <raskar.shree97@gmail.com>, jic23@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org, matt@ranostay.sg,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20251008031737.7321-1-raskar.shree97@gmail.com>
 <20251008031737.7321-2-raskar.shree97@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251008031737.7321-2-raskar.shree97@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/7/25 10:17 PM, Shrikant Raskar wrote:
> The appropriate LED pulse width for the MAX30100 depends on
> board-specific optical and mechanical design (lens, enclosure,
> LED-to-sensor distance) and the trade-off between measurement
> resolution and power consumption. Encoding it in Device Tree
> documents these platform choices and ensures consistent behavior.
> 
> Tested on: Raspberry Pi 3B + MAX30100 breakout board.
> 
> Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
> 
> Changes since v1:
> Add unit suffix.
> Drop redundant description.
> 
> Link to v1:
> https://lore.kernel.org/all/20251004015623.7019-2-raskar.shree97@gmail.com/
> ---
>  .../devicetree/bindings/iio/health/maxim,max30100.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml b/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
> index 967778fb0ce8..5c651a0151cc 100644
> --- a/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
> +++ b/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
> @@ -27,6 +27,11 @@ properties:
>        LED current whilst the engine is running. First indexed value is
>        the configuration for the RED LED, and second value is for the IR LED.
>  
> +  maxim,pulse-width-us:
> +    maxItems: 1
> +    description: Pulse width in microseconds

Would be nice to add to the description which pulse width this is referring to.

> +    enum: [200, 400, 800, 1600]

Properties with standard unit suffixes are u32 arrays, so I think this
would fix the error and also make maxItems not necessary.

       items:
         - enum: [200, 400, 800, 1600]

And we want to know what the default is if this property is omitted.

        default: 1600

> +
>  additionalProperties: false
>  
>  required:
> @@ -44,6 +49,7 @@ examples:
>              compatible = "maxim,max30100";
>              reg = <0x57>;
>              maxim,led-current-microamp = <24000 50000>;
> +            maxim,pulse-width-us = <1600>;
>              interrupt-parent = <&gpio1>;
>              interrupts = <16 2>;
>          };

