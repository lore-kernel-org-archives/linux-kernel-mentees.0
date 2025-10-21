Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA12A2BEC23
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 10:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761041647; cv=none; b=m2o+YW2H2yBGtO9GcjiYUyriBvJ/ozAEQ0VkoLzAw9FMoWY8nIo4qVuayQS6ANyqMEGcbLPavy1Macwr1yFwThzRVlwH6xLq11XJ0syUmhhzYdV1hO9dcagqT4Jk27egK4CJ993mDQNqloWVghmB/h8d+7Koao4SgyhRJRnNFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761041647; c=relaxed/simple;
	bh=hZFYqccy3hrzjkUJnAWqrJtsjPd4X/Rq5BGUoMThiBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9l72Uyund1G1Q/q0/7/jMQ0VwCzclbn3yr9s+0cZVS01Ribv6BaXb01t22phNjufcmD4Qw0MINtpeoCiUHqG0zlTZukR8qdT10NUK2ZqZfRzmnio1bt2j6gHZn6TcxuC/lN5iFcENeDZ+VRIyiJ/zmlBIvhuA7SFyt0EW+IBgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFIGABlT; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFIGABlT"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FFDC40447
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 10:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id auuR88ZT4hTG for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 10:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32C0340433
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32C0340433
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JFIGABlT
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 32C0340433
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 10:14:04 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b3c76f3703cso93432966b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761041643; x=1761646443; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aY4sUqJT8CNQPf5hwojWc40WBK5K/UWeQgITdbU7s54=;
        b=JFIGABlT7e9xgv+r+z4EMvrXDFk91IioUUe2MaEyLIJ29oWEQZM3RJM7hPUqfG6av5
         wvu1RwfUh+Jiu1+Lvm9o/jvbuv9HaS734sWZcE2H2QauV3FBpnyBvT0WGW8zxuWSQhbN
         izmU7OJ06ay2wPh3rDT4lOTuyaPjpfG2BUhOmGnISVqc7O5Zwym9BEqgBKofnycZ4Whh
         gKoEor+tlTKEdReN7R0v9JuIIiBBgKhMpky5Foq8hcGY0/XE1Kj6nuFPzMNQpYqUjCaA
         NxTTtdFDOzEhrX7Zv9iPKIU0bOQCx6gn735n1fS+1PSbEiynghau+ZowLvbvXqmXndzl
         uYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761041643; x=1761646443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aY4sUqJT8CNQPf5hwojWc40WBK5K/UWeQgITdbU7s54=;
        b=t3VHVr5tq2FEOJqgb1teMtvs9men/xihGWWl7yJtOBCBPS0cFw3ojoORBTM77Gfw0D
         k+KjAAFqS2tCYOkZpSdDJOhMrlYwsg3/mb4lXdvYCGOo0O9Ro2iGZgVROV+dqmZRZrWv
         StncLSXQ9op/0KKufaSOhTRsCXB365ih526qaI9kF2fBQrx6Vf585fvvilo7cbsVH2ZL
         jK7927kNmkgtFDgqPyg48Af/T1uIDKe5Sj9K9iEwFD/9xgd04h+SJ3OJQ24CRJWNxRy1
         EC3ffS3V88+Qq7Y9DfD0ZmLM3n/BP7lvqDjjYAyTw3Zn9SUcVhSH5oX3a9Of93Djf2iJ
         bt7A==
X-Forwarded-Encrypted: i=1; AJvYcCWImLKeZvxsSLmj4C6HLVNZ3Xrp/m9+B/M7k8svXvjpyiIdojfgvbUqw6e/y8wYy6hZriQSVZ08VnRzxyo3iexOx7FlRA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwhjaXSAC7rFnZoZkrlHhasfXu5Ah7V5DIfPFBzRr9Dx9xeYa6e
	Z5tPQidyE7XNKhABJVipnepgmOL6EJyHpAPxqrjvW3/PVaTn2L0JJIL9
X-Gm-Gg: ASbGncuTHV3o4MCJ9XVtAXD2NuOucBrsMtS0sENcdPOnPsPMyvYyqwXjcoiGAssR6Aa
	7jP9bJ4NY3KUSopy+sdihSEwP6oPfnMXbWtFd7FzCRlMx6pthJYnjnDD6ykmlNFQI3tt2P61SrH
	nX06IC9Fof9U5TigzjdWIhXN5aKLAmtaksOYIPJmkbf7+aoLoYeuOgW+isSUvmeSHL6t6H9kkaK
	6UXYyxHduYrdgAZEyljtuOcXpC0Oc3y3L9P7nAfIuzSdBMfBHmHn6TJt0ul5QQRXJbrfkXP/++1
	J4QBquJv0dMFx+MfAg/SGw7BeZK8waBkZiKfedhYRUe7dkhW5iDLzKjfHBFuUbTXRScDX+vwFhU
	xAsP/tTJSFc7EPMQW8jmVIW80O0f2aZlk+RvP0UrScBIWBYPSVFNrTdLgrgOqpFGPoca8qvF8qI
	pyJx+UrXTPNxMgkxJ0DIVpWtrercdU
X-Google-Smtp-Source: AGHT+IGp3+5iFHi5zRWLe8YxHSX3njxzZcoBp1BcVGuZR2w2gCAwViee0Dzqam5RCqIQMql4fNoXCQ==
X-Received: by 2002:a05:6402:4307:b0:63c:1d4a:afcb with SMTP id 4fb4d7f45d1cf-63d09d3bd06mr1476817a12.0.1761041642678;
        Tue, 21 Oct 2025 03:14:02 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4869746asm9018625a12.0.2025.10.21.03.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:14:02 -0700 (PDT)
Message-ID: <4c849c04-6647-432c-807c-5fa7afa7fb47@gmail.com>
Date: Tue, 21 Oct 2025 12:13:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2] bpf/cpumap.c: Remove unnecessary TODO comment
To: Jesper Dangaard Brouer <hawk@kernel.org>, ast@kernel.org,
 daniel@iogearbox.net, davem@davemloft.net, kuba@kernel.org,
 john.fastabend@gmail.com, sdf@fomichev.me, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, kpsingh@kernel.org, haoluo@google.com,
 jolsa@kernel.org
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251020170254.14622-1-mehdi.benhadjkhelifa@gmail.com>
 <e0901356-ef48-4652-9ad4-ff85ae07d83a@kernel.org>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <e0901356-ef48-4652-9ad4-ff85ae07d83a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/21/25 10:37 AM, Jesper Dangaard Brouer wrote:
> 
> 
> On 20/10/2025 19.02, Mehdi Ben Hadj Khelifa wrote:
>> After discussion with bpf maintainers[1], queue_index could
>> be propagated to the remote XDP program by the xdp_md struct[2]
>> which makes this todo a misguide for future effort.
>>
>> [1]:https://lore.kernel.org/all/87y0q23j2w.fsf@cloudflare.com/
>> [2]:https://docs.ebpf.io/linux/helper-function/bpf_xdp_adjust_meta/
>>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>> Changelog:
>>
>> Changes from v1:
>>
>> -Added a comment to clarify that RX queue_index is lost after the frame
>> redirection.
>>
>> Link:https://lore.kernel.org/bpf/d9819687-5b0d-4bfa-9aec- 
>> aef71b847383@gmail.com/T/#mcb6a0315f174d02db3c9bc4fa556cc939c87a706
>>   kernel/bpf/cpumap.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/bpf/cpumap.c b/kernel/bpf/cpumap.c
>> index 703e5df1f4ef..6856a4a67840 100644
>> --- a/kernel/bpf/cpumap.c
>> +++ b/kernel/bpf/cpumap.c
>> @@ -195,7 +195,10 @@ static int cpu_map_bpf_prog_run_xdp(struct 
>> bpf_cpu_map_entry *rcpu,
>>           rxq.dev = xdpf->dev_rx;
>>           rxq.mem.type = xdpf->mem_type;
>> -        /* TODO: report queue_index to xdp_rxq_info */
>> +        /* The NIC RX queue_index is lost after the frame redirection
>> +         * but in case of need, it can be passed as a custom XDP
>> +         * metadata via xdp_md struct to the remote XDP program
> 
> Argh, saying XDP metadata is accessed via the xdp_md struct is just wrong.
> 
Ack, I didn't clarify that XDP metadata should be propagated via the 
bpf_xdp_adjust_meta like mentionned in the link[2]... Maybe I was 
thinking more in the technical side that xdp_md->data_meta would hold 
the value internally... I will send a v3 with appropriate changes.
Thanks for the review.

Best Regards,
Mehdi Ben Hadj Khelifa
> Nacked-by: Jesper Dangaard Brouer <hawk@kernel.org>
> 
>> +         */
>>           xdp_convert_frame_to_buff(xdpf, &xdp);
> 

