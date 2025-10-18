Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA8D244691
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 16:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760804027; cv=none; b=WzCncRz6HgyW5ErIEE19BWOfZkeswcPHU7cUsBHWYVyMhZj//nuR+aiY/F422O4q3famBPua9aEX0JQTGyHiMA/HnzKSLUBSR3NW+hCVVqgKbhTbNRLuZ5hb/fbAkfcKp/pgfcAt2e1h4yM9mNssBSuFhFz5f6DqtV9/7NfDTGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760804027; c=relaxed/simple;
	bh=pLKk0UA5x9txz2pzbD022hS7+sQLw1lvQiEUDBqTXvA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VaxR5LfinyhWIRdK0n7bF+237HyMdY92/Mo6nrgU1Dfm+gbCk5GjsCj29BMRlCzF9T4H0eEPnyXsFBKW3KMBcaRh8OmMZEaNb/r20xOf38w1Ms39uWyKlcj+RBo4CeuqRzOskRR5EkyEQTZ4GuXMp0XiHFZeGAo/SW1uBwMvIdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwHkiW94; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwHkiW94"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0A3E83657
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 16:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpLERDfX3xKU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Oct 2025 16:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E545883653
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E545883653
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cwHkiW94
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E545883653
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 16:13:44 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-470ff9b5820so4653455e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 09:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760804022; x=1761408822; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f0pOHV9nv1hxJzjc+rhs/0yX1sV8PPggM1YFk5/tT9Q=;
        b=cwHkiW942IIQO/lJl33DQ+37SCyqRGowKH39KVPIs+ykPqSncInDpOAOZESFE11b2g
         SqYodZf4NAOUT6tVAlsDCuiMWFz7nEOcE5RvdE/8aF4/UAcmW2hbhn3H/X1Wt2DjTCPQ
         BvNbJLOmqG8dErkjcFNwfkpEHF/qXktBukwEMFoS1rd1nNoEZDGY2A0rXeKm20hc6+dv
         l69eOLAQUzJ3qYeF9KIuwtIMadN6Cu28r9SaF4hxYYnDuB77HJ20z8vqVflidFiPQ7PM
         5FQ/2pUAcDMzFamktyIkR+D6W+56O5hddwpC/lFnUUsgYs6prcjNOspWlY1E3pc9SQED
         8Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760804022; x=1761408822;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0pOHV9nv1hxJzjc+rhs/0yX1sV8PPggM1YFk5/tT9Q=;
        b=epCii0X2M1zfegjPFa8VxnxykqX8CG+8RP8B1UVqzxNfIsS0wZspCcI98dvoImX0eT
         FmzkEtV5W/lcKT4A2AJjuBswXo/MMbfgyo3fBkMUaHBaiBqLpMbqRscBy+9itTIXixa3
         4V70l9HIWaUxvRcUpYpdYEuxnGic6d1td3rfbU1c6iCFUMGByLtF6esLo4NSnvrY2ru3
         Bk/LXK3B5vCljZnAmLTQONs4N3FKxv+rNJO8yyd984ZpI7Wfl1qHUqH/Nj+s6PpDSl2L
         Vmvb8T94KMXD6d2HVVKtvIzzT28/y2z+9Lg4VNLG1LCoz+Xd0VQUHRn5OzBKgG5BOuCK
         TIEw==
X-Forwarded-Encrypted: i=1; AJvYcCWEnfN3koci35Ipta0SRLhe1XlE9qFCqR37YJnUrDzg7IyoabjeZpzxpdgIJ0cvmjK67UREPYo+L9BWPBxMkmZ1ceFXQg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxyqKanKKf97YoGOsWMyYbY1whrqqymFv02phVBjJiRHJLODHmo
	sTniwaYa96HexgphFjiFLshbUnr0jGLHRAag95iAuovVwp1qwmMtwgmg
X-Gm-Gg: ASbGnctFqJ84VVjPCjme61HRsXaySzaF0ZPYeq2EF9SJUTRvjlitdCdwq10xA9VHrYy
	TNMNI/1PVsSAtkYgDmqYQzMMVNpzRVLJ6PVOx5hz+IAvIB0KazbdZWXa6j8n3tCroECMXdTg1Y5
	puKmIOrcpsL3d23omVZbcgWx1Y6tk5nvyhZ/tmUbXyEQ4UWVtey9bMURiX/08qRzvNaztwKTaOW
	cEJRWi8Vc8vwn2pzONSJzNPSh12vQRULqha1RzuTb4eF5LQSRjqnhjZeNvL0LiVnujnmBH81EST
	aHteeU4Z4zo1vUDITl4ofItAJaVut0SFPbS0/Vf5ijWvZMM90STr/yf3m1hsdIStRreujAvApQ8
	/cjOKi/mkz/fNPtOC5H/OcJKeRXhPvGwCRbJA3XcPQIIUQFLCCUhd4X3pcN+/eSuig2eX5X5ycd
	oPlbAhk3s7CSg0no4d1v52SY6kgJcSBFY=
X-Google-Smtp-Source: AGHT+IGOxLwcjmXvE3Lb0mSlFrm9lnVnNEmJmV5uOeoSLYYaZp87Dibu/aojvz+uM+vnxkS8QeEjKQ==
X-Received: by 2002:a05:600c:3b8d:b0:471:703:c206 with SMTP id 5b1f17b1804b1-47117917718mr31981905e9.5.1760804022334;
        Sat, 18 Oct 2025 09:13:42 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.121.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm5665372f8f.28.2025.10.18.09.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 09:13:42 -0700 (PDT)
Message-ID: <ccaa911b-f405-477e-a542-fe4f6bcb618d@gmail.com>
Date: Sat, 18 Oct 2025 18:13:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] init: Use kcalloc() instead of kzalloc()
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
References: <20250930083542.18915-1-mehdi.benhadjkhelifa@gmail.com>
 <20251002023657.GF39973@ZenIV>
 <b0388977-413c-46d0-b0e1-fc8d26ef9323@gmail.com>
Content-Language: en-US
In-Reply-To: <b0388977-413c-46d0-b0e1-fc8d26ef9323@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/3/25 11:40 AM, Mehdi Ben Hadj Khelifa wrote:
> On 10/2/25 3:36 AM, Al Viro wrote:
>> On Tue, Sep 30, 2025 at 09:35:37AM +0100, Mehdi Ben Hadj Khelifa wrote:
>>> Replace kzalloc() with kcalloc() in init/initramfs_test.c since the
>>> calculation inside kzalloc is dynamic and could overflow.
>>
>> Really?  Could you explain how
>>     a) ARRAY_SIZE(local variable) * (CPIO_HDRLEN + PATH_MAX + 3)
>> could possibly be dynamic and
> I missed that c is in local scope.It's already of size 3 and since 
> CPIO_HDRLEN is 110 and PATH_MAX is 4096 + 3, it's far from the limit and 
> it is calculated at compile time since all values are deducible.>     b) 
> just how large would that array have to be for it to "overflow"?
> If c could be of any size, it would have to be of size 1,020,310 for 32- 
> bit kernels and a lot for 64-bit kernels around 4.4 quadrillion 
> elements. Which is unrealistic.
> 
>> Incidentally, here the use of kcalloc would be unidiomatic - it's _not_
>> allocating an array of that many fixed-sized elements.  CPIO_HDRLEN +
>> PATH_MAX + 3 is not an element size - it's an upper bound on the amount
>> of space we might need for a single element.  Chunks of data generated
>> from array elements are placed into that buffer without any gaps -
>> it's really an array of bytes, large enough to fit all of them.
> Yes I get it now. But Even if the CPIO_HDRLEN + PATH_MAX + 3 is the 
> upper bound on the amount of space and in use it doesn't have any gaps 
> in memory, Shouldn't we change kzalloc() to kcalloc() since kzalloc() is 
> deprecated[1]?
> Regards,
> Mehdi Ben Hadj Khelifa
> 
> [1]:https://docs.kernel.org/process/deprecated.html

Hello viro,
I'm just resending reply in case if you missed it.

Best regards,
Mehdi Ben Hadj Khelifa
