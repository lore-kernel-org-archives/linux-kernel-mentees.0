Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1511E0E1F
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Sep 2025 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759073178; cv=none; b=nW5/BHKT/lcdmp36bXcBhxTbLOBWdZ/3Qq5dD1m/zN4EPxnvXOF4dvDsJ848m2osYq+/CHG+tcCXT1WeAte1rV4+gxeqx1IidqRj5XeYxPK11AaZU6Mf6MOA/ECY1MBSSFV8hF/qsHu/qey0DVqvxBuBZRgJ1TijnqTPmGmTCFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759073178; c=relaxed/simple;
	bh=1ERQlFtiwev+93nGlX8WZAk0e2Z6jhL93QCIb0AGxZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gw6c4Qatek+3AFKSVMweVcJlxg1On8EjWZPzQTeikq1SmlwcwNEA1jDztOT884nMEPAbvKkfmWfVvllRZegqVDWe/oYU+x04FkyJaL73EU//gW0vBJeTcb3ZtiJdcjau56nEEPW4/Bml1qHoHOgpEg0E7/epw4NvccLmnarSwOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmH3LSqu; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmH3LSqu"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5a7b2a6b13bso3575942137.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Sep 2025 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759073175; x=1759677975; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5Alc4NB13gwKBoLXrQZ51wQV0kYW03eZU88Bc/twqo=;
        b=hmH3LSqubzxrn8xBIUpU+C1S43Um6fm/xqrMVaHzR8DcsXxrPi9Jp4ahuU/eLFDR7A
         T+mAxymBIkHZk0reT3j122cNGWw7eXOvEk9u8qnT1KWSv79BMn7gwf/h2MuzNnfj85B1
         uDwZy3nuEH3aaVHYNFO4zd4kS2vsNBSMQzV+MPCTtXovPRwt0xi8ch7wM1BKVM7GaFYB
         c9SR/lqrULOg/8HJ0EfS/e1XDQ2C0qmg4gBUu0d6exCmP0lHsI5nx5nb965K1fB/sU4p
         t1FEc0WYXkpIL4piPWqrs+6Ft2OUddi6DE9b8dNiGqd++QIYHIy6UXvwaCUC2rs7Of/R
         Jmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759073175; x=1759677975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5Alc4NB13gwKBoLXrQZ51wQV0kYW03eZU88Bc/twqo=;
        b=CHbVKVbVFukES4ZZPfeCfgAhYMiTOHyppB/5JW07ZZ2I2+Wb1egs3Nutr6reRb5Rwh
         avTXiE+LXK0IbzWqw4JMOzcNP+FBgVg+ITm/iRZMN3t7wSnRsjO0kWXolxYzcplC0syL
         NMu3M3gOfObj5Ywm4S+i2iYRLNVt6SzIiHeEbpPd46BLzAcFqqaQhqg0B83498fWmdPe
         e/u1AKHnKhyAb2HpIraR9LsUsNVrwqTcDz9YVpEr9+MGsjOLF5H0JkZV4DKiqN45HqO6
         PvDlF31KQORu0fOuPtNHhXRsw8iXd/ul8IMTZswuXFrvTcVZ0BQZLAX0AUbFlp3YY6d7
         ntFg==
X-Forwarded-Encrypted: i=1; AJvYcCUfx/dlkWVbLZG6Da39uyDjgQlO7by/KLLKEweeUAymXIpY9qVepZeRkeYjUWSdc3ktd+jxZ8BGMyrMMuS3py5ADpvDaA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6eGdYNijY/xMPVpy21MEJDTdgVrjq9elWpj0EpT8yYZ2EXrlx
	Vk/BLEYYmcr8T5ubrP7lDRDNZIPIqFYCwIbva23lHMyTnqlRSIN2zce/
X-Gm-Gg: ASbGncuN8GRH8HFCYmptXeLNnWKH7mYiHQ1WvngOqhtB/5iOWN7Wk+EeOAvU5w56InK
	yYYB0isaYrCV1fZBcATsnleHGMbrIpFr7p3unofJ5hmdzrOSljjmawIf53oWunvDJis6kE05/+c
	Uiw80i/9wVHjXADTGk2hcFNyc7UUoQPrZS75gDn8Ob8N9fY+yxMCm6qUKLli6kNhL1eqzGicL/M
	I0rvarv7+j3pccXIM4TyXr9SJeCrDrtH5WX4LUmrQq1a0SSePCUZdu575YhGMXH8/GOsegzaIOZ
	eqIWPSlay+0rqry6NuEio/QtvABwTLURf5Flaho5IYMyCi+bJu4mVbykmDj6V9HW5skl9Vq2K7J
	IdadrQMZ2bLRl2IITgD5LUdoZjTLqMkvKhABRwMNpkJoXrn5Fkw==
X-Google-Smtp-Source: AGHT+IGjMAamUm1kSVRaAVKwnIW0mikD0OoWVZOWVPr5K6MrIi8U/5ZZFDgThH3u0kobgv3zD5x7Mg==
X-Received: by 2002:a05:6102:94f:b0:523:4360:2b86 with SMTP id ada2fe7eead31-5acd046d79bmr5906381137.31.1759073175125;
        Sun, 28 Sep 2025 08:26:15 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54beddbb84bsm2008261e0c.21.2025.09.28.08.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 08:26:14 -0700 (PDT)
Message-ID: <03cfb82c-5502-4c0f-aaa9-05c4d1a4ae80@gmail.com>
Date: Sun, 28 Sep 2025 11:26:11 -0400
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix the cleanup on alloc_mpc failure in
 atm_mpoa_mpoad_attach
To: Deepak Sharma <deepak.sharma.472935@gmail.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 pwn9uin@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com,
 syzbot+07b635b9c111c566af8b@syzkaller.appspotmail.com
References: <20250925204028.232320-1-deepak.sharma.472935@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20250925204028.232320-1-deepak.sharma.472935@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/25 16:40, Deepak Sharma wrote:

> 
> Do a `timer_delete` before returning from the `alloc_mpc` failure
> 

Was this code tested?

