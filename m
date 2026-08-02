Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2563B1C861D
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785684108; cv=none; b=H+jouJE71sOTBdsTZ4e/bt2TKVJwnV6uEJvgezZ0u143ofCldfA3zdbD4oSaPRlrnXV/wHqBw4diNOL+DxBD387VFR/8dZ+f7ePLxr5r4iCzlgHCx7/k7H9K3mhQyQsEn2wQVGo2vmDWf0RDKJW66vU5Gr8AobAiqkVKq62UrUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785684108; c=relaxed/simple;
	bh=oPIPJIbT996fDCjpLjlK/ZsY97vJTBErQkLcDSYPjus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EyJb69/XXRJYjhzyMpyqHdqc37jWfp4n4sPeFZ2d529/l8B2JdAwW6o08IUZxwpQPfXsvpllGeHXnGTiFkTnDiYY4TG6YzBvsK8TQnJ7DkmA5HZsMEdBS9ms0O6JIlJlYpjJVwJEsUHR2REJpRbUuYdHhxaBGmPMaKqLwBhE0Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VfaHp8Iy; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VfaHp8Iy"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6acc2a10023so744000eaf.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 02 Aug 2026 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785684105; x=1786288905; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPqOl4wp7KWWvdGsj9eCGVRa0PYoR/ErdETgCVgpTQk=;
        b=VfaHp8IywmpgQuyCAUsYDcgwZHqrS/ihp3Pt7ZwakRB5Xb1VEk9xQXq/Y1Un46fd5w
         YkTD6HkLB3HXST4pGoVDbqrE5iFtCzY54fHW7UHfSteAq/my2i2mxnCgtbUzfYLap0Js
         OXOTJTmY4sH4YthFSfVJjgofpXfD4SW/kOpP7SKVeL0xMcUQR5YH8/2WhrBLzRzJxl30
         AGxnp0R+oExysigKVAdB9gTO33Z5ibE9qrgP8xzI7kb1ts6Abkruv+aUgDCZEs21HG7c
         gNBeFfQM0htTNJC7TPQ24Aw1meoPi2NucMmGDW9W3f6PGEcFWByDoi5LMxFRgCw+WJW6
         D9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785684105; x=1786288905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPqOl4wp7KWWvdGsj9eCGVRa0PYoR/ErdETgCVgpTQk=;
        b=r3ebqYvm3fwqR+1cIyJZgMxw0dbqHuXU7XYjo0AeMFXmgpEjHByG7zL1XVX2Pt+9+F
         F9yrQ2KgoiLj64DHT3oFBsHR18gy7k5g9A8EW4V88LQvpeROZwbV0TTfCijsWMHehqJB
         fSxWc9sJs1+Rq/EqI6jH2HxwfHoliCSGNp+CuLmQjZKHIljBdxEvu2gncirxnXPVoY/i
         ThRcEl8gEepEvuWNl/ZByQzOw6idIy7JHb0LhRfPu9SZpDoxZ+YeEN/iMsuxbSSUWL4/
         c0pkKLuCn9YO0uY/qhBnOeuoW5a5nAmQ/NBlw6iWuo+/7rqudwbta8Ysvr4jV4QVKxth
         czyg==
X-Forwarded-Encrypted: i=1; AHgh+RpBhGqHeZCUQaWmSeCuNVqVt4Zfm3zGk0OFAaPpFKxFFjPCTbALpWhhiAFL2WCINFF1ZTCZGn2uI3M761QJqAD+MrXDJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YydugH3QTar6YL/lHnRaVtHYPdAnHWONwjak19hv92aQczD7Dms
	sQiiZ8zPta7PDyOR8+dDi3Wjxn3SBfDw04PoUeLq33LbBF0G+GOpSzMe11zsO8/aBr0=
X-Gm-Gg: AR+sD13jtyDxdwxHTsym120fuG+q9dFJ65vmBtYPyZ1RpATuXjDsIao/CVCzwLYqURV
	lkxZol9qfIy6KSrS5GyAlGEsPgNQ5OdygDd1Mkkgis2fds6teYVxWQLQDDkknFgolf2ivK1yJRf
	xJ6/NPtiSbmjPvtFvDzAU70aSHAkz+62kLrCy2HyWuTxlqungaaC4aklV9nhYj20lGn+OSPQT75
	dMf+86eGwpeIOL61m+Iw5WmfukFzS6WwTn9yT7jdQRWNMXPOeGmM3yZQXi54Ue0l39S/9Ojo3Ip
	ww5wvq4h3DbOiNq3Y5wqYR1cqHZQxg8gk/Mxtb/84sopdSQkYwe9PyqaTX6VwUK7IDT+QqDdq94
	NzaoPSaOlLFABgd4IHMf7Q4rQp22Ai9cD3OFFt9MfJDLCNlbrn9Nt6xOPsWNnOfJQxUHMnY5O6s
	LB4OdjDT/7PF+bXPBussp+4/xkdylEshosePpb/kOBDBzotAawXKcVnrs11amoFbpgyYniUMlnE
	FTsLqyQ8BR4dZw6xXPvZaadcU4llZt+K1UPmig=
X-Received: by 2002:a05:6820:991:b0:6ae:46cd:e8fd with SMTP id 006d021491bc7-6ae46cdea66mr8564071eaf.21.1785684104915;
        Sun, 02 Aug 2026 08:21:44 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:5487:2b6e:1057:d3d3? ([2600:8803:e7e4:500:5487:2b6e:1057:d3d3])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f60650c2sm6608256fac.2.2026.08.02.08.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 08:21:43 -0700 (PDT)
Message-ID: <89176b25-bcf6-4d44-94b3-7a29abec7b10@baylibre.com>
Date: Sun, 2 Aug 2026 10:21:41 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] iio: health: max30102: fix NULL dereference in
 interrupt handler
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marco Chen <marcochen.dev@gmail.com>, nuno.sa@analog.com,
 andy@kernel.org, pmeerw@pmeerw.net, matt@ranostay.sg,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
References: <20260731184124.112124-1-marcochen.dev@gmail.com>
 <aca9bdb5-f068-491f-a651-d24a80a2786e@baylibre.com>
 <20260802031035.6eb2be14@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260802031035.6eb2be14@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/1/26 9:10 PM, Jonathan Cameron wrote:
> On Sat, 1 Aug 2026 10:18:42 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 7/31/26 1:41 PM, Marco Chen wrote:
>>> The interrupt is requested in max30102_probe() and stays enabled  
>>
>> I've always wondered why most IIO drivers seem to do this. It seems to
>> me that requesting the irq with IRQF_NO_AUTOEN and only enabling it
>> when everything is set up for reading data would avoid spurious interrupts
>> like this.
> 
> It teaches discipline.  More serious from what I recall the no autoen thing
> used to be done via a racey bit of trying to turn it off as fast as you can.
> 
> Most of the time we should be able to write drivers that don't need to
> use that flag and don't touch enable_irq() at all.
> 
> Obviously that's not always true.
> 

Hmm... so I should go back and change [1] since it isn't strictly
required there?

[1]: https://lore.kernel.org/linux-iio/20260731-iio-adc-ti-ads112c14-continuous-mode-v2-1-eb13da38e8fc@baylibre.com/


