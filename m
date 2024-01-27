Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E46B125A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jan 2024 05:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706332774; cv=none; b=rjznKEWbJT+niB17qZh4U5WPSDquWPeAh/3g/ohM+rwwXYICrWqBU/Vx6gyYW2BFNFMb/azhcqUFnR0EOyY6k9U5V8NajYeTpOAJKhHs2Qb+1eSu/s5PIEYNEV51y9t0aedQrEARLlKOco+KYiOESB9BogzM0+53iw6XQn/f4S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706332774; c=relaxed/simple;
	bh=UUm52DDs1DdO1GYqGNEYQ/2MhKLs1aaBpZYltmJR5oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxBtN4n0tfODIVK9mnxxMvtFOnMpAAG9y3LGPpuFO2lJ6JU7KtSS0/YKbveDXkdK0PBQlQxnrb3Oi5SdmkxZrMMD8qM5v1ABRFuZRGHuHZ6KcWdhXd8U1pW8HyyRGIwxD6M5hvkc6fCDXTVe3VcvLLfbaCaLyvHoOTY25kUnwAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDEb5Bbd; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDEb5Bbd"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B15360AE1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jan 2024 05:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B15360AE1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dDEb5Bbd
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvM8JcjrKNzp
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 27 Jan 2024 05:19:32 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2835F60ADE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jan 2024 05:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2835F60ADE
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso602258a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jan 2024 21:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706332771; x=1706937571; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZlwPUAl6/WE0Iz5wtvJeDFbKAkv1tr9cB03w9FhW5zw=;
        b=dDEb5BbdrKme5KjOIWr8RLaf3tYhxl/GqldbfXy8OIPU5fwG9zdYq9brjBqPw6RCGc
         7q5ehYAQ0NfQKd1auxkG3r4KlkuwkKYe/XLRZn0ji8a2Gw0jpXuUmXKnVUzyote/Ds4+
         WmO8DlYa4tp9WooX9ofLJGUnixKYgtu+dps2bDG9wsOLMyaFqdxt8naj57pKCtpQPmgT
         S3ZwDudURWjt/ooZ8MkcRybwYl3sjfKSWRwedO04a8mUJiqXUklqQDxNyIK9iZlqPAlf
         nzZ+xUE/nBn/6glD3UDfGOOXLUnSTOGfdTnXYn6phz/6ZwDsmlqZnpbonERDJf2oXHXn
         pDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706332771; x=1706937571;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlwPUAl6/WE0Iz5wtvJeDFbKAkv1tr9cB03w9FhW5zw=;
        b=QBrwypMY2tgQZrDGPgWajURbXIUCiAhi/dXLeCcDbOL5Xmc2rPp4Cu4bEmaEvcAqDO
         sOWo029bjPqQ5IRbLPTZ4M/sRScoPYfHp4WswdHIOPFFr6xI0BHRjWICa6dRm6sG7i3X
         Mr5rQUN8MylxC+/oLBUP46A+DOX4jMaIZ4WJ6gmnSTU5Av3Z8c1hhTR1GBHcdHP8arlK
         xpa/gb4Fgkr3WH3hq7dC/x/tvqj9iA6vHZ+BqzO95uWGLd0mhaG0lDI3nTnFRWW/6qPJ
         cJH55Mvv8w3arM/Y9sakXkIvtxC2Es33FxYfOYYmFI2BHyzG5BXIzCjI0nRnPnccaRbd
         S2Uw==
X-Gm-Message-State: AOJu0YyDJL1an4nnxfWFEXHImc9U98oXkZl2IJEHD9jMSgnNNXEwUsFt
	UNPX+P7gJwjfQOyZr+PBEZ+GnFSBKpJWS5IAoAsLUcI/+jTZ68+/
X-Google-Smtp-Source: AGHT+IGoQk/AVJgLYnRpz/t6BgHCALxC1mQhdVMBlv+sN8qu9oUMcPZo2z7delqcT0PguXyU5JsdNg==
X-Received: by 2002:a62:f252:0:b0:6dd:8a4c:bfb2 with SMTP id y18-20020a62f252000000b006dd8a4cbfb2mr506242pfl.60.1706332771321;
        Fri, 26 Jan 2024 21:19:31 -0800 (PST)
Received: from ?IPV6:2601:204:df00:9cd0:106a:b3d9:2374:e3a5? ([2601:204:df00:9cd0:106a:b3d9:2374:e3a5])
        by smtp.gmail.com with ESMTPSA id a10-20020a63d40a000000b005bd980cca56sm1742316pgh.29.2024.01.26.21.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 21:19:30 -0800 (PST)
Message-ID: <fa71e57c-e50f-4538-afa8-9779f3aebde0@gmail.com>
Date: Fri, 26 Jan 2024 21:19:28 -0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] brcmfmac: replace one-element array with
 flexible-array member
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kees Cook <keescook@chromium.org>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, aspriel@gmail.com,
 franky.lin@broadcom.com, kvalo@kernel.org, linux-wireless@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230803052238.12147-1-rauji.raut@gmail.com>
 <20230803052238.12147-2-rauji.raut@gmail.com>
 <f739cc15-dade-4f69-a17a-30242026c099@broadcom.com>
 <202401181217.1D75C32E@keescook>
 <CAKXUXMzjGbO0U0pko1rg9=q3j6xS5rbzmLnMPeT3g9fMhBr0hw@mail.gmail.com>
From: Atul Raut <rauji.raut@gmail.com>
In-Reply-To: <CAKXUXMzjGbO0U0pko1rg9=q3j6xS5rbzmLnMPeT3g9fMhBr0hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thank You Kees,

Hello Lukas, Arend & Kalle,

Sorry for not getting back to you sooner, am out of county &

hence unable to push the patch right away.

Will share once back, apologize for inconvenience caused.

-Atul


On 1/19/24 05:00, Lukas Bulwahn wrote:
> On Thu, Jan 18, 2024 at 9:20 PM Kees Cook <keescook@chromium.org> wrote:
>> On Thu, Jan 18, 2024 at 02:53:28PM +0100, Arend van Spriel wrote:
>>> + Kees
>>>
>>> On 8/3/2023 7:22 AM, Atul Raut wrote:
>>>> One-element arrays are obsolete, and flexible
>>>> array members have taken their place. So, in
>>>> struct cca_stats_n_flags, replace the one-element
>>>> array with a flexible-array member.
>>>>
>>>> This fixes warnings such as:
>>>> ./drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:119:6-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>>> I think this correct, but maybe Kees can give definitive answer here.
>>>
>>>> Signed-off-by: Atul Raut <rauji.raut@gmail.com>
>>>> ---
>>>>    drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
>>>> index de8a2e27f49c..fff32e54833d 100644
>>>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
>>>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
>>>> @@ -116,7 +116,7 @@ struct brcmf_dump_survey {
>>>>    struct cca_stats_n_flags {
>>>>      u32 msrmnt_time; /* Time for Measurement (msec) */
>>>>      u32 msrmnt_done; /* flag set when measurement complete */
>>>> -   char buf[1];
>>>> +   char buf[];
>>>>    };
>>>>    struct cca_msrmnt_query {
>> Normally a [1] -> [] conversion needs some details in the commit log
>> about why this is safe (since it runs the risk of changing sizeof(struct
>> cca_stats_n_flags). In this case, there's only a single user of the
>> struct, and nothing about its use depends on its size:
>>
>> #define BRCMF_DCMD_MEDLEN       1536
>> ...
>>          struct cca_stats_n_flags *results;
>>          char *buf;
>>          ...
>>          buf = kzalloc(sizeof(char) * BRCMF_DCMD_MEDLEN, GFP_KERNEL);
>>          ...
>>          results = (struct cca_stats_n_flags *)(buf);
>>          ...
>>                  brcmf_parse_dump_obss(results->buf, survey);
>>
>> So, the allocation size is big enough for the struct, and nothing
>> depends on the struct size.
>>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
>>
> As the linux-kernel-mentees mailing list is in CC, I assume that Atul
> is a linux-kernel mentee. In that case, it is certainly reasonable and
> at least of educational value for Atul to take Kees' explanation and
> add this to the patch's commit message in his own words. Then, with
> that, submit a PATCH v3.
>
>
> Lukas
