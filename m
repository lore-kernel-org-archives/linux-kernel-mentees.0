Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82728641E
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755792113; cv=none; b=jFMFShD9hWmgdzfepE749LM1h9sr1NW5qMbI2kqWOJjeGYf8nmaBZhQp8E3uQCyFotG3ktHTymEh8WK5Z5GyanK66JLl6I/5sGo1txq6ECnJEWxsrhiT48brKbusf4HbKU3L/RPCPUlRRjq+ioHloKVHkBGIbKWrcRdsgHedIK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755792113; c=relaxed/simple;
	bh=Sb2tmvyhA9kl4RDm1IjcNLqVSOU59BKXqAaqUHmoj7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGW66syDuVLuCm5bYp0jDnVnf0BVS3JuIHlsk+pHr+GotdsGcK3ybF9qhYUGEnnK3kKztfBx32a6bnYHMfq/XEcieJ+NKXh3LEvBSrXLbePowUERt+Y7bmDXTCDGO7/WKCOTgXb636XPfZY912ALh/QGIb1llHxTg4xXL2ENtMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUYvFJia; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUYvFJia"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2eb6ce24so1054062b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 09:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755792111; x=1756396911; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zzsiqmbfqBkVY+f01p1NV6V6NJGQ87QW0Z5a0oYFHFU=;
        b=WUYvFJiaZb443vQiV09BoQJCAHDdhXb8iEdtOgslliNYD5avprYt8MFQ4ZB+g+GQe7
         zGr6vKEQjRThq/+6d/8zcxiP0+aZASKgyzyhZwEysYoEIr1k9NvERj+CaMRxdVVaN6m+
         RtFpMYsLeZFtwlAyeBg5uFp+r4/FgWyjbgXxWJ5D5yuCndn8C7hEn8FHw0ddk7ib8FZe
         EeWyjXY0/ousU6hlGkDuVoq01tgwhLvfJ3RXrvW+oAIqwo1SyE2n4LHuK+qLQZrDaxvq
         +oif/yJJd8A1LoWBw1bKQIUdrEaMHzHC83GOhmp5rb7XwjONoAsBgEIFSy7X9bR3DmW5
         UKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755792111; x=1756396911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzsiqmbfqBkVY+f01p1NV6V6NJGQ87QW0Z5a0oYFHFU=;
        b=V6C7W23AqTGMEsAQcqh0adPcBti6Qg6VMEJP4pj+dnLHKc0LIEw+YIWCWbVP3sXsI2
         nPDHEzMFK21PVXaZn2VkFqBCmHG8MRKIhngDSqoaziSdcZESJlIHSZhv82DfyWymSZOW
         sUViK+1KPbYQOjyjDZ3kpte8wGhIRTKRzEa24ZW/JYyvMk3iNPfvccMKdE66HLnvZ2TB
         uzvpCrIn8dfaopinT4+R5NCwdju8aJ25BqkfcauTNell2gU0lmbqRU77Vbp3ODsNJgsq
         2zw5nHxmMBWFlsUjSz8/njjSWrh0LPQEbXVf91eFchMY/f3i/2L/w2+GDHoxJ7JsSHiP
         TClw==
X-Forwarded-Encrypted: i=1; AJvYcCWk0FqZfssDwrxZ9MiBGsfFLPhsjcFpFTp7whVYTodBwJ/+3c9o9xvdDcr88481vXKlzWxlU6ST0i6OisfTuqm3ck1zOg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkcu1ru4C1OwcAWQFMkjODMmVhuT690g4JWf6+7cQFA9vuoO21
	svXkv227fWj4xB9XX8RTkSi6YJGvTz+XVp+2caSEnIlAtQJ7wAgceiO+
X-Gm-Gg: ASbGnctr/M4py42RdB32lL37LWa5s0feIal0mB6CJ1mBL/lUukEqDZEp7HzffaByEff
	9dOCNgVHqM6Mks/sEJIzH3PPxlwe3NuqFCgPhu3CynAflIyceLwDUUhmTYjcHCddpjclAzcABc5
	BElCJb5ilEUTvkJuYwgyCjgLRe6LoeOJkyAxdsFSgCEdU/eWNqWeRiRMGWBwj8dCzEoICpO4Oe+
	zYs5dvkdFGLNQ7i3nHLQPyyTYwk9hBsMSiaig0r+FA4mYkbWK+GWFEHwcetddJJUKiDY2udx0qY
	TmnJrELXzKE0+5lo2ewP5JrROBdMBMB4xkg1AzPx5ZXZZYVbJn0uqUwspwbXioTsJXE5ZnxJtIL
	OhqPxQ5BUfonHI+frYR/fvJZxgPkF/Ar957q2w3HopDvBPYeLhNM+qFnU
X-Google-Smtp-Source: AGHT+IE6uLjtZA+NsA4etmBGRhXqOtbKJrOEJL92MfF6Uthlu2MOjaGFDFnyQtI4j943jND6fmZtZw==
X-Received: by 2002:aa7:8888:0:b0:76e:885a:c3ef with SMTP id d2e1a72fcca58-76ea325e544mr3700074b3a.27.1755792111050;
        Thu, 21 Aug 2025 09:01:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d14efsm8849369b3a.2.2025.08.21.09.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:01:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 21 Aug 2025 09:01:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Debanil Chowdhury <kerneldev@debanilchowdhury.com>
Cc: skhan@linuxfoundation.org, jdelvare@suse.com, corbet@lwn.net,
	linux-kernel-mentees@lists.linux.dev, ninad@linux.ibm.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Fix typos in hwmon docs
Message-ID: <bcfd4b37-599b-4797-b3a3-6c4ae34ebaf7@roeck-us.net>
References: <20250821125539.58313-1-kerneldev@debanilchowdhury.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821125539.58313-1-kerneldev@debanilchowdhury.com>

On Thu, Aug 21, 2025 at 06:20:24PM +0530, Debanil Chowdhury wrote:
> Fixed some typos ("Critial" → "Critical") in hwmon documentation.
> 
> Reported-by: codespell
> Signed-off-by: Debanil Chowdhury <kerneldev@debanilchowdhury.com>
> ---
> changed in v2:
> - In previous patch "From" header did not have my name in it. Fixed
>   that.

The real problem is that the subject does not identify which documentation
is being fixed. It does not fix problems in "hwmon documentation", it
fixes a misspelling in the crps driver documentation. And responding to
this -and having to look at multiple versions of a spelling fix - prevents
me from reviewing patches which solve _real_ problems.

> 
>  Documentation/hwmon/crps.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/hwmon/crps.rst b/Documentation/hwmon/crps.rst
> index 87380b496..d42ea59d2 100644
> --- a/Documentation/hwmon/crps.rst
> +++ b/Documentation/hwmon/crps.rst
> @@ -43,7 +43,7 @@ curr1_label		"iin"
>  curr1_input		Measured input current
>  curr1_max		Maximum input current
>  curr1_max_alarm		Input maximum current high alarm
> -curr1_crit		Critial high input current
> +curr1_crit		Critical high input current
>  curr1_crit_alarm	Input critical current high alarm
>  curr1_rated_max		Maximum rated input current
>  
> @@ -51,7 +51,7 @@ curr2_label		"iout1"
>  curr2_input		Measured output current
>  curr2_max		Maximum output current
>  curr2_max_alarm		Output maximum current high alarm
> -curr2_crit		Critial high output current
> +curr2_crit		Critical high output current
>  curr2_crit_alarm	Output critical current high alarm
>  curr2_rated_max		Maximum rated output current
>  
> -- 
> 2.49.1
> 
