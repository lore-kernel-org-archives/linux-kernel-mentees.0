Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103502DC793
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 16 Oct 2025 20:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760647677; cv=none; b=VmwRqFljSdIhDfGF4IVCBIBGc9JXhlhVNBcL0qmugVkxC5oBeKDgSSRPQveM+Vib8a/h8cQ8nv2bjLZqh6Y06Dz5CJuXMSe6pBxKgWvVhFwoeW2i5iTQN+rFvCll/qtBeaPfozve2wPuJw+DiwEcsPKwTPzmFCj91ud3HD4Gkw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760647677; c=relaxed/simple;
	bh=ndgdnL4NvZXc2YXbgp6JkfbQHOsj4MuJcCkc5VpFe/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cy2YXW9r6DtRjO7YZeGXxD+/AnVhK/RbdorqqoBISaxQ3gM/6M2BOLRlWwf7BWkM01hUIP8fDTb1Tp+egnPShjwJuP5DjmQrayXOc3GIkyLhalBd3QUqAmUDGQSc68OnpW6VWhJX+6426qZIWZtL1b8f5UylNzEQ8GYidt0wyvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCVzU6MC; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCVzU6MC"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33b9dc8d517so1144321a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 16 Oct 2025 13:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760647675; x=1761252475; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onqj4CjIVJRLh43lyfVP55yMWDw9oV4qH8HlU6gjd2U=;
        b=MCVzU6MCkt3kvjmgp+xZMg03R5JIJTQrwWeXS4Od/tmEPpKTSaKUjDzXfed7WJw5Zv
         w1sxx0lrmwmcKffGXJWiWhBGWN5l0pLqbw+fYvoK2csrEwUFdaJcn3OEbLU04b4v1lM1
         5PVJdLIMZRAJFLgc7U29kVqNVyniZ8B+i0wzbR2SUWix70BlPCSw7Wu4b84PBITusps+
         N25uLrE7YOJUBpII/bdoFb8LTNFxqp7zn62IfB2CaFUXwodsXF8EAqb+qvtdmE/2YucW
         qIehfqkQnfo7hIKuk8ZUHE18hG13vkFr70uQwpdACuGX6OK06bxjPiWdWj3sWrqi/S4a
         BIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760647675; x=1761252475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onqj4CjIVJRLh43lyfVP55yMWDw9oV4qH8HlU6gjd2U=;
        b=Qmc9AW8fDqZObyn3Fyu/6Qd1ya36EutWLV/gTKQmAXMaOiR6xOKQmoqMT7VZoL6Znc
         L2h60ppoIabtQHRxPa2LEJeZywk56v7cX+iNAiXkhD+65UrJOCmc+slnzVtEdy7aroXx
         X7OlDNylhku1iidK82Lg0EeZG7qqUkOBnNg41lpa1VFqp6BeetKvznAQMGfz+BFTGlAn
         qZL63nKDK6K+7XsCugFmxVdBGB9ZRWkPM/OBihvKqLbDGt1oy05AHj36i0QxYWSuS1jE
         4DR6LYyVtMBjqXHqZ2WRIEF6tHhEtyiIk0oHWtVQumTV/CcGkXEsHZda6t3jPIE3zxrd
         k8cg==
X-Forwarded-Encrypted: i=1; AJvYcCV43LQ4cmtshbxoVx7zol2U4i7mqn1ZGHmofhXJis+vbbhL329W9K3lEhZezZqoVQSdVj1eY1IkH0iRW+DYOSgzSqWx5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyltek6WvxWaA/J/vmkWzjirk8UXd52IYppjKF7DW4Bbyp4mW0T
	t6tUzgFFaNC8+HuujX837l63M8TgQ4mPVSw1ludIIGqW0Dkhhgp9OpZz
X-Gm-Gg: ASbGnctFBboZDRsp5dTBf5VMxeMHGyG5GE0iL9ZJ6l5/DKlv4eiZKfuHx2ClmHa6D95
	St51HKOT8br/IpTAjWfbtpZjhUBtRpNSBEiWBXPuplN0G0AGswq6ufGLLIhHIIKjCXioWZbsnTZ
	RVs8QfPrSRWRGruWNqWwxVAv6rvSA6NZ1LvdPztwqo5bBiidD4+PpjvVuCTkZhncF2Ntkog6luk
	Prb/vJdwakKmo6ON3NTn9tuJTN/tf772DXCeowem7y+9XqTA5kcq71mzNCcnBpddNZG+ttzjnof
	RplHyhHlU25/wfthKdezrceunENACYV0r11ku0FlBpO34MBOhUnT6rneCMWiTPZsYjZ3Tf7uP0A
	xB8CJix9qg9FsuozVbMJSXBd/AMFKQQqVZl4oItqdcSdVF1mXLwYcEvhaGhgYp4TvUgzfyOqO23
	KmN4TxNqr/Nibf
X-Google-Smtp-Source: AGHT+IH4G3cPfsZSOD6swv+Nr/r1bSZCKg8w/Ox7KOwwd15eIqRctEk/RfdSNTo8Nh6NWlqwEHC1PQ==
X-Received: by 2002:a17:90b:4b0f:b0:32e:8c14:5cd2 with SMTP id 98e67ed59e1d1-33bcf8faac8mr1245917a91.28.1760647675393;
        Thu, 16 Oct 2025 13:47:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22bb5b8fsm3746596a12.37.2025.10.16.13.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:47:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 16 Oct 2025 13:47:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	khalid@kernel.org, david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] docs/hwmon: Fix broken links warnings in lm90.rst
Message-ID: <dff61b90-31fc-4c96-9bc7-0f8aa8404689@roeck-us.net>
References: <20251016103049.2573-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016103049.2573-1-spyjetfayed@gmail.com>

On Thu, Oct 16, 2025 at 04:00:47PM +0530, Ankan Biswas wrote:
> This patch fixes warnings in Documentation/hwmon/lm90.rst reported when
> running 'make linkcheckdocs'.
> 
> On 2011-09-23 National Semiconductors became part of Texas Instruments
> and national.com is no longer accessible. The datasheet resources for
> the chips are now available at Texas Instruments website and have been
> updated for lm90.
> 
> In 2021, Maxim Integrated was acquired by Analog Devices and maxim-ic.com
> redirects to analog.com. The chip datasheets are now available at
> Analog Devices and have been updated accordingly.
> 
> Some additional broken or unavailable links have been replaced with
> equivalents hosted by DigiKey.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Applied.

Thanks,
Guenter
