Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D352304BC3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755624890; cv=none; b=SVxvb2Va+NEQYTKAEqYCIRoCPOKRCk+h9sTxaX6bAaFu3cs7Fcc2ld/D+P0NAAmgjbLFP3KH6T4pCiCVbQYozYahxUA3faHc6hzQhnNkmNr4wAMOc+sgFc9noRAqmsSJ5FGgT0eg5Zahevm/8ZZK85/ATEfuucMUlmsiUbTqOXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755624890; c=relaxed/simple;
	bh=bwY4RqvIUVjti8nFxW11inLOnUPd+lLxl6GuRe6CLck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2G7v0GNrDOJhH8GxPqOIcKDUofWwu9kmWzqu7CkZr8Yw1flAdP4WO5piFURE7qEDb5BVriyFvaXeM6nyDbs5n713wU4zNh0KHmWJ3KZ8oHc6QJlWfr4AgrAYwZ01QW4T9e9v3Y/u2kMRSzG23ojw4JcsHh02dDQGTIuDUwDNE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+JXBmQM; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+JXBmQM"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24C640CFD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 17:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPOI8UudOh9Y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 17:34:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0735340933
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0735340933
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b+JXBmQM
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0735340933
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 17:34:47 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45a1b0056cfso8262855e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 10:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755624886; x=1756229686; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rS2Vjoh44icWptyNurpvy4S1A6LcVdl5tDdwEsptosA=;
        b=b+JXBmQMyOMMg/kh7YBgkprSGNMhpTyu6hETeHS3k1AAhrc9dXMspx3qwNTJQOdAfq
         ADDkIRNnJKZXX2GK8+J/BQ0v5nCiwBfLHIyRq3tCVEfHwVokS40dntYNa1wjR/zBNGdO
         Q0uc8YnszHOz+cTNMRZzKPJwrLx854LMsx3fTUNvqqUsEtm17El037JSIXl2DdvIdk2i
         daehEUQLz18VQxhmh+YsnIHS0wWrPV+9yl7q6sB6+VMpRuLpk4AzDJMw16cGdVDx5ffO
         khWkoLvTn7jpUfsVSssAXMnhaQEZITnXTJXau2mUy0pSuK+xiChy8qCMsNinBb4h6GxH
         lOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755624886; x=1756229686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rS2Vjoh44icWptyNurpvy4S1A6LcVdl5tDdwEsptosA=;
        b=rtc6nvSlkbhBXiEeU+Sik6WSYjxqU53ReUGVR0HSL5MXYypOk1mzNE85xcIZ2b/Aki
         YPHutSkuKhAUgZb+mB+9rdQERDrQoKThAIAtWBQh3FFZla4WHEaUhEFEPYOD0u8eXNJ9
         E9riFCqB1CozvN2Db+IDhZFhvOedTdMprLL3JrzHoLW2M2jv1l3oLR05poezLVQoZAyf
         hOyos/60uEZ2hxp1Pm31sHskgW7Kc1Ud3QX7TT3rCF4GNw+Hvl6GYTuLexoGu81JtK6L
         smPnacxs6Q7tW5aJ+w5JTyY9D4pJkq1EMuEIGZ/OMX2OriS8W/N1czlXwZAtRn6FLQRm
         5Tcg==
X-Gm-Message-State: AOJu0YygVhruOaMJxP9wvDHgjLP8kEdqKcXpo8lgCEyfKikhossx89Ww
	bnSfCDJ5jUHqnSPvJxXDGRrwtkdOOU3P86Ot3QkLxR6IbwLdXRjVOOUt
X-Gm-Gg: ASbGnctJaAPIHHpzVyc55JNl7gU5uGN2hHhqB8gZP++Fb3ZkDQb5YaACfVtvu0zgR21
	NwdNTHskjGZqp854kfCHWZSGdN97WS8oV2oXNuCLxehxwvslxk23vCgqm+TjQQeShJZcYbLWbOX
	UTj0JLQeYR6RMNd/HAFWW5UVNmjnfelsiVJvpJn7vTKrdJWiMiyXt5MQkVl0LNAwH/X3oqzEMKa
	zFXUuovfkmYEjqECpQ10FwJwDeiooE4ex6MsWhd4qYftUL82CSWFZpxKHJweaojwyRhviGtnOMs
	WqvXsO+HZv1ATSoG3HkKYwFCt/q2HZBDOmo2L1lIXpx6Tpc/ryUkEFZxBepixQOKfjUZpzccErB
	srmZtqhQAKmWBhQgEM/oMpovhOG/Vh2ybkC3H7t+T
X-Google-Smtp-Source: AGHT+IEEpKSOlOQ4ujkMr6cPIJn/Ad1HradS+o2SX4VhEmxA8lpfnAmVBIe+dKKN2qxJSFevTX6MXQ==
X-Received: by 2002:a5d:64ec:0:b0:3b7:892c:41fc with SMTP id ffacd0b85a97d-3c0eca48b3dmr1039170f8f.9.1755624885649;
        Tue, 19 Aug 2025 10:34:45 -0700 (PDT)
Received: from [192.168.1.16] ([41.231.66.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm4514073f8f.48.2025.08.19.10.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 10:34:45 -0700 (PDT)
Message-ID: <f5eafdfc-2ecd-4212-bb88-b93c34de7673@gmail.com>
Date: Tue, 19 Aug 2025 18:34:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Corrected typo in trace/events
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 skhan@linuxfoundation.org, linux-trace-kernel@vger.kernel.org,
 mathieu.desnoyers@efficios.com, corbet@lwn.net
Cc: linux-kernel-mentees@lists.linuxfoundation.org, mhiramat@kernel.org,
 rostedt@goodmis.org
References: <20250819085040.974388-1-mehdi.benhadjkhelifa@gmail.com>
 <d14df81f-989f-4467-aa0c-5c65009fd66d@infradead.org>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <d14df81f-989f-4467-aa0c-5c65009fd66d@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/25 6:18 PM, Randy Dunlap wrote:
> 
> 
> On 8/19/25 1:49 AM, Mehdi Ben Hadj Khelifa wrote:
>> -Changed 'Dyamically' to 'Dynamically' in trace/events.rst
>>
>> under sections 7.1 and 7.3
>>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks.
> 
>> ---
>>   Documentation/trace/events.rst | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/trace/events.rst b/Documentation/trace/events.rst
>> index 2d88a2acacc0..18d112963dec 100644
>> --- a/Documentation/trace/events.rst
>> +++ b/Documentation/trace/events.rst
>> @@ -629,8 +629,8 @@ following:
>>     - tracing synthetic events from in-kernel code
>>     - the low-level "dynevent_cmd" API
>>   
>> -7.1 Dyamically creating synthetic event definitions
>> ----------------------------------------------------
>> +7.1 Dynamically creating synthetic event definitions
>> +----------------------------------------------------
>>   
>>   There are a couple ways to create a new synthetic event from a kernel
>>   module or other kernel code.
>> @@ -944,8 +944,8 @@ Note that synth_event_trace_end() must be called at the end regardless
>>   of whether any of the add calls failed (say due to a bad field name
>>   being passed in).
>>   
>> -7.3 Dyamically creating kprobe and kretprobe event definitions
>> ---------------------------------------------------------------
>> +7.3 Dynamically creating kprobe and kretprobe event definitions
>> +---------------------------------------------------------------
>>   
>>   To create a kprobe or kretprobe trace event from kernel code, the
>>   kprobe_event_gen_cmd_start() or kretprobe_event_gen_cmd_start()
> 

Thanks for the review Randy,
appreciate your time.
