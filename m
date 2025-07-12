Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA542222BF
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 12 Jul 2025 15:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752333428; cv=none; b=KjHTYTi9togsZcdzDbrUEyS94U3fzFt49PfNVkgMd7xPiFRKTzb+a65vYK+SZGQNkHcCGd5iIjPhTYQPBcNp3WAze+RIn85DBehtTHMbHxBY9pEOu4hLwshbuD0nILJ4Yybim8d2lb5aRpFHgvw0uebG6vv2avD5XQl30l/sR0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752333428; c=relaxed/simple;
	bh=aMFFlD8sxb6KfI7aiKzBAgW2ILixRygjx5+/rKokabE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bH1g7lJlXH9TLuKHFz5kzDzGBd/DiFP3V/EbZ3MdE3WqNE8Ec84EXcryaZYSM7h+0HO5RislT8yfEwujgEoTTfPXl3WsBugBcBeKAOhAdZ5P89uNDaKfMm9V0qrnzVVpm8wdpEeVF+pYhbwdxi7JcBwbTTTDQtlBazRzO0QUEFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiSujw1J; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiSujw1J"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso31604745e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 12 Jul 2025 08:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752333425; x=1752938225; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQYhbDjEdkH6qRbj8NEnL6UoIBqxgyMRymT7FTKAEPI=;
        b=RiSujw1JIxhWQbIOJb7Lx9SlsxjjwVKifdMj/rHc3fHa24yMpA0gN366CSNRvE+cAV
         IGX8MVBMganD+DEHRsKGsZtkrg4Pog418UvCZVZpUdcxuvSglPXkWryTfjG6jtu0ArPT
         xAi3t56Zae/sNmzfRBAsOMQ1vNDILQSHRpIQ7/6Skj9DVKYYEkLDQJCOL5StP+vMMjAj
         qA9bI7kLvJPEQSJHI8jphtV5HuvywITXT0NY26WYPVODf57Mtl6tnYRX0ltuLrawbdON
         bhelXjo3bUIh+T1A1Imsi4Q01gjDf+MjSc2WnZ7sdvdj1UKXKjyFGPOSaR36uXl3QXSv
         WSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752333425; x=1752938225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQYhbDjEdkH6qRbj8NEnL6UoIBqxgyMRymT7FTKAEPI=;
        b=lPhAQCcWtv27RX2j4gVTLmnaJJ7Ulg4W8LSPEokTbhgiRhLQ0Yay5Jqd6XQr4zbSuy
         BY6sjOaGsxhjeJjili1yhCdqn7wGtZDJZ2U3Lkww0rgTkV5/Hv6F7+BMAQDmypkTXbtX
         fufee1auxcpkV309p8pZnZq3UtdTtsgkBxOBJwuXFbtxrY2cHqwNsjmhGEDXtvseindT
         8Cdmwm9dT26R9wFvbUp5CHpkJpDbLPqhhKYH5243TRO/oWeGWXKHZHmxrolV5U6IzUDU
         N27OoLjcmfxMcDjwgPZEfwAbl/100dZlU1wNNvu9498PxEt+jia5Wgc1Wxi5S7ZRLAfn
         nCVw==
X-Forwarded-Encrypted: i=1; AJvYcCUocOYdS1dIRCVgHumL+BYrOQT9rL1uZPG2tk+2aQD/ocXa/mI3ggRKha1mrjyMUzg9AreSPtvQn+pL9xnkX1foBatOpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRQqcb6QegdwspjXaxECYJC+FbAjkU5xSBYY4pyPKQJPvsd77S
	4oUOXDeWurlMOUlCLGZMzBppC0ouN9DHLc2eZkpBDCgU4Yb9v5wM8cIY
X-Gm-Gg: ASbGncugdPOerOf4PUi3Y3UYDO1YDvCrCL0slgVjGqJWm3+siIqZHa048QjlQqCACar
	0KYgeoCiZ0ofk1rTYLZsF0NQS8YQD6GbHHvF8I4zI2tFP+2BbdvN7/2D3GyngCXl58CihFk4pKz
	SoWzEDXNi+9UW745JZL/enaClbZ1D+klHrca70EBFNfYklLGh+joUlIz4hD4rzqTKZaSxmWJRvb
	tWlEWNJra2gIYhWJYBmefDEI3kOdM539ZuuyMVo0x0T/slfbSZQxAvwkgKQUvvMo6ljLpExyFzq
	niIftQx+wdsn4a0eHrrgeo7vuwUkMhWIxnPojBd4M3Im4FDGDbm0IdjV5Y1nLpYYRK2jH+/M6v/
	iafXVUYMIcMXV9PuOzB/LgfiVQiixJl5nXuWVZg==
X-Google-Smtp-Source: AGHT+IHsKQ0zL0Ztqsc+6mKM3Sd3cljTVmePtjv8/kQwA/IJ+3LpPzNoO1eIPju7wYqam1fDK9fNbA==
X-Received: by 2002:a05:600c:1549:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-454f425585amr76589345e9.31.1752333425128;
        Sat, 12 Jul 2025 08:17:05 -0700 (PDT)
Received: from [192.168.1.13] ([154.183.63.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50def1fsm117167725e9.21.2025.07.12.08.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jul 2025 08:17:04 -0700 (PDT)
Message-ID: <806f427f-2d6d-442a-b207-09cf59af642e@gmail.com>
Date: Sat, 12 Jul 2025 18:17:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: hisi_sas: use sysfs_emit() in v3 hw show()
 functions
To: Greg KH <gregkh@linuxfoundation.org>
Cc: liyihang9@huawei.com, James.Bottomley@hansenpartnership.com,
 martin.petersen@oracle.com, linux-kernel-mentees@lists.linux.dev,
 shuah@kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250712142804.339241-1-khaledelnaggarlinux@gmail.com>
 <2025071244-widely-strangely-b24c@gregkh>
Content-Language: en-US
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
In-Reply-To: <2025071244-widely-strangely-b24c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/07/2025 5:43 pm, Greg KH wrote:
> On Sat, Jul 12, 2025 at 05:28:03PM +0300, Khaled Elnaggar wrote:
>> Replace scnprintf() with sysfs_emit() in several sysfs show()
>> callbacks in hisi_sas_v3_hw.c. This is recommended in
>> Documentation/filesystems/sysfs.rst for formatting values returned to
>> userspace.
> 
> For new users, yes, but what's wrong with these existing calls?  They
> still work properly, so why change them?
> 
> thanks,
> 
> greg k-h

Oh okay, got it. I was under the impression that older scnprintf()
calls should be actively replaced  with sysfs_emit(). But no need if
they just work, unless there is a bug or something.

Thanks for the clarification.

