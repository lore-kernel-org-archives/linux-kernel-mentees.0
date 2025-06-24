Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5212929ACCB
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769643; cv=none; b=UFwy//YVlSs212zPsj9YQaPD+PDzKczNpLTHFodGPDeu8ZyYmJzlAA2Dfj+plOebjR9ihoXZUj6Ct+j33pGYdrgt8OkIcAwO8f3e6kegxhvJjHHMtRczgJWYEkCoJF+qxn8U2X8aPZ+JgHgoWyzm6TbCHH826gafV4OHIIoG5dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769643; c=relaxed/simple;
	bh=2kOE0t10Ys08qMax53uN1Ij++jJiV3VlExemldFQM8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cjk2xACbEcBCld0CSdbe87JoS6vTL+jo2gGdPuNX7+bIws2PC6ywlr1SjHESpe05aIZuqMUJeHcsIvmDAVQMJGsfYYJDpMxeLZyjaDqtEQXYplk14UGmNoZw6xA8/MCHKWgWaFk8mK0vrhwcP3ILkyMZ2cbr/2VOAB/iePXn7G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SL8Yt1zg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SL8Yt1zg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750769641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T1zTpwcC335IMGuNVVSMsviTgOOTgO+DQI5xktWwQcI=;
	b=SL8Yt1zg9TIO29wLDMVTHDWzSd1Zg2m61jrZhBZjaPIiIldBNwhkVyyJBirpPOB6jG66Ys
	clN2G31GnBTlxzEDvRyl+xT22GrvY2LDn1mUas8jSaIcJF0bYTLfVgHB8t4aT0fy4Y4QgR
	bYJl3ILudv6fg9jpyhrozjLKI94iAco=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-wIq6LjHIOc6vuia3bt5Rzw-1; Tue, 24 Jun 2025 08:53:59 -0400
X-MC-Unique: wIq6LjHIOc6vuia3bt5Rzw-1
X-Mimecast-MFC-AGG-ID: wIq6LjHIOc6vuia3bt5Rzw_1750769638
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so3061175e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 05:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769638; x=1751374438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1zTpwcC335IMGuNVVSMsviTgOOTgO+DQI5xktWwQcI=;
        b=cHfcCuCFqBsQkLCNwspiLcC4dhM9Fzi121r8DatommjZviEqUjoFZ2lbuFId2Bx0YW
         NDa+ZtW8ICFQEVfhEeyv2klCTHOPHF9+BlidcYjgnZdlRm9Z1Qa+YzAsNeYsv6bY2AaD
         T1uRXpucla29BsSRxhfx2HdGQkOrCc+cD5p3sx3oW8HWnc9r2p5FKh4RjQ8pJR6+KW+u
         f2Xgjbn8KSSWnn+X0GXbddck4sky0B4xx3CjGNLTQWA74FtS3iLU67go2oKK7YFwe26l
         Rs1MDxrN4oxbLRLB7Y7vn3leRC9Km2Qqg2DPOEg6Ij+H7uU5DSJJLFCsWiQMWbWM+3qT
         VCkA==
X-Forwarded-Encrypted: i=1; AJvYcCVGYXjNdFMxkwkilBTUoGDsnRzkIvTp+J9gPbmdOyc+XJaYncMYDQGd5IQ8jsXMCdg3xa2llcDchwykYwQKSCAxupjxdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLl7Da0NVikiSqjiXheYejn2W4EJRU7jDqRfW0mZ0eIUE+BIim
	jN1y3Rx+zsQ9Q/yUQmeppPfm1yv/93NHVegaCzXU9cVm3T2fxp7AQVcnP0RqP8SZ8la3xYCJT6U
	+jAKYqnUZLJe2cgvLgnBDtr0c5q1vHWsA07Vg7FnGN3/5tnXIzfG7D1ulvP+7mtry/fgcq7O34Y
	8l
X-Gm-Gg: ASbGncvofXBvvqlhIA/uuphowPwvvXtR2cm+rEjjj13L7nGFv1y0B3Ila5X+mUwvg+x
	nK8+UuiojNHuu5KM/eYEj8JkmNAzGlirOboTFtWKIhwAXSPURmwmv2wEPvDWAwrlWSij5KKCAip
	bH6/JBFePuR36dW2fBhGPgXiPhsAAncP/O5dba9XD9UeQSt/j8DOOrP7SxQV+CHP7ZhgrMm4iVU
	bDzf7Nc4zv2e8yjDi0Mz9kYWVMPWwMIYlN/Pf2kdH6h40XFzar7LBN8xpS3jQVVaEuko2rmn540
	5I9+onVJ6hXbwnKdd52q4M5nSMuC7w==
X-Received: by 2002:a05:600c:b8a:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-453658bac1fmr127799395e9.20.1750769638133;
        Tue, 24 Jun 2025 05:53:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY7lMZVaWFiRWIPG8b3cMXMdvCcNTK8MZjjGLVmokK+tCuYyoVQ5c/x3K3fImoxj9zLjbwsw==
X-Received: by 2002:a05:600c:b8a:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-453658bac1fmr127799095e9.20.1750769637706;
        Tue, 24 Jun 2025 05:53:57 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646dc761sm139345745e9.17.2025.06.24.05.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:53:57 -0700 (PDT)
Message-ID: <fb0f1e3c-2229-4860-b46a-b99f6dbfdfe6@redhat.com>
Date: Tue, 24 Jun 2025 14:53:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5] docs: net: sysctl documentation cleanup
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, corbet@lwn.net,
 davem@davemloft.net, edumazet@google.com, horms@kernel.org, kuba@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 skhan@linuxfoundation.com, jacob.e.keller@intel.com,
 alok.a.tiwari@oracle.com, bagasdotme@gmail.com
References: <20250622090720.190673-1-abdelrahmanfekry375@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622090720.190673-1-abdelrahmanfekry375@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S2fyJ3pRIPS06M5fvYJ5_up229FxSJqJpdVFpGWwkM4_1750769638
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/25 11:07 AM, Abdelrahman Fekry wrote:
> @@ -593,10 +629,16 @@ tcp_min_rtt_wlen - INTEGER
>  	Default: 300
>  
>  tcp_moderate_rcvbuf - BOOLEAN
> -	If set, TCP performs receive buffer auto-tuning, attempting to
> +	If enabled, TCP performs receive buffer auto-tuning, attempting to
>  	automatically size the buffer (no greater than tcp_rmem[2]) to
> -	match the size required by the path for full throughput.  Enabled by
> -	default.
> +	match the size required by the path for full throughput.
> +
> +	Possible values:
> +
> +	- 0 (disabled)
> +	- 1 (enabled)
> +
> +	Default: 0 (disabled)

This uncorrectly changes the default value: should be 1.

>  icmp_echo_ignore_broadcasts - BOOLEAN
> -	If set non-zero, then the kernel will ignore all ICMP ECHO and
> +	If enabled, then the kernel will ignore all ICMP ECHO and
>  	TIMESTAMP requests sent to it via broadcast/multicast.
>  
> -	Default: 1
> +	Possible values:
> +
> +	- 0 (disabled)
> +	- 1 (enabled)
> +
> +	Default: 0 (disabled)

Same here.

/P

