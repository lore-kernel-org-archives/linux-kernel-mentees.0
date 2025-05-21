Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9712165EA
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841895; cv=none; b=m+zrt9QLSrpLA44uTnhzFpIZGNvpD4QcqxtyPbV5x+BTZhe30WOiCl/8Hf4MvY34Dt20TqitS6LtEj0GkXlilrB9gRuWLxMia/dqygIkKGaSPHrU4VWkAzciafGUMpNtIDVPoX9wgyPpAHjSGfP5BsANu8zCq4/khZlYtU1TxEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841895; c=relaxed/simple;
	bh=j7sDhLAJG1NCqa/6sMKvVWjsSSAhvNNZC8wGEuMPu5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsohMNCNsz5oVGdJcGgbgoBVJhESRwt1QC/1VB2Atkss3XbgnEbE4weBbJkvkCYHtVrWn9e2Bn8j8mqKx2bK9GHEbWc3dEbmS8pgBLYVlVMVLGWhkCvkwHpf9FCynZDyeU46GY/N3q0VQTEU/jjdsjdtuS3BQDLiRixXq33CLUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVAN37b2; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVAN37b2"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54d6f93316dso8278258e87.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747841891; x=1748446691; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xX1GdWOhUQkZGneOEdWqA8kdYMe8hW7mvNhj+I9O+wM=;
        b=VVAN37b29W729ar8I9rAbxCSzx6E/0cvmjS8r40anBeSg3RjyBPt0M7BwqPf2zE4Rq
         YRq9byir0KT4CcX/CiYGqAbbnaNocnDhIvMO0pcDne1oAcQcA6unTt3SjvofPJyDsoA3
         1OYAn10Lbbl8Bb/iMfs9gUORmyrDknRm6RrXAJW1z7zI7yZUNaAOchn2GDoaS+BErhVj
         Y48Tg2ELnbehgerDIzMepCr6LgU1KjRxNO1wS9P+PCDR7NEj7nCUAZce55bTSh5g4/h6
         JHh+LBqexfKSfFADv7wZAXLA3Xz8k8cOnbR0rCPMPXtRjpbXcxGrhliR/gBiSYl5Tvd/
         NjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747841891; x=1748446691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xX1GdWOhUQkZGneOEdWqA8kdYMe8hW7mvNhj+I9O+wM=;
        b=H8M2lmnHJs3sDTSl8cNu9uHqF6E4hQMzgNKu1DhOfiH6hFUuPxAGgbfAuGQ7urOas1
         pdypjbRS+FIEbvmtMIrbIAhCtmLhJjxPz4cpyrwsc4SQWzepF8sNGGPUOP0lqBxLNO7x
         +WfjMUNK1HFZGXv9NgMtXaEPfOc33hafmwis7yldjrRCrSAyNXujYcxTSZ4zYhKOVCzC
         p5znkEULATQkaYDkRq2irTQMlB3KpN2z7uOR7ZsCaaZFXO/UP0HDdNcW6VzvZsUk9+F+
         bwVwa/6v7C0Qhcdn7Zdb0wcgrbeCLXdxEAZKgZDOoJGBiKcb86Hxa+qlx1kulKA0xmzF
         igYg==
X-Forwarded-Encrypted: i=1; AJvYcCWKrq6nnvJa5YQiA3Qtg1C/acW/qXVaGU/XgLDH1D7Y/aBX/jwNG1mJZk90pcfgUvP9yBIdeAarbrW3R1Rt+mowyFreEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2eVJxXiNk3hOb8bPBuuFuWWP+ZzuxnQDaq6T64rUgdciC+Lu6
	ioWrMB69xp2r0Hw44DrnSmTmCSIDoYljGIrl1fLYLuAPJdzbYYjgxpbD
X-Gm-Gg: ASbGncuDexDu9S2gpSPhVHSvKJz6lAuddi37DFRhk/z3REoBfEWRnK0wAJ/bdCn31gM
	gCzFXiM+gMHbT0H4f7I20bUjTJZ9P4skgz9j5C6OQ2bzldRgpXHqZ1MfLeXlTMp+26YZkibmrTb
	7Qv4fZltm1KBqhKVezsv+5pWwHEu8Bvzj6PDtyDQhIDX6ayyH0r2Wl2HupyYzMQwgoXWgeQtPrz
	BXh8L+etrMPSO4ZN/OJj4Jqs/8le12o5GFs7ydvIhOpp4AYejGPHiZDOnj015HINtbl05CO91Kd
	UPSly1VE75AeqNudO71tCAOrwjL4dLXDCEVmzX1j5k4S2P/+DJHX71YMtQ/ztvNINVG9qKRfNUy
	T5YgQeU3Jm7RlmDvp7sFAJ5AnBSBc2rlti88pgkeFMvo495M2k+XSeIVQHwT9kd3TmgWEVaPqOc
	0z+4XJh1VI0Zd6
X-Google-Smtp-Source: AGHT+IGJk/QA3hPb0+7+lQT4VfmFwPDxyEv47UVCzN+pVXLWlFipTvOAW7WEP1E09sDDyJ2Vmg3EGw==
X-Received: by 2002:a05:6512:1049:b0:549:55df:8af6 with SMTP id 2adb3069b0e04-550e726a158mr5906365e87.53.1747841891225;
        Wed, 21 May 2025 08:38:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:53:1500:e8f4:97c2:d311:5b15? (2001-14ba-53-1500-e8f4-97c2-d311-5b15.rev.dnainternet.fi. [2001:14ba:53:1500:e8f4:97c2:d311:5b15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e9cb4d69sm2793218e87.21.2025.05.21.08.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:38:10 -0700 (PDT)
Message-ID: <8bd31e5e-9f0a-48cc-9727-d2e6475ce046@gmail.com>
Date: Wed, 21 May 2025 18:38:10 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] docs: Improve grammar in Userspace API/fwctl
To: Bagas Sanjaya <bagasdotme@gmail.com>, mchehab@kernel.org,
 ribalda@chromium.org, hverkuil@xs4all.nl, hljunggr@cisco.com,
 dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, corbet@lwn.net, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-3-hannelotta@gmail.com> <aCqKNg3p_VlGbce_@archie.me>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <aCqKNg3p_VlGbce_@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 5/19/25 04:32, Bagas Sanjaya wrote:
> On Sat, May 17, 2025 at 04:27:10PM +0300, Hanne-Lotta Mäenpää wrote:
>> Fix typos and improve grammar in the documentation for
>> fwctl subsystem.
>>
>> Use the word user space consistently, instead of having
>> two variants (user space vs. userspace).
>>
>> Change wording of denied behaviour to be disallowed
>> behaviour when describing the interface.
>>
>> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
>> ---
>>   Documentation/userspace-api/fwctl/fwctl.rst | 30 ++++++++++-----------
>>   1 file changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/fwctl/fwctl.rst b/Documentation/userspace-api/fwctl/fwctl.rst
>> index fdcfe418a83f..a74eab8d14c6 100644
>> --- a/Documentation/userspace-api/fwctl/fwctl.rst
>> +++ b/Documentation/userspace-api/fwctl/fwctl.rst
>> @@ -54,7 +54,7 @@ operated by the block layer but also comes with a set of RPCs to administer the
>>   construction of drives within the HW RAID.
>>   
>>   In the past when devices were more single function, individual subsystems would
> 
> Do you mean that devices used to be singleton in its functionality? Or having
> multiple functions?

On this line I did not include any changes. On the next line I have 
added a comma. To answer your question though, the original author may 
have meant that devices had less functionality earlier, which resulted 
in multiple implementations of the common functions, and now with a lot 
more functionality it makes sense to have a common interface for those.

> 
>> -grow different approaches to solving some of these common problems. For instance
>> +grow different approaches to solving some of these common problems. For instance,
>>   monitoring device health, manipulating its FLASH, debugging the FW,
>>   provisioning, all have various unique interfaces across the kernel.
>>   
>> <snipped>...
>>    3. Write access to function & child debug information strictly compatible with
>>       the principles of kernel lockdown and kernel integrity protection. Triggers
>> -    a kernel Taint.
>> +    a kernel taint.
> 
> Improving grammar includes s/Taint/taint/?
> 
> Confused...
> 

Here the capitalized word is not in the beginning of a sentence or a 
name, which is why lowercase would be correct.

Best regards,

Hanne-Lotta Mäenpää

