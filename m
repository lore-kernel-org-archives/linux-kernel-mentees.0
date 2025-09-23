Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8AA202963
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Sep 2025 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758639502; cv=none; b=cESynStvmLjrL8UdQj2UgZqrohzlHeUGPopE9OzWfUO8YTbGVXiYwctHncx/ZRVtyILdmY+OKamJyZffBk/DBpn/++djuxRsh2REReGVQYPU3K0k79FyrjY84LoyxSxSEpvP+vTz2UoAKfjhTwP8y86Z2IAKm+OQ9AUs99jFEUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758639502; c=relaxed/simple;
	bh=gRBqSBgSa6OthtUzDtiNR0zF7w4r08SIGeb3mkOaZf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGWptIC/sMBhb0+uruZUWwUhrlUHMH1QPNJ546TQsdmdjMftho7iFm+sYp2NvVFbvJZ30bAcWuUgmYVhHJOcJ0j/YC8vEvupDSop275P/OH0TxI29ANuDTeflrx9I/6AzUHItuxXDNWwAbClVkEHeKIK3CHapmitNgK5JMhaj0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9N/qrUb; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9N/qrUb"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso4372957b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Sep 2025 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758639500; x=1759244300; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4ImXSi7R3if4rDxtPDuHh3gasiZze1yOROTcvFaBJ0=;
        b=d9N/qrUbGPzOkfGtuM7MBJ/hZRqCGs2jMCOxf6Qc0i2OJxD+pTgPbJ6bMhAxxZSMpT
         9xSRS6IDuyiNnIkXYAqtcRWD7qCLF2vnAluvDfyr2FfMZoKalOiiSWxpo009BPAuxG7H
         KG6rDMKW8ISKV3Lzmqb5JB0hf3MHlp8qFJTNyA3pUDaed4fUCa+TxQ1neblmhBP5CgC8
         w7ePf255xV5yFLvqTrG8F6/mBQVyrXeNy7RN1XfervU/L3XXClKeRrCP80N+HAEFbx42
         HCCKNCy+pxhTrf0DkMvsbyq2NiB8XjFLO9MoY6FcMXdZJEd5tIWu7nx+vDG627oOd/BQ
         4aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758639500; x=1759244300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4ImXSi7R3if4rDxtPDuHh3gasiZze1yOROTcvFaBJ0=;
        b=hSm39oYyrJ5LvufMJ3PC4taY+g6i7bQASEa94Tq8dkE3VT9NI5YH3nr4tAhm4v7cRX
         U3SOgf0ixC1F7nwlkSvs/cKl1MLpCHIDbFzRDNOGNVqmp3AD+kax4ZbtDXcjy7eQqkqA
         Y3ypnIQiAWWi0rT/QkguGXQBqzEB3q8G/9yecnzi2vraDjWnpoVo59EbyfJ57eqiKLOe
         K9pci3wuFd2HBpUCVtplfSBRMJ4rQvqRR9CWgrGgvH6DjtUXzUBe1cD4Dpi9pDrHmJsW
         L1RRF6p5vTEWY27WWv1YQ9dgSR1IfiLXYeTwy0pGGvFnWs1IvDbIdPGKN3kVnWoaxV/y
         B2+w==
X-Forwarded-Encrypted: i=1; AJvYcCV16h5qFKR/GPtPoiriNxm1Wkttq8wmqAKx+fMBtxFGqEiOHYiPlMaPR+eabxaezrzBuzeDkPNx4+xumkuR9PnIqMe1qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwM8lJTD0uce44u5/fzh2MfILk5pxbJAI85TvI8pPuHMu864sfm
	aPmsAER0VXPnC6w37rmRryQOLWA+G0PULqY0cSLbKEuCUWMDhsIGzwxG
X-Gm-Gg: ASbGncsMbo857moExaErI9PU6Oks8HJbKvWUUpE5i94Klm8PNXKqua4+7H0HcQbfWJE
	Xa2dZcYVy8NDI383lQWXMcZQS7uIowDQVjAN1iBAdGJWIEeHUdcgt+qCTk+x1ez8whKfoUWllRE
	KZ/bjRAJoSur5WyYlGYj9NEHZjmrhuNBWn0yAHp0aAL395BHFbhv+qJ9pHXGf6BI/TfWJvzlYG6
	O0LeByOeTM3acYVUn1nI0FpjyJMMq6gcf/A57EXw6c6dUpzlsElG2Cwf1cexlwsxph0Q/QsTnIq
	dKfipcGk4Z5yFVmoQt7ZC+PUFrAShmAjjsHdLFIHVpnIeiimnlWVyGm563QQkYbDDJFcchLLsAx
	1vP14NPauPwZShowCG7Jv6mZI7gjW0LgWr1Uo3qwTy9jJmd48QiJGBnG/Tg==
X-Google-Smtp-Source: AGHT+IF/zZclFSEgpiyYayQeOXrzChZJj4MnQ21sLwn2CDDgyVrjtxcXUaNDM9WgSRffhfGpsMsI+g==
X-Received: by 2002:a17:902:e80e:b0:267:af07:6528 with SMTP id d9443c01a7336-27cc48a2813mr39477455ad.35.1758639499884;
        Tue, 23 Sep 2025 07:58:19 -0700 (PDT)
Received: from [10.0.2.15] ([152.57.99.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016bea0sm165554175ad.40.2025.09.23.07.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 07:58:19 -0700 (PDT)
Message-ID: <65c32c82-d744-4477-8a6d-10ce9a4cd295@gmail.com>
Date: Tue, 23 Sep 2025 20:28:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: ft260: Use sysfs_emit to write formatted data to
 user buffer in sysfs show function.
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250923144926.307315-1-bhanuseshukumar@gmail.com>
 <2025092316-pasta-parachute-737e@gregkh>
Content-Language: en-US
From: bhanuseshukumar <bhanuseshukumar@gmail.com>
In-Reply-To: <2025092316-pasta-parachute-737e@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/25 20:26, Greg KH wrote:
> On Tue, Sep 23, 2025 at 08:19:26PM +0530, Bhanu Seshu Kumar Valluri wrote:
>> Inline with sysfs documentation, sysfs_emit is used in show function
>> to write formatted data into user buffer. sysfs_emit is already PAGE_SIZE
>> aware.
>>
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>> ---
>>  Note: Patch is compile tested and verified with checkpatch.
>>
>>  drivers/hid/hid-ft260.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
>> index 333341e80b0e..8677bea46bea 100644
>> --- a/drivers/hid/hid-ft260.c
>> +++ b/drivers/hid/hid-ft260.c
>> @@ -826,7 +826,7 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	return scnprintf(buf, PAGE_SIZE, "%d\n", *field);
>> +	return sysfs_emit(buf, "%d\n", *field);
>>  }
>>  
>>  static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>> @@ -838,7 +838,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
>> +	return sysfs_emit(buf, "%d\n", le16_to_cpu(*field));
> 
> There's no need to change existing users in the kernel for stuff like
> this, only try to do this for new sysfs files.  We've had too many bugs
> where "simple" changes like this cause problems (recently in the USB
> core for example.)
> 
> thanks,
> 
> greg k-h

OK. Thanks for the prompt feedback on this. 
