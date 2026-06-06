Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17873314A8D
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  6 Jun 2026 09:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780738042; cv=none; b=UdT7FWuDiiSZxKjXF9t2SCvdphKKAH5m0smACwwW5HUe7dMKfzkYo6CEoEIIJI6NI4+6PLGno5yiAxWaAdZTCZbxt2xO8pM4oG2cqp7XvYuM5MYRqYfF9PikA9frGWTSPXZqJ4HyEvXJwpcgkrjDI8dkIaZo5ci1NBPAKHeKTLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780738042; c=relaxed/simple;
	bh=oAYcyU/xg32+wm+itzwDqLCUlfsHpkpwyRpoAl2AWxY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=f3Qg5O/ZbY+OmH8D+5QJwHeciX0l4WcfIn1fYK5AVObQneJIVSUB7WmC5BsizGoxG3KW7DRX1BNVdUvQtfeFHMD1iwN1k1Lfj/h2RLpyMumRo8409VKwUS68zIEFlAMLqvoo/As6sD2qYqdbWJ0bBRyhac4mqmUfAlhNlsu1U/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNxfjowg; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNxfjowg"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef1198766so1487728f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 06 Jun 2026 02:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780738038; x=1781342838; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6rnRDWNFodJfpGcCxgsSzIm6WWEVisydV6yWbLjUSzg=;
        b=UNxfjowgxFnA5gOIhNaZEAIQOUxfAu2Vm/4p5AyEka0yD0ZZxLTzzNOifgf2jmgyRv
         fNUa/uBTLYQIBHvolJtun76G09fDTdqlJ05jjjMLnLPQNKeap9vWCQXbpKYQDmSchz+y
         g71UdT081bCpgVRGthhRmBNoklZl7lhGjFdiD+n7JDtD8Uc5eoeq0IkXIRt5I+QcjUSR
         uYwPdeP7b+wztXItST9EKjJ9uOGI1RE1x1+q72MU0YAo4aFJ91oKlI3tQ/JGxqek27PH
         TWdGg/CybK3IXvF2tH+jnnSmTof4hZYmbSuumE8MyIlf1mOYaTLYNfN62CG7Wn7D1G19
         NsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780738038; x=1781342838;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6rnRDWNFodJfpGcCxgsSzIm6WWEVisydV6yWbLjUSzg=;
        b=U+vjpzqEt3m61Y5VpPNvPjpmyEWp33WOtPbpSDcwzuG/weqaps8rwxOnowBbQ03e5D
         xAdHlhRhT489DYtGeSMh1gwcwF3iPZAKRCQD3uVoIBSvCK0PKdve3iTuofRvKDdCy9us
         rrnbXOvH/bA2xh5nq3V0KXGwZ86JkQZpxKMuQIXZ2H5xhnFRUm3C7lQgX3w2X1+Ap6wk
         XDXJHHpW3Ir8XZ6JOtIpFZZ8cOe8k40i0WisTSBWJ8thDuJbu/bC3yh39CCerQwQypFq
         tybg9qNhHfMaWFvZkl6TibKzPX/puKYyJnj/iarjnF2sXLquBVQrhwAcgVWu3B+0HGRD
         yRvQ==
X-Forwarded-Encrypted: i=1; AFNElJ923JikqbllJ/54XQEGzSMDiyfnPd89y09oKj1rBbbJGn6yfjFbJNnvU5XQcyENIr5r14F7K1yR2KnJFGSFh7W/Aaf7qQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxY+8WNTRMcy5jMBl/+EgZgatjhpgdcDqnhEENq7d5zhWMldFci
	ITC4ep0iuFJ+DEZZHggE/CWXAOklnmP0aREIfWUFLDFMiUM/hdPmC/bi
X-Gm-Gg: Acq92OEV3A4eDjT7teYjca0qiDtbiQeTVdW3g8dQe2vwFZEEHXtSK5FhAMEHl4GJLKX
	nRK1/6cCLmuLYzNO6isHRO2gm2n2RZoI3Zr3XFKS+bEMOjlaTUD55CE0rw95i6F2LjlZviMvY24
	mIpyXXge7uQtoA2fu4VFQ2iV/HiHcBCIcyBg/491DqSRG9W8oUWeJeQZzmSGHfJ9c5J/leMJy2o
	VHjzLskQaKxNGqy0bYI/XYsyFC4Q89PtZB2qXJ+nnCnHHTQYPzBlEbYUQf81avqACS6NWqToEoy
	X8qszw4B28oYMsAAZieaILH5hY6bwsj9udhi+eaN2B2aDCHsCFCjeNEhv7rPZFDaES3Cw3cFAt5
	OvcXNVlTaok7Wd1VNDf6/QGiE6FGfkEWoVIfQ8BWaliQptePqltldd5TRcAybtie6bROnva8Fy+
	KWw5AO1GuVFocCviilIhtyfmDdHVjNTv9Qe85QQiAjEhJQ0jDmMqFGFrLlQr73GjT4yBvCVSYyE
	J1hysLoRQ==
X-Received: by 2002:a05:6000:2083:b0:460:11bd:3fde with SMTP id ffacd0b85a97d-46032da2286mr8499620f8f.13.1780738037992;
        Sat, 06 Jun 2026 02:27:17 -0700 (PDT)
Received: from ?IPV6:2a01:e11:5402:d840:f1ee:c5d:74e4:6e19? ([2a01:e11:5402:d840:f1ee:c5d:74e4:6e19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dce6sm25534821f8f.30.2026.06.06.02.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 02:27:17 -0700 (PDT)
Message-ID: <8392f8a6-719e-43d9-813a-0a163f450ed8@gmail.com>
Date: Sat, 6 Jun 2026 11:27:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] iio: tcs3472: implement wait time and sampling
 frequency
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 shuah@kernel.org, joshua.crofts1@gmail.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20260522123420.45495-1-aldocontelk@gmail.com>
 <20260522123420.45495-9-aldocontelk@gmail.com>
 <9c0bec93-e102-4655-8074-fd544b16d912@gmail.com>
Content-Language: en-US
In-Reply-To: <9c0bec93-e102-4655-8074-fd544b16d912@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/06/26 11:23, Aldo Conte wrote:
> On 22/05/26 14:34, Aldo Conte wrote:
> 
>>   static int tcs3472_req_data(struct tcs3472_data *data)
>>   {
>>       int tries = 50;
>> @@ -166,16 +214,131 @@ static int tcs3472_read_raw(struct iio_dev *indio_dev,
>>           *val = 0;
>>           *val2 = (256 - data->atime) * 2400;
>>           return IIO_VAL_INT_PLUS_MICRO;
>> +    case IIO_CHAN_INFO_SAMP_FREQ: {
>> +        unsigned int cycle_us = tcs3472_cycle_time_us(data);
>> +
>> +        tcs3472_cycle_to_freq(cycle_us, val, val2);
>> +        return IIO_VAL_INT_PLUS_MICRO;
>> +    }
>>       default:
>>           return -EINVAL;
>>       }
>>   }Hi Jonathan,
> 
> One more thing on v4 before I send it.
> 
> For Sashiko's "tries too short" finding, I made the timeout dynamic
> based on the actual cycle time:
> 
>      cycle_us = tcs3472_cycle_time_us(data);
>      timeout_ms = max(1000U, (cycle_us * 2) / USEC_PER_MSEC);
>      tries = DIV_ROUND_UP(timeout_ms, 20);
> 
> 2 * cycle_us gives some safety margin, and the 1-second floor keeps
> the original behavior on default configurations.
> 
> This solves the timeout issue but introduces a new concern:
> tcs3472_cycle_time_us() reads data->{enable,wlong,wtime,atime}
> without holding the lock, both here and in the SAMP_FREQ case of
> read_raw() (also flagged by Sashiko).
> 
> For the SAMP_FREQ case I'll just add guard(mutex)(&data->lock)
> before the call:
> 
>      case IIO_CHAN_INFO_SAMP_FREQ: {
>          unsigned int cycle_us;
> 
>          guard(mutex)(&data->lock);
>          cycle_us = tcs3472_cycle_time_us(data);
>          tcs3472_cycle_to_freq(cycle_us, val, val2);
>          return IIO_VAL_INT_PLUS_MICRO;
>      }
> 
> For tcs3472_req_data() I plan to use scoped_guard() only around the
> cycle_us computation:
> 
>      scoped_guard(mutex, &data->lock)
>          cycle_us = tcs3472_cycle_time_us(data);
> 
>      timeout_ms = max(1000U, (cycle_us * 2) / USEC_PER_MSEC);
>      tries = DIV_ROUND_UP(timeout_ms, 20);
> 
>      while (tries--) {
>          ...
>      }
> 
> Could this be ok?
> 
> Thanks,
> Aldo
Hi Jonathan,
do you have any updates on this idea?

I have already implemented it and it seems to work.

If you agree, I am ready to submit the v4 of the patch.

thanks,
-- Aldo
