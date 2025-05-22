Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F647DA73
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 21:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747949257; cv=none; b=mrtDoGTdTk2MA8tFwvZztRnWeF7NjVe1uU58qhFG0fWmH6HsN/8N29PXJihn5bDw3Sg4X/ojeEiC6P0DngRBhR2TQt4OY3jG2sImAA3fy94nReBAq3LT7zba3Svjat7FxMWaCTXmwiOj3nlYqwcw9Cx1ZZ215Ykteph7MkbdlnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747949257; c=relaxed/simple;
	bh=mnpr6INuI/cGWSdGC0aPhOUbXzMBiTFczrqe4wiWxDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcoyMcFWmUOgxiHc9Swod4pPtid1OKdZTSiMQfkrjqZtifK5cSMwxR+GPSFeVkFrHe5odFB6QBG+XWgdWCLAtWpe8sQYtaQAhvKyrCe3lLMCSsb5W0s68CdzorRptfU/sFR3dC/dT/kJJZA5Ze4ZDxHDljAtrIm4yrSF2qiIuPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LAasMtY/; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LAasMtY/"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86a464849c2so11785539f.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 14:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747949254; x=1748554054; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5LAw2cg//rNcmP3BjiXQppUkP46hdY49wjLPrnMOFU=;
        b=LAasMtY/b5DM0MNxtf+K64MRLD1Iay7GBGnevcAwUv64jOLDoTked9mvCZk6isEPpo
         6D5WniSEXSNuSo3MOGAyTWit3pfdTNSN3BySKrvTEm24V9A7vpgmXWWvM9YrQ4XdVyHU
         yI+gQiJV6L/zTgLLsUS14bFD1+7U98zp/e0bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747949254; x=1748554054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5LAw2cg//rNcmP3BjiXQppUkP46hdY49wjLPrnMOFU=;
        b=LHsD2Xi73y4BDejOviHCqZCJvRqViNdTWApOpL8imXfMh0EN0Q3FXRgSwewuVMrffu
         wTEM2AP4lof4ENzKSNDxSxg7faT5ZsZgOJceMAw+Rzj5tqbx1xswNHkyGHTLPya4gEDd
         6Q6Ul89k2GoFlw7pCs6yMIVx1sRehpKW9xT5E1a9lR5bb33w2Etb4UqUQUF0XemWLOdM
         S4r/qZlnxVeFnjEu2vrRTxdB8PK2vlktr7uPSn1kURYfto/CTeqi1YhCc3wNCqdOF9sk
         ZJssdALNX1uq8sQRfWZvc0n0l2lEqeA7EQWF4XErGKvJ6wLhkEdMpccRbvZy+X9hIlY9
         hifg==
X-Forwarded-Encrypted: i=1; AJvYcCWs9SvqNANpm2B4UPcqYDOCrcPUMidyndOUFO2xQ0EmDDCTzMfY6qr9gse43i6RJerMud9fi5A17eHyexgDLsZcYaBExQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrnBUG2yI80yQr0edCMcbwEX+p7BqaqgSdn1dQN36yIH5h7wPJ
	z6B63qTEHxh2DDIQlDALc45glPE988He9FW+wjVsIXK9v4Y0G9FCy2xvMNTE8quRAiE=
X-Gm-Gg: ASbGncsYDbKKkoavdiU/gtBsPoms+ZDOgPw1T/CZ6+kid1cAGvlyLfmusNAYzj0AxId
	PJ6dmaLydfc3OJfLvprOhNsLq2+wea35N6ktwz3wzw9B4iNPeKhkBKYbnjS8hZjFS74ww5cfcwY
	GRmBSE2/2POL9NeayqQfPduT42icgD08vLmcNSqweu+TCictFJYH9rUkPg59kCJblACS2MtPX7s
	wzJE9uMXZPDiL1QBMBPfBqhgNPLLB0mSg3VE+Nsr0BMu7NS2XK0/NY8AeczXQ8Y0xo3j7czfZ4s
	IMfXM661wteXrakGrxOM1iY8jmY3jrC7PLHPxC1qV/OTX47EGKNo46vOf+eNRQ==
X-Google-Smtp-Source: AGHT+IGYqTZwAOxSAwQ4MLoRuJW2OgxBpFdPfc1Yu/NwmS2TEYIdKzXmQezEmiO33MvZvH+Dx3+K+g==
X-Received: by 2002:a05:6602:2351:b0:85e:dbe3:137f with SMTP id ca18e2360f4ac-86cad951849mr123626439f.0.1747949254440;
        Thu, 22 May 2025 14:27:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a5a0sm3313676173.25.2025.05.22.14.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:27:34 -0700 (PDT)
Message-ID: <3a73cef3-83f0-4e26-b8ff-3c289a7cd52f@linuxfoundation.org>
Date: Thu, 22 May 2025 15:27:33 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: size: fix grammar and align output formatting
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, shauh@Kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250513214438.300430-1-Abdelrahmanfekry375@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250513214438.300430-1-Abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 15:44, Abdelrahman Fekry wrote:
> Improve the grammar in the test name by changing "get runtime memory use"
> to "get runtime memory usage". Also adjust spacing in output lines
> ("Total:", "Free:", etc.) to ensure consistent alignment and readability.
> 
> Signed-off-by: Abdelrahman Fekry <AbdelrahmanFekry375@gmail.com>

Did you run checkpatch on this patch? I am seeing

CHECK: From:/Signed-off-by: email comments mismatch: 'From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>' != 'Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>'

Please fix it and send v2.

thanks,
-- Shuah
