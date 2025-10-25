Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C446221282
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 25 Oct 2025 08:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761380399; cv=none; b=m/ND1vs+DmVqVJGg39ICK3v4NIpLZN+mRh8sqIk0vrpCTEz5Prtesx6lrO+nOnpd8CXU+oTohXqjskK7VuXY/dHY1MwCUGYENwJmXtcXKJXpoJyerkNeJ7Njf1gZbTPegp+s0hn9ubTp78SJZz01NfLlWSM7152YWvPeKEyBFuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761380399; c=relaxed/simple;
	bh=AzfeVbbRV3eREjYjS3QXyjhA7RuXufKczC6qDZJG4R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3JbianevAQFKbrv6mlw3A688H0kbWGrrGOuTwrWryZU0kCab7DyQAt2WvmxZffibQ6Ci0+G0ejEVN8681mM5EIe/o1WMUdMk2pMKKr3DgPLMiozz8bi4wNcrVcpsOjXvJuNiwh3aHvfgVkcX6Wp5Np03bOxzQeS9kHxJjGm1QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuhNXiG9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuhNXiG9"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-33badfbbc48so3757639a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 25 Oct 2025 01:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761380397; x=1761985197; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W0P1qCP4uZ3AAQgH9R2rp1FNOw4ZXslRjRKDSpwrrHA=;
        b=HuhNXiG9Y/aoenhyFlwJRoVGb3+pc3geVy7+09vok+W/fbe9ceZNB5ggaoyaSd0KF5
         86pXF/Qgz1ROXpdV1wUHzw8Whdag5NtkFFOcSol3d9m9zcLFiFnsCZIrYMKHzTsJXG+5
         8Rw95fPN7jVmfNLKa33N/NXGigvlAsVQ7E1zIbpfOXCi9r6wWjyQ1BFBKrMi5RtXT7pp
         zVTDYA/VixnrJpueuQBMcjqyMK1sw0jejV10WN1rjtrd2K2ltyWjxjcfcrdqHSonlSeF
         HKB8d+m4VxboUOlMsDN9be4zE19PnJug7Mu6GK+cQnDI0i6lNtrfw6zvNBnWPD3jzQWp
         9BDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761380397; x=1761985197;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W0P1qCP4uZ3AAQgH9R2rp1FNOw4ZXslRjRKDSpwrrHA=;
        b=K4L+7PG3vBcOJ0CgnFU6wlPPbg7rF7ap7gNcCiJT8WhD17opW7wEbXpOhf2gmz0mSm
         M3U30hizVQxLoS2ZaTSknntQQq8Gb00t+/nVRvmzoVYlpwNaCr2EfNVDqC03EdMeq8/g
         M0e/91S7s1am6GkFPP0mI0rtZO0SNEugi4Y6XjSbFx1iVANfCy7Pv/+pDszW6CpeTKXZ
         zbbdJqenv39vOQVjZsSp7rnxKNx9grtuD5B4iO5CHi6HPD4P2zTqGeEjmHVfVxIUV+k6
         0SK5VK3ESAEw4RntqqYjS87aPRujvZ0/++dqDHI3oexb5Zj56s3Et10407nP/mhONrno
         lu0g==
X-Forwarded-Encrypted: i=1; AJvYcCXniM2ggyfQRo6paakgKQskRm4+REs5BUH/r/h5QrpmmB6QjqHghGqcLWD6jstQbJEdNrGkk5yej4B7XXKDC52605Koew==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAKpre1INnr/1o52HGmcT63WGCuKZjRYbmkWB9LNrGXvqbsZ1v
	G5+ilXrEsAWG6aG3NdYcf/REgZsyqr6KQeiPvZguxg0GbLLX1Vr4r2BV
X-Gm-Gg: ASbGncsUJgV1zftrQQIezJLqIYPaEj5WBgN5SOO5+ewT+eVvqkmG96OXRJW6uHdg+4e
	+RINiOjlZabdTNWwU8ll573PYVroYU/YCTa8MSU+VTvm2fp99ady7QSd7GfOQSNwOgtCHBs6PP5
	BTBwjAJBq2xmy3SAg4LDN5EUXkAWrTImVj3alx0EoUnonESETK7a9t47mBo7GFn7xSiBiCS+zkg
	HMDuh9tzN8QRr/sMODeV4hlZO4+9qbydul1cSEvMHpsCFn7qZF8tV6aF+WRo6PkLMbjPmni8KrI
	qw3v7GA+U8C40EtYkkpNMDJI9yQiWNO3ViPBDepy+8fxDWZQz8FFvJ7cVAuhjmqMI4t4vq69FJs
	5/3saMVM0gfMTDzIla/9fW5drWoNtySq06lFaYcqtB/oKtx7BQ3oe6UufPLREetAKE+M3CbsPE8
	M/p2Xy7pMKcJpWUkq51eVa0Ow=
X-Google-Smtp-Source: AGHT+IHGTk9mHrG98F2le4aB1w/t0kcsoJBN6xOXR8de0Ny/hqGEZAIH8AH8oW3GDzOVT5iOt4o7jg==
X-Received: by 2002:a17:90b:530f:b0:330:6c5a:4af4 with SMTP id 98e67ed59e1d1-33fd662e554mr6574117a91.35.1761380396715;
        Sat, 25 Oct 2025 01:19:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81aa87sm1511375a91.20.2025.10.25.01.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 01:19:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 25 Oct 2025 01:19:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: cryolitia@uniontech.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] hwmon: (gpd-fan) Fix compilation error in non-ACPI builds
Message-ID: <6a1e1503-0529-41f6-806d-0ecf0f8e77fe@roeck-us.net>
References: <20251024202042.752160-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024202042.752160-1-krishnagopi487@gmail.com>

On Sat, Oct 25, 2025 at 01:50:40AM +0530, Gopi Krishna Menon wrote:
> Building gpd-fan driver without CONFIG_ACPI results in the following
> build errors:
> 
> drivers/hwmon/gpd-fan.c: In function ‘gpd_ecram_read’:
> drivers/hwmon/gpd-fan.c:228:9: error: implicit declaration of function ‘outb’ [-Werror=implicit-function-declaration]
>   228 |         outb(0x2E, addr_port);
>       |         ^~~~
> drivers/hwmon/gpd-fan.c:241:16: error: implicit declaration of function ‘inb’ [-Werror=implicit-function-declaration]
>   241 |         *val = inb(data_port);
> 
> The definitions for inb() and outb() come from <linux/io.h>
> (specifically through <asm/io.h>), which is implicitly included via
> <acpi_io.h>. When CONFIG_ACPI is not set, <acpi_io.h> is not included
> resulting in <linux/io.h> to be omitted as well.
> 
> Since the driver does not depend on ACPI, remove <linux/acpi.h> and add
> <linux/io.h> directly to fix the compilation errors.
> 
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>

Applied.

Thanks,
Guenter
