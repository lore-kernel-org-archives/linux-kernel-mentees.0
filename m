Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E6614D2A0
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668979; cv=none; b=XqxTrD8hgkNMw9gndYY6JTHOfxZv+NY+Z9/mR7USVB12coPKpMqtTEqy/gvhp9eQ6+5XScgsECrgWcCE/j6HZYMG9HxYmRADBczj6tw6+nDnzz2BAJvaipIRTZqeiyAV5AIkm5BD1cGNyIX4KFZa3k4EHeHbgpkgNzHfEHCtnbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668979; c=relaxed/simple;
	bh=n3+W5D8CnGWfTlHowjBSq2SphepD7q7N6mU4Inz8Lzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DD9ofk7xfHkP39B6jLvwtFp8HQ419o3lTXu5qkvD3Md8jvOQiGPnpZ7MM2eQXmCPYPRL8+JdTXXNkazesnKzwlRptAF7YRy2zk1z48EyabQG7pjnUCNFoT5NrYCCfi4DDFR82XhJyRS6EjRa9GHjlmkb9iWdHWr9FQEfh1x/CDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=Mcx0IXEk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="Mcx0IXEk"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so45360975e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1750668974; x=1751273774; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3+W5D8CnGWfTlHowjBSq2SphepD7q7N6mU4Inz8Lzw=;
        b=Mcx0IXEkP1+pQ4lAUPD3nwVH0NDcXSehw0sVdVnC4ZhSVfjOLA44ttgCihmQCPXqFH
         9sjBSAnCwWQymjM2Cx9y9Fq5jD/SUOS4xysOigMNQ7THDYx6hNVgwWdozGKAbAbjh55j
         QivytJgGN6BcK+qQiSLJ6XCbcqfWGn/Hpm5uiOPGS1HfqjYETVTUsopRxigVWlqvswcn
         hfJJrQZYAyCkFD9A4NQbpn0/6xw3kcpo1qob/pQmLGr40e2QoUUaOhnbgRLALVwBTrYG
         z+IOdXASsb6UmLdJJIO/HT5HhvbWSBqnTljg8m5xjW4vXEAfTeuzH7PJpTlUC/RLHcyl
         cnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668974; x=1751273774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3+W5D8CnGWfTlHowjBSq2SphepD7q7N6mU4Inz8Lzw=;
        b=OVvQDnZ/mBGJToSd8qhxcS+CpajQ8e68tFOCzWnnaMKkjIuARAS/VObaXlqpiV/EOk
         jrgCuo361SKB00ycwqlxbEWWHNZsHxFrAwYzjZ5rje8BsHZv1TOV89/S103bi3gXUMPo
         mVE/nCqWnuxLYZDxx0fZuZNRrD+t8/ckngqQiMX2NXhzSD0SQl69lDsNGxOZrtaTwyf3
         IO/jSn2eWBrq8nKiJP/l8/f9zbH+l9o+ZjuUOKIHcBIGOohUwngMWs8Ur7rWYqGcj4xT
         3bquiiBLqmdHONU7TZbAlPTUWE8k7802C83bVpJjV2XM0NnOXaazSUI6DKyPRe+A8gg0
         Fwtw==
X-Forwarded-Encrypted: i=1; AJvYcCVERHSGRu2PtZ6UIlQQWZPXum3ILd82pxaGDiZIjP32AJqU76nQ7xfl5nlE50Ta/z3iuu5lF4ftuR2oycEA6oo+Bjx8Pw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSJIi7NJMJnUXD8MrBrThRYFu7HDhrSkv7wCLy7JfSM1aqiwGo
	NRW3P7LHgl7VCOzhpUKbSILCsFIt0FLdpzkxTjkBJeTxTxlCxvliFKDCOPbSP7QBMYKTEEshmgq
	b4R2fQsQ=
X-Gm-Gg: ASbGncvuBUNzDHC8XVulkGdnrNG2JXY8aREfDoaoaLywNOCW5mlJ3JWmuOpe32OX/1k
	vh5skmWyQNsuhf1nXNw2ferosuvxWvHMhlzfJw//31bW+GfFHxjTXtXI98dCvs985pgWh7bATt7
	BdAyWenjfkL0XVPIEoCrvrpa2fsX+LhOzM5pnaa5TiEY04RfvVoiT9gRhWnpYTBN6BEbqjVWFK+
	fMWsv4aFeVliZW7p1B8+KoFopojBdRwYZ/iRpVY/na3aXJcA1EzwUjZaFc9SfSPOw0HNH7i/uZV
	EXnAyU0op+DQWTPpjB37sDHwFKPmBSV+cM+Vw1b67pS5BIkG1AoX9ahDtO/4OpUqe7vs1nC+YaY
	2wTyrLgkTCHFFAMlMUTu8n//VmANJQitFWNGuvTubfJ8x2g9YXxtl
X-Google-Smtp-Source: AGHT+IERqVhXUuZaycJ9TXWhRB2gxybcEMP4NaEWUk1qVF4LE8ISnCBkZkByr7Mu7swhmGQOyICAkw==
X-Received: by 2002:a05:600c:4512:b0:453:5c30:a1d0 with SMTP id 5b1f17b1804b1-4536e0da765mr49058295e9.21.1750668973790;
        Mon, 23 Jun 2025 01:56:13 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:8778:2532:8a32:106a? ([2a02:1807:2a00:3400:8778:2532:8a32:106a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536466596asm107238875e9.0.2025.06.23.01.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:56:13 -0700 (PDT)
Message-ID: <643db411-d72c-4542-82a2-056d7d745967@hammernet.be>
Date: Mon, 23 Jun 2025 10:56:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: ehci: replace scnprintf() with sysfs_emit()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>
 <d2d321cd-7ca7-42d9-8eb8-7ab639dddfa6@wanadoo.fr>
Content-Language: en-US
From: Hendrik Hammernet <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <d2d321cd-7ca7-42d9-8eb8-7ab639dddfa6@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 6/20/25 21:56, Christophe JAILLET wrote:
> Le 19/06/2025 à 14:07, Hendrik Hamerlinck a écrit :
>> Per Documentation/filesystems/sysfs.rst, show() methods should only
>> use sysfs_emit() or sysfs_emit_at() when formatting values to be
>> returned to userspace.
>>
>> Convert the uses of scnprintf() in sysfs show() methods to
>> sysfs_emit() and sysfs_emit_at() for better safety and consistency.
>>
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> ---
>>   drivers/usb/host/ehci-sysfs.c | 15 +++++----------
>>   1 file changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
>> index 8f75cb7b197c..3786e81b0ed9 100644
>> --- a/drivers/usb/host/ehci-sysfs.c
>> +++ b/drivers/usb/host/ehci-sysfs.c
>> @@ -12,21 +12,18 @@ static ssize_t companion_show(struct device *dev,
>>                     char *buf)
>>   {
>>       struct ehci_hcd        *ehci;
>> -    int            nports, index, n;
>> -    int            count = PAGE_SIZE;
>> -    char            *ptr = buf;
>> +    int            nports, index;
>> +    int            len = 0;
>>         ehci = hcd_to_ehci(dev_get_drvdata(dev));
>>       nports = HCS_N_PORTS(ehci->hcs_params);
>>         for (index = 0; index < nports; ++index) {
>>           if (test_bit(index, &ehci->companion_ports)) {
>> -            n = scnprintf(ptr, count, "%d\n", index + 1);
>> -            ptr += n;
>> -            count -= n;
>> +            len += sysfs_emit_at(buf, len, "%d\n", index + 1);
>>           }
>
> Nitpick: extra { } looks useless now.

I'm fairly new to kernel development. I checked the coding style guide and
indeed saw that the curly braces should be avoided if they are unnecessary.

Thanks for pointing that out. I'll fix it in the next revision.

