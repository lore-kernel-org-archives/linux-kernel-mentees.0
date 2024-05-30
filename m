Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785E1174EC3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 May 2024 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717069553; cv=none; b=mGDR7UqmZnQWWdn6wvx6KUtdwXCq8g6EkQi7elHh4o8WnmK4b7sgX7bvQvhklPgXTVsuGVYIP8oCJ+mLUtPCraltXu8f2BNkSQllXpHYWlCXNlMSUWzzv8m9KLEpWst/XxyyjEfVyCsQU47aaDCdNm1jRdoB2UOKeORNZ2fzFWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717069553; c=relaxed/simple;
	bh=sX4RJy4YoFPq1EwjTgAPQQ0l9jpIrZkiHp4K0YDIK7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmUDcWRc8cClbJmAfUpyoF92f4f4IiZwRDF5XKoDrATsnBFI54emIodaVB+dWFztvNPOMKM/YG4+VY+uOMPy0dq3EfBmEBndbL7P8NIsjOmrVKgWCTnnX/OMnbYMmHglGYe7CeFDq3i2IbfIP7y+BTIoDvdYy4RfGNq21dIVgUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FI6a55tu; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FI6a55tu"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12B7D40822
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 May 2024 11:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqdMkfBlPiP0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 May 2024 11:45:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21FDB4072F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21FDB4072F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FI6a55tu
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 21FDB4072F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 May 2024 11:45:50 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2bdd8968dabso562394a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 May 2024 04:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717069550; x=1717674350; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dt6lbse5R4B5MkccKBRXCeSKahpc61vxjuJbAqOgTYY=;
        b=FI6a55tuX+sKju7s+/jB8AR4/hidEf93M6XaOx66PpIGSE8CT82bm42/+qrm+9E2zH
         5beYuxHogvYgSjSkBP7geQVtyz/la9/pDcT3N92Y9AOqiQ98tseQ2CHe1PEZ329eUw5J
         xPoLqz+rcvBcwBpCbBiHPCGiHMs5D5q/xuvrnL7IsA29VTIAFXyDaxLKtloAvw637PmN
         LI0CjbLplOia3m9B3L3we6RM+K3iyWrHupvSfh35DuAETus8V4KJBTrigmDVp0UX5wi+
         6juG4zKxtSGPshiMx0+oGbGWrCENS/+kfVsjdlQ/e8aznaJju249oIFgcBhzLGceq3BW
         /Bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717069550; x=1717674350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dt6lbse5R4B5MkccKBRXCeSKahpc61vxjuJbAqOgTYY=;
        b=ckqZmKwPPHH4c/5gDWR/M06B7UAQKILcoKtx+f9D5Toc7hJRmBCe+32Ad8z+fWVqSv
         nZkhQG6c1UQ9N3vPtmJLmiEDWG5c01bryhrnkCYexFCUBa3qLnoM2NsefjJo1IMOcgu6
         lHlHWWM9xcHD6k2iD8oBojDwFYzr5DwDcrcO+nm9SozE1Jxnuz64NLYkcc2cqXVJyO4k
         xH+3o1m+bRIqNmwgUFeMp22lHDyy+xJBg7cvEDmXOsyMvi7vH7cYrtXIslSYq1DhDdI2
         eYUKzU7WV9hBvNvQ6acwv9gioOTWdqRVXbjzKkmnqe9OFhHNV0Xg8nz2mb7J3tieC7K0
         o2kw==
X-Forwarded-Encrypted: i=1; AJvYcCXKDDbNmn1PzwUtMkAhV4rm1Ew6W6DQnsZk7SEjFisaNm2czfP0WIqVCjjIQRonWNel5OIjlRzByV4tzqPGkXQ+nGIijUH0hl6wGzS0rIOx47KC91q7FLVqcbqEKyhw
X-Gm-Message-State: AOJu0YwXFgNgcTU6IzDfOqr0WM7sb9QprLE1KFq2CBQ20c2FdUYjn/kO
	MXx1zwG45aNkrUgRWeBPFsyJ5cJ5Li+lDhChiwyuZGCN1dPDQ7kI
X-Google-Smtp-Source: AGHT+IFprFj2EtA/cGtVlylQzuJQE1K6E83+32v7QgNJ6Q6uC7jejf6yvmpaSuKNZMUBiSgUm93iDg==
X-Received: by 2002:a17:90a:4586:b0:2c1:961c:790 with SMTP id 98e67ed59e1d1-2c1abc42ffamr1732303a91.30.1717069550185;
        Thu, 30 May 2024 04:45:50 -0700 (PDT)
Received: from [192.168.50.95] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a777f7cdsm1372393a91.25.2024.05.30.04.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 04:45:49 -0700 (PDT)
Message-ID: <00b9c76f-0beb-46e9-9a0a-5b8e304b2759@gmail.com>
Date: Thu, 30 May 2024 20:45:45 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: cve Korean translation
To: Austin Kim <austindh.kim@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
 Jinwoo Park <pmnxis@gmail.com>, shjy180909@gmail.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20240527102313.27966-1-yskelg@gmail.com>
 <CADLLry53yZ6PZ7X8DwdS=GGp6+6L0tbAkb+hiL-Eth4FZ+ZTNw@mail.gmail.com>
Content-Language: en-US
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <CADLLry53yZ6PZ7X8DwdS=GGp6+6L0tbAkb+hiL-Eth4FZ+ZTNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/30/24 12:46 오후, Austin Kim wrote:
> Hello,
> 
> 2024년 5월 27일 (월) 오후 7:24, <yskelg@gmail.com>님이 작성:
>>
>> From: Yunseong Kim <yskelg@gmail.com>
>>
>> This is a Documentation/process/cve korean version.
>>
>> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
>> ---
>>  .../translations/ko_KR/process/cve.rst        | 107 ++++++++++++++++++
>>  1 file changed, 107 insertions(+)
>>  create mode 100644 Documentation/translations/ko_KR/process/cve.rst
>>
>> diff --git a/Documentation/translations/ko_KR/process/cve.rst b/Documentation/translations/ko_KR/process/cve.rst
>> new file mode 100644
>> index 000000000000..94610c177f17
>> --- /dev/null
>> +++ b/Documentation/translations/ko_KR/process/cve.rst
>> @@ -0,0 +1,107 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/process/cve.rst
>> +:Translator: Yunseong Kim <yskelg@gmail.com>
>> +
>> +==========
>> +CVE 항목들
>> +==========
>> +
> [...]
>> +
>> +잘못된 CVE 항목들
>> +=================
>> +
>> +특정 배포판에서 변경된 사항 적용한 배포판은 더 이상 kernel.org 지원 릴리스가
>> +아닌 커널 버전을 지원합니다. 때문에 Linux 배포판에서만 지원되는 Linux 커널에서
>> +보안 문제가 발견되는 경우 Linux 커널 CVE 팀에서 CVE를 할당할 수 없습니다.
>> +변경된 사항을 적용한 특정 Linux 배포판 자체에 요청해야 합니다.
> 
> It is a little bit hard to understand the above section describing
> 'Invalid CVEs'.
> Please refer to the following sentences if you consider revision of this page.

Thank you for your document review Austin!

I'll take your suggestions and incorporate them into the next patch.

Warm Regards,
Yunseong Kim

> ---
> 유효하지 않은 CVE 항목들
> 
> 보안 이슈가 특정 배포판에서 확인되면 특정 배포판에 변경 사항이 적용됩니다.
> 이 변경 사항이 kernel.org에 적용되지 않으면, Linux 커널 CVE 팀에서 CVE를 할당할 수 없습니다.
> 대신 변경된 사항이 적용된 특정 Linux 배포판 자체에 요청해야 합니다.
> ---
> 
> Thanks for dedication, everybody knows that it is challenging
> to carry out translation work.
> 
> BR,
> Austin Kim
> 
>> +
> [...]
>> +않은 일부 변경 사항이 관련성이 있을 수 있다고 가정합니다.
>> --
>> 2.34.1
>>
