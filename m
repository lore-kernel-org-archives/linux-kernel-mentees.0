Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC42256C71
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Aug 2025 23:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756681655; cv=none; b=RbwRd7J7VR52gUOHZ2mrdJmV+YktCB6NhsPDxl8PVq3T2otLIPKe9iOZ/PQ0t8B5fCigqeyMGjgvCBW+skNUJWS/buz+j3fU5pGYctpua3sAiLPpmv7bsEBmG+4xQ1Y/6IYwrWiSESvUptfezYG3KRhtbvTl0+0119olj/sjAXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756681655; c=relaxed/simple;
	bh=/dq1+WkskxLjQfiUna2tnvXAStsMIRt3sNeqPiyojaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYarAkzpxanSdOREWFLtjc6/rpyoftEEovXJbJUaYgdYGzkNxLYOxgjLVbIsklI4ijJbZvqUHNpoSHcbAJybW6koaXh1s/EB19VoeI96rC6v10yGdeZEgE7HjgZFs0jnZF8grgfJ1fqJwlpVb5MUNrZh2U/9Qj92cIeTXa3mrSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVC1VGjy; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVC1VGjy"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E6C833AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Aug 2025 23:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bba7iJvsHUvQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Aug 2025 23:07:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=smokthar925@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC73B83103
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC73B83103
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WVC1VGjy
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AC73B83103
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Aug 2025 23:07:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b7d497abaso23186845e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Aug 2025 16:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756681649; x=1757286449; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VzORTaj5j85cq2M8IR2sPPrrk6vTYoFG53BsY3IwtmU=;
        b=WVC1VGjyu4moRGBuEHVX6qhzCU0fTUIT31B8MU7+3sS6Xj3hiCNyuq5M/DP9U/+FsH
         AUXW68ZV8131wd00A/mwzlyOURSfPu/+Jw8CUfP345rq6Kkel0UYuV4hDWXr3ayFeWV/
         P8YRyg+L8zm/jDdfjN+zrNcrDSYycM85zETwV4B8JWyR/S2mRWVNwUbptX0yj+5Gz52W
         b54fZk7+KqroKftkZqp0YjdbVFi0v8jiOoMLN7ugzSm+qbK32WVt24gFQDVi0z6eU4QQ
         vBPZh2nKplIR7Y+RXshV3bzLUPQKdL7hePFFt/kjuQbUf0soaPZl39S5S9gH2uLsdlbP
         LxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756681649; x=1757286449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VzORTaj5j85cq2M8IR2sPPrrk6vTYoFG53BsY3IwtmU=;
        b=g3oWrZQxJZkvAljwTcfF3LdANLrRWf7Smtow3x373WY9cplbEQRc+gLGAvOn4NiaaB
         8oGECJXH4z7MZ0LlmMYMNLArlvcOdJ5VVSsE/rYCfqU347IHRSoXMYreVjrZoYpGNiXp
         CcbsxOEDtCWAeGiwxjTcnIk4Xj9QlZ0yapEOCaE2KKjkrjpbK1k8EPnEyZmC7JiWkO+7
         gThNxqot/jP2hL1ldB7lKLlL5YpyDlrB40Uwbaeo71Qruw8pYmGXx+mjsbplKtDHY1ri
         2Pa2OH6tBZg7Snu5GL+ZqufCZ5SpuKdClCoFVKvAX7cP+M6UxJPyurudEOrYFNiaHkqF
         Ff8A==
X-Forwarded-Encrypted: i=1; AJvYcCVS9RpSN5fStpiYdaZvVKTBiETK5O2Z3L3XVkL0oucUoIxWjm9uQDyiK1TX8IVADPcjVz65+CSnelbvtIqRLe7HOwfuew==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzSyu4sZ1kfp8bHGJMzAGo7VAvi7//Sb2yhzjk4sFlzWh5ls97t
	16MXXhE3Nq+AIRXOkngqxruNPLQZEU4/bS82xOKmPqPVUAVQA5m4TO3R
X-Gm-Gg: ASbGncv9+5I7Dhgkfjuujyr4mUTv1ieHCMCcyx3jaNtF2i+4CTUymdOuI2Av/fsdPZ5
	dL4O+aaLUyhwXbPW6IPTf32JynyXlPpC01Qq9A+/7EppIPFS4hOpD+iLVRm8CZbL8SP0wW8yMt6
	+w2XNgHB2NYWIg7J4Ws50wgS0bSa2qvG0+i9CZW4+5/I650gzz5BS6EJwJQ9pUhmqbI/n6o2iax
	9t0YHGUvGyFTlh9Q9sVdNszuY/ohaAdWEIXijHPutUr+9J9p2iWHJXejOLV0rsPl6SarGbee4hV
	sBjC0ca5ogYyY9gKscnR+rSaVinwX18SgmIT3POYsS/Zg/DNmHS+EGuVGGOQYMMHU4Cgb3kvind
	cDuHQ78nMwZo3C83YaF21QoFrvlCZH4ofCKNzbYNypQ==
X-Google-Smtp-Source: AGHT+IEvc7GiBSOLL0eVIAnfsFxuuyb9Xs6ZWQt1q85vQuVTGCKCiLZUHxhq+3aytM1K0vb5VJdtTQ==
X-Received: by 2002:a05:600c:5487:b0:45b:8d2a:ccfe with SMTP id 5b1f17b1804b1-45b8d2acf6dmr7011485e9.13.1756681649334;
        Sun, 31 Aug 2025 16:07:29 -0700 (PDT)
Received: from [192.168.100.24] ([102.31.181.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e74b72esm133792415e9.0.2025.08.31.16.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 16:07:28 -0700 (PDT)
Message-ID: <c6158f58-7a62-4df3-b025-4fe9f33c4d16@gmail.com>
Date: Mon, 1 Sep 2025 00:07:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/driver-api: Fix typo error in cxl
To: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Cc: linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Gregory Price <gourry@gourry.net>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
References: <20250819084116.13108-1-smokthar925@gmail.com>
 <87iki53gfb.fsf@trenco.lwn.net>
Content-Language: en-US
From: Moktar sellami <smokthar925@gmail.com>
In-Reply-To: <87iki53gfb.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/29/25 23:35, Jonathan Corbet wrote:
> Moktar SELLAMI <smokthar925@gmail.com> writes:
>
>> Fixed Typo in the driver-api/cxl/devices/devices.rst
>>
>> functionalty -> functionality
>>
>> Signed-off-by: Moktar SELLAMI <smokthar925@gmail.com>
>> ---
>>   Documentation/driver-api/cxl/devices/device-types.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/driver-api/cxl/devices/device-types.rst b/Documentation/driver-api/cxl/devices/device-types.rst
>> index 923f5d89bc04..7f69dfa4509b 100644
>> --- a/Documentation/driver-api/cxl/devices/device-types.rst
>> +++ b/Documentation/driver-api/cxl/devices/device-types.rst
>> @@ -22,7 +22,7 @@ The basic interaction protocol, similar to PCIe configuration mechanisms.
>>   Typically used for initialization, configuration, and I/O access for anything
>>   other than memory (CXL.mem) or cache (CXL.cache) operations.
>>   
>> -The Linux CXL driver exposes access to .io functionalty via the various sysfs
>> +The Linux CXL driver exposes access to .io functionality via the various sysfs
>>   interfaces and /dev/cxl/ devices (which exposes direct access to device
>>   mailboxes).
> This one was fixed a while back, so this patch is not needed.  It is
> always a good idea to check linux-next when considering changes of this
> type.
>
> Thanks,
>
> jon

Thank you for the clarification and for pointing me to linux-next. i 
will try to come up with an other patch thank u.

Moktar


