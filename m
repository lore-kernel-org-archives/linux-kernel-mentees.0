Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664F03AC0E7
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  6 Aug 2026 01:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785980235; cv=none; b=OpWDajRdNEWeemueh4uqUBxNIeP0LxWZgBiNu6NlEGAzTkk2QJvpW6EGrgK4Q8rkURigTd9TcQswIMOmUqJnqZv1525qBaTKUt/UPW1vJInGHTIsPMZW6N/q5KTmGAZKkAK6OVeZsfLjgIMhE1uXqCHFPX8gvnX5MqgBsIta9q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785980235; c=relaxed/simple;
	bh=2bPmce2VvElbr9s+Y3BqN8NxKw7USlulDA+SOx5EnbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2Q5HVORFw22HgikwePLr3euYwaNOpWcyywgGVxqP5L5rn5rnQbcjwc8hHyYVtJMyWjfcIsp2GIelqXLEk6bKOpouSGRX73owk4BARyTJy9j0lZ8LPZV2CnhPX9TQKitv2iu4HfFmiCt5GivuiuiRtqnQfhAE1p3ss/XXzB3O5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwEVjQYd; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwEVjQYd"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-80814edb536so27001277b3.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 05 Aug 2026 18:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785980233; x=1786585033; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwMB0g/fJOrIyIUhv0tBgJ3DoHlp79+JSCvFcZYypKo=;
        b=FwEVjQYd7QuAyDVuf+u3NKk91epHCDOGCnoRZxJcj5vX1LgXhGCDdajRLfuesBPHao
         x4vntwPk/QfI7Ts7V0NZLA8S1DUh1RayiaLyK68NM/VEv44oqjXgo3SY3XOdGD75cYZP
         k4bOokH0nJn5FxAIkAW4Ry2Ke5mu5t5raWpMIHtubG1aGobQZEF4noeT4YSTSwvytMTg
         piIm0jMUrW36+88b0JbcIK4/DY2aGzlD0oZrd+E2dI91Q6wW7fyqG4/yhrUhW605geVt
         8k17AbIpotYMV/E1xAVK/ZKipuBHgHNT9Gn7InBJO3SeeFQvmz3IPVLIE6uJy8tA/Lgd
         jPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785980233; x=1786585033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YwMB0g/fJOrIyIUhv0tBgJ3DoHlp79+JSCvFcZYypKo=;
        b=OQd1O/kDvhUqV3dyXghJ67vdSr/eR3A2kpQqKqFcXGoyD+eJkhxG5gSOcKuMUobuGL
         w/xZkpQ2IjBXmhM5oFOfcfFIzpUTxziCitiEP7cZawBdd8pfECORm7AKSnarxyDgTyYf
         oPVHo9ssIFH/HKkVmgaGZRRYhFGMSGPEJRCUjHmuPHyPjcJaCCPcUtXg9T/SUJ5eTMf1
         MoSKPOViiMPWCHsfuWuPR9+7UHpPpsL8jCV1PiQTd2b26m713pL4u9USw0AaxfoBB+P8
         ipX634SHg2CfgbZZWtg49Sss4AhttvWExUcn4+8hhGpia3JBf+6iGMbaoxWy5mfmCqHT
         Ukug==
X-Forwarded-Encrypted: i=1; AHgh+RrRdByS+bzfzlFezQ4AbHz95AjejBn+GfVksSrSyeP726BdLciFjirX8rkvf7C8EZdbr0aywuxOwYFMHcPB/mK6HHarpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMgIiHNbnthd+Ux6881Jq+R0/lakC3wwHzb39KaqyN+FkKgJWj
	bun2uHqT+IpEup9APUKP2wZB4sy/TVC2tN9Xn0REb5ii8yHAb5iZ+F1k
X-Gm-Gg: AR+sD135csjiMcLP4oVW87uDMP5iSnNZ4OkrEXzXWbHsQRh9XXXNmIuY2YZQJm/4dOu
	ydzsi0vm9SO78H0fO5Pq9Wmjrqv0MVjNn/EB5BY4PNcFVs0CVOTTFUgLWyqO8Ep4pdGr2KDsLbd
	ujF6hYDdJajjbw6PgvqWQrWZWQb+FKjQtKY5svkpr2W63vRZWS1bAWv99CUpvrY9o4VAkf4ICLp
	0FHsLQ7ZqHW6zYloq2j43x2HI1xKETQDEL8DXyxrb37tDgTj6zQ09wU1LfXKfxXqg3VkfErXgD1
	+5on4WpubL9WCMAIzruioX1cH1GJfb9MjGGT2yIvipkpAyWCtfs7BzqxAps7QFjESv8ZUZtf+0H
	hYI4ED0e/GdZdr68NR3rDyFIfTNHMvqWZaFKW7hzQMHA0swFzcR7IqQ6mLi1SjtkXiSdwqGPRtD
	kYK/p2znY5VAJHzjUoQf9PfIQ4kNMVKHn1hdhTjXikhUaHEtOt/HOuLfqI1AHMNK8yRC66fLu1B
	5zV/jo=
X-Received: by 2002:a05:690c:6212:b0:81f:64cf:2c58 with SMTP id 00721157ae682-8201bccf8ddmr66971477b3.6.1785980233193;
        Wed, 05 Aug 2026 18:37:13 -0700 (PDT)
Received: from localhost ([2804:30c:166c:b00:15f4:95ba:67e9:7ce8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-82013261c83sm30848417b3.18.2026.08.05.18.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 18:37:11 -0700 (PDT)
Date: Wed, 5 Aug 2026 22:37:44 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: =?iso-8859-1?Q?Nicol=E1s?= Antinori <nico.antinori.7@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] iio: humidity: am2315: add am2320 to i2c_device_id table
Message-ID: <anPlaMvCo5aPmIut@debian-BULLSEYE-live-builder-AMD64>
References: <20260805183733.1000550-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805183733.1000550-1-nico.antinori.7@gmail.com>

Hello,

On 08/05, Nicolás Antinori wrote:
> The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
> communication protocol and measurement conversions.
> 
> Add the "am2320" entry to the i2c_device_id table.
> 
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---


> Tested with Raspberry Pi 3b+
> 
> Used as reference AM2315 Datasheet [1] and AM2320 datasheet [2]
> 
The two designs are pretty much the same. Skimmed through the data sheets and
spotted no relevant divergence among them. The sensor external casing/appearance
seems to be the main difference.

Few changes, new device supported. Nice patch.

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
