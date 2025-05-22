Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563E91C6FF2
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 21:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747949229; cv=none; b=LVfaG8XQhOu+fkxKLYmpqoalyhKDtHZy+hoG9SC4iVgrM29KiWO+Kihx68Ze8Njz0RZUdswvHscyN0uBRJb1cAL1CdBQWrDKQk11PQYlXAfltSgZcq+wQZSxQcGZxApKWpQVDOY9Ev2KkwuCJStadpG4vwce2b6gCqGGENBVw8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747949229; c=relaxed/simple;
	bh=us3iKQhRkalRsD/BdhzsJnzgFym5+0ASy5QVjxwWNRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=so23nHhIXhDP2ualpYteIzdU9GFMMSUKGB4sD632fWSsgqiw8r9wz9MX4shrycc/VC8FSdEDNgrmlH+N+8teOnvJiFAxn0CpApbklgcyLQiQrJrkpExwyLbpg5VlDfS6zMhUVtW2z7zyymAL4+rkqzU4kmNRF4Ub97joEdF2nZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q81JaRJK; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q81JaRJK"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3dc82baf4eeso10612625ab.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 14:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747949226; x=1748554026; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPrRYdkJWlMyJE3e8/1vBPYSRNP9akBhDsTfTw7hzKQ=;
        b=Q81JaRJKf9FJQuB01L4C/lQsOnazCsBCEhPBVJC+ZYBsoekzLdBGRuAxHdlX1jX7Cj
         kpQrYEDy7+RK7E7//KasmqydMrI0OMpgV4TY1tBbuLR6fNUq1OiMETVPfdVRIfsoWiDS
         zKUTujR8BDYPt4lNyeOW5oue6NjvFzKd5bmts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747949226; x=1748554026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tPrRYdkJWlMyJE3e8/1vBPYSRNP9akBhDsTfTw7hzKQ=;
        b=JP6An4Xj2YKadvIgwUEKpcmfus5hR0L7x+O6vet+C02ISAhPFzXda+eFcyTKOm9ew7
         T28vbi4OQYHeq82mx7OczFTydIO29kJ+NhorGhMMzPy5Y4y0mp3EFt/6X1/KfiuY1gdQ
         gXvvt4HFtsvbarOZrwPHrFdDVhBSTEIJvlQH52z+sEY6eTnMAs+hdZE2D7gjYxfuHiOf
         zB7cAOYhbUu/EXCvXmI1mpHHGYcD9vHoSXAdWb8soiPKO9HcUbLDcdGCdW//PB+p5NHK
         P9R2Akbp8QQHBelOU9zttXvAk6WivrpHUZn5XF/PH0nN1k4d+i6Gihf3VxB9yORux9Bv
         lj1g==
X-Forwarded-Encrypted: i=1; AJvYcCVvjnsGNgLAE/9AhgFtHn/7d8BjrQUwrCeKCLDtEMDX6Nuy8OfQ5+cx3+bteY8f8Rbi1AhXNube/EP1U7nNKA1OoSd5pw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnaZ7mP9CT4fnHCCELg+mlldS/zNhFqpyabhgT+m4oI9mQR/qr
	FmAHjY3qyUilgU5yhtFwjSagWnj29tg/CybkPLyhJac5XO89XORmSIUp406lTMrIVs4=
X-Gm-Gg: ASbGncshpNlhi4tuI21IrXHbWxWG8wVc5IIEyZ5jBKvEQLcr0WvGf6tbfTuihT8CgzK
	kIOfeNTGZ5R6RcC3nHnMKd/qdWmO/iHpKejSymb6aLdIhtwOSZGKXB4szCsncLdprxMUmRlV8m+
	AxjVKFBqzZ0/+PlHfqYRHk2MRmCTpGJM727EBSOd1shndnCuZWEyl4qAHgllyf97nZv9UdYGDNI
	4h1QPhWD0QmMLDTDWl5woWYGTMPbV7gtpzfCwhJPAsizumCoZtUmSNQiSElZWoEj+5Dem67SY7a
	m6mp2dwirBk1KFzPXg4pAHI/iIKPoB90I9IhsttZwpiB+Qbk7v7EY6MRiw7vfw==
X-Google-Smtp-Source: AGHT+IGF9kkHq2D7sAhTSbY7gkGLf+579rCp+JAYlJuNdBfKaUKaUnINA0WTF8k6WQgBZE7m8pZOpQ==
X-Received: by 2002:a05:6e02:3181:b0:3d8:1d0e:5308 with SMTP id e9e14a558f8ab-3db85737862mr271861965ab.6.1747949226326;
        Thu, 22 May 2025 14:27:06 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4b3b55sm3280486173.131.2025.05.22.14.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:27:05 -0700 (PDT)
Message-ID: <e2ad679c-7c68-44c1-b4fb-20b3d02a7c35@linuxfoundation.org>
Date: Thu, 22 May 2025 15:27:03 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: acct: fix grammar and clarify output messages
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, shuah@Kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250513221426.303691-1-Abdelrahmanfekry375@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250513221426.303691-1-Abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 16:14, Abdelrahman Fekry wrote:
> This patch improves the clarity and grammar of output messages in the acct()
> selftest. Minor changes were made to user-facing strings and comments to make
> them easier to understand and more consistent with the kselftest style.
> 
> Changes include:
> - Fixing grammar in printed messages and comments.
> - Rewording error and success outputs for clarity and professionalism.
> - Making the "root check" message more direct.
> 
> These updates improve readability without affecting test logic or behavior.
> 
> Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>

Did you run checkpatch on this patch? I am seeing

CHECK: From:/Signed-off-by: email comments mismatch: 'From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>' != 'Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>'

Please fix it and send v2.

thanks,
-- Shuah
