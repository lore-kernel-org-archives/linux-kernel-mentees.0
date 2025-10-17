Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917262E0917
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760705534; cv=none; b=VVdlJ4S/iR4qFn3HUOS7+S+ATjdWzaK7sfLzeBXbCimVaVrbuwkUxxrr3Cr014mnC7zkYZEeumMmYRxEMPayUd/hK9JlDWC9/RQR4qF6vKe0mK80RAdkXAjM8boVq1q0o8fru20Vf9FZ4/iUwChtdvUnXkINSGITRY2PSLR9FTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760705534; c=relaxed/simple;
	bh=zGnu1o//e3bxZ1ijfWOYdQqIB9ZYrFiOJVInbImT8Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFzKDqCrCbBHRAjVOjVu+MXi4BJ6xZHhRrmmc4IBHDtYyTZEZUBuECnE2Ex1qjuabJKbptb4i4nUT9H4QswkrqQwSahQiMyh6fER+okD7c6OY3mMxZOYx2rQIcNB/bLCI5TsXsqvxB66bjKj0ER519VmbJYBvBwSk3n7Ae1FxGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1qxg4PA; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1qxg4PA"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b67684e2904so1315399a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760705532; x=1761310332; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GX1z7rpYYkyy+tiYD/wTVd32X+5BN3gi9AYpbkqHgFk=;
        b=X1qxg4PAVl9/HkfYjFqDcfkDdwTBizbw3/0mBzedRoZbGD3RPFy8uSf2V3hXBA+8XE
         wkzh312MqwfcK8YxRDGR2j4TJJPwK34V4OuDy5emFJbGwx1rMFa2roQ9LfVTVeHSvfus
         QNNtcCuWw5kkL38FTe4SeuW39tZV8y0zIK1uXN5dLxv7HtAxXZUP0mRAsZqM41BPO9F5
         y8Q8qTqkrKmqdMnW/xkhwR1W/+OgDUY9s/njgeVEVpIcNiqgmZlkUED4RDwR4nHMlccQ
         dGPNgBljAXZtTIYxxbUCEW94GipEFjLp6YUhdas4BG38MIP3eI8nI6Y4cva+vZhvpxby
         X7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705532; x=1761310332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GX1z7rpYYkyy+tiYD/wTVd32X+5BN3gi9AYpbkqHgFk=;
        b=j9Ik4JLTqqGibgEGceBhKwSCxoEG9QMCvZycV6li3nW9dzND1aCdDuIVX5MQ4antAL
         zGQQ5DZ+DzxEKRn23Gr8yPOyr6QQTlfZj3VLGN42Z1MK8aKE8jOBYYegfoPOvnjF9Vkm
         sWy1OnwmJUD3jQqdQgDmIzQT6djgr7Ct/x6ulHPssFMWpp5EB8tFBz814SUcow9vdPaW
         zfobnGiJ+TJMwiFSrwUKZAwDe2PnZ7/RrXSnn+wsMVSymVU+NqoeMQeTP1hZlpxbS2zG
         1sVso2DFrdbzLMH3HK9rJthotGK31ENLheXYP45xdo081cDbZFKF40WnxFo48L6qIuQA
         BdvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/4X8QUoGN3T2RI2V/HYlhQtGZMTdGfJUa5N1LZyIKNePz8d3jOzvBQc9HqN1tQtVBv5lCkC1/5XE3BZQjm1RItqt8FA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKBXfQiEhuZQsd1Kkf4FSVJDg/YJYIqUu9ui/xoQPUVogKU+1P
	DIy+GxzAZyLZfXFGVphyaczGJgUSDuhGMs5JvOODj2Hu997mPSJ3X6YA
X-Gm-Gg: ASbGncvDthEhgEvPUR0i0FcxcEeiJ+uAlFgtpYmkepRhahbZjLFG2eoY7RM+o+MVlGO
	HOPGE0tXxRMgG63uhhIlw0VdC6+yonxd/3DOHu3fN2Vkbqz3BRVAALft5NGvDN9Adt30S2v/Ino
	X/WoQ2AsDHkyCpqTIGeNcz9LaKNpuUZZ02mo9HYejBySV7nswWj/Rvo+kF2Z9mXoz8A0GaLJa2J
	ARAY35ArwIdsQjxUu6/spkOjoYS0jp5WyQtIyNgOt2WWYsFsUOFWj5Womc7EcyLg7eNu/h05uaM
	UND1/C3jOlI5XaQSKzJhMzbHSRE5krIEchz8Ud2rw3ibWtG+fJEFZeKsgReWURExD85J7jxUKtw
	lZfb6TvIZZE9Tw9HZAhUqX6jrz4YeWKSavaS2xbz2Pr1idSp+hW5EicMHq17g6XhVxpoTYT1hIw
	ob+qRgYw5u35NfLBc8QCJgE6Y=
X-Google-Smtp-Source: AGHT+IHBD+b3NB37DW1NNJU0Y7CRgNRfgj81Km3ty7iNT68DqbwCZ3dOZD5XoX8w64DGClNML1SwEg==
X-Received: by 2002:a17:902:f642:b0:28a:5b8b:1f6b with SMTP id d9443c01a7336-290c9cbbd49mr47303555ad.21.1760705531800;
        Fri, 17 Oct 2025 05:52:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb6522d67sm5481626a91.5.2025.10.17.05.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:52:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 17 Oct 2025 05:52:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 2/3] docs/hwmon: Add missing datasheet links for Maxim
 chips
Message-ID: <bfbbbf63-bd7d-4b2c-9e03-a3d3c3db04b3@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017105740.17646-3-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017105740.17646-3-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 04:27:17PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Missing datasheets now available at Analog Devices added.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
> ---
>  Documentation/hwmon/ds1621.rst   | 20 +++++++++++++++-----
>  Documentation/hwmon/lm75.rst     | 13 ++++++++-----
>  Documentation/hwmon/max15301.rst |  8 ++++++--
>  Documentation/hwmon/max31827.rst |  5 +++++
>  Documentation/hwmon/max77705.rst |  4 +++-
>  Documentation/hwmon/pmbus.rst    |  4 ++--
>  6 files changed, 39 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/hwmon/ds1621.rst b/Documentation/hwmon/ds1621.rst
> index 552b37e9dd34..415d4c3043a7 100644
> --- a/Documentation/hwmon/ds1621.rst
> +++ b/Documentation/hwmon/ds1621.rst
> @@ -9,7 +9,9 @@ Supported chips:
>  
>      Addresses scanned: none
>  
> -    Datasheet: Publicly available from www.maximintegrated.com
> +    Datasheet: Publicly available at the Analog Devices website

The "Publicly available... " text is intended to identify the web site
if a direct link is not provided. Either the text or a link, but not both.

Guenter
