Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6333031B
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760705588; cv=none; b=puQx2RAUn90vWOGpw/3DACt1aPn8KQ8jKZ3BvmDevNQsU3FNHEts+aHMBPXqTmwAcDyNmtkqe1MlbD096k7NxJ0rx7Jix8/BzymsbpA1J4+LK3O1cYKoqJMQ0dEQFLwkTvRtHupcPiT0HQalB62zKlensbnkqqTq6tZSpxt8eiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760705588; c=relaxed/simple;
	bh=q0dKvcJXcIqsz8kbuZxRuCwTz45q3VYiBczF46lCmoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOfXLAVcRVnGt9UH4J5PDAT3FB0itAxTUYOom3F3tTXvb8R+jhiv8aBjXTQ6JfqjCZYrlO13N6e10EZu/ozaAxHiCg7VCbCdq97votCWDysObYsxFBlsiD+i+cwfsS+Sddx3E6HA0cpwUE8+GURWn4jGf+121z5Ae9D/6XiEzo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9EM9qJF; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9EM9qJF"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b58445361e8so2411381a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760705585; x=1761310385; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KPuy8xanc30aUC0NeAjXkSoXgg+j9Yhzu5edLPhaAs=;
        b=K9EM9qJFp20sN3hf7W5at6EU6Bl91bHcQMZUWo10MIrIhdS3iXcG5HCnqWoh48PpFz
         SlD9az5Mo2SVUE6dQBmc5AKCbffGphn4PgZkM1sitv5S8+lfWH7/WIBr2lQTdC46K+DQ
         /9vGVEi4MGIWzDE8MWZ/gvzuzBJC0KC+ab5t7mzN/3hO+/rp05Ub4ejQ8KoVmAX788Ii
         PCjWNZd78v69vM7K1J+M4QwpaZwxjEXHcjTmlzichYo/k4ZmN4hehodn+CgkezyZXL/G
         6STBSIGo83INW6TUrP84F0/niTQE01bCw/JtbvcJGzU408q78EH2BEwxvR7KinAOYiz4
         RSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705585; x=1761310385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KPuy8xanc30aUC0NeAjXkSoXgg+j9Yhzu5edLPhaAs=;
        b=wKKPE4QyQutazsZsK4bXkGybmWhp2e0r4pGfAjmXHOggc5bVBA1dhuXLNOXDirHmta
         gbSiSwA9QgXSqTOQxG8ufioUK0tAYBewGTp0BeCY7Ru503yG/PlofSM7vNhxDZGz0KIO
         Vny5c/LsDu9jHI0JrXwR4ycwluQoqTVMScj+RHgqIJXA0VnmJhn2TXK+EvT+lmMN5scO
         EbOPeWTzc9Zpjk7aAAb3hD9IVavzzb9iLgMO6s8T4zCckHUbgkE/IO2Qp7Rjnqb7H/Yn
         gGfZZfOW8VRCu6h8AfbLU09JsFVcIPXQHZym0rNlLEdfJdke+cU06hL1R8GnJ9RcWJ2t
         R21Q==
X-Forwarded-Encrypted: i=1; AJvYcCWV+Cbq/7/s1ebqj+ivSrbiQEw5+PsooJ3FHF50F6ud1Po7vFxAXD3sioAnWA0dIwjZMTG7A+07P6IwcnzsQcPmxROQzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0n8XjaLpG0s4UHmAaZV5tfJAwLRXDkJ45pHkoJ9nap6QH4b1f
	B4Sjc4i0yMVsatAsPBgakAKQ3acDhi8n5hnyRHGofbabPSJXwF9YMozL
X-Gm-Gg: ASbGncvyeYhvYDMshfV4sNLxadoZxSjL+82IoKD+1nZeHM/Io4L8kUQQfjCKIRq9ocC
	b+ym+NhAYFQTv7V5S3HVIYbUqu4Y0mHE5hi/WE9o0UrZjAtVRyXeOvo6SqNgni1d1mKf6kcAS/5
	XhnqRHAlx1LzyH0FK4QHoGN7v1zMy0vp/k91hapFAm42SFyR629VBPrCEaXkczqFXng+VnMVaDj
	oCTw4cW7367+7T/bRos87gk94Zb6q/w7omDiAUgFLzEbYv7Oqdwg0abkkXf5o1M8u5KsJVm2fIC
	7iT5aBza6oluDoQRD1TcVy4gPhQhjp4fnx2RoRPFalUNEsBlX8ckV/tt6RxL5xqoegtT53g0A+W
	VaaWdjVyxgTOAtPTz10p7sJM8mJbgadz17I3kX1S1NJcobrXjETN/MuCMWK6hGvJWIii2BE7riR
	mK2sU4+jpGkk8XcAboba+B+Eo=
X-Google-Smtp-Source: AGHT+IG5O3uFCStwtBtYTlo/Za7+Ei3oHkieQstV+E+Ni78R3C1MS3A0qnauKtcp81RiP5MMdGWSXg==
X-Received: by 2002:a17:902:d58d:b0:265:b60f:d18 with SMTP id d9443c01a7336-290c66d9f6amr39830685ad.1.1760705585006;
        Fri, 17 Oct 2025 05:53:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a999sm63835595ad.9.2025.10.17.05.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:53:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 17 Oct 2025 05:53:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/3] docs/hwmon: Update maxim-ic.com links to analog.com
Message-ID: <07862286-4e65-41ab-bcbb-ad9b8432ef71@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017105740.17646-4-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017105740.17646-4-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 04:27:18PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Update maxim-ic.com & maximintegrated.com links to analog.com links.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
> ---
>  Documentation/hwmon/max127.rst   |  4 +++-
>  Documentation/hwmon/max16601.rst |  4 +++-
>  Documentation/hwmon/max1668.rst  |  4 +++-
>  Documentation/hwmon/max197.rst   |  8 +++++--
>  Documentation/hwmon/max20730.rst | 16 +++++++++----
>  Documentation/hwmon/max31722.rst |  8 +++++--
>  Documentation/hwmon/max31730.rst |  4 +++-
>  Documentation/hwmon/max31785.rst |  4 +++-
>  Documentation/hwmon/max34440.rst | 24 ++++++++++++++-----
>  Documentation/hwmon/max6620.rst  |  4 +++-
>  Documentation/hwmon/max6639.rst  |  4 +++-
>  Documentation/hwmon/max6697.rst  | 40 ++++++++++++++++++++++++--------
>  12 files changed, 93 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/hwmon/max127.rst b/Documentation/hwmon/max127.rst
> index dc192dd9c37c..5ff2f64f9daa 100644
> --- a/Documentation/hwmon/max127.rst
> +++ b/Documentation/hwmon/max127.rst
> @@ -13,7 +13,9 @@ Supported chips:
>  
>      Prefix: 'max127'
>  
> -    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX127-MAX128.pdf
> +    Datasheet: Publicly available at the Maxim website
> +
> +	       https://www.analog.com/media/en/technical-documentation/data-sheets/max127-max128.pdf

Text or link, but not both.

Guenter
