Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551B91A0BC9
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748034545; cv=none; b=OmKOIXZGR9j8Qm5A7xrz7dHIBw57gKtYef3eGs0vg1nDPre3uPXQ+USxpXI8ggpfCRdX8IY7Ku8dIfHMGhFMza135kGyk+GoCUJmAlXvs4pdzxBGESbsET72sxRE67iozmEq9Z5kKIy+i0JbPZVK11hTWh/5mqRPIabBARMacrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748034545; c=relaxed/simple;
	bh=Ug/0cek0liAmIOALkolnnoBQY2EBqu8WIDEwQsDxrN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WY4sZTr6NGTQ8CkZsph1o/7MiYjotVOoRIhXel+q2JM4Rvqlz/gokn/yuLOq9SFAKzWCX8mxM8YSYo3XNVzrH05J47dj+ddooPdVlha2F4bTqI+sMyx6CzllwE28nbLVtwm+og3egt8Ao4tBpK7rxohFJVHYcjdTHv+hcDpQ/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UzH+RX2I; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UzH+RX2I"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-86a55400875so20083939f.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 14:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748034542; x=1748639342; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHsikEp0hoaPHHq7HEUUN56dIOFIBGPuhUpxjcOnZLo=;
        b=UzH+RX2IJQ5ugyg4Qm5lSfu5UJceFVWp8n+5jpWsCRpXH6nQfVzUqNyOAGssAKNmD1
         28zDylWpbKcWplnA29Efp3nSsQoRM7uOSSa/VGpsNF8iXmby5V9Q3jFgJVON26JoZU2/
         q6ZdvnyZfEgVydjIjxplXEpj6V+sIckKF7Z0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748034542; x=1748639342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHsikEp0hoaPHHq7HEUUN56dIOFIBGPuhUpxjcOnZLo=;
        b=JINW0lSBEwQSd2rTwEjlTiQIOHZx8HYynfBbuDD33Qmco0qyVXBA6vzAnpEAhwRKS8
         kIvz93CiqStqpWhFnGteteaXU6p0Z7TH/HAANjqEH5KXvfpHe07ZSzUBB3VEPxq65XJR
         cE1NLZMMqQXL2n02BuXjvfRar/MupB3JbEZLrarU7UCoEFiHOwXSg3EOCw+TowhaNl9f
         +cq1Zxu4WXkyjNWyGOPGGXP26lF+nUC1CVMoLWi6Wayw/zEixm+54Iqk4pG1UnJr6NqQ
         YNbEvpwCVl9gTOVJz6cdlPKlyUSHU9BY8ZmryrpyB/sjKCKPV2aMYFd3D+yJUv2hYwDf
         IsRQ==
X-Gm-Message-State: AOJu0YxoW6r8IzlcQR7BRWyUSMqjjOEmAUX3ipWNrT5ieolej2sIDFQJ
	ifZjJeFQcFpn7a694RRNPhfQxKsMS0zfnUsqbLTUo3ytpvhRXrtqS2tI1k2eRwSwZIw=
X-Gm-Gg: ASbGnctQuhsgIhC+xHHSdK9nrm0ombGHrB569LqgL1ilRBKs6ajzKjSYNkeZmvjZeRO
	NJklktaS44KLd8HGu01ym0o9fQ4uHmMoOG32s3oyvDARtEGHdaTbrWTgTod4wUhAeD8g5A8O744
	3FqA8e/4ZvLWpEIpTiUcVUvjmqig1Spn8ZMS7QkNRrRmECaaG5qGRHIiOukhP7kl4sK5Mz6dmD1
	Psczl3epQA9UJeB7jkTbUHC5w9OKVZxcdEgayd2jgnDl030ZjrQtBv4h7GbzjheY4frvLsyRnju
	+SHQcWyOwKqdFr5TUUTOj5a9tBlEpmyL54TK5X2beIpX7w5gmQqUJNJzO7bmrg==
X-Google-Smtp-Source: AGHT+IGBmLj6tWLPVP17kacCv1bkeh5vDkEH9/sWNCuGqF6TfQj4uoU0k1NisoF3nK/aBveUbZIr8w==
X-Received: by 2002:a05:6602:399c:b0:869:d4df:c2a6 with SMTP id ca18e2360f4ac-86cbb8cd7fbmr116734339f.14.1748034542354;
        Fri, 23 May 2025 14:09:02 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a236e800esm359673339f.29.2025.05.23.14.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 14:09:01 -0700 (PDT)
Message-ID: <41d3b11b-d269-4ee5-a118-6608c804e068@linuxfoundation.org>
Date: Fri, 23 May 2025 15:09:01 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] selftests/mm: Skip tests dependent on a binary not built
To: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel-mentees@lists.linux.dev, akpm@linux-foundation.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250523184312.2647781-1-khaledelnaggarlinux@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250523184312.2647781-1-khaledelnaggarlinux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/25 12:43, Khaled Elnaggar wrote:
> Hello.
> 

The above doesn't belong in change log. Refer to a few change logs
in the repo to learn  how to write them.

You can also check the kernel documentation - this change log
is way too long. It doesn't clearly state what is being fixed.

In this case, "write_to_hugetlbfs" is missing because the right
config isn't enabled. Test stalls waiting for write_to_hugetlbfs
to run.

You are fixing this by checking if write_to_hugetlbfs exixts
from /mm/run_vmtests.sh

Summarize this in short description so people can understand
the change.

thanks,
-- Shuah
