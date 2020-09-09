Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BE8C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 09:17:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0942120708
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 09:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmSZDcVY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0942120708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 96FEF87502;
	Wed,  9 Sep 2020 09:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pB2IWaFnlZ4n; Wed,  9 Sep 2020 09:17:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 12D86874C7;
	Wed,  9 Sep 2020 09:17:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E690C0859;
	Wed,  9 Sep 2020 09:17:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71FB8C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 61767870D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Otq-0+OiFgo2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:17:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D3F34870C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:17:20 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id v15so1628624pgh.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 02:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yVLlR/GBq8p+XpUnmaqadX/EVjif1LLZMLQOGnFD1X0=;
 b=mmSZDcVY/TdsJ370dKUHF8jSVM8QPpYhE8KukocfBP6hLLVTkf/2SlkspN5uEdlHAe
 emAnk6yqQ/CLAIB9LmQuYvWW3jV5rolHPPja3OQSt799ySlBzFaSXPlZDc566aOFcK3w
 jOPgrnJ2JJT1mQwmwY+trDExSQ356DJvTH2oJZHwT7tSLLm7X/xsU3KfYj2Jz5hLsHDL
 310IWdKfk7ymKi8UwJmU5HuBhRaXhLRzKXRfXFJmxn1cmhcwNMXzfLxvqJEkdkhZZBhc
 CW5uZ2zezSEZ+9iwqkEQh782Rlq+ScVa+SaWkDLmmsnHBsjlb2s7GlMjGUrjPDxw/gkU
 Bu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yVLlR/GBq8p+XpUnmaqadX/EVjif1LLZMLQOGnFD1X0=;
 b=kk0tS3KIzfMU8cKrWN4BVOGnZbPCgQVMhyotaFt25DsrLGpGZ5dizne+gErYLW3DxU
 elqrmEKSsVce86OIlfaqpn/X6Z6RxssWsDaGX2HWnJo5rO/UfZqbUkrFuwOkjN42zaRi
 6qek9nYOQlDySMpNXVenxIXOi47hDNOaEUma4zTcJot3lYZD/k85DFnnucJXFb9DpssE
 M0nflXH+TDK+5gSd/+nTtO3Pzvro3CSaaT7N3bOpdgYr0iLepGmJeHupO/sW26kN3pg8
 70aOLPXT2wnDlSnAYwyKz6vI2UllWc1+VLouKcjTkpp3pFy/3Y9la1leMgbfn2vpJLH7
 aCsw==
X-Gm-Message-State: AOAM531Mh8Fd2Qwp2nhDy018/uzDN3vKwCcJSV/iCw4OnmmnidjFoHHp
 urtBYk2m/nMqOJ2jtzm/koCak2JF4NLIvG7i
X-Google-Smtp-Source: ABdhPJy794NDh5CgmaUeame6GwQdlcGZsZHLK8UOOpRC2QWD189x9b8jcxa/Yx9vXmiLLzxXe/nidg==
X-Received: by 2002:a62:8011:: with SMTP id j17mr8940pfd.98.1599643039756;
 Wed, 09 Sep 2020 02:17:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:20c9:9c65:b4f8:be85:95bb])
 by smtp.gmail.com with ESMTPSA id x3sm1965145pfo.95.2020.09.09.02.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 02:17:19 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <a5104e46-c652-ce52-3604-c33000234718@gmail.com>
 <alpine.DEB.2.21.2009090839110.5622@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <31147ae1-b72c-df49-79cf-27f479f81a99@gmail.com>
Date: Wed, 9 Sep 2020 14:47:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009090839110.5622@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Evaluate and Improve checkpatch: general
	doubts about project
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 09/09/20 12:15 pm, Lukas Bulwahn wrote:
> 
> 
> On Wed, 9 Sep 2020, Ujjwal Kumar wrote:
> 
>> Hello Lukas,
>>
>> I'm Ujjwal Kumar, and this is my first mail to the community :).
>>
>> Recently I came across the following project on Community Bridge:
>> "Linux Kernel: Evaluate and Improve checkpatch.pl"
>>
>> I'm interested in the project (as I think of it as a head-start for me with
>> Linux kernel development).
>>
>> While I was going through prerequisites and mailing list archives, some doubts
>> came to my mind. These are:
>>
>> 1. The prerequisite says: "Show that you are able to modify checkpatch.pl and
>> get a change accepted in the community". Because I'm a bit late I am wondering
>> if it is even possible to get a patch accepted and hence to complete the
>> prerequisite. As you are not familiar with my abilities and knowledge, please
>> consider answering this based on your experience.
>>
> 
> You will need to be experienced with perl, basic English writing skills, 
> and need to show some basic scientific thinking, i.e., understand how to 
> evaluate a change on a larger dataset to estimate pros and cons.
> 
>> 2. I already see some people working around the project, so I have this
>> specific doubt. Does the nature of this particular project allow selection and
>> hence the contribution of more than one mentee?
>>
> 
> The project provides different areas of focus and there is enough work and 
> investigation to look into. Multiple mentees can be mentored on this 
> project.
> The selection is based on the most promising learning curve and the 
> mentee's ability to structure and show that they can identify an issue and 
> find reasonable solutions through the discussion with the mentor and the 
> community.

Thank you for clearing my doubts. I really appreciate your quick response.


> The first task is to set up a working environment that allows contribution 
> of changes to the kernel community and the follow-up discussion.
> 
> Lukas
> 
I have completed the course on Beginner's Guide to Linux Kernel Developement.
So I'm all ready with the working environment.


Thank You,
Ujjwal
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
