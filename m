Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22293481AA3
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778688749; cv=none; b=Yg9ZzaVC4XB/+Bhq8BVxtCHIc6Gsj2NtOHCAltHAh7cw38GnnY5pMd/9ovnbohnYI+Y3yBLMaHi3UM6MXNBs3lthuVphENkF67mLOz4pGMTET6e+dKdZMxVxRYp5PP+R9p61U1dQ+EtaxV+mqIU3un39wffwZqTqkYk8jicIhuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778688749; c=relaxed/simple;
	bh=Lf94+U8uB4d6shrtPK64fSV3D5WpuG9aew0bJ7m7ysA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jAuPwKuDHnu9kMe21+RG5NGVBj8rMF0R1NLjWK70LbW8/TbQ2aW/UqtG4h2Vdm1SelU/a2M8TEFLHMC/la1URzuB5r/hGOwX9I7KbHXDqcCdDvJpaU5/Alz0nTTcU6kmKR4YzGemjaasUe4J6ytNUd8RgKjI7XLb4cQN/sNaDo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIpaEClk; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIpaEClk"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45562c41ec7so3406922f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 09:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778688747; x=1779293547; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ai6dR/bymyCWlBYI6Ti2e17lWUNYyrdNZIbrxhMJBME=;
        b=RIpaEClklRa/athLU6bJoudm/yhmEiGT2V4BfeVZedzli2lAdPgh2rsFBxdULF/Rpz
         zu4zt8inEZgrGv/W3gTUvWqXKJydb8BWeJ3KzgcW53Auli6FxuUtvmsy4tYVb3YYsk5T
         O+8tWzGcB1Vt0YJhSjByfAzTRUQKg5DuUGbDx7aB6xG0mmDdRuCyYHZ13yRfJ/wyt8Wu
         mdiTnFRCJjmYR0geFDLigraxxEtfvh8AcqFA6IkxALSgTIzYmNtv6V2Fja25SgPB93dR
         3NBWdIWbFC9WM0iqMS2GlUZgXN7K0WpZuTxNiGdMcxjfcyz9h6/E5+i7YFjg9cRjg29l
         WdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778688747; x=1779293547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ai6dR/bymyCWlBYI6Ti2e17lWUNYyrdNZIbrxhMJBME=;
        b=nqpM479cn4VQrCSG+77dq9hyioax9Yst0RXMh756/eqB6qnODaSTN0Q3Lg3wAsfkUP
         WB1b7WeCLhTlspoeY25+N3fGqa0U0Vi5I+wavlPTAzWEt66YNXpCTU9eQsR5GGtYjS3N
         lP1k1UfJ+pE+4ipSjgmgbIlaRFrk1FTktgINBEjwkGzFyIMc8JFUvRfoXKaHh5F5D2js
         ggkHINBZ6CT5iWCbjoNjvYSZZro+PlX5TQBD+PmjLP3O4RfBitf54/V0ZXpaPr0K3WlG
         lvJvTsnmGZyNUt8+nRIQOvJ3nQWYBRsEMEYpEa86zKSjlIDvKFNja8bfETJSSbK2BaTh
         F3Uw==
X-Forwarded-Encrypted: i=1; AFNElJ+heBxxc3+Jj/llKhlwJhmylOutTS45py8VkrgFkX8PI9FGC3tZ3uhYMwwdcZviipeeEHcmB90/okthPB/jk2BAFIh7Gw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmpowhha9/WgiJkwMaMKcBfm7gWHooGojYjxKggUeIE4AluBa5
	9evQXpMwUlqPqGhMa9sjhr2VPUTMkOfmFdPcalMBJnm+Xm4KjCBzDLs1WZhlgA==
X-Gm-Gg: Acq92OHepmgnltmYiLBYeXJmi872hTwqbPfMZ5eoh6xTA6VBPwDOdvaA5CKsTWzbNnn
	TxKqw6GJl+qRFnel9iR2nKuOmUH4rYM+RaHjSVB/G2jsnrhkPDOUptZY12PkxLRhAQZFsk4OYMF
	x58itW1cW5eqvQBP1SY692loxxJr0xIe+2Sg1jEzYW3zYGhJNrGgFbTDETqih7xcEljct5j9HZm
	oJMt/9hGMUWNcQX/qNfMoiI5XLgTinObd6YwLiwf6Zqq8ho1o+G6F54dtGo8Bh1GkDwmkaUYBe6
	k66nRVIVh5TWEYZfeAKle24fmqy/2XTVisleJXy2F9hakYWJBPqQHggFx/Be2Xz+9rYsCHBF3bu
	kjwQ3kSDdaYZg4yu4LnFcZp6DDzb0Hm5vWafsQo/Hy8UinV/bZTkyNy64CDoru6M7wNbny71a7a
	qP5sCeHuMsQvC85DC56H07l0/tgimYHw==
X-Received: by 2002:a05:6000:220c:b0:44f:f4de:a844 with SMTP id ffacd0b85a97d-45c5a392f2fmr6242310f8f.37.1778688746247;
        Wed, 13 May 2026 09:12:26 -0700 (PDT)
Received: from [192.168.37.44] ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491bae13csm40293279f8f.29.2026.05.13.09.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 09:12:25 -0700 (PDT)
Message-ID: <36ed59a7-8af7-4458-9e90-70ea251b389e@gmail.com>
Date: Wed, 13 May 2026 18:12:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] iio: light: tcs3472: move standalone return to
 default case
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, shuah@kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20260512223215.25596-1-aldocontelk@gmail.com>
 <20260512223215.25596-6-aldocontelk@gmail.com>
 <agRfMWL9BughLT2x@ashevche-desk.local>
Content-Language: en-US
From: Aldo Conte <aldocontelk@gmail.com>
In-Reply-To: <agRfMWL9BughLT2x@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 13:23, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 12:32:15AM +0200, Aldo Conte wrote:
>> Move the trailing 'return -EINVAL' statements at the end of
>> tcs3472_read_raw() and tcs3472_write_raw() into explicit default:
>> cases inside the respective switch statements.
>>
>> This removes the need for a separate return statement after the switch.
>>
>> No functional change.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
Hi Andy, Joshua,

Thanks for the review. Before I send v3, I want to make sure I split
the series the way you want.

My plan is to split v2 into 7 patches:

   1. sort headers (same as v2)
   2. convert locking to guard(mutex) (drop Suggested-by, clean up
      trigger_handler)
   3. replace == NULL with ! (add Suggested-by: Joshua Crofts)
   4. use devm for resource management (drop Suggested-by, remove the
      dev_info change, add devm_mutex_init)
   5. use 'dev' for dev_info() calls (new, taken out of patch 4)
   6. implement wait time and sampling_frequency (drop Suggested-by,
      fix macro style, simplify cycle_us and all the other revisions)
   7. move standalone return to default case (same as v2)

Two things I am not sure about:

   - Should patch 3 ("replace == NULL with !") really be its own patch,
     or do you prefer it inside patch 4, since that line is right next
     to devm_iio_device_alloc?

   - Is patch 5 (dev_info refactor) in the right place after the devm
     patch?


Aldo
