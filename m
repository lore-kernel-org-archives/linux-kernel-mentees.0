Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B281E502
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 22:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758581857; cv=none; b=Iqze7EZSsRiaaKm8ziCuGD2dl663TqmgfC+IRQlyfcqihNh7zj7WO2WMj91ESegRCwQzj8vis9WIyy97sBdUyk6WriLlrAIFZ8Y82Vk51eZFDpZovCNmFgJnnFItq+RbwbzAq3NURgqKkIY+fAJ9hHRRivfyGz6ap+Q4tmJOy+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758581857; c=relaxed/simple;
	bh=wJcpJFENZM3XJoASue2WgV0KmkWQXXkTgGWB1tLNT3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LeX5OC4fgxc3xAtF0i34bmC8cA7Zr5AKORbqKesZBg0/6v76y+w2pBJFb8ojCtaG/3HfT7K7gkqY1GhC4DgUccQdSlVoZKz4o5JSPZeN20ZZelgzq4HWAFFJeK3uHh1WhiPCXymLvtMUWWvvQHIMgPvMJGpClvcAjp3cUq1MZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsguRKkv; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsguRKkv"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8e1d6fd99c1so1479617241.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 15:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758581855; x=1759186655; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PmeTUZt1oKPH7ak6kJVKMIBti4fjRyL0GgGscNM+JY=;
        b=IsguRKkvFCiRZ44FC8bX9r+enEb6D/z4JG4Lx7FbL2wnm7ym8R/IxBEk2jJPFbAD2b
         4teG8EE0ZmQCLopf1LIcs1MJxILgrc9LEmZxeIUM7yZQb0gtLA+5fwHRGJyT8bboYQDy
         SKwibvg2DDYwle4xmjFWdh9TJFNFw328iezZMK/cyDgC2v+qaPnapLMijFK5HKBpx/ZC
         89xw8IL6ieMPYJ7J+wpnAyj5l/tDl/AfOxN8JePw1DrVeexcA1iKtcOXnyT/u1PqH2TB
         CFsB/D15AlJjZ+5No2adnk83XZkyb78FQ8UGoOlhyzwhBh7ytdOedSMrfHDex3Ih0QW8
         iM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581855; x=1759186655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PmeTUZt1oKPH7ak6kJVKMIBti4fjRyL0GgGscNM+JY=;
        b=iRm0S6aaUXBN5j1EoHgZpreNBA78wGF2cc7vAHf2J48VJtMglBpfSUp0W50en+NbLa
         KHgN2JPWIqof6/q39QBbxKQi/nQp7C8A4s6NQok21xIODqVOizWberjbPs93VObasrmX
         BfHSPzH0FC8cwhIYOxQTYRbTmfgvNGRrfYkkRb+EvAV/Q+ZL8Q6u9kln1vcC9pddH02J
         m1Mh1k/NhJtCzGcRlioMmCzPz5RYkqtVhkhTBJDI6MIeqwStpcJM/bOP5q/EdLhXk/BI
         DATgQPApTzYB5CFQVW1Yci82xOs4zjZfcRoz+ztBMGTG87zXMo96n7b4+HqpbXozMEbD
         GLEg==
X-Forwarded-Encrypted: i=1; AJvYcCVy4AqR6247zbSjdO5kzlRCtyAd6AELxH1TJWTiX9mtkppE4qvD5vOS67/YCatVSEjFfzfAR7VXJciYCQ2x0bOzmZJ+wA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjrYlioYTdpkA7k8f+E3P3wkIRGLVtMxdo/B50eVoJpp17sFw/
	PnopsRhsr8M2vRj3OWhkAL06n/+IDT5Vd+BOJbZOCwObdv2SPYxWcCgc
X-Gm-Gg: ASbGncuUe6KA7TW1OqstItl4pEPMVR8iAzwuOEoeGINCTPdqDaghNh15qhAV2vDuBuM
	njoCw4uFrL6i06xlQgYhIxfwCBU3VWyhbfEUq01Ewc5jRlJNTbKgscN7mZYJCqYP5OMCa2no3t8
	H/RwKrEIjre3FUBVge5eq1FIOrv6pORoc+cj5Rjf+c4SfsiQ5pyU0n0dNcUfkFMF2+sKQ+lRaQC
	yuwDQ4JaLgT6qp8Hj7Xj38uNsjKqaVXkjX/lTvctaHpYuwIwmhBgg7BSp/6IlmizjTO0RQh8JhL
	zqJwpzG9OkoWDZVjTOTD44E4ypgpj4ojwaapwRlCqaZCcVfMHPZ28k373OljXi02W4lBbEVMNqU
	R8RwePlsUx4cdMgTYNvjfYjsvvUIwOyWFoFV5brY=
X-Google-Smtp-Source: AGHT+IEvT9aPO8VQeqDviuBf3xOmqzdNdU8B4VMjX/6iETFgk5faqYljbrRsv10VslcAQOzyPiUIlA==
X-Received: by 2002:a05:6122:3187:b0:539:1dbf:3148 with SMTP id 71dfb90a1353d-54bcadf84e4mr233297e0c.2.1758581855238;
        Mon, 22 Sep 2025 15:57:35 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a72974f24sm2963990e0c.19.2025.09.22.15.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 15:57:34 -0700 (PDT)
Message-ID: <29f30ca3-cf45-44fc-aec7-1db6f9694e5f@gmail.com>
Date: Mon, 22 Sep 2025 18:57:33 -0400
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: Fix Makefile to run targets even the ones in
 SKIP_TARGETS
To: I Viswanath <viswanathiyyappan@gmail.com>, shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
References: <20250920041914.7253-1-viswanathiyyappan@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20250920041914.7253-1-viswanathiyyappan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/20/25 00:19, I Viswanath wrote:

> Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
> ---
> make --silent summary=1 TARGETS="bpf size" kselftest
> 
> make[3]: Entering directory '/home/user/kernel-dev/linux-next/tools/testing/selftests/bpf'
> 
> Auto-detecting system features:
> ...                                    llvm: [ OFF ]
> 

Hi Viswaneth,

After the "---" usually the change log is placed. The change log
contains the changes from version 1. Also if this is a version 2 patch,
it is best to note it in the subject line. The v2 helps people keep up
with which patch is the most recent.

Thanks,
David Hunter


