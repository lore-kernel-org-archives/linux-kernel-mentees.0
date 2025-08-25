Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942771E32DB
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 19:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756149699; cv=none; b=KHcxI3n6ZU4gSN0fvY+N6/UY7zkXL7q9Cha5YNoKzUOfQN/ziZlXIV1Z1rcng52/hN8Cu4T3zwaBivudBw/KvtWZqYFA6JL+9y4yTURtPpsHAni7hoJDVGQuZLozrx+T4ekoOWu1TxxzoYtPTLkY3rTRqcPILPSvbOVxnDcgEag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756149699; c=relaxed/simple;
	bh=gAd8R6P+ashAsKOaoPBAZslHm4lpM/gr56AhKeUPw6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pe3+EnWXFGX6Dn30ndQNlUyesKUwraljvIJN6LL1ToOo+Qe32dPcgLXs+XGekwL4HD9HqTvwr1AXT/ik8sC66IOF7YAfrUEYj77QZOrj5wB8wv9bItAWZdwJMRlzMbNPmGUApo4HfSQTT35F2J+eT5DMZGUaZPDRj9A5DVWSNe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H5KeSYxn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H5KeSYxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756149695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4973FsADhzdVXNTFjytsdhgtYARkFQAq+eNa6ZCfdrA=;
	b=H5KeSYxnudwYRDMj92k/Z3xVtOy9J/fWeGtP4v0pucbv4FBnBpLAc99iw1GvSSyuMZLnLf
	BaiPEIrLxEg/5Gl7E7J3ev+iGz4AkbKp2TcHDBFbWuiFVIQyB3KSRi7Rwam/DlQ9n2mxC+
	zai6KxwwTIM4vIJ8H74DbtGkJZBvg7U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-fXp4g3vJPKOMrLhzvReSVQ-1; Mon, 25 Aug 2025 15:21:32 -0400
X-MC-Unique: fXp4g3vJPKOMrLhzvReSVQ-1
X-Mimecast-MFC-AGG-ID: fXp4g3vJPKOMrLhzvReSVQ_1756149691
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3c79f0a5ff1so739860f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 12:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756149691; x=1756754491;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4973FsADhzdVXNTFjytsdhgtYARkFQAq+eNa6ZCfdrA=;
        b=WZCXX4talk6+4EPvIIdaVmRLxoHleay8jCcHVypawGbWJFKyvS+V2GlDdXTXrxkx04
         HjuRwpOFEg03eISnyLEGPVAfpzgrQOF1YNwgFwiT51HFZCRAXET4REOZFEIiEF5jmSrm
         ++7GxorPtW6YckLPCaJlP8ghH92JiDPHe+5eZjukuIhUSEHMPH/Pc+McXU4JwnRRDUp4
         /34X617t5QSB1MjoSeVr+RSe5B9ka3UUmeU3XxhBV3byUon6uzMtMmm/xVwaIFXsMxvY
         TeSg3oCQ287z498jKDFyzSGM9kZho2vfYA18zSxu6LQC6Mz1gFIZZTBSIqLV+s7bA2/c
         GySw==
X-Forwarded-Encrypted: i=1; AJvYcCXKFJ2JdK0QriWBFGqTPFMe7ucdzLYAZtT10wsGye4BrB1ohC+c71i8m2yD/JdtOmzA10C6dVrKp85Q9Lpj5mqYQwk/Fg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyH+kGdyhMeAnXnrInPlEmjrRFZiucAbgblxPW0LRfTFfV7rd6
	TtNMsrPG+7fN0Ofwo/UzqoYWGH5054hwAJ4vn2tCaK8P32/Jl0qsTqP9u0wymx0zB+Smuo1qVOo
	tYuelR0j+5xZ0V6hPqHw/8+vaUhlR8yqWdkAYxKj8B4H6vFmBXIPXVv6y0MmHQfxlRSlfsCKRlk
	Ev
X-Gm-Gg: ASbGncte4+xCSDz464SKfaFr7K9exXagCW87eIaXWvZJVr+XkNjSEaG1gMEh5M/5PWq
	ouwXw4z3rdCSCKqVxw36zhD2ecXrZbi23IjUiNoCrL7IiqcQxHyLLwt/tqUSqs+pLIkpLPIuibm
	4oApy8IrxFenrghDEEnIrS2Z5yVQriG1L70o9A9ifmo1vL/qIQ1QtUW56LSYme5ryxLu/XkZO99
	i7ywtUPaSOFjj349t6HpjWgshs4gNWWjOJW+VqCC8+97CHh6zKmy5g6G/3mlPJIJSpV7usPBaGV
	SsIT19bJdee92MHLWLX4eIN261simLKA5iRMFHVPOz3ydYicbg4OyM6yFHWB8dAv6OrhfMbfpc3
	luIPrJ1Mzs5FSlKCeM1MllOIBBkVMwiIYnQt/FzATcOZCD/EZHZW8aA7gze7/5F46wzU=
X-Received: by 2002:a5d:64ce:0:b0:3b7:9ae0:2e5e with SMTP id ffacd0b85a97d-3c5da83c912mr7364284f8f.9.1756149690792;
        Mon, 25 Aug 2025 12:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjWNW6Xu5QSvFxBNL/CfYdsPBPx9ubozM5lZ0V7FvEndNA7Hp/scIrCJusDS+aryhQ7TGOyw==
X-Received: by 2002:a5d:64ce:0:b0:3b7:9ae0:2e5e with SMTP id ffacd0b85a97d-3c5da83c912mr7364272f8f.9.1756149690332;
        Mon, 25 Aug 2025 12:21:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76? (p200300d82f4f130042f198e5ddf83a76.dip0.t-ipconnect.de. [2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c70ef55aabsm12458636f8f.23.2025.08.25.12.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 12:21:29 -0700 (PDT)
Message-ID: <c512ddc5-0d04-4af8-8b26-2c671e43a3f8@redhat.com>
Date: Mon, 25 Aug 2025 21:21:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: use calloc instead of malloc in
 pagemap_ioctl.c
To: I Viswanath <viswanathiyyappan@gmail.com>, shuah@kernel.org
Cc: akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
References: <20250825170643.63174-1-viswanathiyyappan@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250825170643.63174-1-viswanathiyyappan@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lh65g5g4ixtg6EKIVk6u1ULQngTZ6F7Bm8ctV_ER7og_1756149691
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.08.25 19:06, I Viswanath wrote:
> As per Documentation/process/deprecated.rst, dynamic size calculations
> should not be performed in memory allocator arguments due to possible
> overflows.
> 
> Replaced malloc with calloc to avoid open-ended arithmetic
> and prevent possible overflows.
> 
> Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb

