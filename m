Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F652E9751
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759224422; cv=none; b=DdrFVIHHXHA5xi6DTJp7D2v7oIfDXuvn/VvxRDIDky9F+HTmEYRU93VeKhjen/Kz+PNr/JsV5REpgokINRyNNfsMuqUBq24VLxbWSlVf7g1+T/0XH7WFvzWZF3Bn0kg0KjMBLmCHKJgdWtEGAjaSVSmHD/NIIh0US62GFser/3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759224422; c=relaxed/simple;
	bh=j6aKpZja6IJO9Sv+6v0U/bfOyaEulbLfHw8yBTY5Ssk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afGh50bhamzy+r1dQi/LgXw+UqzjNY7nQDLdaA75tIo9WG/sb1iCsNAY3pjWVx/IrZh4hua12uEWtJVmnnI1T73tZypzoap+oV5EvDhSEUB/zSZqlIjI50y1rQ609P+oJvWeo36qFNW72WSsYwZkwO7oRff4kKoNGZiPahyhmR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMoBuhAs; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMoBuhAs"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB0560EA9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 09:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VqiZZBZSdxSv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Sep 2025 09:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7746B60E9B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7746B60E9B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nMoBuhAs
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7746B60E9B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 09:26:59 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e32139ef7so9199245e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 02:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759224417; x=1759829217; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cmD1H8OwmHh9iQxosxV+vKhL8WnHs3OeYyoNA3LHXXs=;
        b=nMoBuhAseDePWYeclx7orYliN/ZdJlyEmNDQ4He03NQ7DUE2bE6XfPmMyqJ/nNK2uI
         m7Z8CJVgC5/jjVrO25WAMRl16lCURNv6zPtHcc+Ykt6KOYdzDaBRYMsgRK7fo2aO8Qvn
         K9Si7m4yDG2k7bUmGe4q6XHDkcbxfSgMQgDoR4BvMqebIIXdMX8ge7bmWuq75sLT+LEA
         D/idetKJAeeN8HzFk4Vnfte3CCtRJHXWQ8z2l29R2tGMjtTOuYpe4DhHDqdFDGilwHtK
         G1ErEQA/in8XouatVeArFf/ERWdqyj76A8l0D7457xM7bCv3VRRGE51QYA6e/qIZocq/
         AS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759224417; x=1759829217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cmD1H8OwmHh9iQxosxV+vKhL8WnHs3OeYyoNA3LHXXs=;
        b=XFuP356QwTOVQfaJngay22rpee/l/umKagu4FO5KVvOiaypGD51Wh4Jjb7oLA2fMlm
         IWwnVU/DpfeLCaBo3m105/DDeSwIZr733ViVNK1AQUq9YAWytza+837cJmfJOdNAJ7qd
         QdW8DQvbiPFNEWSfjvzxKMjuxhDvDnEh0q3qkk7Ac7McjMatBuZ019mnLTzspALM5oWf
         owJi8hW9ZYppjqw9aXejgDC06302zRHd1MBvEGrG4idNmXHzaMfsAsR579xDnGqyNmCm
         9qFYTha9ARTBQLR+zEcdopZ0qRkkTUN9YfkcodvjGhbLi5vusY9yzEilXoF4+FpUvd/y
         H/8A==
X-Forwarded-Encrypted: i=1; AJvYcCWtfpGTUX6i96uyFVlNR9HRlavUNO5CHh0Fcc2clvWzeP6D77CaYb0h9Wr81R1bxCd+3d8eXROF0CjJ7e+WmtUv+CNK/g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzUbakTb+LAV9wJifUEErslpBk/ojeu74VuVZzN04ohe1hDmDc3
	BpnlXlP5YJaBxsARl9s8Fc4F6lOwvfcR1BNOpleQD2ZfioULtXW0AA8Z
X-Gm-Gg: ASbGncsIErXOuSXEuXXPf9JyEzY01gZ9yANYQCGIPin/W+VFp9vdKiPctlHysatgMs7
	stzy8iB/KlDUZ8mc2ZP2+nX6HqOn0tZDQTkfs8LJ6pOzAyxfu+bvxuzFhn7vPvsW3W6aNgdhipE
	5CVqBzrK4p4FUGKLj+qfOUAEJ7pRYbnMGl4pWeQM5RBvimmunFkZGm5SgEvMRtmKrdp4Bi4kWwh
	i7HuNP+c+eA+xxivi2PR43n6s9UzrQC1LvBluOWHWR4Y0OH8nORqA5q9fqJPdBD0dltaM/N4J7y
	4kw0AiuX1TYnMO5TvkWKkI3covrfhrhAxwdZNrYvX9RAcEkgeCA5WfWjfaBIHdTHhE7fZYphBpP
	PpDfSwp5itj4ZDAJJmE0o9QagmslipHh444Q6SUuKploD5ie1ARbjDkMtFZVbKQY6YikhmQCnYM
	Ucw34dlUo3
X-Google-Smtp-Source: AGHT+IFGYtwA1qyoebtVQ++gcwEdKaTx5QP4eRZN8yRpJyR7zx0cvodJhiLzw+/VafZl0LWNohao6w==
X-Received: by 2002:a05:600c:3b0c:b0:46e:5cb5:8ca8 with SMTP id 5b1f17b1804b1-46e5cb5a045mr6783365e9.0.1759224416900;
        Tue, 30 Sep 2025 02:26:56 -0700 (PDT)
Received: from [192.168.100.179] ([102.171.36.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb9e1b665sm21820638f8f.27.2025.09.30.02.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 02:26:56 -0700 (PDT)
Message-ID: <342929a3-ac5f-4953-a763-b81c60e66554@gmail.com>
Date: Tue, 30 Sep 2025 10:27:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: Refactor allocation size calculation in kzalloc()
To: Qu Wenruo <quwenruo.btrfs@gmx.com>, clm@fb.com, dsterba@suse.com
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20250930091440.25078-1-mehdi.benhadjkhelifa@gmail.com>
 <76fa5e79-c7e8-4637-bf51-c0e6f4e04f51@gmx.com>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <76fa5e79-c7e8-4637-bf51-c0e6f4e04f51@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/30/25 10:19 AM, Qu Wenruo wrote:
> 
> 
> 在 2025/9/30 18:44, Mehdi Ben Hadj Khelifa 写道:
>> Wrap allocation size calculation in size_add() and size_mul() to avoid
>> any potential overflow.
>>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>>   fs/btrfs/volumes.c | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
>> index c6e3efd6f602..3f1f19b28aac 100644
>> --- a/fs/btrfs/volumes.c
>> +++ b/fs/btrfs/volumes.c
>> @@ -6076,12 +6076,11 @@ struct btrfs_io_context 
>> *alloc_btrfs_io_context(struct btrfs_fs_info *fs_info,
>>   {
>>       struct btrfs_io_context *bioc;
>> -    bioc = kzalloc(
>> -         /* The size of btrfs_io_context */
>> -        sizeof(struct btrfs_io_context) +
>> -        /* Plus the variable array for the stripes */
>> -        sizeof(struct btrfs_io_stripe) * (total_stripes),
>> -        GFP_NOFS);
>> +    /* The size of btrfs_io_context */
>> +    /* Plus the variable array for the stripes */
>> +    bioc = kzalloc(size_add(sizeof(struct btrfs_io_context),
> 
> Please use struct_size() instead.
> 
> And if you're using struct_size() there iwll be no need for any comments.

Understood, I will get v2 on the way with your recommendation.
Thank you for the suggestion.
Regards,
Mehdi

>> +                size_mul(sizeof(struct btrfs_io_stripe),
>> +                        total_stripes)), GFP_NOFS);
>>       if (!bioc)
>>           return NULL;
> 

