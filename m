Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48701D0157
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 19:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675167; cv=none; b=Yb5XaCcJKVx6HXF0L7zWq0jxscUSb1ekXBegvtWJc6BT9l9F7jLm0FgW+612TTIqCZzdgdkbUQeP1AHP48aEC1iY4qkqo+N/MQSJKamAaBLPctB73UJtjYHQ3sAbbOXfs3CboqlIqjTYvNYMHWVqmMXySvcS74rCngWTSDDbn3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675167; c=relaxed/simple;
	bh=jTufO1eqHWvYONgG76j5xyUnwjzmD+Ejxhm+AhPj+AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjt3wUUq6CTEw1T+PVn/rIqB5uvI9IZwe7CrP/nOoHG1sTdExvv5Zx5S6eXzCI90C9RJMLrcutU0jFJJ+C+PEkfU3+/jfXbZpDbZi6lxMCd882H5sshbQYS41ZOngrXQgP1pTbf6PEzt5xePMjl2zY51Y2oTIE/gEMX4qenkX/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbWZHDlD; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbWZHDlD"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9247840BAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 19:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysAjYUFQX4eq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Oct 2024 19:32:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6239A409F8
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6239A409F8
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fbWZHDlD
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6239A409F8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 19:32:44 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-430ee5c9570so25774245e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 12:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728675162; x=1729279962; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HS0NAdsOUYeGI7mRERtfLDO2iH3xgiX9etHXZcQn9A=;
        b=fbWZHDlDwLmXPwjiANdKPD6qR+327j8iVWEmmWF1DFKSYfvoan/l+6CNoopPWXiOYV
         N+P0oXLbYJqAcUo9XQwiwhg/1ka2UvUdZdtt4N70RxTltcy6Td1d45OWs6CCzyoOwMsi
         6+4y0drB4oSlqoECLWW5VlCTTo1hlEqeMjB1XI0HWiOTj3Q7ZidmNJo9q8LBwhwR9A+v
         TaEaZREOz80IkbnFr2jNxh2SWCsXTbKNuMtwtMXTbrrTK7oljoDTeaG9fLAISeXKhLcs
         aCijaDLwhhsrJJ9Hm4CcX8NYV6L2P5cIn3wJTdfGCURfyZjn2V2JmF6iNH1rtFx8DayO
         320g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675162; x=1729279962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HS0NAdsOUYeGI7mRERtfLDO2iH3xgiX9etHXZcQn9A=;
        b=gxTohTLmMsS/7I940VFq4FR3SYD6YRvjZadp/8Mh+rWcw2qfL7FrlW6Fh3HFHTET45
         K31v7XQWk6S3m+wdt7sssm4KEIhgJQExi1OA6/qcp0z54kiwJHBFvbEgwET8SviIuK4+
         4p2cSCUPVZktwCqPzNIdzQE83+HUoJWs86KYzDCn4Ukhv+FYPNFRrt0/yFwAQmuSpYoE
         Q5oeE1sXViWFdd/W2K61jMONuOooVjzQJq6avN3K173onClcN4rzeyAZsTF5Td3umE+m
         Y7UmcFrmdOUjJwhO/2NuG20vkExBqkG9w45FW1jK1V4eO6GfS3MrN1DW5Ivl07SYGj+a
         RNBw==
X-Forwarded-Encrypted: i=1; AJvYcCUdPO+lGMObM1gw1WVf6o+esYVjkbSvLfu9X5/eY10G3LB0neSKkVXqxTwBKfkiVDizv58jWBlrIQeyrpzNQjpCOSBkXA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzhvO2b5qdDMnfJY3zkLOxwu6i4vBnVKsKJ+2uFjxCgfvVvsYVZ
	uaIZqLvyDBKEapIWiozzPkFmXSEB83Q49AFbg2PxadP9G3iOQu7u
X-Google-Smtp-Source: AGHT+IF9+FsG+E30CjlRvWbpTNN1lU2HNefQEhmynyvChYP7LCMUBll81Ko+v5AnAFFcNs3NnrwZbQ==
X-Received: by 2002:a5d:62d2:0:b0:37c:d1c6:7e45 with SMTP id ffacd0b85a97d-37d600d2f59mr572270f8f.40.1728675161754;
        Fri, 11 Oct 2024 12:32:41 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:55c0:165d:e76c:a019? (2a02-8389-41cf-e200-55c0-165d-e76c-a019.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:55c0:165d:e76c:a019])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6b8d13sm4601028f8f.25.2024.10.11.12.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 12:32:41 -0700 (PDT)
Message-ID: <0ec5fd64-a172-4054-a2ef-1c12db41beb5@gmail.com>
Date: Fri, 11 Oct 2024 21:32:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: Fix uninitialized variable
To: Vasileios Aoiridis <vassilisamir@gmail.com>
Cc: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net,
 skhan@linuxfoundation.org, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Adam Rizkalla
 <ajarizzo@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20241011093752.30685-1-0xff07@gmail.com>
 <20241011115334.367736-1-0xff07@gmail.com>
 <26f2e35e-0a07-4b24-91a2-a48d4bc5dadc@gmail.com>
 <ZwlvJCxdiRqRWu6Z@vamoirid-laptop>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <ZwlvJCxdiRqRWu6Z@vamoirid-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

...

> 
> Hi everyone!
> 
> So if you check also the conversations that we had here [1] and in the
> previous versions, indeed the idea behind the offset is to use it as an
> self-explanatory index to a char buffer that holds in fact s32 variables.
> 
> The data->buf here holds the values that have just been read from the
> sensor. If you check on the channel specification of this sensor,
> you will see ".realbits = 24" in both values that the sensor returns so
> hence the value 3.
> 

So you are using 3 = 24 bits, but s32 not as 4 bytes? the whole thing
would have turned into sensor_data[0], sensor_data[4], and no variables
implied, correct? But I am discussing too much for something that in the
end is more or less the same, I am fine with this proposal.

> I am not sure if it makes sense to use a macro here for each one of the
> 3's that are going to be used only one time each and in order to be more
> "consistent". But I might have a wrong view on this one so feel free to
> correct me!
> 
> For the initialization of the offset indeed, it was already mentioned
> here [2] this morning, but on a different patch!!! I couldn't get this
> error though with gcc...
> 
> Cheers,
> Vasilis
> 

At least for the things I do in the kernel, clang catches more issues
than gcc. Sometimes even gcc will not complain, and clang will fail to
compile (e.g. a goto before a cleanup attribute).

And if you run smatch before sending the series, you might discover a
couple of extra "surprises".

Best regards,
Javier Carrasco
