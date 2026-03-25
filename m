Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B78322B7B
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 25 Mar 2026 22:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774477347; cv=none; b=toM4ZA/TzRRlDyxzXcvW2oQs7FzyMOSyy/IFl3Hu67q5vxCEkfs8e3AYrndT2Swxt0xLhaLZ+VF1KOQnP4sLC0bC4aaQ13D442nBLe6sm1vbzP1Nj+MrPoj5tzKoKjTUKolbmMO5wS0GXwtvcottgcyGE3yRzvIx9T0xmrg/Evo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774477347; c=relaxed/simple;
	bh=oIZxwS7DyaKrQvzESHSMKLgpw8mQelWUJVu14lPeFVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4SkGc1jJaTtfh8BpVkn6XQVfVXLbiG95JiiyULqOESlqo5++D8qzrioLnD+YlFQTwpkzO0oE2f7O+6UpNp8RO/D2WUe2zqG3NEBZ1lzJ3CUQnGUADqjfyMl9GsbD+sftYl5wyOYvwD+WYJd/fviIbYbZ1vKEqaXXcb+bWGvqNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DW5VNLPx; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DW5VNLPx"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d7fdb922a5so254769a34.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 25 Mar 2026 15:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774477344; x=1775082144; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMVBUq76We5OmSgDu+kPUK+rLvGUIFxCal3rZvl7YbA=;
        b=DW5VNLPxFI27pJjnuwaDCCJDiLiRV6qani74M0fAuMbskWu8t6RYZSLGpckui/WN+e
         mZuQYBAmkWg8ZB4XZl7ONcggNbLX5hr8P5fXO/OC0OkJO+p/ZxVD/bEeMURB0mPaQzZh
         DRDtdRTOIU+jyVqEolWVOHQxSTcq//n0shMe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774477344; x=1775082144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMVBUq76We5OmSgDu+kPUK+rLvGUIFxCal3rZvl7YbA=;
        b=tPb9KKTPcEETJ+qVsMsX5Y1OaUFbRuNARCIogZLVVbAW1ccCijeeC/nquhxnRInPB4
         v8XSGWE3LtVGz/YGJqV2AMHJSoti2TPXDr2KcCEJqs/zx33Gwt+9I4GfdkVa64LxXm/J
         2UiqLrw5irsZpyv71o8QbyDHM/YW+abPO2QY1nvzS2xkeH7FxwoihL4Zc3Kb+/LM9weq
         YLMeoUZbKQ6c0AJSCBiw44eGfJHItSB98J3dUfjnciFrZUSjpmK+QwNIK4ylAvkqfXdj
         qubZQ4vuBxf5PoggSLcrm4cBYSH6J27Hr2irSV9aaGrPysO7gRSgVAGJrFC6MzBKMww7
         p61w==
X-Forwarded-Encrypted: i=1; AJvYcCXWDpeHiTzhriV2+DJkNB8TKXiXWhZySW+2Y78iBOE9UAWClwAZIIIeeyyCphJ5BjGZ9w0tiH3MQ73yylBE26QHGGzh3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyoje68IAEjtBQfUUZd0vZbmTbgyZVx4EUUJq3+sEZL4ZSoo5Jg
	EtCdjPq72hy2ErTeX4EKLWetnKQvDc3+fq9U14GxB7vVnDdIVWJKuhJbSZGpPEpVGic=
X-Gm-Gg: ATEYQzynRBl5dkLBd0mOJKadGo70qJ95u6qze2wB+DYSjM3QveG1SnMXbLB9gWzDo7J
	YC5eWDe1woE+64mxhc1TyJqgch+qLb4hZZoq5kDAohSFWIzbGniET//fBUnptzQdGxHKhH3bA/A
	JHpuBbT/S7BM5StIWCrH73E8g+JG8+GbcDp1sbUvFoXTwPSIWHzLyF5Vi7gpFqVp5cHGqfz3Hze
	ITQeMjXH/vZlNcj+eynz0I7l6mCyZnBS1pbVZWE35DFM2EwnGwyUVk8vUxzMhr7qVHqcbLkIMoJ
	HnE7hkABKNmEe6CnTgI2+s0iwKBQc56n0tyiN3gYfh9/O5guYOcixTWP4xgAmcTcfGWOKl6uaM4
	Y0QndiZJRsLXytTNf/zw6gAV3Jnd7DCDRflGPfNmFkK62Ejn+x1+89VQB3UZZPNdD6EP4Xg3JZ6
	dyETFTgYOWScWElEk4brzXowWRWrg6iOGZAAu4jitGErqV+g==
X-Received: by 2002:a05:6830:6f45:b0:7d7:fcdd:3f8c with SMTP id 46e09a7af769-7d9d6b1ac8amr3142144a34.34.1774477344605;
        Wed, 25 Mar 2026 15:22:24 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d9e680456bsm1004206a34.0.2026.03.25.15.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 15:22:24 -0700 (PDT)
Message-ID: <730559e1-aea5-492e-8e5d-9a7ed3b38323@linuxfoundation.org>
Date: Wed, 25 Mar 2026 16:22:22 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Prithvi <activprithvi@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
 straube.linux@gmail.com, b9788213@gmail.com, ethantidmore06@gmail.com,
 weibu@redadmin.org, knavaneeth786@gmail.com, ignacio.pena87@gmail.com,
 dharanitharan725@gmail.com, lukagejak5@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
 khalid@kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <acFtiaXTp7bwl604@ashevche-desk.local>
 <20260324130234.3776tp4ykuerffcg@inspiron>
 <acKU7JjW3OFugHXY@ashevche-desk.local>
 <20260324135551.grth7jfjyoh5krzr@inspiron>
 <acKaP0Jz-VqfmEqj@ashevche-desk.local>
 <20260324160229.f46h25ebd2mxcfiq@inspiron>
 <656d3bf5-8d97-454e-9691-540cdb79dab4@linuxfoundation.org>
 <acONUF2nLAk6uhQs@stanley.mountain>
 <ea43143b-a880-4d15-9fd6-1a4a25abf187@linuxfoundation.org>
 <acRU-NKBqLe4-e3E@stanley.mountain>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <acRU-NKBqLe4-e3E@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/26 15:34, Dan Carpenter wrote:
> On Wed, Mar 25, 2026 at 11:57:38AM -0600, Shuah Khan wrote:
>> My primary concern with this change is that it 10 files changed, with
>> 26 insertions(+), 32 deletions(-)
>>
>> It can be difficult to find any regressions unless the changes are
>> tested. I understand it is staging repo, but if we relax the rules
>> for staging irrespective of the scope of change, it becomes lot
>> harder to find regressions later. We are essentially leaving the
>> job of testing to users. Also if ans when the driver is pulled into
>> mainline, it will inherit the regressions that crept in.
>>
> 
> To me this is a mechanical patch (basically automatic, flip the
> if statement) from a newbie.  These kinds of patches are seldom a
> problem.
> 
> I took a sample of the patches for five years from 2021 to the end of
> 2025.  We merged 54406 commits in staging.  We had 401 Fixes tags.  But
> then I decided I don't care about Kconfig problems so I cut it down to
> 380 bugs.  Half of those (189 commits) were from when the driver was
> merged.  We tend to not review code very much when it is first merged
> to staging.  The other half (191 commits) were from us missing bugs
> during review.  191 bugs over five years is 40 bugs per year.
> 
> I hand reviewed a bunch of the 191 commits.  It's mostly senior
> developers and maintainers who introduce bugs.  They are normally doing
> complicated things like adding features or re-working core parts of the
> driver.  Quite a few of these patches were tested.
> 
> The fallout from newbie patches is pretty rare and often really
> minor.  A common thing is "We deleted code but we didn't delete
> everything."  The number of serious mess ups is probably just a
> couple times per year out of the 40 total bugs per year.
> 
> I've attached my script so you can check yourself.  NEW means the
> bug was introduced by a new driver.  OLD means, ideally it would
> have been caught in review.
> 

I am not the maintainer for this driver, so it is really up to the
maintainer(s) to accept mechanical patches such as this one.

As for the mentorship, I like to use a consistent rule that testing
for regressions is important and that author needs to disclose how
the patch is tested or not tested in the version 1 of the patch and
add RFT tag. That way maintainers can make an informed decision on
whether to accept the patch or not.

thanks,
-- Shuah


