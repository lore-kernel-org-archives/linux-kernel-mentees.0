Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1AB1AAE3F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 09:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722417336; cv=none; b=cNTOpUZcIKNWbVN9nPyYiF7W7xF37cKitmGpTNmjiz0Tbvr0CM0eGdvrmya3HFfIEUu3izgiy/KVgldAiwG9bIHled6X/AnTZx0NEfFqMysl4gOqGV6qZ7hHUyihG1hdzd6fFoOgm0F3v0RFY7Y7cyahXuVOvHKL7GnBGZlIizg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722417336; c=relaxed/simple;
	bh=83W9xNyEhrhj9qUBBB3tEuegHbX2AuriMDdh+0vXiuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxBcmIn3NspsCLX1AqNbvFy3zuvpDnBcDeFMKJfUlE0wyGWz2LNkBYqCPPimY0FzIHLdmXA54cYG+H5Ljjx4CpMicVU4VRlbctl1kWzXZ2XQXhnac54dEvQXc4uFB9hXJBIPkktDmcGeLLM/MdQ16rwyFAAeguKD9dgZSyxug4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=am4QhbJc; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="am4QhbJc"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47F9240720
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 09:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1KUgJzG3MKic for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Jul 2024 09:15:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=oneukum@suse.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09F7840710
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09F7840710
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=am4QhbJc
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 09F7840710
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 09:15:32 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2f01e9f53e3so82272911fa.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722417330; x=1723022130; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSGg8nbzE43rNqdiDkmvX9VXw5/3C+7aRCNi7MLm7Wg=;
        b=am4QhbJc8vhXedtP1B01BLwUQoYYB7KdDzCJlY4eI/Roe7L+zq053+QkUQ6sdLLerg
         TAYvlaa3h+Xuw+mSDtyby7anrQZeDK98zXYq11hvBVPXxHkoQIQGYm2wL6WSuS97C82D
         pKx7+TOkTd7eCdlCJ1DTdlLeYIQGCI42ux2dHRTWsUxEStv+bFiZNbd/1KhiZdlQ2G5O
         6nTekFSnh2XHLtpaXvtVW+53y8Znvi6oKP9F+F88lpfN143jrq4HZzfJYh/GCICmnei3
         AypB54ixDrTXWOEF3u8YAe07tq6DnyyFa3OSKjkG1LN6DyRFjEYYisksukmvv56CB3uM
         wj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722417330; x=1723022130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSGg8nbzE43rNqdiDkmvX9VXw5/3C+7aRCNi7MLm7Wg=;
        b=wn6z/wqfR9p/jorYjCdgXHEINOPihqB/1QzzcfheIjyCP96j5qFLV9BXkZ5q9WoYbw
         9EufLxLDMwjP8VHIlknlOC90gInvRNCRs2VW4fcWUFIczfpNKATzDO3cgDSYnoXRNFYs
         t2FFYJ62wQmV7QnvNsjbag135YHhxuzU0pPejdII89ADOXZdTRfYlBHKWAEXoQU9dvF1
         EbEgPTmJUeHnYqB9neQ1xydmaAJIPIQyIP6eNY845WD9k5TbY1RW3aSJNBoKUMrzs3Pq
         TXM2MlYqe5Azn3BuMWaCFaN95T0hcVh9SWWpciqzpzeF5pm5QSI6rVukvMYDHgXx9ySY
         kgPA==
X-Forwarded-Encrypted: i=1; AJvYcCWnYkhcheKcF1ZPBgO5KahWKsi9/0zc0Stz+8qa0Z7IHlokMvFZWW8fn0oumdwc/BV4AzJS2ESipdGkeVRL2slGbIcadz8KHHvpOijiK25D52nFB1RU1h/+jqnajCrP
X-Gm-Message-State: AOJu0Yyz+gzXNDbHNhbLPK9s+vbgHueW7Y/4yTOkrsJYCUsxsA+04vYr
	X5LH39aRLpsYc0RX7cw3dm/LjRUW5f41da4BrkXavFHtRHcnJp9cPL8L0W9ulq8=
X-Google-Smtp-Source: AGHT+IEQ44GksC7yt9tVPJqo9jRk2fLB26LDnjNmJ4RZUywVQidrbsVIjFt6auqVfRzB22Hd0YCyhQ==
X-Received: by 2002:a2e:880c:0:b0:2ef:c8a1:ff4 with SMTP id 38308e7fff4ca-2f12edfef3amr117885781fa.7.1722417329932;
        Wed, 31 Jul 2024 02:15:29 -0700 (PDT)
Received: from ?IPV6:2001:a61:137b:5001:be5a:c750:b487:ff1b? ([2001:a61:137b:5001:be5a:c750:b487:ff1b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad4aaa3sm748177766b.138.2024.07.31.02.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 02:15:29 -0700 (PDT)
Message-ID: <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
Date: Wed, 31 Jul 2024 11:15:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 Oliver Neukum <oneukum@suse.com>
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
 usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
 skhan@linuxfoundation.org, dan.carpenter@linaro.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30.07.24 19:56, Abhishek Tamboli wrote:
> On Tue, Jul 30, 2024 at 09:09:05AM +0200, Oliver Neukum wrote:

>> 1. use a constant, where a constant is used
> I think you are suggesting that I should replace hard-coded values like the
> buffer size with named constants. For example:
> 
> #define BUF_SIZE 8
> unsigned char buf[BUF_SIZE];

Yes, but the constant we need to look at here is bl_len.
This is a variable needlessly.

>> 2. use the macros for converting endianness
> Can I use macros like cpu_to_le32 for converting the bl_num and bl_len values.
> Should I replace all instances of manual bitwise shifts with these macros?

Yes.

> For example:
> 
>      u32 bl_len = 0x200;
>      buf[0] = cpu_to_le32(bl_num) >> 24;
>      buf[4] = cpu_to_le32(bl_len) >> 24;
> 
> Is using cpu_to_le32 appropriate for the data format required by this
> device?

Well, the format is big endian. So, cpu_to_be32() will be required.

	Regards
		Oliver

