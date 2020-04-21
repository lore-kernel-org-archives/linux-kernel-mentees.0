Return-Path: <SRS0=yja0=6F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C409DC2BA19
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Apr 2020 10:03:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8633C2076C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Apr 2020 10:03:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajy2zIgJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8633C2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5460121505;
	Tue, 21 Apr 2020 10:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcfP1t+0cR9K; Tue, 21 Apr 2020 10:03:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9D7A82045B;
	Tue, 21 Apr 2020 10:03:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FE2BC1D91;
	Tue, 21 Apr 2020 10:03:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A47D7C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 10:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9D02821505
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 10:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZCWGdKlSMhG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 10:03:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by silver.osuosl.org (Postfix) with ESMTPS id 0E4A62045B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 10:03:51 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id b11so15748462wrs.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=UKn5En7wFKxxWqtksAIp7p+IWhR+PB0MRTNchvViQ+I=;
 b=ajy2zIgJow53wsNAriu9EVmEwXDv7ao5qMQ2lay0VH46ckrdHzD9+fIiTzWWiujLEA
 9kG+L8Dpv/dH6Sk61rXyRrX11Al1a2SZ9h4hA/4gpjLiwckpTx1ZDPLZbhP/do3gP2xH
 VHvBOD5kSFdjCZZNUdgcjH8w1GyF3yYa9KgUqBL7cVdNwpuS5++eOeHV53DszGkpo9YG
 NJvFzHRpcoUqq/3+XwpjA7ThcBpKqSpeE3Chj5q4yCPInYT2NKGBKY+p5ClfrYYvMVbq
 Y8c2HXn2zztKNqaoT6slF2e1hJJREQkyRLsY0UCcbip4/lkjQ8cIL+jb/x9RBhdAthjj
 xDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UKn5En7wFKxxWqtksAIp7p+IWhR+PB0MRTNchvViQ+I=;
 b=QoaQbtTPWc5DrZAEGhvSUubRQsXq/0Tp2YIvLbQzkuHwz7FH3/MkO4CUkLNwvRom/4
 dvwRAAkgOnP3pBm/R2BZLchSq1S4KEzqE01bffSJ9SwiSqgGf6XsN/Ypcs1sptgWBlss
 df3V5D1XUUmXd0D+Uz17HdF2OlRbX/dzhrcpeP2kFIIFKxBESQavFeLCVrv3VTb0NNqw
 rEkJTUX68K1Y1jK9eeWT46I3mcKzvz6maar4jb0+5pvsUrOuqr12h4ZteXmjrShzz4Rh
 90GfrmZVdq/4i4M6q+rYJzfkpdJqyX6KRPZ16aMpXGZDSYfPcQ3LLUa9NjW43q1VXOMr
 0nQw==
X-Gm-Message-State: AGi0PuYIFnIei98BWmFW3t7qZguQON8JCYvRq6BMPPk5cHnopjBQ9WWG
 W6WDPyZazVDIkboPHRQPW18=
X-Google-Smtp-Source: APiQypLw7QpfBLsWc6W92lhUAV9akMenDdMjC/WWbWi2k/kP1EmKwL+UJJLaA2CXWXNYIXWKE5fBoA==
X-Received: by 2002:adf:dec9:: with SMTP id i9mr20000386wrn.197.1587463429590; 
 Tue, 21 Apr 2020 03:03:49 -0700 (PDT)
Received: from net.saheed (5402C526.dsl.pool.telekom.hu. [84.2.197.38])
 by smtp.gmail.com with ESMTPSA id k9sm2987689wrd.17.2020.04.21.03.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 03:03:48 -0700 (PDT)
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <d21c9671-9848-9286-844c-69d7fc9f8297@gmail.com>
 <20200420083617.7cdcbd1c@coco.lan>
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <bd14efb7-6144-1e0d-7cff-459f6d1c9a94@gmail.com>
Date: Tue, 21 Apr 2020 11:04:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420083617.7cdcbd1c@coco.lan>
Content-Language: en-US
Cc: Jonathan Corbet <corbet@lwn.net>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Is anyone working on fixing warnings
	these Documentation files ?
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


On 4/20/20 8:36 AM, Mauro Carvalho Chehab wrote:
> Em Mon, 20 Apr 2020 02:56:18 +0200
> Saheed Bolarinwa <refactormyself@gmail.com> escreveu:
>
>> Hello,
>>
>> Please is there anyone working on fixing these files. I have have
>> checked the email archive,
>>
>> though I surely have not search thoroughly.
>>
>> Please, let me know if you are working on any of these:
>>
>>
>> - Documentation/admin-guide/ras.rst
>>
>> - Documentation/virt/kvm/amd-memory-encryption.rst
>>
>> - Documentation/trace/events.rst
>>
>> - Documentation/power/pm_qos_interface.rst
>>
>> - Documentation/process/programming-language.rst
>>
>> - Documentation/filesystems/fuse.rst
>>
>> - Documentation/admin-guide/bootconfig.rst
>>
>> - Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
>>
>> - Documentation/filesystems/ubifs-authentication.rst
>>
>> - Documentation/driver-api/driver-model/driver.rst
>>
>> - Documentation/driver-api/gpio/driver.rst
>>
>> - Documentation/driver-api/thermal/cpu-idle-cooling.rst
> There is a set of fixes from me at:
>
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=docs-fixes
>
> that were already submitted, but I guess Jon didn't merge yet.
>
> Btw, if you want to do any work, I suggest you to take a look on
> this tree:
>
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=all-docs
>
> Where I merged all patches I did already for documentation and
> that weren't merged upstream yet.

Hello,

Thank you for the response, I have checked the link you gave:

https://git.linuxtv.org/mchehab/experimental.git/log/?h=all-docs

I am not sure if it is the best way to figure out what is not being 
worked on,

but what I did was to search for the files I listed previously and I 
could not

find the ones listed below:

- Documentation/admin-guide/ras.rst

- Documentation/virt/kvm/amd-memory-encryption.rst

- Documentation/admin-guide/hw-vuln/tsx_async_abort.rst

- Documentation/filesystems/ubifs-authentication.rst

- Documentation/driver-api/driver-model/driver.rst


Can I assume they are not being worked on, at least by you?

Thank you.

- Saheed


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
