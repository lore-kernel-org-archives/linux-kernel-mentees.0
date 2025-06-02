Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160E4189F20
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  2 Jun 2025 23:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748906553; cv=none; b=af1OFsdeklXp4Om4MNX6Vzq0/bS0xOWdLZRYyBHpiqcUr8oJfmxFNuvyO9+STyK+yySp2Xs5JcQyP/q/ufbEaaTlSrVLVg5U/ESmXZMKeBzM/rAKI99M9YkPPppgIZ1wAPcWu2HunylU67uiVpCD3PSM+5EcCJP8IX50IFUYt2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748906553; c=relaxed/simple;
	bh=CfnMNOCbjMEyJoz3Q1bK4Y14uGlSI1+jGpZw9hAUQRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubR6XiUHbQ+RVEiDPBSV4W2bHGMF7f4VrbGxZMXx631s7AQkHaOeLXN0p7i+BSpk61mHu/jLPgFX49ETrcW1ps5DUEMBIs9ohLI0tn1lgDWpRSaFnPosxMwEVAo9EOjRZVqFQpADwrLWR01RhZYX/YgvZVx1FWDPCVwfuOUo7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=U1F2YhsU; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="U1F2YhsU"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-86cfe449f06so118718239f.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 02 Jun 2025 16:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748906550; x=1749511350; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qT3wVHWE1rM3dJa7hjPLW9JGzPh24mia4Xa7cI/6U6k=;
        b=U1F2YhsUo/lrAdmOl/TWbPbjfUyFHQOSfBx9cRws50rtaYltpKCwLSIU1dae/sslJe
         z3TDa0wm3Y4ByCGICphOHyPB4QqgA09R8C+ekpijMgLejMsDNW4PQ/CNdddlm74ikgas
         EDJRXXv4t3kglJx2Qhx5HIpDfNCWlAeHEmUns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748906550; x=1749511350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qT3wVHWE1rM3dJa7hjPLW9JGzPh24mia4Xa7cI/6U6k=;
        b=ezEmDkbeZ1ggBhVNwMR7pZZ8R1W2ZZoBEisOy8cnDgwUXH3PI1G6RgvHcI9gndd1sX
         PlfNN8SUBfdrhs3SAa30rRaJCZ+eB2Ay5Hh2Shfktz3JyFTjPKQVs0dXqBtj8gIoVGtz
         OSd5NcTiVkBvGEUS0UCHBNl4AV6v+JZTDMQvQi9R9Excjxf7xq1DJVRNPmyu7ENrrf7M
         O5uSKaY1OAr683JktxuSW4LNG0P58GuxrMmEn3hUuEtH0uc+axus1wZahic56a3IhPgX
         QRK/Iay+wzefgF+4hVYX2d0r//h9DqVxaZSrEVT03y9jeVZQv4g8LMwkPIBrLFwhyOkk
         XKRw==
X-Forwarded-Encrypted: i=1; AJvYcCUa7Y18+uujzJNJJxY8ry1N1F15wDcVMwvNeTewcL8TxSuuL1HxPMj6O89YafaJTZ0qrLyYWeggFF6FOROIHk6r10pEZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHAh8vZvGbsYXm3tEBUUBGIZUybdmJ69RAFZKhdVprZYo8Foo2
	Qz3PGvPoIeFVUivIHlA4mDwUGqHoqt7RKbLQwCedsXSS8NT6lKGxF6Ycsb6o86tfwTlt8oAaGY8
	sffmu
X-Gm-Gg: ASbGncsgU2Y84PJdzrc4P3NOLRgTGna+haAKkasjdUeFmbHSbEuoJx9zG4No9PlEUEe
	6k45slQzs//okTqVfq3W54Dcsf4vUO1ZjJbOSrjcoekKIGgbOLOCKV9Mc4zYryPtXjAbZz9w2pl
	Lu2zrRfhMRdic+VUQPvCNZLeN/R70itQ0zegPvs336h+glGnFyrZUIMLFJMl7ozov0LhN3aciM/
	MufHF2Sg6ObOVI9l1t/xqbRD8g/92Q1Vryzxum8/Yv8TwBhA15E5hiSdhyJRJ1q6rC+8i11tDDA
	wH0tdAcEPVs540MLGn3+tec6k3VbrR4gRuQ/CqBWNEx42zu3YU2wuRg2DaC9pQ==
X-Google-Smtp-Source: AGHT+IF7uLkYyb2UqK/tGnOiuFb0m76VobbyWvrOenXTHdPcdfk9UTH7o8q1NlmnaIuPiCjJgFHuQg==
X-Received: by 2002:a05:6e02:230a:b0:3dc:5be8:9695 with SMTP id e9e14a558f8ab-3dd9c989d83mr143426925ab.3.1748906550017;
        Mon, 02 Jun 2025 16:22:30 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd935a7ad0sm24412105ab.66.2025.06.02.16.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 16:22:29 -0700 (PDT)
Message-ID: <c7c071ed-6a4e-4a9c-ba9d-c745fd42c22f@linuxfoundation.org>
Date: Mon, 2 Jun 2025 17:22:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: firmware: Add details in error logging
To: Harshal Wadhwa <embedkari167@gmail.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250516153955.111815-1-embedkari167@gmail.com>
 <73a4b1c9-44b4-4f06-a766-ea7ed391c578@linuxfoundation.org>
 <CAPCCTVOXHUh7j6Vb=dmnY4wi37f4NMo+Pumuho-sA7jq1iH_fQ@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAPCCTVOXHUh7j6Vb=dmnY4wi37f4NMo+Pumuho-sA7jq1iH_fQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/25/25 12:26, Harshal Wadhwa wrote:
> On Fri, 23 May 2025 at 03:49, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 5/16/25 09:39, Harshal wrote:
>>> Specify details in logs of failed cases
>>>
>>> Use die() instead of exit() when write to
>>> sys_path fails
>>
>> Please explain why this change is needed?
>>
>>>
>>> Signed-off-by: Harshal <embedkari167@gmail.com>
>>> ---
>>>    tools/testing/selftests/firmware/fw_namespace.c | 17 +++++++++--------
>>>    1 file changed, 9 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/firmware/fw_namespace.c b/tools/testing/selftests/firmware/fw_namespace.c
>>> index 04757dc7e546..deff7f57b694 100644
>>> --- a/tools/testing/selftests/firmware/fw_namespace.c
>>> +++ b/tools/testing/selftests/firmware/fw_namespace.c
>>> @@ -38,10 +38,11 @@ static void trigger_fw(const char *fw_name, const char *sys_path)
>>>
>>>        fd = open(sys_path, O_WRONLY);
>>>        if (fd < 0)
>>> -             die("open failed: %s\n",
>>> +             die("open of sys_path failed: %s\n",
>>>                    strerror(errno));
>>>        if (write(fd, fw_name, strlen(fw_name)) != strlen(fw_name))
>>> -             exit(EXIT_FAILURE);
>>> +             die("write to sys_path failed: %s\n",
>>> +                 strerror(errno));
>>
>> Hmm. Wrapper scripts key off of the EXIT_FAILURE - how does
>> the output change with this change?
> 
> In the whole test file, all fail cases uses die() with the specified
> error log and error code, so just wanted to add a error log for this
> fault condition and maintain consistency.

You don't want to make changes to be consistent, especially when
the change alters the behavior - this change changes the results.

thanks,
-- Shuah
