Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72267218591
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 12:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728649870; cv=none; b=ZJFeK2cQGPoJ26cOBtoo2VXV3KpWEFPYnh/Zsi1X0dpawfPZmSufhFuu/Qed15fhymKS8mlQBDXttun0On3V+tFysFIkixRWQzXIsU9kLbejDvz04HsAISgsq1zZ7GeaMEyf8tGE98eelGdCjUTxEKtcwf/7ZeGBLTtx0x7JX5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728649870; c=relaxed/simple;
	bh=mXF5tY1r8sZ+BePLSvut8fwsgeweL9N6J98VLTTvPLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXQkCPJ6X67zJYadHCDfTf9rlCpu4W6/XL1tVhHUl1bc1Je2OBIsM997WF2ixrMLYm3k1Yoc+2kCL4Q5JpXVhSKItrGp/cnfy5CoGJbC+kBi6nAjSKwUYyBSkCJapXnB6cJMimDEu9CM1z1nG/M1pacgRaZDAgaaQuBNyqEdFds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khCOrX8i; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khCOrX8i"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 215D46113F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 12:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6m7r6dKMZh7Y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Oct 2024 12:31:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B49C61177
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B49C61177
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=khCOrX8i
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4B49C61177
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 12:31:05 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c948c41edeso872697a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 05:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728649863; x=1729254663; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=63D6g6LIgJSLc7UFUFlkwljQcLXEYto6STChMviNESg=;
        b=khCOrX8iN7W3d+mfl9/+fSfMgaqmJnjNPczwpu0RG6O+3RwbCqRS6arE4TvTSjgIjm
         wuuj673yQiktEyfah01sOJhWWlOcWA6UTYgXFt2uShxXCkdZU2SE9C/gTNPRUN2D0lnG
         AQi+4gl+tDkAobzcn7bEADPToRrMjMibx34IQ1mpZi9Otg58lO2Npj/bW51ZzvIIoKgK
         ++N5Uiaia8eciqZlRrzIBtnlyXOi8kEIDaf32bwCgxYapN/+3Chk3vPgcHDKR5Hzp+uF
         v9IHGzYOT9gcXz8HosXCFeWQiBcRWYp4WoL5ySjH8gNkSnFfDCOg7542ZkaBafTbRSXV
         fc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728649863; x=1729254663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63D6g6LIgJSLc7UFUFlkwljQcLXEYto6STChMviNESg=;
        b=SBvGASSPuM4zD7SHFYzAjcyE0C6xBSGaIQ2vyWB7UTuY/97L1M2yX84wznzLTPVUJZ
         H5vxVxG/oeNPS+tk7djhC22qzxT2YOlJ5SNJACLQBz58NbTd1TrFYnI+fszgLdCjGhH8
         wqMapsf/HY1TN73FMVhjjtcW02rBJQp4bzzOc9PGKM/bHs/PMxrdq/hWJvLMAEJteujh
         /IMzmowD4GbvpLBAHhRLB7+I1JKP+iUXelM7roYmTdEk+i68aqMiO4pAuaAv4lEuwrGS
         OgaHkjgMzg8dFJtTgWTiHXTWe+wiZvEKUJ6NQeYDldsSTrDWYaS+gEZicen1nIMY0GuQ
         SzqA==
X-Gm-Message-State: AOJu0YyhMqjILWEAhdVmxpuRUIK9AIFAF0zt0n8GQFYeS1V4bdsSXAT/
	BhbWp6OQNPXU24SVXjPYWNTNhJBs5dwbNXbfStr1qVY4XEabhR8x
X-Google-Smtp-Source: AGHT+IHOI1+rAgiSZXEcbJ0u5CvDrlSaAtckGUxZS7Y/N9xHUmUDEO9strUSS97owHZQnmSzbyRzzw==
X-Received: by 2002:a17:907:e297:b0:a99:8893:84d with SMTP id a640c23a62f3a-a99b95a7842mr217739866b.28.1728649862407;
        Fri, 11 Oct 2024 05:31:02 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f2437csm207068766b.57.2024.10.11.05.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 05:31:01 -0700 (PDT)
Message-ID: <26f2e35e-0a07-4b24-91a2-a48d4bc5dadc@gmail.com>
Date: Fri, 11 Oct 2024 14:31:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: Fix uninitialized variable
To: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net,
 skhan@linuxfoundation.org, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Vasileios Amoiridis <vassilisamir@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Adam Rizkalla
 <ajarizzo@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20241011093752.30685-1-0xff07@gmail.com>
 <20241011115334.367736-1-0xff07@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241011115334.367736-1-0xff07@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2024 13:52, Yo-Jung (Leo) Lin wrote:
> clang found that the "offset" in bmp580_trigger_handler doesn't get
> initialized before access. Add proper initialization to this variable.
> 
> Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
> ---
> Change in v2:
> - Make value initialization immediate before its first use.
> - Link to v1: https://lore.kernel.org/all/20241011093752.30685-1-0xff07@gmail.com/
> 
> ---
>  drivers/iio/pressure/bmp280-core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
> index f4df222ed0c3..682329f81886 100644
> --- a/drivers/iio/pressure/bmp280-core.c
> +++ b/drivers/iio/pressure/bmp280-core.c
> @@ -2222,6 +2222,8 @@ static irqreturn_t bmp580_trigger_handler(int irq, void *p)
>  		goto out;
>  	}
>  
> +	offset = 0;
> +
>  	/* Pressure calculations */
>  	memcpy(&data->sensor_data[offset], &data->buf[3], 3);
>  

That was a quick reply. I would recommend you to wait a little bit while
the first version is under discussion.

I still see the offset thing a bit weird. data->sensor_data uses an
offset to avoid hard-coded numbers, but for data->buf we do exactly
that, in the very same lines.

Setting offset to 0 to access the first element i.e. no offset required,
and then adding the actual offset sizeof(s32), which could even be a
const if the first access was to sensor_data[0], looks to verbose.

These things are of course not critical, and the proposed fix is
definitely ok, but I am missing some consistency here.
