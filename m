Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59A918452D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722510100; cv=none; b=ZXEWGubh1uFBj7RJJmmQh168xVbbEUkafkMf0pw6K9QHl4e+ty2uvGmb8a61QD85HsKbj9BygUzHYJN6ZddO0v37bZ+hFlIECMQ3R3BPccX8GpvSTWS5MuIE7H8xvkiNUCex5Dh8iorL7xlRPvJgDcDOrMVU0dnpVXHOfNlSy0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722510100; c=relaxed/simple;
	bh=gJyqndJlsZd25AEeawI9Gm3JE0f8nU5ng+m2CSIKFTg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OYQ2i9aOd6nUV6LrQSCLcPBM0/W43BbPQlDOdtSMs5kg9xJ2OR3ykiNDlQBcwp8LtC0CdydQoAC1ZCYVAS4J7yYz7+qDv47tBwfhKH+YT5Tf2L8MEkFVpmvAadTDBpmR4/4fvlrEaMGPeTSRjlpuNLpnXmpqirUs3FjL6DWYWC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONmg7GSP; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONmg7GSP"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 732C881E4A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 11:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeIrSqo08Bxx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Aug 2024 11:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C438581E13
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C438581E13
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ONmg7GSP
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C438581E13
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 11:01:38 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70d316f0060so1381442b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 01 Aug 2024 04:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722510098; x=1723114898; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G8V5Gq9jWtJAcpqxL/ibCzCHR2W/JBS18p+I/Sq+cjY=;
        b=ONmg7GSPQOq6WO1Qdgqj0zoa24IMJ6Iz0VPi978ecShXLTPHE/9H6Kgk4Ki+bmsV4J
         mcrgJNbPYV79HipukaxptjaWxK7E2RqJ51bz++MQ69XJD/vEr9KPL6L14Nxnbnx8CQbn
         PbcCqCLIXDNu2RpOWKSCLsfvZBDGqQ+EbI5Zh0UEwv9+Io51lAB9PU9K1mJEKZ4JH/Hf
         41R7PblSoOzx12zYm7Y7d17NZ7m2Bj3BuG8DoSUnyEWzjrLUO9rM3VzkeSUX2U9Ba41p
         PLQdB+YZwYTJqRkTkBuc05q9KTieN+x3jYcgXw6YdsSksi6KBQb8R/3XSb5S7zYhQx4t
         pEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722510098; x=1723114898;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G8V5Gq9jWtJAcpqxL/ibCzCHR2W/JBS18p+I/Sq+cjY=;
        b=fiHO9xBRuhOnGt1RN6Y9tqtn8PuqKQexGT5jFYg7/LH5u1cgU3itgLNcRnoLFiaVAJ
         rfeGam23Cw5ygSQ1HnXNz7lrw3beTiBWvhE65ba7oBfwbhGQdP5aB6kpC15epKDc1st6
         UMENFLcvsPHg4Aquufvc2v6xNKlivzdgLxUp/sj9TpMyuYjvtskkDpejt5dHRoyVbBu4
         l+EORiu7aNL9V9dooj9xGTKu3JzjK/1gOq80TMFnBT3Hmv25TkJaJYPQsDOA061TeAKX
         UcqXcGJls8Aw05GLnpvj1mSdCYXj2Ocavr3BsLizp+FDymORNA0llKxCBWQ/GyDMcxUo
         lKfg==
X-Forwarded-Encrypted: i=1; AJvYcCVDJ+J+Xf0S+s+WuaRrd2CZ7+uW4d6ZwspEngQik4x3ByNF7HBu+cFRMVY/alUGGxgOnDMEZujCa3SKPQ2yuydMV8+eRGtRijAIXOKQvDoo+JuKLe97xSVtjJXjvTP2
X-Gm-Message-State: AOJu0Yw1cktQrreAKCaEAwN5oliGE2sMZCJcgif7O6/6SzYUoblvJFdq
	G5rRuGcaQjLoQW/INtHo8t9D9aqLViP4ByEg8yriuMFQf7Pe2NVR
X-Google-Smtp-Source: AGHT+IEu0e2+9ZS3N3cbiTYLTpdoJWdmPpEzx695WbcAbt7es+AwgOyiJKuERjZPm44T9p1JlIXASw==
X-Received: by 2002:a05:6a21:58b:b0:1c4:85a2:9958 with SMTP id adf61e73a8af0-1c6942c3e54mr938337637.25.1722510097662;
        Thu, 01 Aug 2024 04:01:37 -0700 (PDT)
Received: from [10.113.19.163] ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead7156easm11274437b3a.85.2024.08.01.04.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 04:01:37 -0700 (PDT)
Message-ID: <ec6e3d88-b98e-4fce-9f7a-73c8ff82f8dc@gmail.com>
Date: Thu, 1 Aug 2024 16:31:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Siddharth Menon <simeddon@gmail.com>
Subject: Re: [PATCH v2 1/1] Docs: Update LSM/apparmor.rst
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20240801102356.93591-1-simeddon@gmail.com>
Content-Language: en-US
In-Reply-To: <20240801102356.93591-1-simeddon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Docs: Update LSM/apparmor.rst
>
> After the deprecation of CONFIG_DEFAULT_SECURITY, it is no longer used
> to enable and configuring AppArmor.
> Since kernel 5.0, `CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE` is not
> used either. Instead, the CONFIG_LSM parameter manages the order and
> selection of LSMs.
>
> Signed-off-by: Siddharth Menon<simeddon@gmail.com>
> ---
> V1 -> V2: Removed historical information and addressed review comments
>   
>   Documentation/admin-guide/LSM/apparmor.rst | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/LSM/apparmor.rst b/Documentation/admin-guide/LSM/apparmor.rst
> index 6cf81bbd7ce8..47939ee89d74 100644
> --- a/Documentation/admin-guide/LSM/apparmor.rst
> +++ b/Documentation/admin-guide/LSM/apparmor.rst
> @@ -18,8 +18,11 @@ set ``CONFIG_SECURITY_APPARMOR=y``
>   
>   If AppArmor should be selected as the default security module then set::
>   
> -   CONFIG_DEFAULT_SECURITY="apparmor"
> -   CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
> +   CONFIG_DEFAULT_SECURITY_APPARMOR=y
> +
> +The CONFIG_LSM parameter manages the order and selection of LSMs.
> +Specify apparmor as the first "major" module (e.g. AppArmor, SELinux, Smack)
> +in the list.
>   
>   Build the kernel
>   

I had accidentally added an extra '=' before the recipient mail
and linux-doc@vger.kernel.org while using git send-email.

Really sorry about this.

Thanks,
Siddharth

