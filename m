Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42B218A6CF
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Aug 2026 01:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787015204; cv=none; b=gqpWa7u/uXsbhLb8IGLWm3dsi24WG+gNN8sSm5Q2GGSmJtjKH6YjWrD3txsZ88Y1b/YVR9JeDZOFLGYKLggy12hDIYAIHDhPr6jWyfidLRc7t5oIWzxoAIv+cScNWEMwCjBK+n6vk1+d4bvded99EJrDijS9hjKmG4max8jQqDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787015204; c=relaxed/simple;
	bh=eSPFm40DT82J9f9OZEaNKoqzMUgt02iaejJx5gfUYWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hceS5GN2uy3e1PGiOdTojP9RIAZU5lDn8JzRrdqznqcpHQoOIXQZKnKhZiEDSpWAxbT7gwwC1f131YDdjNBKweOfIql3d0E+TlLod4OTUz9OFiuvclkviBsr751NKfueeTGaRynNkutSd9EonviTs1+DrQoLnP0PT8gUD2yVNl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELcUa+gJ; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELcUa+gJ"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so1485717e0c.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Aug 2026 18:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787015202; x=1787620002; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S0NWw8TWJUBoUoRaTT3xU902CIURU9VCpckKgBzcPno=;
        b=ELcUa+gJiUId/ll/1Q8Gb0fIDM03HBGZPM+O3Jw/CIISWBMHU+SP91pdtK/jAN7o/7
         IsG/guxqh3c7PKT5l5tU2luA+F7z+Xu8uBQkNUtL8bLeJt7dHTGH1lCirBYcbjbFuGoF
         f4XFr7UD+/JGGTfwzmU9MPsXLMXSEjV9PA4L6ZOOBQE+ooDuIiuKcm5IaPEAWzaSUPZ9
         BTcklDDz31Dv78OzR8hswjUrJjOIblcm8OYw5KgrWaTQbby6RupkybWXn02Rw1hnfo84
         hynVFdYz3k3NlTm5DLKTHfCh6r6YAblED38y2AsrX1v4DDTpfYMxnxF/G9NShLoK2rPm
         1tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787015202; x=1787620002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S0NWw8TWJUBoUoRaTT3xU902CIURU9VCpckKgBzcPno=;
        b=Tc7mqjMMuPnsi6bQU6ja/0Ot639kH2fl2FCX32vGuQsq8UZbY+RmGwxdH81VWQ8Z4d
         DdtZK4MuA3CzkQxEHi16uaN9igOxpG27YdV0imcCAMevXmzd9vnQAHSLT4v3+tUKBC60
         ZYzfLR/rqsIlWbfO/icaHgi2U1/cTNhSv1zs4zCIVrcDsWWAjzvsAROW3LhiNNobSN8W
         6/UFMucuWPKJWq9h3sOLI+FHIiouhGcRYsUjWmjxnhck38u8Yw5RBezKGq1cpKtpgP4G
         HH8FjIsxfCZ+fKySmJPu8SmSUM3F/Zd7tTeCV5q8IvYERtBLYNCEdr18Qqvla7MtYDNi
         GJ8A==
X-Forwarded-Encrypted: i=1; AHgh+RqmD9lv677p7U9ISa54DmjCQTUu///qCgznXBoUg10KsTgbHE5ROyXteJ0fgsAUhnffyh787ropZWVfXOdyhgLqJiCNTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YytjxImx7WBLclMnMU7T5M4/rnJo9LTA8WUD9hKqnp2iwX3jc2A
	zIOCI32Gu+BJ9jx+xwO3gPStTn/hz+vhaLNmijC0bwADtdcChfezt4xB
X-Gm-Gg: AR+sD12MRup0ZywpoCKWuEySVqMVh1A/VnYvgeKjam4aedU+3yd5+7wr1Xb2qt+DmzO
	kzGPkRlcBs2LFx9IakuS7b2l/gOCuUK4186W95arD4thwi/XtSC+KPdC7LL7+wvHIwGUmUpjutR
	AYbaFqtbwp7WKke5YKpDmz0eX4Gv4OO+jUjVk0fs9/5knLtGwSiUiTZgVNjOz0P0W7FU+JosQuP
	09F4c7pZSe7nmAPCJh4cJfadcFNhis7o/z7hD7Pb5BOxJ1HvVnH2Ov5PIgjc4QPcsuw3WGR7svH
	dqouV6sFpVPaC6fgfv0XqzBPP3J6fCM+ghcnVWrziDdKYH8E5htNP8aKinBlzgLLuFEOdG4s7EP
	Ep7/NJb/ScT6o8iDHlkoQjVAoPq8t9aL0TdALfHbmNs6+/pj3HMWslnXWu0jt2gi/kkJHuTrrC9
	ppTAJdeSHRDjQ7OM6dfj0wQWQTaF+uSllIS3eEMOyk6p2RpJcj/zzqo2PScbT/Y+vqortd
X-Received: by 2002:a05:6122:50d:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5c5ce7ed595mr1017290e0c.7.1787015201662;
        Mon, 17 Aug 2026 18:06:41 -0700 (PDT)
Received: from localhost ([2804:30c:97d:e800:9454:1179:18df:ab33])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5c7684cb7sm2331580e0c.8.2026.08.17.18.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:06:40 -0700 (PDT)
Date: Mon, 17 Aug 2026 22:07:19 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: =?iso-8859-1?Q?Nicol=E1s?= Antinori <nico.antinori.7@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3 2/2] iio: humidity: am2315: add support for am2320
Message-ID: <aoOwR6JMOYPCn4PW@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1786725567.git.nico.antinori.7@gmail.com>
 <83c8a41607ed07285a84dba8ed10a954226076b4.1786725567.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83c8a41607ed07285a84dba8ed10a954226076b4.1786725567.git.nico.antinori.7@gmail.com>

On 08/14, Nicolás Antinori wrote:
> The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
> communication protocol and measurement conversions.
> 
> Add the "am2320" entry to the i2c_device_id table and create
> of_device_id table.
> 
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---
Some optional suggestions for the commit message:

The AM2320 design is fully compatible with AM2315 in terms of I2C
communication protocol and measurement conversions.

Add the "am2320" entry to the i2c_device_id table and register a
of_device_id table to match against devices declared in device tree.


I see nothing else to improve besides what Andy already mentioned.
With those sorted out,
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
