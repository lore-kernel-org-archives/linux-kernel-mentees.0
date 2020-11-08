Return-Path: <SRS0=ep41=EO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE43C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 09:19:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 039E6206E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 09:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuYLIP7r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 039E6206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AF9D08687B;
	Sun,  8 Nov 2020 09:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0iT1LAn2Ighm; Sun,  8 Nov 2020 09:19:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 43E1385F8A;
	Sun,  8 Nov 2020 09:19:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2897CC088B;
	Sun,  8 Nov 2020 09:19:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EB3DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 09:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4D38B8547F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 09:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVqwA2mu0jFZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 09:19:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B9465864F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 09:19:35 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w4so4360842pgg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Nov 2020 01:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Icnf3qN5J1LQm6Z8jbn+Oc0palvcbMCrjaRj9yMA+eU=;
 b=MuYLIP7ryGc3zrkp2EEf7DnNqd2mwIq7E+1BGmeDlHAzaSOnNk7WppMej1LtjxC5wI
 VuR3udhh8tIP4Nc9Qm73ymTtrULqlzNhfRtj0R3Muld0eQSqqPzqkcMwCPC5D8DgDrAX
 Rhep8ecYj+uLLaodYw1tzNKAYr3Llc7TsR/I4F9DJHBNZVfTij73oqsEVNdDvVBd1koC
 YDw0YpGmwuAMjVk/Slu4+0PfvWp+YZQOsffwIo4I0qTeECGd0Xt+NBAM7oKkKAQ6NMdg
 dSo0ev9aLr7XqXwTpMpUQ6LuCkGBI4HXXElrt/1UjokM0rQ100ah79d8/VFA0vyyNmDl
 r58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Icnf3qN5J1LQm6Z8jbn+Oc0palvcbMCrjaRj9yMA+eU=;
 b=Rca22xsTRzlgeTYzM4NIHtQU8GD1aMjfzZwJNQA3xsuzCI2vayaHSAf69D6Nno5Fop
 t2/qZrPCzOdMFQ8shoe/iVnJ6eFx9z/EFSZ5378u9nQEm8Cne/JuzvYFrywfXaYwGlWw
 mXgEtW93pEHmKu7Dkg1s5bQqJLcokI0+89uW+E6ld/sZee+Qd9wRquzamE3SdbZRrnMq
 +MrJRYOblC12ZfV4JxcToUZiP/b2rX+3t/ZJHlq9kwJYyTUo2tk86EQ5OxK3zjOXT1ww
 u9VhwYeok7J0jI1YstUxnle8ljY4qvDXgw/eIT/JTmaFwvAmPYXD9a6M5/9xkOroO98Q
 AWuQ==
X-Gm-Message-State: AOAM5319vWVACnJ/qivVUxZXs1Z0Rnaqq28oWA52PHBJ3xDQZ+GLC5cC
 J857SoebUdo1aSYMbLqZQ9BWiTQngvGDyg==
X-Google-Smtp-Source: ABdhPJwjbNDNPKii9SWneaLfqOyyq0HoNMDO88AS+CPEIbUaPl5g4u8GmfDAZVUvAcB6sIw0MMWKNg==
X-Received: by 2002:a62:ac19:0:b029:18b:cfc9:1ea5 with SMTP id
 v25-20020a62ac190000b029018bcfc91ea5mr5272165pfe.45.1604827174793; 
 Sun, 08 Nov 2020 01:19:34 -0800 (PST)
Received: from ?IPv6:2402:3a80:42f:431f:a8c7:19b8:cb80:f5a3?
 ([2402:3a80:42f:431f:a8c7:19b8:cb80:f5a3])
 by smtp.gmail.com with ESMTPSA id q16sm7880197pff.114.2020.11.08.01.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 01:19:34 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201103151858.25375-1-yashsri421@gmail.com>
 <CAKXUXMzx=UacWsoPyiD5AVtfBpVDCcJpAFMo8OpXrf+KNpBFww@mail.gmail.com>
 <6fca02c0-4c4d-c6bd-67b2-35304cf25499@gmail.com>
 <CAKXUXMygzqgiCm+1SCaA5daO5HkoUXyhXS=QEE2d8GKUO4nypg@mail.gmail.com>
 <b8aac750-e460-74ad-674c-a340a1e4f188@gmail.com>
 <alpine.DEB.2.21.2011080738040.4909@felia>
From: Aditya <yashsri421@gmail.com>
Message-ID: <ce5206bd-0beb-a35b-829c-968a01c92e6d@gmail.com>
Date: Sun, 8 Nov 2020 14:49:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011080738040.4909@felia>
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

On 8/11/20 12:17 pm, Lukas Bulwahn wrote:
> 
> 
> On Sun, 8 Nov 2020, Aditya wrote:
> 
>> On 8/11/20 12:08 am, Lukas Bulwahn wrote:
>>>
>>> Can you share the six commits?
>>>
>>> Then we check if the fix is really the right fix of if something different
>>> is wrong with these commits.
>>>
>>
>>
>> These are the commits where this warning for BAD_SIGN_OFF was getting
>> triggered(over 4.13..5.8):
>> 1) Commit 1d1f898df658 ("rcu: Do RCU GP kthread self-wakeup from
>> softirq and interrupt")
>> 2) Commit 6e88559470f5 ("Documentation: Add section about CPU
>> vulnerabilities for Spectre")
>> 3) Commit a35d16905efc ("rcu: Add basic support for kfree_rcu() batching")
>> 4) Commit b7e4aadef28f ("locking/spinlocks: Document the semantics of
>> spin_is_locked()")
>> 5) Commit 621df431b0ac ("Documentation/memory-barriers.txt:
>> Cross-reference "tools/memory-model/"")
>> 6) Commit 1c27b644c0fd ("Automate memory-barriers.txt; provide
>> Linux-kernel memory model")
>>
> 
> I checked all six cases and think the proposed fix is always okay.
> 
> I guess there is still the warning that Co-developed-by: should 
> immediately be followed up the Signed-off-by:, right?
> 
> A possible fix for that would be to check if the needed Signed-off-by: 
> follows somewhere and then just move that to the appropriate place in the 
> patch.
> 

Should I add this in the current patch itself or create another patch
for it?

> When your patch includes this information on how many occurrences, you 
> found and that all of the fixes are correct in those cases, this patch is 
> ready for lkml and Joe Perches.
> 
> Joe will possibly ask to name the six commits, so he can check himself. 
> But no need to add them in the commit message or so.
> 
Okay.

Thanks
Aditya


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
