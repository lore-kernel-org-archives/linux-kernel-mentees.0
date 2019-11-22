Return-Path: <SRS0=fwyv=ZO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DFEC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Nov 2019 15:02:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8999720706
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Nov 2019 15:02:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qqav0lsb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8999720706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5F71520479;
	Fri, 22 Nov 2019 15:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffhS76P+7-fS; Fri, 22 Nov 2019 15:02:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C1D6620444;
	Fri, 22 Nov 2019 15:02:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A95B5C1DD8;
	Fri, 22 Nov 2019 15:02:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C915FC18DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 15:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C388188B4B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 15:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRF2bbH-Atpa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 15:02:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2889A88BCD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 15:02:47 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id p12so982873iog.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 07:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PxNAVs84y6+SdjyjG3T0bh7Cdn5TKSY5guXJVYla5a0=;
 b=Qqav0lsbtPScG0UOqGuwD03uWyG+fZJf9/lRFrM6uiGX4IG+jbsu+j7SR9Djgs2YbY
 2HjIkw4QToMAUPgexium8gqB/KbfNMYvRZ0lW5ibRwX1uQOfkpIV49tlBCocQPU16CoG
 Xc2/dWOLWhYRTShLPJlavRo08QrP61d6PU0XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PxNAVs84y6+SdjyjG3T0bh7Cdn5TKSY5guXJVYla5a0=;
 b=Po9qCCAKAuk5gthJOMS1bknkNStidvKsBm5tUKI9eZnEBZa+yd189U4ogYfovp6l7f
 zYaTRyn6zUfdHjUql958xTf/0m02QRTzzK1aUh8YAc4HSGBAa1a3OS9KgZ8ooilYAfEK
 n8vNFRw6rEYv9VKcawwFow6/5kedN2b8w+BpjLmhPYdkVYTFNslFB7JDp2G5JPu25EH9
 R9gozdmTXMld5v+igO6cL0pm7jU+Fgm5oYQ7bhxlaTdDV3KiXByGudOdPcQkxTkajsqL
 s44xyYAhIssQziYOzTJh86L7rzvXKoxTWxGC8ap2PahEptwddEutTwIGG+ivRpPX6MOg
 nUog==
X-Gm-Message-State: APjAAAWKlBGosP242FlIav+blpxDoPIn+JYSiPuZySjzPZ3/BzgZ37pY
 JzB52RVI43N6Gs04q1RjqHPOQylJ
X-Google-Smtp-Source: APXvYqzZRyzNpVJBMZeDUWupKu+gILtzBpEeZraZSJZ/RrbsiZNRLB7Zm9rrc7n+rU1kJ/uscdFzow==
X-Received: by 2002:a02:92c8:: with SMTP id c8mr13993197jah.2.1574434966112;
 Fri, 22 Nov 2019 07:02:46 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id v15sm3029217ilk.8.2019.11.22.07.02.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Nov 2019 07:02:45 -0800 (PST)
To: Greg KH <gregkh@linuxfoundation.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
References: <a02e01c5-635f-60c3-9d27-6c13abda8ffa@gmail.com>
 <20191121202104.GA812038@kroah.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <078909db-a4e6-3656-67a4-f55cec7395c6@linuxfoundation.org>
Date: Fri, 22 Nov 2019 08:02:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121202104.GA812038@kroah.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, stable@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] Linux 5.3.12 BOOT TEST: Compiled, Booted,
	everything OK.
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

On 11/21/19 1:21 PM, Greg KH wrote:
> On Thu, Nov 21, 2019 at 03:55:34PM -0300, Daniel W. S. Almeida wrote:
>> ~ 2hr uptime: no crashes, no new errors on dmesg, everything looks good.
> 
> Thanks for testing.
> 
>> *This pops up after diffing the output of kselftest though:*
>>
>> < # ./reuseport_bpf: Unable to open tcp_fastopen sysctl for writing:
>> Permission denied
>> ---
>>> # ./reuseport_bpf: ebpf error. log:
>>> # 0: (bf) r6 = r1
>>> # 1: (20) r0 = *(u32 *)skb[0]
>>> # 2: (97) r0 %= 10
>>> # 3: (95) exit
>>> # processed 4 insns (limit 1000000) max_states_per_insn 0 total_states 0
>> peak_states 0 mark_read 0
>>> #
>>> # : Operation not permitted
>>
>> I did not run kselftest as root. I assume it is nothing noteworthy?
> 
> Is this a new issue, or has it always been there?
> 

This is not new issue. Running a root is required based on results
from my test runs.

thanks,
-- Shuah

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
