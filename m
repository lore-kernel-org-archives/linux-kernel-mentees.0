Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B6B331206
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Dec 2025 18:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766599322; cv=none; b=mqL5vLlz3y4q/dFQopzOx44h2LOVo9jJT/W5ZUG/OnDa/KJ2EnX2bFw92jhBnHnDblcK3fEZFOSbnNciNjqN0eRnYHWC5Sn6/EJgaeQqZJABCB6Nv1uRX8IE+PW8V5xOpbuoEcLADprqI/OHNWh6uUorg/HDsKziS9drpxmT7Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766599322; c=relaxed/simple;
	bh=ffr8BuiqR1HXDARhf4WRKjYaZRBbwe/ETGa9BNLzfkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGe08uY58rwJv+06yM2rvBbXyl5Sxj/h3I/ujwQosr/AuVCtyv0yC3zVuBvgdosLKX7aU7+EO+gEazuCvKR8aSISdWpZY1eANGaLb1bBmQdYpfUnYHV8xa3crJ3ZrDxKTfzWVzCRsudXrMtly6YlvFFeiSR7uQ5MvZRJau6qzp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=mEwX+j44; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="mEwX+j44"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c7660192b0so4007596a34.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Dec 2025 10:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1766599318; x=1767204118; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31Zv6z83wAMfU9zE8KFoguUGkPYnxjQorySjBsQWmUo=;
        b=mEwX+j44yU6JzYzBs7Q4aNBjYhqPZLnCKSM0DQ9qVkNHkY0NfmI+/qygtDXK8Xwu00
         zGrAjdaCy9heq52hOZwu66syZOk4ktPejMm0RuxWyBewYOR45+Zwarx1Wxmwb/NnQxvb
         kPyLbnnrOYw3IZUWjUQPJh19rAnImiuZPIJ4Uh0HrZPyi0F73kGkWoYOJOCJQrM4NO5X
         UqtNhi3imaEp6GdEmSsjdbOxEzT4GpKT3bQCHbLYCnMwzFJfqgQB8Quo/Puco75qT4rX
         1LznoSw6MR2+zPJQXM8+cIvfN3jWs2kzOT/JZhwfEryVjrE3Bztmfoik5airrP/I2Wop
         oiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766599318; x=1767204118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31Zv6z83wAMfU9zE8KFoguUGkPYnxjQorySjBsQWmUo=;
        b=w9PqHFt0tqKqHP8/vhTpbxPPXx/BTKiCl8HcHO/NbqcYSF89cTFi3bB0bLoTiCGbj2
         kCB+K8+MnnIWf2bLvwZz9UNQNcdwQ6MLt8jvS4M/UD9gw8//Pm96ruhXgV6xqfkqzaaK
         o3gcUv4S3Irhz+pMiMwhT/NKZRaJ27BzmJCSNag2uZo08aZxCajRGMQGit1lyxTSlFSW
         /MBElOTY42TlvmqwiTmo1THF6lk29uRE8eN8YCsTan6ZKZtXA7okHtq29ZbvmfyD1A1u
         g9NbCNG68xskanfAxDj1ZH4snSlAjWu7c3mP8DbdwbdKZAwFHYzBEJOo1p9PP/SOjEzM
         kd7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtGru0U4fiO5G/+e7mtNIH5czgSO1mVE4n/ydEf35tlJyFfFCk/KByUkbPiPp2DZrQzvroqiQFYs4sbBXOLDYQNjwmPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIZfVfyrHTkoj/EQyhK4l9M9S4SmPGwAf9MVKRWANBE0JBhz3k
	SYxflKS56HpRIiZCzI8G6wTKj5f8/YSUtOHwrahQCdwR4+Nj0ONg9FVovRyDplJ5GWo=
X-Gm-Gg: AY/fxX5n/Ah6mIyu1KYBSNm9ElJxB6hGFlbRo2pb5UZIVrklM2QAQABoJh8/yByTcy4
	g73Fh/TG9P4Z5NOZ4pn7tgbmKhcp4F60nlQEIcDEYhaTUfxX0+RkD1SpX76Bnly1/hewaIUw32w
	o35E2FemvwvLBxySG3P9vlTf1OxQslYcV6mIReGFhmAtlnM7Uwa+EmCbR6DwUKc5A7dZoqLuQym
	hWDxDJZNnBaiH7Lw9Ps42CtkjnUdMsJUDHziGiPMhYiqxn5RL2aiOCOukas9fNA3NHczulXDSyP
	GjUM4kcC5t6Gyx5r6D+OkgvtK6YNbBHeZLRWMz+wxU9X8d5Gfo9COUkG2COJMGCFlvaIqw/KtWJ
	B9+gDsDFiJXS1epi5QNnRXdzX2xfjEImXl8+t7NZCbmakLN8WSTfwLV9/9Lw7vHuJkUY0Jz7zDJ
	z1nnXmRzJ5
X-Google-Smtp-Source: AGHT+IGfEWIgxDSU+uANNE79e+2413xwqBZuFut4L1sp7glYjUDAwIPMADbg+343p4Lu36fqv0j2bg==
X-Received: by 2002:a05:6830:2546:b0:7ca:ee2d:fd8d with SMTP id 46e09a7af769-7cc668bb2abmr9050695a34.9.1766599318375;
        Wed, 24 Dec 2025 10:01:58 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66645494sm11921405a34.0.2025.12.24.10.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 10:01:57 -0800 (PST)
Message-ID: <dc51a709-e404-4515-8023-3597c376aff5@kernel.dk>
Date: Wed, 24 Dec 2025 11:01:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: fix filename leak in __io_openat_prep()
To: Prithvi Tambewagh <activprithvi@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 brauner@kernel.org, jack@suse.cz, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20251224164247.103336-1-activprithvi@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251224164247.103336-1-activprithvi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/24/25 9:42 AM, Prithvi Tambewagh wrote:
> __io_openat_prep() allocates a struct filename using getname(), but
> it isn't freed in case the present file is installed in the fixed file
> table and simultaneously, it has the flag O_CLOEXEC set in the
> open->how.flags field.
> 
> This is an erroneous condition, since for a file installed in the fixed
> file table, it won't be installed in the normal file table, due to which
> the file cannot support close on exec. Earlier, the code just returned
> -EINVAL error code for this condition, however, the memory allocated for
> that struct filename wasn't freed, resulting in a memory leak.
> 
> Hence, the case of file being installed in the fixed file table as well
> as having O_CLOEXEC flag in open->how.flags set, is adressed by using
> putname() to release the memory allocated to the struct filename, then
> setting the field open->filename to NULL, and after that, returning
> -EINVAL.
> 
> Reported-by: syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=00e61c43eb5e4740438f
> Tested-by: syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> ---
>  io_uring/openclose.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/io_uring/openclose.c b/io_uring/openclose.c
> index bfeb91b31bba..fc190a3d8112 100644
> --- a/io_uring/openclose.c
> +++ b/io_uring/openclose.c
> @@ -75,8 +75,11 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
>  	}
>  
>  	open->file_slot = READ_ONCE(sqe->file_index);
> -	if (open->file_slot && (open->how.flags & O_CLOEXEC))
> +	if (open->file_slot && (open->how.flags & O_CLOEXEC)) {
> +		putname(open->filename);
> +		open->filename = NULL;
>  		return -EINVAL;
> +	}
>  
>  	open->nofile = rlimit(RLIMIT_NOFILE);
>  	req->flags |= REQ_F_NEED_CLEANUP;

You can probably fix it similarly by just having REQ_F_NEED_CLEANUP set
earlier in the process, then everything that needs undoing will get
undone as part of ending the request.

-- 
Jens Axboe
