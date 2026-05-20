Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BFC231842
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 May 2026 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297157; cv=none; b=W2C23+iDtWsgO2x31FG/R3A0n9obHHS3ETsSdR8Q8ixPkcCTe8VykmHkv45PBhfOPReDwapLJkh2dhpjtAtSxCCxN/fW/gdl28HO0C01N78xA5w5SsDS+RtvNupoICBaCVCkt5Zx8DehebpHmOsbKDgVrz2xRyMC7R8C8DeU+W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297157; c=relaxed/simple;
	bh=a+4pkVQFgDvE9l0EyyTH7FWgaU21dziFoD+rVTEcJBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ck0RiLkLZ9qby3vQGAO4T9YXl0DJQVAz3tDVpVj00nCqxnWhYU/3o1eQ6cJYuS2WBb2PPUdOei5i7iJ++h6m6PvGLcOJ7WkugPsptEx2D1ymmzSCOfZy1Ghno2/MIT0aOjhvC58lk/XPsuEJ5KzSCvVKMlsMnVPKRmH6xwPJjEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLuGKAud; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLuGKAud"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso33673685e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 May 2026 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779297155; x=1779901955; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6VNpxJpZImBs2DL2eNAsFduxFIRxVVChzzo7ko081ns=;
        b=sLuGKAudL8iQfcdtUZbZBigOA9scJHbLnFewatOvcTneAkOrvDhOo3cvtBbMDY/h2O
         SySgZi3Tcw/5ZThAfk9sLRH3+t2fOHCtKUkCgqFCoVNKECIyGJsh5dlvApGmD6mXTQhV
         lDqFojJh7qIu02Z2G2fFggmOtlcKnDMCaNo5Bo6NUuRW4H5Z5JJFVltHv/cbp7hPEnvO
         DA3nYCv5rQSxsrXQKKe65bahnHCoL9H94onD27sFu+sVWFZ7Knng0E1wYWavctUuqmbl
         KOnBJR7AWk9trR6E93yvhTP8djaMAm02WAQGxVyL2dpMP0cQZWnwmrQKD1OB99oYXM69
         87eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779297155; x=1779901955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VNpxJpZImBs2DL2eNAsFduxFIRxVVChzzo7ko081ns=;
        b=BmU5SG05AdsqBQawqjwTp2tnxLO7e86Rsni1S8QKPU1xl9uLVReA5hYnw7GtjbPjzx
         izbvZEhUEF/ZYyUNTjXCSYUT5Ko2UVwfB80oMf/7bfvHBortO/Puq1rmcPUmdRmBtIdd
         OmLEkgMq+4e1lAtM1zXqGcGdAFWSpv0gP/o84hrcFqOQF24XFablgP+lzPclORCaCYK9
         PVk9/ZwDWeFd42paWgajwpA4SDRNmWMV+AKpwsIFXm9anm3E5gcnjVRS0Yof73Qwf6lx
         gURtE6Sug6wC6rUB/0vZgrFAnRFVV4lZrjytdQby4z9Jr1kVf4F17tqgIjOw+MbSMmGN
         mxhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ovzC63NLjZ3saRWJhVapN/8+g2lrpGzc+Oa7Q7kUH1+MnCGJmLbKU/B894zb1KZob+DZpTnas6si6/ht6SyUgRc4m5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ5siuNsQcfMnvU25cD9I7SIVPOzapvuY+RasePOtIjEQ/l4+l
	0Jg9sszbBf8EHtsPuLOet6AO0C6JkxvWFNJ/tAW/PG2HjO4huQPeEJue
X-Gm-Gg: Acq92OGqJu0nr5LmUv56RznunF9Ljg72WOe7TMIta0LuwKSY+/CuT6cm5Me3ffYJVTD
	RfLRCxYsvILETA2nJQjLGplViOiVZ0lnEgNpFkt602Sujv9OiVnNmexkxDmr3bEYhmFW7sW669n
	PwCcPJBoroJ1dx9ofM1eAnWwLeyPmSV+3ziIcx4kUiUgYZtgGd+qNsyO4uHunLez29Zwx1FZ5hf
	WUNuF7THXk3JRxABO+ab6GC/dw0T6EIGLaqLI/wT47XPG63s3PAMR9o+/z8251HX+Xq6Tq0gOVz
	dsgVDPRNroruxxvhNVY1eDjHXKfIzVm3r9cbOYb6TzBKd4W9Jb/S9AAePeg8Baf/QKpQh9Ki53c
	slD0l4MUz0dGFpm9L5b3y1xBbSRqsSiJgtD1V02cacFXe1+iwVyCpSK8C5Vd4tPm4BqhvEqmvNb
	tON/661YXODdvx41T0ep+jc5Du9zZ14+WkaZgj8czubLDLYvAe9/O7i4SMwqBmWYd9i4Rpvcs=
X-Received: by 2002:a05:600c:4e4e:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48fe5fd4747mr410414845e9.6.1779297154567;
        Wed, 20 May 2026 10:12:34 -0700 (PDT)
Received: from ?IPV6:2a01:e11:5402:d840:f1ee:c5d:74e4:6e19? ([2a01:e11:5402:d840:f1ee:c5d:74e4:6e19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fead15bf3sm135251275e9.6.2026.05.20.10.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 10:12:34 -0700 (PDT)
Message-ID: <7f56ee25-11ad-4dcf-87bc-a353bed3f914@gmail.com>
Date: Wed, 20 May 2026 19:12:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] iio: light: tcs3472: move standalone return to
 default case
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, shuah@kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20260512223215.25596-1-aldocontelk@gmail.com>
 <20260512223215.25596-6-aldocontelk@gmail.com>
 <agRfMWL9BughLT2x@ashevche-desk.local>
 <36ed59a7-8af7-4458-9e90-70ea251b389e@gmail.com>
 <agS70Dph8-zQT-e6@ashevche-desk.local> <20260515190517.70bb0ba5@jic23-huawei>
 <1c87362a-bba8-45b8-a836-153f468815c4@gmail.com>
 <20260516132555.64e27d62@jic23-huawei>
Content-Language: en-US
From: Aldo Conte <aldocontelk@gmail.com>
In-Reply-To: <20260516132555.64e27d62@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/05/26 14:25, Jonathan Cameron wrote:
> On Sat, 16 May 2026 13:04:13 +0200
> Aldo Conte <aldocontelk@gmail.com> wrote:
> 
>> On 15/05/26 20:05, Jonathan Cameron wrote:
>>> On Wed, 13 May 2026 20:58:40 +0300
>>> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>>
>> ...
>>
>>>
>>> I would add for this that, to reduce churn it's fine to add the
>>> struct device *dev = ... bit and use it in new devm calls. Just do the
>>> remainder in the follow on commit.
>>>    
>>>>
>>>>   
>>>    
>>
>> Hi Jonathan, Andy and all!
>>
>> Thanks for your reviews! they’re teaching me so much!
>> If I understand correctly, I need to wait a week before submitting version v3
>> such that other reviewers can comment right?
>>
>> I’d like to take this opportunity to suggest two alternative lists of what
>> version v3 might look like in terms of patch order:
>>
>> First option does not consider the "== NULL with !" patch and so:
>> 1. iio: tcs3472: power down chip on probe failure (NEW precursor, bug fix)
>> 2. iio: tcs3472: sort headers alphabetically (same)
>> 3. iio: tcs3472: convert several functions to use guard(mutex)() (modified)
>> 4. iio: tcs3472: use devm for resource management (slimmed down)
>> 5. iio: tcs3472: use locale struct device * for remaining cases (NEW)
>> 6. iio: tcs3472: implement wait time and sampling frequency (revised)
>> 7. iio: tcs3472: move standalone return to default case (same as v2)
>>
>> Second version will consider it:
>> 1. iio: tcs3472: power down chip on probe failure (NEW precursor, bug fix)
>> 2. iio: tcs3472: sort headers alphabetically (same as v2)
>> 3. iio: tcs3472: convert several functions to use guard(mutex)() (modified)
>> 4. iio: tcs3472: replace == NULL with ! (NEW, optional)
>> 5. iio: tcs3472: use devm for resource management (slimmed down)
>> 6. iio: tcs3472: use locale struct device * for remaining cases (NEW)
>> 7. iio: tcs3472: implement wait time and sampling frequency (revised)
>> 8. iio: tcs3472: move standalone return to default case (same as v2)
>>
>>
>> What do you think?
> Either is fine but swap the last two patches.  The wait time one is
> more complex than that trivial cleanup so might take more revisions.
> 
> I frequently pick up the first part of series just to avoid people
> having to keep sending the same unchanged code to the list (that I've
> often forgotten about completely by the next version!)
> 
> Jonathan
> 
>>
>>
>> Thanks,
>> Aldo
> 

Hi Jonathan,

I have two quick questions.

First, Uwe's "[PATCH v2 0/7] iio: Rework i2c_device_id initialisation" also 
touches tcs3472.c. My series modifies the same file for unrelated reasons. 
Should I wait for Uwe's series to land and rebase on top, or is it fine to send 
now and let you handle the overlap? How does it work in  case?

Second, the first patch in my series fixes missing power-down on probe failure 
(goto err_powerdown). Do I need to add the “Fixes” tag?

Thanks for your time.

Aldo Conte

