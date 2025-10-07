Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07284202F7B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 06:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759817917; cv=none; b=M1U+SHHTImGdmIUK72S3Gc5WZHsKutMyzxnBCOCptuIy7bQxq/DlL+dO65TqVrILPRqsQ6Rt8eKJS3XYVJdmUGJteFfYvyCD3J1sC9kmcmAm5kUO0wB3qyl5tcGctB69mZm0lAgLV/awwovK7uQQbjZZcDIbqJ9b1Wt34ddU0KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759817917; c=relaxed/simple;
	bh=WSad1HugXe52q/g05va5eYGyhewLw2wPoyXwmeqSge4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOxJ+ENeIoCv7BMKx190Jwj4j86X09dsJxP+ZuRhpkM7AOqrcEW68W3SP+vS9PUoA92pRohBTDZu+5+TUmM3f/jqzpcEc0nIz+LjekPeRZ5XIHk94VYoaCCOBdTGcS3CvEzcipTEEjuDvCTLC6g++HzLZByYV2Ioh9E0E99TOwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsgRo7hx; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsgRo7hx"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89F3741370
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 06:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtSM3TEzy9Yb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 06:18:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E53AF412E4
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E53AF412E4
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QsgRo7hx
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E53AF412E4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 06:18:34 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b6271ea39f4so3488792a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 06 Oct 2025 23:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759817914; x=1760422714; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CDwAkbaDlWUjevGfq4nyNlKuzcgWszmvXZ9ur/30uOQ=;
        b=QsgRo7hxWkPxiySoLIzDQ8k4K3xzreYjx+nLt0XrPuXyDuYp+YKdd8jjCUCl1caK/g
         BHnYyynmJ3YvaseupiTmHKBYM0+JV7S/5DwrWEHI76eMFHD6/cG81TMF0niRvwerZ9YK
         Le2vrALnhUdCLDe/zRHqwxu9V4Q8lnn+4s6o0hUQ0kEp0kqn4pILfOA5iecu0zxPm6m8
         97h+Jp5+Zw9QX0dR37w29URk7UdoJD5bRtKr3bq+N1kB39+Vn2UV/Aw7eW8QNzHiKq6P
         Tpf2GM1kccFEUx3doxWD0QtFpT1K+1VmabClgP0RP6fF3tQ49Y/o1XZcIalOAR6JWa+b
         0UQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759817914; x=1760422714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDwAkbaDlWUjevGfq4nyNlKuzcgWszmvXZ9ur/30uOQ=;
        b=d2nSxM9MdRrnCFseoOiY/Ip/z6+f3HSqKPNNB95Hq/YGkjN/qFkZbZQ44ysDmTWNyh
         XdeANd5hokm/kVWfj6eKZFqU3JBBFPTPFTKC5zauKFaDyXauT42XZ2bwHDPnap5iUhq2
         QpZ1Bw4Elj/F6Yy/EaS3h99VWrF2KxgC/mdK3BKH+KUI+z2InhwyqjeRlTmXm7NOq/5e
         zeATF8GcaXaTtVMbQ5O0EuoudQtd61rFo0otiisyUSf6ouXbRdS5IpJzz/U8e/4hWF/E
         MYxmxEsbRWaWq5VbsxnEkXDUlD6GzCBtZnGOgT3Q/e+waydYGz97ArcZ9dhb9+xP8D+Q
         DRmA==
X-Forwarded-Encrypted: i=1; AJvYcCUpxtvNEj03Sp8CPcPMdfjt8BQfgZIBGapqfLfvKL+KcqGtJxsXmW0yOScORCcoOxr4OKdTiT26887JXjfPJZhTfOgZVQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyUIVJFyFqKhtQ+fazUkdOnCbz/9QqWi9LKXSnWO0VixUffFzC+
	VbnDzBIM3uOCdvTH4nKFTuUnQk5ZSqvyUJVNufuh4KYncAbT+cX27caq
X-Gm-Gg: ASbGncuIrurEPCM17tw6AjEEpOcwAKPLJ1ycxG5Z4Wb7eju/YuaHs4DeeWV0Gfn6rSA
	qbKj1usRFNCK1Ydp98oMNHfeZdr2mkmUY9RCBGcMwll4Ne8NbDF5X/MPQjhU/mu5doZbi3IoFhE
	O2b9q0XzvBvYTmoLtS3Gu0QdaVmT+YvBQb5Medhqyk4/pJTIEMoPg8UmJ7/Rr+q1gigmyKsPE0G
	VSAcn2Fj0ywklYDszLbmhMOquwMB3vVlum2QENvyTgywHZ7zFWWLnlxlQ9YtbHRsXBisC5crko0
	Ddt+8h9rDxnbh7avbk0ILO7wOH1EnDayZe5LPyIxXRQVIz3zRAOKBOs0bRiI8oOiTA7BZgF5aGi
	LdKrjPWrQA3/wEZUrtxF3rxhe9HxiNUYAWBGYpub2zm1mpCVq08aPicoER9w7ZZaUm0Q=
X-Google-Smtp-Source: AGHT+IFEB4BT03PGibT8CSd70pTCt7zClhc5w3shhrha8qeF8hont0hAokJ8+q/qQmhqQ/KGp8jHnw==
X-Received: by 2002:a17:903:1aa7:b0:27e:ec72:f67 with SMTP id d9443c01a7336-28e9a54ee5dmr208134585ad.6.1759817913969;
        Mon, 06 Oct 2025 23:18:33 -0700 (PDT)
Received: from [10.0.2.15] ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d11191bsm152771835ad.11.2025.10.06.23.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 23:18:33 -0700 (PDT)
Message-ID: <3ab53f69-4e1f-4f76-8605-e95d7516a97d@gmail.com>
Date: Tue, 7 Oct 2025 11:48:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: Use kmalloc_array to prevent overflow of dynamic
 size calculation
To: Niklas Cassel <cassel@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 Don Brace <don.brace@microchip.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 storagedev@microchip.com, linux-scsi@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, bhanuseshukumar@gmail.com
References: <20251001113935.52596-1-bhanuseshukumar@gmail.com>
 <7761904f64c554821e71e30b205e092fc2f8478e.camel@HansenPartnership.com>
 <1c6cceec-da16-4867-88e0-c629accbb35c@gmail.com> <aOOn8TFTseukaZlS@ryzen>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <aOOn8TFTseukaZlS@ryzen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/25 16:58, Niklas Cassel wrote:
> On Sat, Oct 04, 2025 at 09:55:22AM +0530, Bhanu Seshu Kumar Valluri wrote:
>> On 03/10/25 20:23, James Bottomley wrote:
>>> On Wed, 2025-10-01 at 17:09 +0530, Bhanu Seshu Kumar Valluri wrote:
>>>> Use kmalloc_array to avoid potential overflow during dynamic size
>>>> calculation inside kmalloc.
>>>
>>> This description isn't correct.
>>>
>>> Given this check
>>>
>>>>  
>>>> -	host_memory_descriptor->host_chunk_virt_address =
>>>> kmalloc(sg_count * sizeof(void *), GFP_KERNEL);
>>>
>>> How is it possible that this allocation could ever overflow?
>>>
>>> If you want to change the description to say using kmalloc_array is
>>> better practice or something (and the maintainer concurs) that's fine,
>>> but we can't have a false justification in the kernel git log.
>>>
>>> Regards,
>>>
>>> James
>>>
>> Hi,
>>
>> Thank you for your helpful comment. 
>> I will await till maintainer confirms if it is ok to push this change as v2 with
>> subject line similar what you have suggested.
> 
> You misinterpreted James' reply ("and the maintainer concurs").
> 
> James is one of the two SCSI maintainers, so there is no need to
> delay sending a V2.

Hi Niklas,

Thanks for clarifying  that. I will send v2 patch.

Regards,
Bhanu Seshu Kumar Valluri

