Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17666C83F12
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Aug 2023 16:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9124C408CA;
	Mon, 28 Aug 2023 16:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9124C408CA
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fv6CcC+j
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54nU2nMVvgje; Mon, 28 Aug 2023 16:52:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 845ED4010F;
	Mon, 28 Aug 2023 16:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 845ED4010F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62E31C0039;
	Mon, 28 Aug 2023 16:52:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FE55C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 16:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 440AF81E8E
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 16:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 440AF81E8E
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fv6CcC+j
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id my5QxDCnNdkE
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 16:52:53 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A64CB81E71
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 16:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A64CB81E71
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68a3b66f350so2955707b3a.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 09:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693241573; x=1693846373;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5LZIVj4rUAeGJ7xui07ULb5M7AQu4gvcO6R5a7/WUD8=;
 b=fv6CcC+jDOSDUm/VQO7Qa+aKpCgqesssmlz8xpNRVp2auAsq52rLUTPfM9qIuBjg3g
 1oMEevASI9cjIJqFjczV8BtFLZf/jsXGONbGk5KhWJKaLzhTDfNWgtxXXm4nm4iYKbiV
 cQv1oPeTLF/QFX55MKEqZpi3PSrtsMDl6UB+jqTBm21JAi0xSAaXO+TA0XZnIfrk6oM4
 MUNF7fjKxVqrqilR6mq+t4jLwD5n3TxiiVQGrZB/LWaFNzioDgh5PCDI30+zmxew9Lh5
 RMVVeT24xuym6hW4BDR+FPzGVYwV61iF87D7iy0dmLtoCmALFYsD64D9MDmkFTK+pMY+
 o9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693241573; x=1693846373;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5LZIVj4rUAeGJ7xui07ULb5M7AQu4gvcO6R5a7/WUD8=;
 b=Zob3jPeZEi0lqNtuISQTlDUUh4rGXEiA3Txz6xj2a8BxnLNKaqNAyJKNevHzFKy/RX
 Lj92rvfkLVneO2cv+OEIgS5lnGpQF0kfza08e8OlGjuX6drPf/+WtTRAckgUOnTezTPM
 uhcm6sLcwk+u+rFd2iltAiTbOqJ9bXNLFgLsdPwTVWCUH/3rNVMp2lztSbou5dw5KI/G
 WjzijmoBHfXgyzHIHG8CgLE9cd9ImLqLuYS2DuPqXjj9dcYiIyZ/8Ic3qiKOSDVxjs4w
 wL99RDLY7o45S3IVtySOUuOAcclASrAhhJ6LFSO60nfTijUE5dbJcpkJy9amofRy9atg
 NiwA==
X-Gm-Message-State: AOJu0Yyho/2ZsNJpW3A7YJ829lq1L+eN+jZBNphb7uPxuOyvsM+Oj5vM
 S7k0YVaM8UcakDQ01hFzD9o=
X-Google-Smtp-Source: AGHT+IGfJ8QxT/w3CIw7NTnwVugoja1tzYfAy1ChGXPlHyrgXaReZKXt9GXsKlrl9rVH64OCwy7IZQ==
X-Received: by 2002:a05:6a20:dd82:b0:147:fd40:2485 with SMTP id
 kw2-20020a056a20dd8200b00147fd402485mr24846816pzb.35.1693241572861; 
 Mon, 28 Aug 2023 09:52:52 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.179]) by smtp.gmail.com with ESMTPSA id
 s17-20020a62e711000000b00682b299b6besm6881273pfh.70.2023.08.28.09.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 09:52:52 -0700 (PDT)
Message-ID: <3216b72e-76d9-368b-a903-cd3acee96438@gmail.com>
Date: Mon, 28 Aug 2023 22:22:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] ntfs : fix shift-out-of-bounds in ntfs_iget
To: Namjae Jeon <linkinjeon@kernel.org>
References: <20230813055948.12513-1-ghandatmanas@gmail.com>
 <2023081621-mosaic-untwist-a786@gregkh>
 <54a8ae10-71f4-9e91-d2b7-bd4a30a8ac2a@gmail.com>
 <CAKYAXd9-NjSjt-TrJ6fYcPDHcaUm-L=-h5OU98DTw97J2qwmXA@mail.gmail.com>
Content-Language: en-US
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <CAKYAXd9-NjSjt-TrJ6fYcPDHcaUm-L=-h5OU98DTw97J2qwmXA@mail.gmail.com>
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Linux-kernel-mentees@lists.linuxfoundation.org,
 anton@tuxera.com
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

I was looking at this issue for some time now. As suggested by Anton, 
that the vol->sparse_compression_unit is set at the mount. I cannot seem 
to find the code for that part. It seems that the ntfs_inode struct does 
not have any sparse_compression_unit. So I am stuck at that part of the 
problem.

On 28/08/23 08:30, Namjae Jeon wrote:
> 2023-08-18 15:34 GMT+09:00, Manas Ghandat <ghandatmanas@gmail.com>:
>> Sorry for the last reply Greg. The last tag specifies the commit id.
>> Also, I have sent the v5 of the patch in which I have made some critical
>> changes. Please take a look at that.
> Have you checked build error report from kernel test robot ?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
