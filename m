Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4F830505F
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Oct 2025 15:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542628; cv=none; b=qh5uQSeZxxzp7YpWWjULXhos7HXbfuoJw4FT1RyrwDv2p4IZqD4+2a9fFp+71TpAFPfmb7kD71GT6kPwgWv7CUP8tgTgjPck+fiZdrts+OU1JsE4c8bqPhDgE4v8kYsqwRM4+kJ8m1vJQE0cd81wJoasS50k81B4aXSSgCUhxBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542628; c=relaxed/simple;
	bh=W+H56aOPbolPmKRStRwB5QPH/LtPDKOBRBsosmOXFp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKrfbYI0enU00I/k5Cjm/iJz8wORW/kd1MEYlkBHU0VuYcPiTM/9woROvv4IRhkAcj3iDDe3Xv0j3jzciUp5lwQIimr8x6cqRNSGO4UDQkiin0DKKp16PzVISi2fx/VBH245MfslHVZ59dCp1rYQ11nDKxn0OHDLFaTrZPrlR44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBn58SYH; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBn58SYH"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33b9e390d74so146679a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Oct 2025 08:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760542626; x=1761147426; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vnBAgCmbYNml3zpTyyPbm6K/u2+pZyuZXQIZmUzghcw=;
        b=OBn58SYHeJt0CAwQjWkyX6z3GHBuFedIuYMN33VZTqQIbq+HEULxdDSb0cdrtAhDqc
         ddhySBj2v1VO62TPFSAEaVme4U4GW6S1DfMA6QrK6aROrAA4Wk8WF//BUBzH8nSX9CHW
         yRXTu/1ikiZY6SrnnasRQZpmi7qrVXeDonHRJ5aVHvv1CnDNZapyKfWjUxunbRO/O0ru
         SCGpt9OyBkb5BRljDs8zelu2xKGBwreWubwgjnNkq6VKBIu24VUmOB9k1jCi73m73Efe
         kVNGAVDNP5YoVkhmOmXoAvsaXLLlPNr9QCYgt0Gj4p1Qa+2w81sNZYPbbOMm4X2NfVqt
         i/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760542626; x=1761147426;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnBAgCmbYNml3zpTyyPbm6K/u2+pZyuZXQIZmUzghcw=;
        b=YrT7hN6KJP+8A6YIAhETeqD59jDUyrYaRUNxaPPqDi3jgJL0Qx3X5VPg+IAToLZKNE
         si3Ovubbfk3rIrj3Pms9ML3N3kK5bAQ9CPJVUA7V5Iecpi0g4+ZiY19UOdaOHmociWV8
         kEECiFJvl4cFKcrLy4oaWlKXIKSYm7n2rctUVqjg5lRXcO9iq83pK75v/Sw/4v95/WCw
         kYse6L82B+jyHorNKtCanMKiSeiF9XDfiyq5joxNQUft55yOQF+TkcQ+wjY1/Ct7yrYk
         /qaVmoBRdkXvN9chsPvXIS7fZmlmx2UR++4+SZXT3xe6Ypr6rmI3FfFN3P8+Jd10qwLD
         0WLA==
X-Forwarded-Encrypted: i=1; AJvYcCWGn8NGnKs6YVrcBQPDkLrt0frqSU01YhrFEu+wro2TDsq9HQdwZfgjYkTRFr148gnarTWFeTV36WNLC5+sPWcefRzfGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YySULq7vZ495DQ0Q0yz4cmgIEWRQElHygmkPdmNLZAJ+pGzJ8ul
	rpQsQDTdAKFx+0SmBjbWvmU5xIQJZJ6MSMBIIv3NAbRpTm8th9wnNMP7
X-Gm-Gg: ASbGncuuelxOk61CXSZucJvTWvgcDqO01JW50D6UmZeA0niHqB6k6xDvDY5/l/w/xal
	E8tzVqYLmC2cj53kfNcUrqQ384pOod1vaGtMbYpN7tEhlb/ad7az+7yoUOI9ak6Chlgi3/omrcL
	Mkb8TQGquy2jYXNxTUf2vRlu+4Ycrwd5HxkXh0WYfSLeNCgcjGX+2064lJIXEKPjuPr835RCNEm
	g7AA2fQmWcxE1uIic+PIN7botCT1IINR2IwbR7Zx/sGOj1VCjg1UZ5AE+B2Oe1z4EE30DMTrFKV
	j9HRvf7MxqFsBH3asOas2CcV9JQOgJLTXbc4/LkGnPJalJpNc8wOZyN9eDouUv/SKw0GMX4Wpqg
	IJj9XBBWdki8cED/rW7YKzLAXpmcRGj6HuVSyffWJrVrKvgNzJHU2/Cez5H4WRU2pEnNAoUc3r4
	6c/vuACO3HSGRAmeT1
X-Google-Smtp-Source: AGHT+IEJjooXXaZhfIzd8Ul2LkbtfQbQZORtByVAe67pEeQe57Gz2lveZjTzB8fnkfh/VdT1hhQLNg==
X-Received: by 2002:a17:90b:1e0a:b0:32b:aee1:18d5 with SMTP id 98e67ed59e1d1-33b5138e670mr33927500a91.29.1760542625939;
        Wed, 15 Oct 2025 08:37:05 -0700 (PDT)
Received: from ?IPV6:2405:201:8000:a149:4670:c55c:fe13:754d? ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61b0ed20sm20427756a91.23.2025.10.15.08.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 08:37:05 -0700 (PDT)
Message-ID: <192bc74d-90d8-45ae-a324-6c29ccae2a06@gmail.com>
Date: Wed, 15 Oct 2025 21:06:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gpuvm: Fix kernel-doc warning for
 drm_gpuvm_map_req.map
To: bbrezillon@kernel.org, himal.prasad.ghimiray@intel.com, dakr@kernel.org,
 matt.coster@imgtec.com, robin.clark@oss.qualcomm.com,
 matthew.brost@intel.com, aliceryhl@google.com,
 thomas.hellstrom@linux.intel.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, simona@ffwll.ch, skhan@linuxfoundation.org,
 khalid@kernel.org, david.hunter.linux@gmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20251015113656.21447-1-spyjetfayed@gmail.com>
Content-Language: en-US
From: Ankan Biswas <spyjetfayed@gmail.com>
Autocrypt: addr=spyjetfayed@gmail.com; keydata=
 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
 TRpGew2ozniUMliyaLH9UH6/e9Us
In-Reply-To: <20251015113656.21447-1-spyjetfayed@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/15/25 6:56 PM, Matt Coster wrote:
 > On 15/10/2025 12:31, Ankan Biswas wrote:
 >> The kernel-doc for struct drm_gpuvm_map_req.map was added as '@op_map'
 >> instead of '@map', leading to this warning during htmldocs build:
 >>
 >> WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not 
described in 'drm_gpuvm_map_req'
 >>
 >> Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
 >> Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
 >> Signed-off-by: Ankan Biswas<spyjetfayed@gmail.com>
 > Hi Ankan,
 >
 > Thanks for the fix! Is there a public report from Stephen that you can
 > link to with a Closes: tag after the Reported-by: tag (see [1])?

Hi Matt

Thanks for pointing that out, I have added the Closes tag for v3.
And resent it.

 >
 > Otherwise, this looks good to me and I'll be happy to R-b and take it
 > via drm-misc-fixes.


On 10/15/25 7:09 PM, Danilo Krummrich wrote:
 > On 10/15/25 1:31 PM, Ankan Biswas wrote:
 >> The kernel-doc for struct drm_gpuvm_map_req.map was added as '@op_map'
 >> instead of '@map', leading to this warning during htmldocs build:
 >>
 >> WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not 
described in 'drm_gpuvm_map_req'
 >>
 >> Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
 >> Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
 > Please add a Closes: tag, checkpatch.pl should warn about this.
 >
 > Thanks,
 > Danilo

Hi Danilo,

My bad, I did not use checkpatch.pl before sending, I didn't know
it also caught missing tags. Thanks for mentioning it.


Best Regards,
Ankan Biswas
