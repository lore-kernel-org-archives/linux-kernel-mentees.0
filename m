Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF3829BD91
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 16:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763223154; cv=none; b=WqUrYRMXjbvXl/C2OcLzLw2osv9hZe4j0BiCP5ZL2CTjhaUw10qv5noSmcspUr3//WC0Ze/aohPStLwaKhaLpctRkGmMzIaaxTmA3zF2MmMk9ygdU+r2xog4iLzbxSzEsVRBU9KUN01bjCFCR5RO/DNYpO9hWxEqyI3nB2xVwQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763223154; c=relaxed/simple;
	bh=ZnpkSR77rpxwOiypBKfNZpIP5HVzuOahGXkvMl2mC78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpAprKrYvPDiXbs0FtKFNHvrssjhgZ0M6Gg2857NkLa0Vrm8pxWmpxkU/7WwevMRvEf0DKWr+uUK3fuUzUTZv7MDEZcTlTZ0k6bmGlqMnuJvo8gVqLsOcqWVp+W27tn/JTgkSFJwC3NftpjxMOanupVKrXaGGCk0m3Qt3nZNYGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ij4RF8aE; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ij4RF8aE"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AC5340159
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 16:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKEJtDl6-GRD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Nov 2025 16:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::e29; helo=mail-vs1-xe29.google.com; envelope-from=david.hunter.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF229400C4
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF229400C4
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ij4RF8aE
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DF229400C4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 16:12:29 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-5d758dba570so1151551137.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 08:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763223148; x=1763827948; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y4ZZROaO2AtV1FcryfogKXlOY1JjkeOo1Pb1PB2vqI8=;
        b=Ij4RF8aECN41Dr31YFYTTBDyxc66qfWwGnnCy+K/Es24fpbOk3rMv+W25Aj3VtGB9s
         +SRirf117NZktNxhYjxZe6NF+jaK6v/5U2oJ6XQrGwR7EIl0wkXYlW2yTuY0DBLOLEHV
         +TZc49bqUGyBP9xXVfwBVXGf+HnrVl7ng1oKoz5zDmLRz0A3eSVjQwIfY/0iEQJwglg1
         K9eV2xVQbR48n/kXzP4Od3bt//uDU5keV7cqylWeMUKh+0MnFStemOD2C53tktWXD+oC
         IzOCMizHTJKysnQ3iae+H77xnJSzg2PWeAnpiquucwJx668h5L6VtXVbTJcHiZKHQsnP
         P0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763223148; x=1763827948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4ZZROaO2AtV1FcryfogKXlOY1JjkeOo1Pb1PB2vqI8=;
        b=iLjQf8LqEf8mGTc6WSoysxqzATFh4xB+6tCi7YGKapr3woW3sekWeIEZN8hT/J2DrJ
         FnfgtjXNZXxQfNSrJ6HlMVN4+PJOt+czmUNNKgJD1i7CscUCqOv3u8RiM4nmAieGUB5K
         kGd9DCGMsdOIkgihwWyuOrutuaUpeQFYjNPWNTL3937xeqle6MZSvYa1dsUgYJsVhn7z
         EJhmuS2VGPLuCzihgQRp/YV08SOCRPwteHZiO3IoQAPbPEF7YQSn7La4wJ/tHqmunE5P
         C0KZGjIWCjHz5bOxib/PZxJxts6m6vtLqqJsKxH1fqgBuygHWyeE4EEFUMVP2h7/97GW
         zG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwSbZZniY73bGv8qFkLoHLT7ngB8d0fIsN7EVKTa0Rd3MB9yrAwJ9LAaDyC33DU8+AjdRctwkaeZ6qgvmopjNgGjCrHQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwhBI52mOlj3cYxty37yfOvQ+mvPBE/VhCAMCPae9Bj3kHyuCah
	X3HK2X7o0YCNGYHeq3lxfppM3aquWz0FjSW3xEqM3eRctY/s7x4nUCwX
X-Gm-Gg: ASbGncv5KE1nD8mMO62kptrZLDjP9bA+5LZoZ0K0VE1QynQ8wlqVCmhtFuwUa2nFx4W
	o3LiJ5YcZSqliG0Iur6wH48Z36c66VGj6Ril7mirax7U/9bRBFP/3lYTILtKtFzeseJiye3yR7m
	xm2jwSz2ZcKjB8MQ9HVvLEEJSBApeISJ7NdTaoJcG2EbzbG90Nd0jYbPzlERtPT1X4tPy1Zsbld
	qavglDQHWm3u8GqRpVRjLOLANhg5Du+F1DDbtz/uTHsbPmUIEO9xPEiwBFqtUCP51ZSlqxtt9sO
	C+4oseha1JSq15riWmsd5qhUWkHKiSCscGy2vKimsqnrOSDItThvURWdeYDpLHmR2Mhlq7qOI48
	sKC+DHuewD/wcJzUDHbPDgFcM5JfenjiRUHdNWHpR4LcGKsPoWIQR3qdRn2S83u/kmQvhFrun87
	z/a9M0weh1bRCB4yIapyHXsPfzNTqijXzY5WQemw==
X-Google-Smtp-Source: AGHT+IF6afF+Sk5OqXufe5DnIInP/wLQgPhexqZnCnJvERed0HkkNXpn1BqSwn2dy7VPQkM2oelwCw==
X-Received: by 2002:a05:6102:b0f:b0:5db:ecdd:1816 with SMTP id ada2fe7eead31-5dfc564a0b0mr2274620137.24.1763223148354;
        Sat, 15 Nov 2025 08:12:28 -0800 (PST)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb726ff96sm2758596137.14.2025.11.15.08.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Nov 2025 08:12:27 -0800 (PST)
Message-ID: <48a69d90-68f7-4ec7-97c4-89ba9896b663@gmail.com>
Date: Sat, 15 Nov 2025 11:12:25 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gfs2: flush withdraw work before freeing gfs2_sbd
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>,
 Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
 syzbot+19e0be39cc25dfcb0858@syzkaller.appspotmail.com,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <68f6a48f.050a0220.91a22.0451.GAE@google.com>
 <20251024144332.33773-2-nirbhay.lkd@gmail.com>
 <8f270474-7ced-4668-97da-f3d7709a82e7@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <8f270474-7ced-4668-97da-f3d7709a82e7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/25 15:24, Nirbhay Sharma wrote:
> Hi Andreas,
> 
> I hope this email finds you well.
> 
> I'm writing to follow up on the GFS2 patch I submitted regarding the
> ODEBUG warning in free_sbd(). The patch addressed the syzbot report
> where sd_withdraw_work was being freed while still active.
> 
> I wanted to check if you've had a chance to review the patch, or if
> there's any feedback or additional information I can provide to help
> with the review process.
> 
> I understand maintainers are busy, and I'm happy to make any necessary
> revisions or provide further clarification on the testing that was
> performed.
> 
> Best regards,
> Nirbhay Sharma
> 
> 


Hey Nirbay,

The reply that you write should be below the message you are talking
about. If you put it above, it is called "top-posting", and the kernel
community does not like top-posting.

For long email chains, it becomes difficult to keep track of the
conversations.

What I am doing now is called in-line posting. I am responding below
your message, but there are still other messages below mine.


> On 10/24/25 8:13 PM, Nirbhay Sharma wrote:
>> Syzbot reported an ODEBUG warning where free_sbd() was freeing memory
>> containing an active work_struct (sd_withdraw_work):
>>
>>   ODEBUG: free active (active state 0) object: ffff888026c285a0
>>   object type: work_struct hint: gfs2_withdraw_func+0x0/0x430
>>   WARNING: CPU: 0 PID: 6010 at lib/debugobjects.c:545
>>   Call Trace:
>>    free_sbd+0x1e4/0x270 fs/gfs2/ops_fstype.c:1308
>>
>> The issue occurs when gfs2_fill_super() fails after initializing
>> sd_withdraw_work at line 1218. Some error paths (fail_lm, fail_debug,
>> etc.) skip the existing flush_work() at the fail_inodes label and jump
>> directly to fail_free, which calls free_sbd() without flushing the
>> potentially pending work.
>>
>> free_sbd() is also called from init_sbd()'s error path before
>> sd_withdraw_work is initialized. Since the structure is allocated with
>> kzalloc(), work.func is NULL in this case.
>>
>> Fix by adding a guarded flush_work() to free_sbd(). Check work.func
>> before flushing to handle both cases: when called after INIT_WORK()
>> (work must be flushed), and when called before INIT_WORK() (work.func
>> is NULL, skip flushing). This avoids the WARN_ON(!work->func) in
>> __flush_work().
>>
>> Note: gfs2_put_super() already calls flush_work() before free_sbd()
>> (line 606), so the flush in free_sbd() will be redundant but harmless
>> for the normal unmount path.
>>
>> Reported-by: syzbot+19e0be39cc25dfcb0858@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=19e0be39cc25dfcb0858
>> Fixes: 8fdd8a28fe5c ("gfs2: Asynchronous withdraw")
>> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
>> ---
>> Testing performed:
>> - Reproduced original bug with syzbot C reproducer
>> - Verified fix prevents ODEBUG warnings in all error paths
>> - Tested early mount failures (unformatted devices)
>> - Tested all gfs2_fill_super error paths (4 scenarios)
>> - Parallel mount stress test (3 concurrent operations)
>> - Memory leak test (50 mount/unmount cycles, <4MB variance)
>> - Race condition testing passed
>> - Validated with syzbot on linux-next (Oct 22)
>> - All tests completed with zero ODEBUG warnings
>>
>>  fs/gfs2/ops_fstype.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
>> index 08502d967e71..6cea03410e57 100644
>> --- a/fs/gfs2/ops_fstype.c
>> +++ b/fs/gfs2/ops_fstype.c
>> @@ -67,6 +67,14 @@ void free_sbd(struct gfs2_sbd *sdp)
>>  {
>>  	struct super_block *sb = sdp->sd_vfs;
>>  
>> +	/*
>> +	 * Only flush withdraw work if initialized. Work is initialized in
>> +	 * gfs2_fill_super() at line 1218, after init_sbd() succeeds.
>> +	 * Checking func avoids WARN_ON in __flush_work() for early failures.
>> +	 */
>> +	if (sdp->sd_withdraw_work.func)
>> +		flush_work(&sdp->sd_withdraw_work);
>> +
>>  	free_percpu(sdp->sd_lkstats);
>>  	sb->s_fs_info = NULL;
>>  	kfree(sdp);
If I respond down here, it is bottom-posting. Both inline and bottom
posting are encouraged. Top posting is to be avoided.

Thanks,
David Hunter

