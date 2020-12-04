Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EB3C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 17:11:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 805D622B30
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 17:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 805D622B30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 62AD487B23;
	Fri,  4 Dec 2020 17:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oyFDmxtf8bzB; Fri,  4 Dec 2020 17:10:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E96BE87AFA;
	Fri,  4 Dec 2020 17:10:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E33E3C0FA8;
	Fri,  4 Dec 2020 17:10:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC5C7C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 17:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DB59987D30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 17:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8E6wk7DHsQN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 17:10:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4DA0087D2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 17:10:58 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id l23so3517395pjg.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 09:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gkq+ddmvRZNtYS3Dtjn3KF8hbqdi6d0eyfHaP7RaRkQ=;
 b=UDels+muAnTD63GIhPJKB7xGwXnM4EKq0VL6lo0UKV/vasN/C59MDKHvdch20a81BU
 D3LCW/gUx5U1f4c3Gfc3wxYxjUPOBIVO4wvvbG3/rVHpQ0FwTi9vtheNZuARfdSFK6xy
 iH7NN6tThnmkVWfc/0j7jVK5y9Ard8AAHvYmNjYN0+10lwVZooqyKM8oqfGQCdXq0sAF
 j6qD2bsBtSYykan/k+igZhf5r0oO9eSga1LaadLg3UjHWYmVUqCca9wE0xiYTi+X9IlQ
 Xn7DvLnn40y5ZG7qzKeYhPr46Ppi03jKMQ/fD19uhLcTtcP1bF9rZSyK0ulN9gZL9SCl
 ELQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gkq+ddmvRZNtYS3Dtjn3KF8hbqdi6d0eyfHaP7RaRkQ=;
 b=hTVugP3ArIuXyPOHdMpILCyqT/TO8f89WExzg+3/oPJ2Llnf6sQESzkXwrj1i1quFF
 NDA1AyNp65Lxkwves07IoOAMLQxQ6h2zhCKiCTe5aF0GsU7NIoMV+CHdQFP2G1uCddMq
 +zW71QaqeBUmedCSaOrmyWhjhvzq+EITBp4dDq866MwpW7mhwuOGhTp3+jLRBWM4y+JN
 ZhTU66OHmsBmXHuDxh/DKPpEM2LH201Jn2TBrPemcevI0FCfMUTIrRKU2e9IZDIyL9T1
 poNFwKPb+hGw0ZezUU1SI766msYcPSX4+pp13QO5bXT9GIHUweznV/n0HZRryxviG02G
 gQGQ==
X-Gm-Message-State: AOAM532KQ3Wzult+m9KR/c5kY35g4UTEpEPMsoydJErqeFJWT2ppvzzi
 epZ0HiZunhJEF7AJB9BbpJxeSxk5XftsQg==
X-Google-Smtp-Source: ABdhPJzaZrJ4w+y6MFMA0wl5pDZKrzWMz/+JqJoCE6/dSmMIICCsg01/L0/5eZZpTKOEntfnwq4kEw==
X-Received: by 2002:a17:902:59d0:b029:da:69a8:11a8 with SMTP id
 d16-20020a17090259d0b02900da69a811a8mr4852111plj.63.1607101857202; 
 Fri, 04 Dec 2020 09:10:57 -0800 (PST)
Received: from ?IPv6:2402:3a80:43f:b9bb:d059:d26:c75b:b30a?
 ([2402:3a80:43f:b9bb:d059:d26:c75b:b30a])
 by smtp.gmail.com with ESMTPSA id l190sm5361262pfl.205.2020.12.04.09.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 09:10:56 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <280235acc0e91365f3fd3b5be5a5244eced1ff61.camel@perches.com>
 <20201202183045.9309-1-yashsri421@gmail.com>
 <5afbcd1423ee8fc2dfad191d94aef6efc17198c8.camel@perches.com>
 <a2c74693-93ae-cd5a-7836-4ffff643fc09@gmail.com>
 <CAKXUXMxPMdGmnOWdYnS0VQXaAH9dTe7uNfUUPp-GLy2xTXuABw@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <82f6fdae-7e95-83fa-2509-6660de78b138@gmail.com>
Date: Fri, 4 Dec 2020 22:40:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxPMdGmnOWdYnS0VQXaAH9dTe7uNfUUPp-GLy2xTXuABw@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH -mmots] checkpatch: add fix for
 non-standard signature - co-authored-by
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

On 3/12/20 4:29 pm, Lukas Bulwahn wrote:
> On Thu, Dec 3, 2020 at 10:59 AM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 3/12/20 12:26 am, Joe Perches wrote:
>>> On Thu, 2020-12-03 at 00:00 +0530, Aditya Srivastava wrote:
>>>> Currently, checkpatch.pl warns us for BAD_SIGN_OFF on the usage of
>>>> non-standard signatures.
>>>>
>>>> An evaluation on v4.13..v5.8 showed that out of 539 warnings due to
>>>> non-standard signatures, 43 are due to the use of 'Co-authored-by'
>>>> tag, which may seem correct, but is not standard.
>>>>
>>>> The standard signature equivalent for 'Co-authored-by' is
>>>> 'Co-developed-by'.
>>>
>>> I'm not going to ack this as I don't mind non-standard signatures.
>>>
>>
>> What do you suggest?
>> Should I drop this patch and move on?
>>
> 
> Joe does not ack this, but he also does not nack it.
> 
> You either move on (which is perfectly fine), or
> 
> you either wait that Andrew Morton reviews it and accepts it because
> he thinks it useful, or
> 
> you reach out to the git committers that have been using
> Co-authored-by in the past and ask them if this kind of feature would
> have been helpful for them and you get an ack from them that convinces
> Andrew Morton to pick this.
> 

Hi Lukas
I have generated a list of users who used co-authored-by tag, ordered
by the number of times they used it (over v4.13..v5.8) here:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/signature_tags/co_authors.txt

However I am a bit unsure about who among these is still active and
can perhaps give us Acked-by.

Thanks
Aditya

> I hope this helps. If nobody thinks it is a useful feature, move on to
> work others acknowledge as useful. We have enough stuff to work on.
> 
> Lukas
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
