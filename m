Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDBB1BDAB9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 21:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727991556; cv=none; b=KhyJxbRAXKj9q3XSUcF9WS9qlgz747ptf9s60bE49A4bBBxOcYkpOyBWBbhm8OEzjylRmyXqc1oND2kzbNcftYCBuFsZHdC/wA8lTq05Avh7hFtkbLppQY4cW7Yx55DCPPpwrcFMQKGclHmd+Y+oQZHgEyikQilbRAY0DYvuu0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727991556; c=relaxed/simple;
	bh=nfuNzII8nKcy5KInW0Hf5GAkpxAI6OmWmsIZ6ZyN7c4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovXiLEIBqoHb8rfn1qGXvT/fPUj02jEoI5sCePRaGXL8quEe5hsUIBw74JAYBKgcjL0yrGr8gtLu5hOhzxVgA0TzNQg0Iq4BlaB9TbcWaOcRAM4lkyNl97MQAGbNiQQhgu0SB7jfnjA/7G/X/sFstRZGFOHLnCD0qj+tEtt9wzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TFq/TYHM; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TFq/TYHM"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17F3F40598
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 21:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKmGB81nnoRr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Oct 2024 21:39:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D32BB40338
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D32BB40338
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=TFq/TYHM
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D32BB40338
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 21:39:12 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-82cd872755dso68382739f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 03 Oct 2024 14:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727991552; x=1728596352; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXdW6G5LWJ1GWGh1KXvZndbFeqVS8z0ZBtVcxH6wWkk=;
        b=TFq/TYHMHSguUecULLPTWAXEC4pAw8/1xGqAHBrSHICN0zsMNGl7v8dh/vmA8CO4eA
         N5pM/i5JuChNP1kf8o8P5h8klZV6tp4no24bhm4xNdWksPXJ+XAAomIhXOXajsJiU76O
         dGThaAkGESnhgDWZlFhbsECy5LxzfDVbP0e9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727991552; x=1728596352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXdW6G5LWJ1GWGh1KXvZndbFeqVS8z0ZBtVcxH6wWkk=;
        b=mF7QIQdLfBfs77JR4p17y+gp2RS6IrhgW2o9CvMBNviJDBPhen6uxQw5xqa4QJn282
         kZauOIwj9wYjxewh0mpeAO+er6QqIwjBc0rGAigb5eqQuk9DxbfQSO/YUFZOr+pRxaaP
         Fu+WUWefgZmPp0Mij60fsp0npNsAP0X78ZaiPX6m+EBIOoBub2eFk84IFVu7wFj6CbYg
         Pv45AnBfTNzIGL6DaCtlkwF24zvvgCtDP8VMVtJxYdHDuDdQQemmvp4RHPT5jpskYYjp
         zieGfkE8FpmEzCHGQPf+qkA+9jgsRFkAkLdlKgoW7ywHBZRkhMDOlVgQ5kWil18A6WQS
         FCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkg1+V1k02Uln/aOx58c2Rr6lFsjPblA+3Nn1+EBLaZZ/elEYoDvbNEFl1xZYXZY8I/q7t0K/3P5w8ZVnlcy59wBsChQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxSniNIxEHKKeJN7e8Mb3ITsSWHvfOoLAu2+5ZTDFL97RUM1VIv
	YzmVh9USmBlZpjIW0hi5yAyyem6Wv4H6Z/aq5bDMvKxc1hj+O0M5R3fRxp+45Z5yvQ==
X-Google-Smtp-Source: AGHT+IHUWy3TlQJyb99RJOkAvNUXmRC2WWXVl7330ECrHnSB2ztnXujwddFTXhVmct/HAXJqf38nyA==
X-Received: by 2002:a05:6602:3429:b0:82d:16fa:52dd with SMTP id ca18e2360f4ac-834f7cb0934mr73870639f.7.1727991551952;
        Thu, 03 Oct 2024 14:39:11 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4db55aa5833sm444925173.152.2024.10.03.14.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 14:39:11 -0700 (PDT)
Message-ID: <bb534e04-618d-48b9-ae19-00301e7c73b4@linuxfoundation.org>
Date: Thu, 3 Oct 2024 15:39:10 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] lib/math: Add int_log test suite
To: David Gow <davidgow@google.com>,
 =?UTF-8?Q?Bruno_Sobreira_Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 rmoar@google.com, kunit-dev@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240925025606.1714-1-brunofrancadevsec@gmail.com>
 <CABVgOSmEHtSHHsreVq38AzD+PnacgY6h-+Cv1u4n4U-1yjqwUw@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CABVgOSmEHtSHHsreVq38AzD+PnacgY6h-+Cv1u4n4U-1yjqwUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/3/24 01:00, David Gow wrote:
> On Wed, 25 Sept 2024 at 10:56, Bruno Sobreira França
> <brunofrancadevsec@gmail.com> wrote:
>>
>> This commit introduces KUnit tests for the intlog2 and intlog10
>> functions, which compute logarithms in base 2 and base 10, respectively.
>> The tests cover a range of inputs to ensure the correctness of these
>> functions across common and edge cases.
>>
>> Signed-off-by: Bruno Sobreira França <brunofrancadevsec@gmail.com>
>> ---
> 
> Thanks, this looks good to me.
> 
> Reviewed-by: David Gow <davidgow@google.com>
> 
> Cheers,
> -- David
> 
>> Changes in v3:
>>    - Fix checkpatch issues reintroduced in v2
>> Changes in v2:
>>    - Fix the overflow warning reported by the kernel test robot
>> ---

Bruno,

This doesn't apply - please rebase on top of linux-kselftest kunit branch
and send me v4.

I tried to apply, but a few too many merge conflicts. Rebase is a safer
option.

thanks,
-- Shuah

