Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040A8C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 04:05:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA6220EDD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 04:05:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTWJsmNS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DA6220EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B85E586CEB;
	Wed,  9 Sep 2020 04:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSZHifYGa3Hx; Wed,  9 Sep 2020 04:05:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13EBA86D23;
	Wed,  9 Sep 2020 04:05:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6B65C0052;
	Wed,  9 Sep 2020 04:05:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DFA9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 04:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3761686D8F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 04:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rE5NDBngp0Xg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 04:05:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C39D386D8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 04:05:20 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id n3so705286pjq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 21:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=L3zf1zg3V8Amo3aptv9DdJIsbFnWhJwyNMSEIJqq7to=;
 b=WTWJsmNS2BARjrtl5O0VO4t8BR29bvUFuuX3j3FLN5wamx3tFkiP2UD+/6VdrwZPXf
 kEBOlZ9yQuYwmXN3tUi04BfJz7+0T3Fn/yGw279ShQeV5dURm7mBNrgwAa/aGPuu9Ol8
 xbUgy8g5bdFOUqa7PI9Tbmg4/g6hrJrGVsRXdry8SXvSo66cwnBNIa/tc3nV6yztvkzq
 V9XWMQ/3lapp9RF8UzQSeaq70csY5DiDYvCJQMovHjCqVdIDeBqMlqMfW7PLFnbhRkHq
 CQ5KcJTosNFm9IYxcGingJy6SpiFNuHxE78JOfW49mrqjScX/MH5/e3jAvomQCdC2JJl
 VDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=L3zf1zg3V8Amo3aptv9DdJIsbFnWhJwyNMSEIJqq7to=;
 b=rTUBmjA4+4ERka29cH3vkX6V6RPrJeobXLq3jdrgEpN0U36rS4cxmk3tJmNTrM9tIN
 kT+HbiEAQiE9/zrdOhfTbJGhVxobrf2lMx1PCFyWOSVsIIEZYTG9ao+U0QkCbkniquUP
 /mb01uefyDTJ5toDw6lpDqBqnJYwN9byH2e0lcBKkd8Gg/gQ3EK4mqZA7TqtRUKF4GG2
 YwAV+NAYItVd5Op2UBqbLrHVyUroYNxzS+/AwwF3gbEYjkBbaJtYSHD8Wfata4Oez896
 PUUWnbziFGOo1IgvSv81i5bNbOjP/HqOS5pOoWVtX5pooaesCFJlZ5lKteCcPxUBi9MX
 CoTA==
X-Gm-Message-State: AOAM532+1eZJKCRHRnspCzXvaDcIMlzuKr4nNAYbL1NTNpGdnfoN4oDg
 b766uM9ZJN0/2ERKp4F8f+Ah44MO9ly4QQxf
X-Google-Smtp-Source: ABdhPJzV2y0LcgorEzRrs1+YKSPK+GcMkWmP9KHbmvxVd8fU9MRI1j0wP8f1SDFI4tUuLaC70efyGw==
X-Received: by 2002:a17:90a:a394:: with SMTP id
 x20mr1821214pjp.213.1599624319878; 
 Tue, 08 Sep 2020 21:05:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:20c9:9c65:b4f8:be85:95bb])
 by smtp.gmail.com with ESMTPSA id w6sm679603pgf.72.2020.09.08.21.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 21:05:19 -0700 (PDT)
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To: lukas.bulwahn@gmail.com
Message-ID: <a5104e46-c652-ce52-3604-c33000234718@gmail.com>
Date: Wed, 9 Sep 2020 09:16:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Evaluate and Improve checkpatch: general
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hello Lukas,

I'm Ujjwal Kumar, and this is my first mail to the community :).

Recently I came across the following project on Community Bridge:
"Linux Kernel: Evaluate and Improve checkpatch.pl"

I'm interested in the project (as I think of it as a head-start for me 
with Linux kernel development).

While I was going through prerequisites and mailing list archives, some 
doubts came to my mind. These are:

1. The prerequisite says: "Show that you are able to modify 
checkpatch.pl and get a change accepted in the community". Because I'm a 
bit late I am wondering if it is even possible to get a patch accepted 
and hence to complete the prerequisite. As you are not familiar with my 
abilities and knowledge, please consider answering this based on your 
experience.

2. I already see some people working around the project, so I have this 
specific doubt. Does the nature of this particular project allow 
selection and hence the contribution of more than one mentee?

Answer to these questions would help me decide whether I should continue 
my focus on this project or look at some other issues in the kernel. I 
believe this way it will benefit me as well as the community too.


Thank You,
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
