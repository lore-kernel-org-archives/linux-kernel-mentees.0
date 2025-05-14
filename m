Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD3D29292A
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 14 May 2025 19:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252441; cv=none; b=iu7yao9YZ5NYV5USobCgvdFTZT6eY1lcabKI4tpJMrGkwgMh7JQ3YMGi5KtL5arx1Etg2qmn7eXzXF4pMNZhVKhpvR0lldhpvINdVY8yKi6elOUsYtRxUJ1KyHO8lmngkXPKIwNos10TzVcPHjrbMas3DPciGSgB6zO5hnjOyvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252441; c=relaxed/simple;
	bh=TiuJIqeQPLPdM7MV5DHSFrrCGNzg1U0NfsIusO3DWzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxG+RTInJggNCgjmqB52erHUcJ8AKkUFdIwCcVL7K/tMbH0t/WT8Yz5ecRGkodmLn6bpP5JDpasKRGH6PoZkKZqx3DGggn2jW0cmMZxqW1uFOmCoSvwrqWiqze8asvroVme3erqtCJf4lPcSx1VI2+v+f0IKrlT3RrqKPjUXBxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H1yPocF8; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H1yPocF8"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-85e15dc8035so4941639f.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 14 May 2025 12:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747252438; x=1747857238; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqFC7XclFM6HmznNg5RpQqMdlIL+E3U4uiILOAOVAFs=;
        b=H1yPocF8VxLmy6nLaBhKQVYGljP7gFZWHG/aqk23L+6odoWFUgv7b6JAHaM06X+TuV
         oi04kX4WX8O14kVVe1S0Ai5EpRnkyZW9qPT8ocdMjgAzwKx/et569SxSroo9GTA09ast
         ifKyXMLsem5yq8Rg8T5p4fzEwtwPouUQH2Hzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747252438; x=1747857238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqFC7XclFM6HmznNg5RpQqMdlIL+E3U4uiILOAOVAFs=;
        b=sH1vf6YNDEfBSpJ8jJnG9dU4ThuKhLGt9S8XreXMUP8aENxYTOqadZvVVS2yha0I5D
         2wbVomu+G4oROdlQk/xZyV/107MVB43y40TopKtxSTQtkOa87SJbCQSM2a+nU5e3UsKa
         AY7N0O+1vMwYgewoQmIcMWk/j0bD7w+o73vF4zgYIccGJ1MyFr6KQT24Ui5x7p9mEf2n
         HUBfeN9ao5KbWCYhl1qb6xgLeFSLScnhQ3A+SwpPN+qRCvQQY39GJPIPR41DRZNbbkUT
         nL9w8/UMUAuKvT0WGlIkhMvY8vs03klOz4qJ4mH0zFGABtyyXi2wXAxMHZ+sop2Rtyl2
         gJkg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ8rQrjeNr82i0Wrih7EfaYyWVNSevKWGnxQP67Ly9Mbfx0lXEtO+x2JOXC37gswIQfZJaJnAAYaGPoU8eUygDWVbCiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxW5NSAdeinngb0vIK/j8nXZohh64AoGirdqNpA8o5iLqfztNJI
	8KgD8i7lxwmxKG30LccS7aPGRpO7VnPlNxWKdQvPjdUR62N3C3+fERjOHRN3+Fk=
X-Gm-Gg: ASbGncsHL1WFdgTzqJoxC5P8R/8JPFSG5mM8/I8CQRL5M1ZkHcrL2Y4i97zT/eqHZQI
	XrtppAwk84KdwINRxg9DDvVMW4Fa4X5+q2C23CV1Z6p0fSo4xvwRsbK7TNND2OifvUxnrI1WaRa
	Zld0psdRKbzrroEMHanl2nZKCrfDRhTUCLRBudgFrtgT2hjpE6Z8qteq2tLWcUt+7XffPNhGpse
	wg0l5v7Hia6PRLWIuVRtyYSSrhSzpW8EIoz3yrWbUSJxApNX70fpeFSCbhU1kb5jnA5UGUi1ssp
	3m742ieAmagBHk84rXPaHtHzV4qoDb9s40IWQSHN5e2SEpAuCaDqT124JfgBkw==
X-Google-Smtp-Source: AGHT+IFuhdhs1GZ17AJuuecrmu3II0fZTAN+vGnkqRWbS3S0XvQHj8BZNypViK3Lagb/zZFIppEymQ==
X-Received: by 2002:a05:6602:3a8a:b0:867:6631:d5cb with SMTP id ca18e2360f4ac-86a08dd377bmr647811939f.5.1747252437851;
        Wed, 14 May 2025 12:53:57 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8676356c768sm291043439f.10.2025.05.14.12.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 12:53:57 -0700 (PDT)
Message-ID: <53a4d88a-e84d-4cc6-a041-93476f9df75d@linuxfoundation.org>
Date: Wed, 14 May 2025 13:53:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/powercap: Implement powercap_set_enabled()
To: Suchit K <suchitkarunakaran@gmail.com>
Cc: trenn@suse.com, shuah@kernel.org, jwyatt@redhat.com, jkacur@redhat.com,
 linux-pm@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250510184709.44935-1-suchitkarunakaran@gmail.com>
 <09c7ad5e-4061-4c0b-b097-fa575c12a244@linuxfoundation.org>
 <CAO9wTFjyEngVR10ixYj=G8udRBeKaxAQquPCdi0V638t3WqQfA@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAO9wTFjyEngVR10ixYj=G8udRBeKaxAQquPCdi0V638t3WqQfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 19:20, Suchit K wrote:
> Thanks for the suggestion, Shuah. And I did compile the kernel after
> making the changes.
> 
> 

Please don't top post in kernel patch responses.

> On Wed, 14 May 2025 at 03:33, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 5/10/25 12:47, Suchit Karunakaran wrote:
>>> The powercap_set_enabled() function previously returned a dummy value
>>> and was marked with a TODO comment. This patch implements the function
>>> by writing the desired mode (0 or 1) to /sys/class/powercap/intel-rapl/enabled
>>
>> The short summary should say cpupower: Implement powercap_set_enabled()

I am not clear on how this can be used. Can you elaborate on the use-case
for the set?

Send me v2 fixing the change log.

>>>
>>> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
>>> ---
>>>    tools/power/cpupower/lib/powercap.c | 22 ++++++++++++++++++----
>>>    1 file changed, 18 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tools/power/cpupower/lib/powercap.c b/tools/power/cpupower/lib/powercap.c
>>> index 94a0c69e55ef..7947b9809239 100644
>>> --- a/tools/power/cpupower/lib/powercap.c
>>> +++ b/tools/power/cpupower/lib/powercap.c
>>> @@ -70,6 +70,22 @@ static int sysfs_get_enabled(char *path, int *mode)
>>>        return ret;
>>>    }
>>>
>>> +static int sysfs_set_enabled(const char *path, int mode)
>>> +{
>>> +     int fd;
>>> +     char buf[2] = { mode ? '1' : '0', '\n' };
>>> +     ssize_t ret;
>>> +
>>> +     fd = open(path, O_WRONLY);
>>> +     if (fd == -1)
>>> +             return -1;
>>> +
>>> +     ret = write(fd, buf, sizeof(buf));
>>> +     close(fd);
>>> +
>>> +     return ret == sizeof(buf) ? 0 : -1;
>>> +}
>>> +
>>>    int powercap_get_enabled(int *mode)
>>>    {
>>>        char path[SYSFS_PATH_MAX] = PATH_TO_POWERCAP "/intel-rapl/enabled";
>>> @@ -77,12 +93,10 @@ int powercap_get_enabled(int *mode)
>>>        return sysfs_get_enabled(path, mode);
>>>    }
>>>
>>> -/*
>>> - * TODO: implement function. Returns dummy 0 for now.
>>> - */
>>>    int powercap_set_enabled(int mode)
>>>    {
>>> -     return 0;
>>> +     char path[SYSFS_PATH_MAX] = PATH_TO_POWERCAP "/intel-rapl/enabled";
>>> +     return sysfs_set_enabled(path, mode);
>>
>> Did you compile this?
>>
>> thanks,
>> -- Shuah

