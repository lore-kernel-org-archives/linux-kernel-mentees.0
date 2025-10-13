Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D69F2C0296
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Oct 2025 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760376998; cv=none; b=BZ02qb+OESiT0PXaXqR35PdyfVbWoNR22lQuKTlT25Y880vILKB7rIbDiD0mgJrROjVahUk03LtaAnCeCS2By1Jl8R+vHZkHKHBwjI781oLImqD153r5xxrU6lRClA/ZD3tCIooZdJ1T7MHDvgCU2S+wPdMdJ41SiQL/IrACVkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760376998; c=relaxed/simple;
	bh=/DzNk9eo2hvC84o3yvnQwAIOYbrdJd0QnkiK4TyS6og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LyHngp7L+CHUTrAixQm5VZpl8/J6fDm7alUrCe/yitnon/2SVWEzKoVLIsd74E2v+PgBTa55a9AF1gQakegOt3PiGqXk0JU9z2l6XXFNXmG05P/d/qSyXgF70maIa4oUTz2aJsL5quUs9hzXXLcGBYhg6qN9z/quxEvE3djbDNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3qDN7a3; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3qDN7a3"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-28e8c5d64d8so40993805ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Oct 2025 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760376996; x=1760981796; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JnDifAb/yM2sOw3dsFuYF6yVR1fy+kTBKbeq76ndcL0=;
        b=c3qDN7a3R6mCclsgUh/NSQAk8iVMSATYh5ibfBV/0xQARmYfx+p5tV2XELYpudrKRf
         UiNhEtI1NesQNswOYzUbaCxF0iIhWr6yLPY20/FT6H4D6RVYeQGH3vT9h4s37oqetgZ3
         DJr33ycW81pa2jhCDEZK48E1RZTsm9sZbkxJb11Fsml29M+ICD1X1ERL/v3Mzp53g6IZ
         siYUM7b7GbPJv/OuPmAYQ++omYqA+ckmE/VH/imMUPdgKL9l+O7pSP0/e6LMAp1V30Qb
         9tswjUV+jg17ZTpCtvLc1NH1cfdH/A0WROqVY+n+RjGueI/VW04oHYJ6Hoff4TvRG8x1
         Iw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760376996; x=1760981796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnDifAb/yM2sOw3dsFuYF6yVR1fy+kTBKbeq76ndcL0=;
        b=g2SkvSwR1eb4iDrfc3ciVJ2BTAeAlxVDB2c0Nsekc0wtmNuPQOqUcceqJSrhH5h/z/
         6hqGsWTcvjbDEOr8vvpwA/ghXM3WRvVB66kS9p9ENukg0Hr+G2S2Qhx/9bmzrFDMysZr
         ZG8qKXoBnpt1a9nZuSsiNW2PGcTi52Zp3FXmUULBFPMAT88fyWYY/ulvVT1jAeZm/rTe
         qI3g/O7Er3WmT1jjxJZbgD2gzOp6hayTVVMXa1/AB3cV1Fsq3kuGOpOLisJ6G/d2EBCf
         OqjgCEn8LRFSCgZlbHSU9UXFGp8xI2HK1dtWIsSdn9bk7KRz+oFfw7a0nL9zRBj3+vT6
         dJAA==
X-Forwarded-Encrypted: i=1; AJvYcCUk1fvrL5PhuodAAPktvq18yHjLRcY4kcQJdpTYVV6cTboaLRdvTvlmX/k7oJIqJMN0RKAkfrniV3QuHqL68uQiBMj53Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3wfHWhRxhnvzeoLB52yZp7Zfe3rCgX3p7DxBHONd8E/3Z0r15
	1nHW2sjDgfPqJ3AeMTsd0GCRwPZGCyAdwuBYy/ew8hI8PrSXvl96ie6QVkqXtHc2
X-Gm-Gg: ASbGncu5mY4WHsbSYs3tT/KFv1uHgQupxi5aeikKKSanbIGtEXq7swf8Axt099boZxZ
	ED5ANBlXp6QZmJJtTL2lvv5+T4nXk+keAk9Q+fWQPbeV9BrHyzZ1GPzcVLRJ4ASCa+M5A9T/CfF
	YVVIOn521+bRPHocXfGsarZAWA3BzyZdxNPnDDxyZXITY7JrD97WY5KD/W+wXLf3kbfqVe7wB/8
	AFNb44Hw1fffWIJUDi8oNfw38AV1/FXCGrj3RZJU8Ll6RMMyR0Y0DIGctyDvPVBkLc2G8wl0HVn
	GmKpDHv1XcFy2haq3Y4rf4Q+8EMKcW8Gq8G2iW700Frz8fxK13QZfP+7+37+frT/nmD2EL0L1nu
	1RF2l5cpQACLZHC2SvQMe6zseGAM+CyNW2SF1jmWzQufRBLC/y4AYyEaXF07sVDeAE7jA78DlMD
	/EzALyDpLAiWU0IgAP
X-Google-Smtp-Source: AGHT+IEH1PSDchS8WSq6REC3/+6SHp/Km2QpXe16lj4D/IR29cmoRw0+Ti5/0BrJ3xzaI/HBLIafwg==
X-Received: by 2002:a17:903:2ecd:b0:265:57dc:977b with SMTP id d9443c01a7336-2902741e47dmr251353315ad.61.1760376996455;
        Mon, 13 Oct 2025 10:36:36 -0700 (PDT)
Received: from ?IPV6:2405:201:8000:a149:4670:c55c:fe13:754d? ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3c700sm140037515ad.103.2025.10.13.10.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 10:36:36 -0700 (PDT)
Message-ID: <56075d23-8bae-4a11-b5a5-9ed251fc7707@gmail.com>
Date: Mon, 13 Oct 2025 23:06:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/xz: remove dead IA-64 (Itanium) support code
To: Lasse Collin <lasse.collin@tukaani.org>
Cc: skhan@linuxfoundation.org, khalid@kernel.org,
 david.hunter.linux@gmail.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev,
 Phillip Lougher <phillip@squashfs.org.uk>
References: <20251013115136.16773-1-spyjetfayed@gmail.com>
 <79cebb23-5232-49f1-a0ac-b401707c2b52@gmail.com>
 <20251013183800.7af293f5.lasse.collin@tukaani.org>
Content-Language: en-US
From: Ankan Biswas <spyjetfayed@gmail.com>
Autocrypt: addr=spyjetfayed@gmail.com; keydata=
 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
 TRpGew2ozniUMliyaLH9UH6/e9Us
In-Reply-To: <20251013183800.7af293f5.lasse.collin@tukaani.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 9:08 PM, Lasse Collin wrote:
> On 2025-10-13 Ankan Biswas wrote:
>> Support for the IA-64 (Itanium) architecture was removed in
>> commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture").
>>
>> This patch drops the IA-64 specific decompression code from
>> lib/xz, which was conditionally compiled with the now-obsolete
>> CONFIG_XZ_DEC_IA64 option.
> 
> The commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture")
> unconditionally disabled the IA-64 filter, which effectively dropped
> support for mounting Squashfs file systems that use XZ with the IA-64
> filter. I wasn't Cc'ed when it was committed because I wasn't in
> MAINTAINERS back then. If I had been, I might have commented that the
> commits [1] and [2] and the discussion [3] showed that keeping filters
> available for non-native archs can be desirable. But now that time has
> passed and no one has complained about the lack of IA-64 filter, it
> seems fine to remove it completely from Linux.
> 
> I won't remove the IA-64 filter from the upstream version of
> xz_dec_bcj.c, so this change will make those files diverge a little
> more. That's unfortunate, but they already differ by a tiny amount
> anyway.
> 
> xz_private.h line 106 checks if XZ_DEC_IA64 is defined. That line
> should be removed too. With that change:
> 
>      Acked-by: Lasse Collin <lasse.collin@tukaani.org>
> 
> [1] 5dc49c75a26b ("decompressors: make the default XZ_DEC_* config
>      match the selected architecture")
> [2] bf4d064d89ae ("lib/xz: enable all filters by default in Kconfig")
> [3] https://lore.kernel.org/lkml/20140228230017.GE14970@merlin.infradead.org/T/
>

Hi Lasse,

I have sent a v2 of the patch with the required changes.
Sorry about having to make your work a little more difficult.

And thanks for retaining support in the upstream for IA-64.


Regards,
Ankan Biswas

