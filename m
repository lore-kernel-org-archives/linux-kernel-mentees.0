Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065E5C77B7D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 May 2023 05:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C059408B4;
	Mon, 15 May 2023 05:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C059408B4
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VK/SJmfF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yqd8BpkXjb4K; Mon, 15 May 2023 05:58:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7E49840291;
	Mon, 15 May 2023 05:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E49840291
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 527CDC0037;
	Mon, 15 May 2023 05:58:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75D4EC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 05:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B02E83BAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 05:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B02E83BAD
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VK/SJmfF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ou7d1VFtjC2h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 05:58:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E47183B7B
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E47183B7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 05:58:22 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50c079eb705so3039002a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 May 2023 22:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684130300; x=1686722300;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NPQtZOXsXDtCauwTHNXvzScss6wN7/6B+b24lKETaGY=;
 b=VK/SJmfFZupbAd5/+2FwqSOo5GZXg1tMePpH0B9ihJg7i9s70UKRXN7pjr/rJ+Ccti
 vDMxqrkXkt2ev2XIK4l2mpLHAHjNmU9K7T/uZxBGLj3v5x2XFtIGmbNf7p8ROYWbB70E
 7bHRbQmqKhYQAAILyh20N/DkDwZBvCBmPJHG2xYwKzFmZEkrVWZm1jy8VlCvRafH6wEA
 UUqUCKsFqg7uO5fHNlVnznb9KkCr54n0Yijsf0i+1SiIzMzy4Vmh/jl67rkwWBQLpiYk
 Xu3s9GH1cMXUwp6himyLZGzdYFCgJ4839KyyRUI4p81baVKpY8KqzejeZkN+wCbhkKrx
 AC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684130300; x=1686722300;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NPQtZOXsXDtCauwTHNXvzScss6wN7/6B+b24lKETaGY=;
 b=FWcHRyzdSjkxaP9BHFjUkgy3yx3WiHjVMU0qvnDOHsCzqR6mGP8ytUpsLVjTPu8huF
 w/nLyiuAQTZ2KXyRu1koMgZHfl5L3m18MYZxvNi2cCIu+9YOYfIJ2tHMvRkPRZ6sBnzy
 6gCY+0C3ARc59tQBLpV3+GLDtJT3CIz+cnwaayq/Cz6ciUVE2qrqOYtKxTumfKxOfDQS
 KSWpsQZRnDuzfpNq5H98eC0ziw62S2G9mJ3Ezf4WYkw8ZKbBqLRQ72fG90ARKTu084zj
 q2PapcJPhUfO8TX9KcPwVhSqW9MkOLzJXkT7S2l4eK4vvWs2Yztra9ZHJJ0ldl88mW8H
 ah2A==
X-Gm-Message-State: AC+VfDxeq2FECXrg4LvSaQ5onRfSmtkIj9zFOc58FVc0Zyee3TScNt6C
 K4OvgVEzMD1jvPf9clpp1HQ=
X-Google-Smtp-Source: ACHHUZ6nMW9a0P1Ql/uFkqv12DRTC4hSCe3KL6gtMdm1+0pa5miAPoRV2RKERnYzaZnI/EEomTYr/g==
X-Received: by 2002:a17:906:1051:b0:966:1f60:fd32 with SMTP id
 j17-20020a170906105100b009661f60fd32mr5945505ejj.6.1684130300277; 
 Sun, 14 May 2023 22:58:20 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.94.55])
 by smtp.gmail.com with ESMTPSA id
 de47-20020a1709069bef00b0096b20c968afsm1464579ejc.124.2023.05.14.22.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 22:58:20 -0700 (PDT)
Message-ID: <9a76e550-fd1e-851c-e322-4bf51ab11e97@gmail.com>
Date: Mon, 15 May 2023 09:58:18 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] selftests: ALSA: Add test for the 'valsa' driver
To: Mark Brown <broonie@kernel.org>
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
 <20230513202037.158777-3-ivan.orlov0322@gmail.com>
 <ZGGKwA10shGGUr87@finisterre.sirena.org.uk>
Content-Language: en-US
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <ZGGKwA10shGGUr87@finisterre.sirena.org.uk>
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net, tiwai@suse.com, perex@perex.cz,
 linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 5/15/23 05:28, Mark Brown wrote:
> On Sun, May 14, 2023 at 12:20:37AM +0400, Ivan Orlov wrote:
> 
>> +uid=$(id -u)
>> +if [ $uid -ne 0 ]; then
>> +	echo "$0: Must be run as root"
>> +	exit 1
>> +fi
> 
> It is not an error to run the selftest as a non-root user, the test
> should be skipped.

Alright, thanks!
>> +modprobe snd-valsa
> 
> We don't check if the module was already loaded.
> 
>> +if [ ! -e /sys/kernel/debug/valsa/pc_test ]; then
>> +	mount -t debugfs none /sys/kernel/debug
>> +
>> +	if [ ! -e /sys/kernel/debug/valsa/pc_test ]; then
>> +		echo "$0: Error mounting debugfs"
>> +		exit 4
>> +	fi
>> +fi
> 
> This will unconditionally attempt to mount debugfs in a standard
> location and won't clean up after itself, if the system didn't have
> debugfs mounted for some reason then this will leave it sitting there.

Yes, I agree... I'll remove this in the future versions, I think the 
approach with skipping in case of missing debugfs would be better.

By the way, I used the 'fpa' test as an example, and it looks like it 
should be fixed as well...

> Would it not be better to have a C program that actually calls the ioctl
> rather than a custom debugfs thing that may or may not be wired up to do
> the same thing as an ioctl would?  It seems like other than whatever
> this ioctl test actually does this is all just a simplified version of
> the existing pcm-test.

Well, the idea was to test the playback buffer consistency - the driver 
has the functionality of testing the playback buffer for containing the 
looped pattern (and if the buffer doesn't contain the looped pattern the 
test fails). So, firstly we get the capture buffer with this pattern 
(via arecord), and then send it to the driver for the test (via aplay).

The pcm-test (as I understand) performs only time checks, not the checks 
of the data played/captured, and I think it is pointless to test the 
time again. But I agree, that C test implementation would be better - 
using this approach I can perform additional buffer checks and cover 
more functionality of the driver.

Thank you very much for the review!

Kind regards,
Ivan Orlov.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
