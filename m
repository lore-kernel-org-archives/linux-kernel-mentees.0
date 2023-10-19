Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7267CDB483
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Oct 2023 14:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4956F43001;
	Thu, 19 Oct 2023 14:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4956F43001
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HIqdfPsA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIqw6B4saKMG; Thu, 19 Oct 2023 14:33:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EE341401B2;
	Thu, 19 Oct 2023 14:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE341401B2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9080C0071;
	Thu, 19 Oct 2023 14:33:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F390EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 14:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9FC143001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 14:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9FC143001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jAypVzsGZeQ2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 14:33:21 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2DF5401B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 14:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2DF5401B2
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-357ac7cd08aso475215ab.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1697726000; x=1698330800;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:cc:to:content-language
 :references:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rigMbaQLfwz0k+SRDRDRe2hY0+O2wHTugmUq28DZnss=;
 b=HIqdfPsAwca1sMq+iTEQaxhEF6oeHHGUSuf+bGo0sGU+3RJvGO2jbs8WqERriq0ujf
 chcaPSqZTnqXQJANZiGfqi8Jezz9ZHMNCA+bhGXTyvUstgQol7kW5pI/sbr/6sH02jd3
 /EYq81hS6UwnPX/3MN5lnJ6tHOCqRyluWj4Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697726000; x=1698330800;
 h=content-transfer-encoding:in-reply-to:from:cc:to:content-language
 :references:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rigMbaQLfwz0k+SRDRDRe2hY0+O2wHTugmUq28DZnss=;
 b=TAdD15teR6bRyg/jMH7YOmHwChgF3d9gX1YYf/rvh1rrOLgR1jW/fUD8sgF1GMUP3T
 4JPetoN8SCRg6dv5cPRS8fgueU/w58yTiXv/jKZaACY9939xlf3Y5sBSoQOe4omKKmEq
 J02n4fjdj/XKbFBToGg3qXj58s2K5kuvRzQqrJBe8nShZ3p9Og9sxwAsorE4vOzBGGvu
 c+aZW/iJdbXzNcn4SZr5eIaIBYqGfL452thXt64RzfOk/TKo2BDIihkK4hDPEeiTV+Zy
 09V08/OPdnsDjjX5c0+48qPYO8tkUrpJGByZ7Q+tFYnpttmrXiZju59+gbfMYTsrEyZM
 w26g==
X-Gm-Message-State: AOJu0Yw/y9Ov5DhDtXswEHH7zYRvvemXDxK1CPJxVpm3Snk8m7fpoL7O
 eTvu7lWCcb2IgqguNiXsDRhbcNMK7LrhpFJLs1La1A==
X-Google-Smtp-Source: AGHT+IHKxRtqUxMrvVKBaIu/AGObNeNK4fLKvgW83kNkZ+hZWa4uHyXuvqXGhPEyoJUXexPmQ9kXkw==
X-Received: by 2002:a92:dc0c:0:b0:349:4e1f:e9a0 with SMTP id
 t12-20020a92dc0c000000b003494e1fe9a0mr2609856iln.2.1697726000691; 
 Thu, 19 Oct 2023 07:33:20 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 r5-20020a924405000000b00351287f213bsm1800512ila.14.2023.10.19.07.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 07:33:20 -0700 (PDT)
Message-ID: <3371a658-c304-4f18-94f3-efd32d8ece7c@linuxfoundation.org>
Date: Thu, 19 Oct 2023 08:33:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: KTODO automated TODO lists
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
Content-Language: en-US
To: linux-kernel-mentees@lists.linuxfoundation.org
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
X-Forwarded-Message-Id: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Forwarding a message with information on how to find kernel
tasks. I tried it and found 9 that are tagged KTODO

thanks,
-- Shuah

-------- Forwarded Message --------
Subject: KTODO automated TODO lists
Date: Thu, 19 Oct 2023 07:11:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ksummit@lists.linux.dev
CC: outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org

Yesterday someone on my lists just sent an email looking for kernel
tasks.  This was a university student in a kernel programming class.
We also have kernel-janitors and outreachy and those people are always
asking for small tasks.

One thing that I sometimes say as a reviewer is "This isn't caused by to
your patch but I noticed something wrong."  We could add that kind of
thing to a todo list by using a KTODO line.

KTODO: add check for failure in function_something()

Then people can look on lore or use lei to find small tasks to work on
or they could use lei.

lei q -I https://lore.kernel.org/all/ -o ~/Mail/KTODO --dedupe=mid 'KTODO AND rt:6.month.ago..'

Then grep ^KTODO ~/Mail/KTODO -R and cat the filename you want.

regards,
dan carpenter

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
