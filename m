Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4263B173345
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 12:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008459; cv=none; b=Z7dkuLDRJBfKMpcsTn3hi5jcyzHYCiu0J+13vJnksSRnsszbuevDmj4CkEMEZ++eRAdJ9JmHKXUgzCyPO0PH0FGyTitQUVKvQPiQy1+HSUwZuVgnchrsAJPQGFp4oQlDxZRyWtVPLX0LsETfSnW4HjOrVWXhFbwuH+MDhJU+F9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008459; c=relaxed/simple;
	bh=UzhSJLrAAaVzhix69nz6ze4N4/Ma1caSC2pokEUAa84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dnz10QYwA+Ur/wqvKPjlkif/018XZvWAka85vLDLlGfPy4Ur7aqji5YJpHRRKz6Q/S6Izgmb4zVNJDgqwJznUSdR4WkNL3OU5k6lUfIEH3PjVUJ3eL3SGHv/MUCcyduIFVynfUn0mxkoYStxIGKs0g0zfzpJI9Af6a9ZBRjKMiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ku99cTR0; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ku99cTR0"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA948402F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 12:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwL2jyQLE-3I for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jul 2024 12:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6527740385
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=kernel.dk
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6527740385
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ku99cTR0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6527740385
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 12:07:34 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-72703dd2b86so577390a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Jul 2024 05:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1720008453; x=1720613253; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TNvOhfIc2yfdvb4PHPTjUfHyhfdjos3tRQlobticP4=;
        b=ku99cTR01KHtvgnw4uHHX5NCcLWTgY93ak7FJKLW6LLLi+oREBQm80eLTbqTacBtB6
         zUpl7zN7LY75hbp8CIqDgzk3jTNV6jmxd383fnwezworg/7/WSSXoUPZRLZPITKx3gTl
         HN+5w0HI+EZbk6yt54cVAQi9X+1Dt5VDXm0/y9TZt+P17gFukYkbxwUG6OY18Fi2cJGy
         2OXC6ZQsKW0w83gdo07dX1Iphi64adftzxHt9YUtSXPXGvQpqoWXJX1uFj52/M7JdhaT
         /nDce3557q8g+OVGYqEAHCt2ilWmvO6g12tOJFHJIQQ2VtSRfOGh60QvZgNyfRYNhxi6
         +91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008453; x=1720613253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TNvOhfIc2yfdvb4PHPTjUfHyhfdjos3tRQlobticP4=;
        b=VLzcYzEYzgZKDg2UHiMhSSIQKsDsR/+K2NHAc9SnAArvSCGiUmBwA3zEhRvq1UM15S
         0a/dj/SUKtggHOoh7eDsjbaMEQ/9HHGGBUDVWSIgMT1o0JkwwLlSysen5Oc7Jq9FJQ5e
         LU5wGg4Zczr19qJzRwOUy80AubXfqhDrkwslPPJLzQfaoj0liThNimMcVWR2d6Vwj38l
         Re6vpRhVQoCxOlF2i4LIfxQG455iZqAHrfRihoCxVtAq2fQOwmKRJ8y5gtE1fuyOqRgE
         Y9V5yrS4NM+BHiDNK7wTVyLw2dfY8EW2dn9jC7uwMrxLdwVREAUMLURtbMUxKbU6fZJh
         vidg==
X-Forwarded-Encrypted: i=1; AJvYcCVwu33VAn0DloRSlvN23YeJ0+oelCx9SQ1uSPxg0S09qDaHP5Wq2ShZdXAV60Ash6Kp3cihaIAuGZJXCzAPSZynHaHMo+1px4E+I/6uTstt0NPqPbLS7v3nM74e+DjY
X-Gm-Message-State: AOJu0YzPfd8sqtn/ipoNgTaS6twF/SM5K73i+MwLr5BK9N9u+hQBSGfB
	U7DrZP8GV+zjhbvyFRYHU3w/WfQS4x1dZsHRz0S+JApmszl40ZtVLN1qaK/+gT8=
X-Google-Smtp-Source: AGHT+IEonQEEjHC/MKtuahfaFi24H6Y994t8PTFisf88hKWdWgp+qN0nMVSFEoJhiJZ9MIiZbihGfg==
X-Received: by 2002:a05:6a20:da92:b0:1bd:a048:7fd4 with SMTP id adf61e73a8af0-1bef6296969mr14833140637.6.1720008453437;
        Wed, 03 Jul 2024 05:07:33 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70838a9a188sm10069043b3a.131.2024.07.03.05.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 05:07:32 -0700 (PDT)
Message-ID: <25b3b412-5b9c-4b53-b084-4b4cc8b60f90@kernel.dk>
Date: Wed, 3 Jul 2024 06:07:31 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: Fix WARNING in io_cqring_event_overflow
To: Pei Li <peili.dev@gmail.com>, Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+f7f9c893345c5c615d34@syzkaller.appspotmail.com
References: <20240702-bug9-v1-1-475cb52d3ee6@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240702-bug9-v1-1-475cb52d3ee6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/24 6:48 PM, Pei Li wrote:
> Acquire ctx->completion_lock in io_add_aux_cqe().
> 
> syzbot reports a warning message in io_cqring_event_overflow(). We were
> supposed to hold ctx->completion_lock before entering this function, but
> instead we did not.
> 
> This patch acquires and releases ctx->completion_lock when entering and
> exiting io_add_aux_cqe().

Thanks for sending a patch, but Pavel already fixed it:

https://git.kernel.dk/cgit/linux/commit/?h=for-6.11/io_uring&id=3b7c16be30e35ec035b2efcc0f7d7b368789c443

-- 
Jens Axboe


