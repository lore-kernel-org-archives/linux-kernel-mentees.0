Return-Path: <SRS0=qh4O=FP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB486C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Dec 2020 09:16:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CEF023F34
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Dec 2020 09:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CEF023F34
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B039386FDB;
	Fri, 11 Dec 2020 09:16:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYQoOvBUwJD3; Fri, 11 Dec 2020 09:16:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 51F4486FD2;
	Fri, 11 Dec 2020 09:16:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A5E9C0893;
	Fri, 11 Dec 2020 09:16:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4B30C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 09:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A771386FDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 09:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c0+d4YYgtLFd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 09:16:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2591D86FD2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 09:16:19 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id l23so2026258pjg.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Dec 2020 01:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fn3o8ZXVAawnzXehPMQxwsVDmUtRca2uT75xmudgmVs=;
 b=Kip5BzpiQbAxLd9h05hiJxZbOPt3waqjJm6idj9Boa6wqd7hqj2bgLawkE4sUMCP8V
 JWuei56qotiozEjW7BMGQ+qAs4s80pLeutqXb8QPHC9CC16RGJH3Z2x8K+im8iejLKWN
 BkjdJWCszpI5LT/X7Ho8J4S2DgO1fuVHQZRy7f+k1PFSdfHHFtQ8dBGnBMvn/VjYGizU
 ptXlKeF+oLje2JrrTE2MutYX6/4AXPzj56/5k6w30mbwR/yXOBqJgCsgByFY4ncMeKvO
 XUguOH07cZWHukUVKUQz1n1D4VURQ+zQQ0wh4pAbhYtLsYpayJQcE0865+crbgUNbj+8
 h5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fn3o8ZXVAawnzXehPMQxwsVDmUtRca2uT75xmudgmVs=;
 b=U8/0psEUJz0vc1s5MdwEUGvJjXeKrVUVIyARQYSUYbPeL4ppNe38yhKnJXx1Jltlqp
 8zYK6ExoxFRypT1aeSzlAP+5CGUGWz1LzrIYZMl3tx8QFQGFAvYth8NSd8nCuarJLoNM
 hbnZs3aSLKmt+q5kqoEY2jXIs3++H1AGJJ7hbULstzlZbZvKNZR+1kjZHjiZYWBAa70w
 WbzHDur/0SFP7BLx2Yy5eSEIPSKM0Jn2w3LsQyYFl/xVlMPNa8w3zDUpuQAxrceUrCIl
 sKreNX7KoUhRQMgreyNp3q0IWV1oTqNYuz2n+ZRFXcM/NK9bY6b0F/sQOsLKYpR/YaMw
 vOoA==
X-Gm-Message-State: AOAM530jM2JsQM73uFF4m1Bwn/Jd/kXDbCFHgLQszaKOC/ix1qoR0JVC
 imSDunrFfGZBo495196NBsxFX1NMaftNPA==
X-Google-Smtp-Source: ABdhPJzAEvN9gaU6RawufBTbg9zBnpbG29Nmzeon6so2NOjbsd1Qy+K7S3hA7Lj8az9UuT53QeCehw==
X-Received: by 2002:a17:902:eac1:b029:da:88ce:f38f with SMTP id
 p1-20020a170902eac1b02900da88cef38fmr1065916pld.42.1607678178363; 
 Fri, 11 Dec 2020 01:16:18 -0800 (PST)
Received: from ?IPv6:2402:3a80:41d:df96:2141:30a8:a2f2:ddc4?
 ([2402:3a80:41d:df96:2141:30a8:a2f2:ddc4])
 by smtp.gmail.com with ESMTPSA id x1sm9748286pfj.95.2020.12.11.01.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 01:16:17 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
References: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
 <dc09c6a2-dafd-c26e-19fb-ebd7eb212447@gmail.com>
 <CABJPP5AP-gFJEY9D70+HeHUfQC=MnRzps1dOx+Ev+pf3rxBmug@mail.gmail.com>
 <cffb4773-3396-6ebc-f556-2f5d2138b67e@gmail.com>
 <CAKXUXMyD1c1iPEOvPksq_znqbhst=xbqpW5=peyD_+asFMznaA@mail.gmail.com>
 <CABJPP5AOwoshncvbdooy1df4++5NKY-fUMVQUm8yze-w+6-Gmg@mail.gmail.com>
 <CAKXUXMz4fBJ8a_vpYow14yiKoKhC_=bQHHd4WXfOcsxJxqbdcw@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <660a4bb0-1ba4-acd4-e8bc-a53cccfbf10a@gmail.com>
Date: Fri, 11 Dec 2020 14:46:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMz4fBJ8a_vpYow14yiKoKhC_=bQHHd4WXfOcsxJxqbdcw@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] POC script to apply patches into a
 test-branch and run clang-format
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

On 11/12/20 11:57 am, Lukas Bulwahn wrote:
> On Fri, Dec 11, 2020 at 7:24 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>
>>>
>>> Aditya, Dwaipayan, can you set up a git repository that you use
>>> together to work on this script?
>>>
>>> And provide a short description of how to use the script with an
>>> example in that repository?
>>>
>>> Then, I am happy to try it out... and provide you more feedback.
>>>
>>> Lukas
>>
>> Hi Lukas,
>> Sure enough, if Aditya doesn't mind, I will put up a repo for the same.
>>
> 
> Dwaipayan, just set up a repository with your latest state that you
> are currently happy with, then Aditya can fork that and put changes on
> top as he might see fit and open a pull request, so you integrate them
> back.
> 

Hi
I have added my changes in the repo and also provided steps to run the
script in readme.

Repo Link: https://github.com/raydwaipayan/apply-patch

You can use this patch for testing. It applies on next-20201204.

From c631c1b9c4c7e3cdbf0e41b21b8fa1d34ba20aef Mon Sep 17 00:00:00 2001
From: Aditya Srivastava <yashsri421@gmail.com>
Date: Fri, 11 Dec 2020 14:19:52 +0530
Subject: [PATCH] patch for testing

This patch has been created for testing clang-format on c-file.
---
 block/bfq-cgroup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/bfq-cgroup.c b/block/bfq-cgroup.c
index b791e2041e49..8409ee064204 100644
--- a/block/bfq-cgroup.c
+++ b/block/bfq-cgroup.c
@@ -184,7 +184,8 @@ void bfqg_stats_set_start_empty_time(struct
bfq_group *bfqg)
 		return;

 	stats->start_empty_time = ktime_get_ns();
-	bfqg_stats_mark_empty(stats);
+
+bfqg_stats_mark_empty(stats);
 }

 void bfqg_stats_update_idle_time(struct bfq_group *bfqg)
-- 
2.17.1


Thanks
Aditya

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
