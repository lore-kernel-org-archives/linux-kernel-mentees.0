Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C619C2141B7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644586; cv=none; b=YESVwjXwrk2NL+qab19uEBOt3YgHWQSxGi6ZwRdbCmpR83pRkX6Sb3IOxp/Z6qwlSE3G2PBn16pTi9iqbXhEf6n4gNu3tb/FVfMArFamKwgwESSYnUYWMn8FcnHLRvW9r4gtWq9O+dUpM0vXoNiVDbZxVIu6csyCMzxAKAe4DmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644586; c=relaxed/simple;
	bh=PNsJvaR2hjTB0m5F7S8kPrYH81jNbMy+cnbFnpqGHtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OorqiXUFohZwBHK2bLd1nApU5SOelFhCg5W8ASXzr4ig0PuUn4gZLAsO9zqWoCoLWTwN7UkE+tUp/P9bqPKq4+pP66snHodP9GdSTF8c9pdco15aQ6SM7uAccBnTikEfIav0V5SZBiOH6vtiYghTH/j3G152R++dG9FZ0ialqZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tzi9V5KX; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tzi9V5KX"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6291F42441
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 11:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBae6J4UZdTk for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Oct 2024 11:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4165042440
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4165042440
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tzi9V5KX
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4165042440
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 11:03:03 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a99422c796eso313052966b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 04:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728644582; x=1729249382; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDgqCY+XT65kiTHSQJtsyJ8AXYUcreWmz9KtIDjKv1k=;
        b=Tzi9V5KXfL5vqTjEtHGKTtKVOhNcsHo10kYWLm+WyZBK+BWSuxoetUE8PNcv2qyPB+
         1KC9Cnd1YZ62xtNTZc61iMbDa1cgdE3yCdz8ULMcEWgF7548Rf2yjZqZMlRwSFHk+SuG
         2cfGLDFjF5mrzOwAEgR1MKO3bmLoZsZWMaqFZVdRkdNjElCeiEQZx3kuIBP0pD0mAxAf
         Wqh33lVxMWdBFqCoX5fFbOk+mL1Hl1ptgBW99/SRN2aVyUOC7INkJ8CFlAzJDXDRcVus
         K7v6CkKxNP4ys5vBmBS13XsFReVFLEMBSsdAOTTX+kG+PzSWBqPLkZV41hbcq0BoV8Be
         17Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728644582; x=1729249382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDgqCY+XT65kiTHSQJtsyJ8AXYUcreWmz9KtIDjKv1k=;
        b=V5GFc5p/8NyTWtJBhwrvBIzZPlWWYYEZuVeI/xZ/HvHiaILPhlpDukkKW3EMHONU0h
         36knHErQ5rGZjC++iR40KMTaxoVlyMnog2xOuMzXB1wTcUsOtg8Npc7bWuRl1hih7UJE
         zXWDTAww9kEYEIn5l7oa8sS2H39y76b0cp2slpXUol07wnSDHQ+IidREq/6B9sqItOLh
         nz27c9wFRwlJahN68iweGfRMRuDouDce2mQqxhxZFmzoc9h2rU4o3/API6q8knLxvzGi
         QDK6WvYIbcL658HHmXEKbERoFfzor6nFByQH8XSFILMnO7I1sWvPXyoc9DeDJmrKnMx8
         nDMg==
X-Gm-Message-State: AOJu0YyrzPczRDFMFusd+Xh4YSCSAm22WL3ZYfpIZoGqaYn3MOoRoSab
	kqOpWMouZNr4WpNs+YzrNGtSL7vNegwIykn5lZZnDxVl63STbQNc
X-Google-Smtp-Source: AGHT+IEy14Gx0H4bckIlt3krJcapszDFEJlJFkVFRbRzPFWdbCtdvus5IaXo71tLkpD9oWj2tSQarg==
X-Received: by 2002:a17:907:944c:b0:a99:4698:cc5a with SMTP id a640c23a62f3a-a99b95bc0d1mr163059766b.47.1728644581797;
        Fri, 11 Oct 2024 04:03:01 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec573csm200566466b.6.2024.10.11.04.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 04:03:01 -0700 (PDT)
Message-ID: <e9f0310b-c7e7-4da4-92b5-0d2b1948c4a6@gmail.com>
Date: Fri, 11 Oct 2024 13:02:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: Fix uninitialized variable
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net,
 skhan@linuxfoundation.org, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Vasileios Amoiridis <vassilisamir@gmail.com>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Adam Rizkalla
 <ajarizzo@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20241011093752.30685-1-0xff07@gmail.com>
 <ZwkD8hXNWcL0z4Cr@smile.fi.intel.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <ZwkD8hXNWcL0z4Cr@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2024 12:54, Andy Shevchenko wrote:
> On Fri, Oct 11, 2024 at 05:37:45PM +0800, Yo-Jung (Leo) Lin wrote:
>> clang found that the "offset" in bmp580_trigger_handler doesn't get
>> initialized before access. Add proper initialization to this variable.
> 
> ...
> 
>>  	struct bmp280_data *data = iio_priv(indio_dev);
>> -	int ret, offset;
>> +	int ret, offset = 0;
> 
> Can it be done closer to the actual user of it?
> 
> 

Actually, offset could be initialized to sizeof(32), and only used for
the temperature calculations.

+	int ret, offset = sizeof(s32);

The first memcpy would use 0 as index, as it did before.


Best regards,
Javier Carrasco
