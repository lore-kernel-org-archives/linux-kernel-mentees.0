Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DDD1A317D
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Dec 2025 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766674697; cv=none; b=WR7h+2fpT/hAWxfEb53onxCXnYMPKcw527ZSVdhxo/qBJfEvdDyE1TsNH2o+ZyFNmjrdcuhxBnaAxuguGcIuiatCyk5nx48Q+a9t23GnbSe7nHaRkGiNd3obY3zadBpd/iMcvXYSFjPxJ1FzKCCQ617QpMiE+3T6M3jkCYcWIPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766674697; c=relaxed/simple;
	bh=jhTPnm3oFKXz+ipm0uIVJtKtcYoNuBr7fAjHpdYN3Hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RTF7jh5oB8oj7kT4wrrSkcDatWeByG8GCbNNlo1Kzs6dmj8EFN4AQAdos6jL7WJjstLeyyf8JCow129Oq2UHW4W2JxrTjNGaXkdXp/TsGHJvRBXeiTNzBS7CjqJsiEybMjBmYqP99AQlrh3TIwHBC9IYGKqII6bIyz6oKdEAiNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ayphrxpz; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ayphrxpz"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c6e815310aso5340327a34.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Dec 2025 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1766674693; x=1767279493; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hji0XicsQUErLbiGDeZxt0h7DdgSYTr09a/lmErjN3k=;
        b=ayphrxpz80ydUkAc8hRf3uWXG05KrL3sAzVursFA9EN1M0YdphuwRK685hcQPsj5fs
         yWCkr0QqpawSQuNbHjhBbWPdUsaRskCoZ7ZL3IIx9CwVpul29D5uWDUMC2MvW5nxZFGf
         VOPMYWVdJ4tWuBVBGmoDd0aDckePKrF8b7bL8UhH2aXlRuGF7UgK/NxVKVAAIk5wq3PV
         /fGzuCLd4fv7NX3Ar6o2eJwJXgRwkMXl5LTV0nvR/CtGyYkd88yBAcf8arQUVTBk950S
         u4kgIFyIiUWivxWksnvMx6tD4f5Y4n/EipcOqny3CLHWfp6+l9Z87Ui946+gj8c3uhfQ
         VZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766674693; x=1767279493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hji0XicsQUErLbiGDeZxt0h7DdgSYTr09a/lmErjN3k=;
        b=NRyhsgJWEsVJ48Bfl5J0BOIy5XA6gwetVq3qFNSb141Fwe4dUc9ggamHz4/InE3Lba
         +L7gzqLRohG+QDXV7B7uSc6g4PZgd73ZGWffat3MVNgfS1Ere3dx72fMfzk0bpDCA9h1
         yLFxmUqwuFcfwVhtVPnRVvmCTGrMEf5BX4xhzme5GIa1RXIGRxG6z7ihdFgspm/aJVgs
         mEgs2Jt7KwO4+BCpafKKpbZSCD0LWhWE490TRPl1lkAxhPHovRpfnDlV2P8KsisNVsbI
         ny8oAuiaMwKfEfXy9I4MNPn/UV3eX/XLewAfWm0MjpmSf/cP+YHnNB7xljLczGSCuirt
         oboQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4IfZ0NjjUOH4W2VN9tk0qyFodoJ9wJ/zvLebOsw93/krTzW92E/B/SpsHZxfMHnV5sOM9b91U6OClXIIOtz+GbkCDhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywke0GJAASpjW5lIi8uiW4vTTw15qfYWoZz15vmLmxErIAwNrN1
	k5F2MLIHiPpMgaqQTo2o5TmrdoBcm6zdMeSfn02eRCh+6JbOsiwp/bfaOl7W7/4HIxk=
X-Gm-Gg: AY/fxX73sflcVaVcAuFGZDqjEk8f3N6QEuxSqFWg/dby0f0u5/PK9sxYOrWm9f+Sv8t
	GNosJEjLXv04+/1AirZJZsVGXh6UrrfMVq1sVqU9+yigrD5WRd4I4dE259tmTzpKERTJQm/MEQ8
	MVTH/V0Y8zC7TT2cWnFL/RmbXRSsoFNBHwIMkEAZSVyguaKXxmjb8KwjgusF37tIc19az/EAFF4
	yH26JIOtGPUO+v4jGeWwZGY0wsTKApl80wi6c+Z1W9qh+EqE3SNrervbBnen33JUvdHKnmPhdbx
	JizYL3nvsBKIulxMrFI4gLg2yn5IUMLMQS72uFk8b5VcE+/o8WAe2P8vk86r03DeQvEwmYLTb0k
	MD+UAC5jp+O0JSbTv5WR4QkXdAyEODCNw2q4sQJPD0XJq92A9dGnAf5mHO/VYqqF3ZuzsJtYt55
	FmSbP3k8RQ
X-Google-Smtp-Source: AGHT+IEl06568X86BVzNgKQ7sr4wYLSEd+yHkAPiNbCo94xUa63OAJFZtsNW2hDsBmep5OZidthgGw==
X-Received: by 2002:a05:6830:410a:b0:7ca:f50d:b2fd with SMTP id 46e09a7af769-7cc668b669fmr12509788a34.13.1766674693021;
        Thu, 25 Dec 2025 06:58:13 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667ead3asm13308380a34.20.2025.12.25.06.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 06:58:11 -0800 (PST)
Message-ID: <564afab7-a894-4da8-9980-7d68a0a1babc@kernel.dk>
Date: Thu, 25 Dec 2025 07:58:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] io_uring: fix filename leak in __io_openat_prep()
To: Prithvi Tambewagh <activprithvi@gmail.com>
Cc: io-uring@vger.kernel.org, brauner@kernel.org, jack@suse.cz,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20251225072829.44646-1-activprithvi@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251225072829.44646-1-activprithvi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/25/25 12:28 AM, Prithvi Tambewagh wrote:
>  __io_openat_prep() allocates a struct filename using getname(). However,
> for the condition of the file being installed in the fixed file table as
> well as having O_CLOEXEC flag set, the function returns early. At that
> point, the request doesn't have REQ_F_NEED_CLEANUP flag set. Due to this,
> the memory for the newly allocated struct filename is not cleaned up,
> causing a memory leak.
> 
> Fix this by setting the REQ_F_NEED_CLEANUP for the request just after the
> successful getname() call, so that when the request is torn down, the
> filename will be cleaned up, along with other resources needing cleanup.
> 
> Reported-by: syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=00e61c43eb5e4740438f
> Tested-by: syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>

Thanks, just missing a:

Fixes: b9445598d8c6 ("io_uring: openat directly into fixed fd table")

which I'll add when applying.

-- 
Jens Axboe

