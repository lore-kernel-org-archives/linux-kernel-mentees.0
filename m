Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97BD2EFDB5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465819; cv=none; b=Jie7aE/6g7Vjdt1Q+p4yCtO+gFIlN9mrGbzD2k+nglhptPjtax3ctIr7EpeLMNLMsGRKfr29YBJihl6dbEFRtEGGDtKBz1OB1db9yzJ9lRo9AobWoH9HYGoAyVer4Nh4F81PDysWjgaKpddZle12LuQH8a/PBKTlEUcdOCq8I0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465819; c=relaxed/simple;
	bh=ivkSgMTtV81CdANQ5XafOK5UJU4ttt5I90ZuP9XelP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9FeNApyVyt3GqjS9nSF7bRqi6XbzRhEwEAFDBkjj1c4PYGwwykzSvQ4nAgHBeTXXh8sfHXhs3lJ2WPlVDr1oC7aespwSjzqhW0r6EDKDR1qeZixheq3H89S5ih4ECJGXgYgWLYWyO3LJDwzPwZO3dD+K+mPOEZuEN9CjNdZGAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bov42b9e; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bov42b9e"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 535FA406C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 14:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cm3ZrRTa7uLe for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jul 2025 14:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=dlechner@baylibre.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0EDC40682
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=baylibre.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0EDC40682
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bov42b9e
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B0EDC40682
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 14:16:56 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-2e999729ccbso2745952fac.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 02 Jul 2025 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751465815; x=1752070615; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCNt8orVvRnPdLUcXvMNqNxbNUJlKlGrsoDHbOPwgJM=;
        b=bov42b9eLEaZy5V1M6xPZhR9fevuHFm6d/JFzDRloPZHjzs7YEyxCkpz799g+RFx61
         HUJE4JmvS65GArHVu4+vZvEa0yE5vD7GSx7K7WB5zl1eS3tCOuAVbBCaA2Yug8sFLjxK
         ZQaiYuI4mnb2wyBjHcBSjrVmFVJyJtn/D351c2xs+GEht/+ZGIRaoN/NMkO12AsdbRSa
         n2tsayCWaAozT/pjBRE74w0xCKVoVj7xRYvC8hE6ZVjuL2LOJdlpBP+4kL0u9wcdIiMZ
         jEY/NaFXl0uUZPJC7DVJVkdGQb2B1qvoEc4Z9d1p4Op22LDZgYFjyoGUUWpZkucgZ+ib
         UYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751465815; x=1752070615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sCNt8orVvRnPdLUcXvMNqNxbNUJlKlGrsoDHbOPwgJM=;
        b=UzpbXXmRFw0iv8EJFKQHM0DA8b7RryEjL32KJXl/VlF8uXKuaAVhXSUlr7U7kCXwkF
         yOECf7aQQrWbKKM+jjG7cR235xfdgDCQmnw2geWvkWtTnKbvgM7hyzUoNRFonZPdTiDx
         6rn7oHRe3e64NrJ4J7zT10sAZEtUAWUxtxdu72oyoYvlxUimb248xTSoBWUqYLhsGwoW
         609/Kyzh1H1vPt/9qZ8mmh8cEhtd7w4w3JAxho2qXQXMENeH6AWD3SOIShBmCyHlrU8G
         RXC8MtBFeCvnCbcLajAtP7goqwfVCLGhzDn/1V+AIhqa9ZN682dy8UyTIhPUB3F/UxrF
         OQtg==
X-Gm-Message-State: AOJu0Yz8dcw7PVjiLcrwUXnMbir1TlLksANaMS2CcooLnfmHO/oUSPt8
	yEK7lew/6ODQA8xmGMN2PhnFsPZrdkrWZjfC+/IzBikGWjRnkmwOVO8tUE/Zpb39b8Q=
X-Gm-Gg: ASbGncuGTtx6tLjhR9IVecOUpIrxqYTw2yA9JGi3JluIYIL/3Ch5KNcoGWwiex2n5W3
	moUniVlSwfvARvtApTVJpnibE9B/AmO03fKe8mutSupZ0y21V0E+A0CUli7E2Kt15WdEDzhtMuA
	3eXl4ikVHmoaPDjdfhAEm7gr7FutjdaGmy4mlvfOeTiOTrMYx607fC/h0AaLX2POXf3+VCZPMw1
	VbYQ4KdyYgzrP+i1GyFv1hLzcu11GP/+4+359t4p32UTsE2iO36DvKToUy4pgFDi991uSuIrrKs
	3+VbPmNUZWA9+Tx+PtphdSp1KYIYYHIo9xD2ZOenJygkv3xtjfDuJftvEjugn8b4JZoCPQcExVf
	mb6j5/qj/ZXyoaztQJ+6UymMqq1L6G7GTsb4MAG8=
X-Google-Smtp-Source: AGHT+IE3wezFD6gq5YO9AtpQHZYWN89aAqaWHJI6eS+Rikhf0NRsNSoAVq5E1EldNNLhjkG+5ZMahA==
X-Received: by 2002:a05:6870:288:b0:296:b568:7901 with SMTP id 586e51a60fabf-2f5a8c19495mr1923947fac.16.1751465814997;
        Wed, 02 Jul 2025 07:16:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5? ([2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50f9748sm3929916fac.37.2025.07.02.07.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:16:53 -0700 (PDT)
Message-ID: <f96b68a5-d750-45f0-8cdd-9761b5daca1d@baylibre.com>
Date: Wed, 2 Jul 2025 09:16:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
To: Akshay Bansod <akbansd@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702135855.59955-1-akbansd@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250702135855.59955-1-akbansd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 8:58 AM, Akshay Bansod wrote:
> Update the sysfs interface for sampling frequency and scale attributes.
> Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
> and recommended for use in sysfs.
> 
> Signed-off-by: Akshay Bansod <akbansd@gmail.com>
> ---
> 
> Testing:
> - Built the driver (`st_lsm6dsx_i2c`) as a module.
> - Tested using `i2c-stub` to mock the device.
> - Verified that reading sysfs attributes like `sampling_frequency_available`
>   works correctly and shows no change in functionality.

Nice to see it was actually tested. :-)

> 
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> index c65ad4982..1cef10919 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> @@ -2035,7 +2035,7 @@ st_lsm6dsx_sysfs_sampling_frequency_avail(struct device *dev,
>  
>  	odr_table = &sensor->hw->settings->odr_table[sensor->id];
>  	for (i = 0; i < odr_table->odr_len; i++)
> -		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%03d ",
> +		len += sysfs_emit_at(buf, len, "%d.%03d ",
>  				 odr_table->odr_avl[i].milli_hz / 1000,
>  				 odr_table->odr_avl[i].milli_hz % 1000);

Let's keep checkpatch happy and change the indent of the wrapped lines to
line up with ( since the ( moved.

>  	buf[len - 1] = '\n';
> @@ -2054,7 +2054,7 @@ static ssize_t st_lsm6dsx_sysfs_scale_avail(struct device *dev,
>  
>  	fs_table = &hw->settings->fs_table[sensor->id];
>  	for (i = 0; i < fs_table->fs_len; i++)
> -		len += scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
> +		len += sysfs_emit_at(buf, len, "0.%09u ",
>  				 fs_table->fs_avl[i].gain);

ditto

>  	buf[len - 1] = '\n';
>  

