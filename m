Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780B622371B
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Apr 2025 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906663; cv=none; b=TTdLq566hJX5qvSb2th5wvJyu34lOGfmnKPD7txsqmquYeUxpeBZbAg/avxaIHyhEmp5IByb2VzwiyGqKX7xLX4F879G0bakRGBs2oG5NHSZVQANoJR2ggW2AF32GFtF6EAqzl9Uqj201UInaxh+E3bvjghsPqwcqir2/2mVgHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906663; c=relaxed/simple;
	bh=YdyGYQvJPxptB7Ud1K9823h/vEclrujKLrEKCBQa44w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHX9i6kUrK+zdMwAQAYoIZy85gO6K08NrM4BHMGuCPIcFkKjfzBFJ7HW82uahHqWkD4tSIVua4IJN63tAdk52dDT+FWy8sNPdZdhNiM6hT06/boflkio42dhiDa7tyouD1ol5L55+t2MY2iirS6bzJb3rf5UbikiNpxcGUAcb3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Gq89bzuS; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Gq89bzuS"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-603f54a6cb5so472079eaf.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Apr 2025 09:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744906659; x=1745511459; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJ86ga6RjrBQ4jtVg7iGsvEs2Pk/5xuTneiTlVnUO0k=;
        b=Gq89bzuSUdDW3k/DfAxpFiGuGN+EzjFWl8LsNxVOOW8Lp/e+s+e8rEJmQBKZOfkB0G
         w5XosN2JPNdVTbuOfb/E3CeMjUW/JpSEiaUR1hpixg8phsQgqCpgczjaT9wJ79E5Z4LX
         9drp0Rtm3lQYrLdNLDaowh47dj382f75jYtEgyrvlC5ZfmGKuVHMirpBLC6Kf7TWyNGz
         R2kc8EfQEdb1dRAbgKsQWtvRml5rM12OgImbyA0Tkq2wER5rw7IdauaPxGAkLGz6iZJq
         ECbiNCTaTgNphmo9KEPQNeGmBRFEr/E2zSjJGJwGb6CPFeab4QRpoisFd03GS5FCveYu
         8bIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906659; x=1745511459;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJ86ga6RjrBQ4jtVg7iGsvEs2Pk/5xuTneiTlVnUO0k=;
        b=p1Uxt5AVGtPL5xDNelVda4dVu/VDf11HbayVdgjX4Ox8MwHxUdMMdNsR1wJBwwEk7N
         unm/Kv8KB7CFt53GB8cNCEIBZA4A47OQllAnwltTZPAqkawyT1YHj4+DkeD+Ufu32xg2
         P97q2ItmnUxD1+X2V9jLIPDwxqMuSq8tueBb9CcSn6ki3u6q24bRwB8s9onA1LqGRtyI
         9ph97OO3BT0EYRiyNwYGYXetai9EScuHRjgJdFl1qlu8V7xL1W6QCD+CDiGDspMolbqP
         N5LdZePWPlZVtGoOcYkGRAxeGPLKHrV5wXUH7XtSYdl3J5uZ+z+6bLSQFA9foOstp+sU
         hI7g==
X-Forwarded-Encrypted: i=1; AJvYcCUZSWMQQUMq/5ZzeXs9ueWukFaMNuP0O44R9jEHTBYtMGkiqaM/KL1lQjkO128/Mx3DQ5kfoQzqGN4W4+SOVInmUU6wmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuZIyqfwQyE5Po/+3rF/4nhMm+7Ia4NzVB1UXLuQd1fFrXSWfu
	KessXhVIvofJOnaVo4B87Cb5deTntDd3gdmv83czzXashXljBBc9bUCNmz3NtnY=
X-Gm-Gg: ASbGnctHebkPmVwUCV4Jiz8USuW+Nx5Sx5sP68S9r+fNqPKy/nhhyJ7BqkVAFPP3xAX
	rMLjlw+LxlDa0gMCeGs2XFPus9TMHAw04y16rEk7zsKNiiV34AzLoYwAmIS7GNbFSFj8k8DJW8c
	sm0pL7te5ozxqEBER5yw0Q3Dj6/J5W7sF57hD1wFhgDRh4kEuLaevvvqbEPP3awS3Ra4lp1FGWm
	wZVU/3s0pk9tG4C2Z81Z4mXqxp1r5/rxJbL8S2o5dOYBkk/2C0dllgaDL/lVAtwUAxKziR9EE+z
	dqd6DVyxeqbFoOr/33cBkUlz/SIJ59g+n8KTyjHguAmUzwIAbx2KUA6SLVwDHN985BTV3y6XTo0
	lTeLn0rp8+Rpi4vf0AA==
X-Google-Smtp-Source: AGHT+IGBBgE75fsVkLXxYoZqV19j+mS6o4e4vTLZSbr9DKTQoVtLZ0+RYC5g8QIKrdP0fbpy7FLYJQ==
X-Received: by 2002:a05:6820:1e13:b0:604:6b0:c259 with SMTP id 006d021491bc7-604a931e696mr3952610eaf.4.1744906659563;
        Thu, 17 Apr 2025 09:17:39 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-605ff6aacf5sm12896eaf.39.2025.04.17.09.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 09:17:39 -0700 (PDT)
Message-ID: <cd50b4eb-ef6c-4842-88cd-932042ca2629@baylibre.com>
Date: Thu, 17 Apr 2025 11:17:37 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: frequency:: Remove unused parameter from data
 documentation
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>, gregkh@linuxfoundation.org,
 jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Michael.Hennerich@analog.com
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
References: <20250417143220.572261-1-gshahrouzi@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250417143220.572261-1-gshahrouzi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/25 9:32 AM, Gabriel Shahrouzi wrote:
> The AD9832 driver uses the Common Clock Framework (CCF) to obtain the
> master clock (MCLK) frequency rather than relying on a frequency value
> passed from platform data.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.h | 1 -
>  1 file changed, 1 deletion(-)
> 
Please include the driver name in your patch subjects. Otherwise readers will
assume that this is something that affects all IIO frequency drivers. I noticed
you are doing this on all of the patches you are sending, not just this one.


[PATCH] iio: frequency: ad9832: Remove unused parameter from data documentation
