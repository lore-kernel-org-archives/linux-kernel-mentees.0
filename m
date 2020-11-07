Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A12C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 09:27:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37A8220719
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 09:27:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwRFPg1c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37A8220719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B18522046C;
	Sat,  7 Nov 2020 09:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gfr9BfaXrNpf; Sat,  7 Nov 2020 09:27:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9559E20363;
	Sat,  7 Nov 2020 09:27:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7257BC0893;
	Sat,  7 Nov 2020 09:27:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC614C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 09:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E2CF420465
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 09:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kW4tBXl7Xzhi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 09:27:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 090E820363
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 09:27:31 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w11so2116016pll.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 01:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bzGyuRoQkJSEMIV3lS334hQ3JNytN0nv9mA7vXhY0bY=;
 b=EwRFPg1cqSWBH3hsV7Gf494Po9K77yOQRvHu61gtKE9XLr218oWboYFIvEXJxKplbm
 IyuE7jkXoPFzXzN0LDApn2K+RaQ4DYJieFOvTyhRiBbaHQb6y5QAFk4rDPKt/KsUFhYc
 o0zGzafULdnzFNB8dAkHuEmIOQmYLxvHDx+eYN61y4XDLQXovUUS9/3mywc95bRWa+50
 vxf0h2zbCKUE7430FmGI/6vHyvlcfAJzYnsIRD14YRT0r0Nvx/lnpWxmD/Em7Ip47yLM
 KXl1f5aJzcl8JFKMLWfh6qM3OR4v4QxvaDg7J/czhVYI5ommOR2EavaquadhZxgbqHcv
 pw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bzGyuRoQkJSEMIV3lS334hQ3JNytN0nv9mA7vXhY0bY=;
 b=Pl5hvLGQ1AgWT7F/WR1KM5viVfzVYZLnwzdO+8pDAbj+962pkfJ4L0PNG7SCsV3DF7
 DRYbXaLizdcLEN+g9Dmx1vGyYQ9/5V96XVkZ0BljkvlQXVeF1FvB4KAeKB09m0guxI5X
 60DNoDzY14MRgAtQyWnLqcv7LcnXCKYrngtIKPXxPwG/vKzKhN+X17bZbwFcxaS6BNkM
 uaQLTIB6KCHnkd8ODG+wG3IsoUY77fsZj69xCUAGunCGqP03g44SwG3Dydmdkfe9kg9H
 sNh5xUmO1lm6QA27hzBCnMRpAsxNdyH6PZT2alIvN7zP+rcmcHZGyzUu7/YuokolGd+H
 LSgg==
X-Gm-Message-State: AOAM533lIuzcZDrKNquEs/unBwTdJZXHhKVDF2QBHEpaGIikjcnhXVOB
 J5zfofWubvLq+V50eX0XReyHRkYEDGfJOI+L
X-Google-Smtp-Source: ABdhPJwqlZZ2AjSeMHiYE0EEwn6P59yz+b5eAhEAvc+MUHk0Z0oUgAV79FSARfj+YuJ/WNSbyiZf3w==
X-Received: by 2002:a17:902:c405:b029:d6:e86e:d434 with SMTP id
 k5-20020a170902c405b02900d6e86ed434mr5006976plk.65.1604741250209; 
 Sat, 07 Nov 2020 01:27:30 -0800 (PST)
Received: from ?IPv6:2402:3a80:42d:7bb5:3470:9721:ad9d:115e?
 ([2402:3a80:42d:7bb5:3470:9721:ad9d:115e])
 by smtp.gmail.com with ESMTPSA id k9sm4866403pfp.68.2020.11.07.01.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 01:27:29 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201103151858.25375-1-yashsri421@gmail.com>
 <CAKXUXMzx=UacWsoPyiD5AVtfBpVDCcJpAFMo8OpXrf+KNpBFww@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <6fca02c0-4c4d-c6bd-67b2-35304cf25499@gmail.com>
Date: Sat, 7 Nov 2020 14:57:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMzx=UacWsoPyiD5AVtfBpVDCcJpAFMo8OpXrf+KNpBFww@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for
	BAD_SIGN_OFF
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

On 4/11/20 4:44 pm, Lukas Bulwahn wrote:
> On Tue, Nov 3, 2020 at 4:19 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently, checkpatch warns us if the author of the commit signs-off
>> as co-developed-by.
>> E.g. for commit 6e88559470f5 ("Documentation: Add section about
>> CPU vulnerabilities for Spectre") we get:
>>
>> WARNING: Co-developed-by: should not be used to attribute nominal
>> patch author 'Tim Chen <tim.c.chen@linux.intel.com>'
>> Co-developed-by: Tim Chen <tim.c.chen@linux.intel.com>
>>
>> Provide a simple fix by removing the co-developed-by line from the
>> commit message
>>
> 
> Patch looks good. Maybe you can add a statistics on how many cases of
> the last 200,000 commits this rule would actually trigger?
> 
> E.g., you can probably quickly filter all commits that have at least
> one Co-developed-by tag among those last 200,000 commits (that is
> already only a few thousands), then take that list and just check with
> checkpatch.pl for this one rule quickly to see how often the rule
> would even trigger at all.
> 
> Once you have that and explain that in the commit message, I think the
> patch is ready for lkml and Joe Perches.
> 
> Lukas
> 

Hi Sir
I generated a report for around 200,000 commits (v4.13..v5.8), and
found that this rule was being triggered only 6 times. Statistically
this doesn't seem much. Is it still advisable to mention it in the
commit message?
Although, there's a possibility that user fixed this issue after
receiving the warning manually before committing.

Thanks
Aditya

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
