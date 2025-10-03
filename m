Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38A72EB856
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759488013; cv=none; b=RGok+3ckUrAAc2oGCPCVXOJkmM/G+iOMrKhApyPQ44Dw13YLZkRJKv7yF6Ckw+U2wQWcOQkFQAC71J+PiXkZwHDUaBaUVisiM04UScH/9i1oPxRYhAA7jbbUfyVodlPut0sgbAKZrxp92pSWAPH5fSocu3Br3utKve1F+/aRm70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759488013; c=relaxed/simple;
	bh=uixQ6kyH22/C96wbs0ukOXrsC4/qnZ7ssmSzbpApo70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ch4MWA449B04RSVCO3/E5Y46I39Si3mh9tbTzs/MY1mkaXuzR0J5x8Xh8g3GGca5D/q1uqcgwm+uEh3ge6S3pR1h2LVJpTBqlOHKgrUBJIbPhtS2aqUP8gyHDMK9yzJiDOMEXBs38J0pBJO/30n9gjuNbe9tPfELSHDbClL2I8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuGauGAk; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuGauGAk"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 513A0408A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 10:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vigjbYn4gH39 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Oct 2025 10:40:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4277B408A5
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4277B408A5
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LuGauGAk
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4277B408A5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 10:40:09 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3edaa784f6dso139474f8f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 03 Oct 2025 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759488007; x=1760092807; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ZzWimyXaZpxT4HA9s/MOFmVrRgLJpUiUIoVWOcDDp0=;
        b=LuGauGAkYMM2sdQGGMm6cz+k1v36T7yam+nN6+iRI3U1JygI5NyZpCZhmwytDYhm6B
         vdeqnldyX3IMkSkCKfHgO+9y2WqHsSYIZA93W/j3SP+9ytbVZYoEqYu2/RoZb5hLhPyX
         erLcn11cabYSy+ezf8iONxPsCovQHfLVbkNxhk9WsjSLeCjCI3I0eWQMc6T3FHILpOrM
         +uN4Ho4dCzatngAbl4lBxSb51zx3GGa043ZKHt6LP/XJIEcp+aelPXiUwRWb+FJQc/m6
         c1Pcuv9jliuTJJjjyMl73emB4+G5U4dvWPQl/40SCxgYw0JSjCxlAWbdHsWL9X1QkWFb
         GJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759488007; x=1760092807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZzWimyXaZpxT4HA9s/MOFmVrRgLJpUiUIoVWOcDDp0=;
        b=GA+h5qiJLqxeJIC5gRJeg7E+bUq38w0o7xTR9Lf2U4PHilItKsLFIrg5J3RsO+idEe
         yBqwgG6cYMnNoSlBi9XduxFWzl4tJC0EdskxmsDtPPO6WjnExHhydK6TzdQdQaZ/Y8fr
         ShzRDTOAhpq86hMJpyBDifC58AU5A1JAEeEXdjb79NBWslPBoNoysF0V82R/28SDUxg8
         x0QsHRVaVCZaWT6WeZKWcE2qbxPgK6sViZKJUo6mrm0lfe1uVwOY9Tsrrj/SF3oYTW0+
         0gOMMtV6XZdW/Ds98lwqmxHL3f8wmy/HDUCsHCDGGjW4pda8H4ptg1Xfu+OyPZ4vn0yJ
         jDmw==
X-Forwarded-Encrypted: i=1; AJvYcCW6sd3sQtYiRPoeC9NWE6G3zL/yBFucBI9yiWVffk9ujtpb2wt3NRB2aRkDz2IrbFr+9rqEgaX+OKxSuQ0wZcbj//emMQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyDa2/s6ShFK7oXOKCpJU3gNJPEKnZB1HK3KWAoujgajSG4EVhw
	7Y9Oye8jQJe2gEq8btxW01FOYFBPIEedwOtKwCsGginqhqJ6Xerh4Wy1
X-Gm-Gg: ASbGnctG+6yP0xQK4nSegCuRF/uPz4NxOY8czUVz+YOGzBPhBDuQGgwv1EW9eW3EhPh
	X7v2dcW6QMaa3E9ScpmwyfdhmiyVSCrFzVURvFh67lb729i4QiBOqi835M46XfU9egD4X0/gAy6
	BuyPi5QtiEVcbbIK4csjazyrkJietwtAZiyGu9rC6sYsLqzVmJ2g2av/g5C06scld5o7dLe0p3V
	AFhULeuLBb8DdfTM3kQRvYOKG5+QgHYtO8DgH/B/yTYfDA2wGYH93pRvQIQHfq3+ee4FaT+jQCQ
	PTmziGeMBHr4TJBE9ZbgK7/EgUQ9jvw7ON1GFyJxrl2xfrC1wpKVCkzTKvDOmuokIW8ySnbGsd3
	VtQjN3Ubeik1y+u6tP1KghmwNIbtOVuU3geoa92dYGUv8mjsmQsh2+p9XJI5JZZitij3xI2A=
X-Google-Smtp-Source: AGHT+IFUSvvSSGhE/OmU6U3tpy7UKk+VR5GvbEDJyFIQIUGJpgNu1HB76w5/4UMrESS3rJMjujyoOQ==
X-Received: by 2002:a05:6000:3105:b0:407:4a78:fff0 with SMTP id ffacd0b85a97d-4256715ac7fmr802161f8f.4.1759488007012;
        Fri, 03 Oct 2025 03:40:07 -0700 (PDT)
Received: from [192.168.100.179] ([102.171.6.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f0170sm7468725f8f.49.2025.10.03.03.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 03:40:06 -0700 (PDT)
Message-ID: <b0388977-413c-46d0-b0e1-fc8d26ef9323@gmail.com>
Date: Fri, 3 Oct 2025 11:40:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] init: Use kcalloc() instead of kzalloc()
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
References: <20250930083542.18915-1-mehdi.benhadjkhelifa@gmail.com>
 <20251002023657.GF39973@ZenIV>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <20251002023657.GF39973@ZenIV>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/25 3:36 AM, Al Viro wrote:
> On Tue, Sep 30, 2025 at 09:35:37AM +0100, Mehdi Ben Hadj Khelifa wrote:
>> Replace kzalloc() with kcalloc() in init/initramfs_test.c since the
>> calculation inside kzalloc is dynamic and could overflow.
> 
> Really?  Could you explain how
> 	a) ARRAY_SIZE(local variable) * (CPIO_HDRLEN + PATH_MAX + 3)
> could possibly be dynamic and
I missed that c is in local scope.It's already of size 3 and since 
CPIO_HDRLEN is 110 and PATH_MAX is 4096 + 3, it's far from the limit and 
it is calculated at compile time since all values are deducible.> 	b) 
just how large would that array have to be for it to "overflow"?
If c could be of any size, it would have to be of size 1,020,310 for 
32-bit kernels and a lot for 64-bit kernels around 4.4 quadrillion 
elements. Which is unrealistic.

> Incidentally, here the use of kcalloc would be unidiomatic - it's _not_
> allocating an array of that many fixed-sized elements.  CPIO_HDRLEN +
> PATH_MAX + 3 is not an element size - it's an upper bound on the amount
> of space we might need for a single element.  Chunks of data generated
> from array elements are placed into that buffer without any gaps -
> it's really an array of bytes, large enough to fit all of them.
Yes I get it now. But Even if the CPIO_HDRLEN + PATH_MAX + 3 is the 
upper bound on the amount of space and in use it doesn't have any gaps 
in memory, Shouldn't we change kzalloc() to kcalloc() since kzalloc() is 
deprecated[1]?
Regards,
Mehdi Ben Hadj Khelifa

[1]:https://docs.kernel.org/process/deprecated.html
