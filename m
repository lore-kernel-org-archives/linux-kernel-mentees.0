Return-Path: <SRS0=OBpN=FK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAAAC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Dec 2020 10:49:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E49BB22D2C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Dec 2020 10:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E49BB22D2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 62F0E80D34;
	Sun,  6 Dec 2020 10:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ftz3snfrFBn; Sun,  6 Dec 2020 10:49:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF996868D3;
	Sun,  6 Dec 2020 10:49:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C37AFC0893;
	Sun,  6 Dec 2020 10:49:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C43ECC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Dec 2020 10:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B09FA8701C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Dec 2020 10:49:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oV2bBjBfMGin
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Dec 2020 10:49:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2B27087009
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Dec 2020 10:49:05 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id m9so6487887pgb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Dec 2020 02:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NTQgBQ+PVhArG7ia7k9AHs0mZF1b6GWlzErYeH6aRUA=;
 b=f2xNquQ3CQSm0kiwc2f0w2uXXMrGS79ukoEIJBw9fJ/9og6SGpC/ub9FGd38P1IFXP
 otfEnFYLF+DyftmVdP+wCoZdljJo/qPRWBtH3J/L3BWZJIqvQSsOHhhqNrg3jDJiFWdk
 HsfJRSWKiE5RVZvFr3mgUuy0peMVaMotuRe665f2fRCRJFzx8xZZ7q2ifFPMr3SI9mcM
 wfmN8rzsJYYyhyzHVUK5jcU5AyqcG8vRDM9v/86XaOAZFG9SRsV3wCQtSUkRxtcyZViX
 BXB+dZJHMxan2GdCNOBKTe3KjU8zCAj71fiEy+ZzJWIwm9+EEEiL9BKfHx6ZjgY9XNTX
 BagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NTQgBQ+PVhArG7ia7k9AHs0mZF1b6GWlzErYeH6aRUA=;
 b=XvTX7B19hS0LsZdsUqthd/tel9AGJv1yiQSTnNuA2VyIdy62lqdioTJymFt23mr//u
 aQd8bVGj+N0eLBnUynOGZhDLiqG6KKGUo8CFQeOWbXRE7dx0icfKhKDqq3gdwLVpxIs1
 O0Xt0qbFf/5Qj311iBoPQG24pHIjyHFxPBDzmKPqMy4K7KlyGHs9L3CQEdV+nbbHp8F8
 TKDBI+Y23ap9MJrB3uyJELGMCL0dHteyurSYFhk6MnhO1zL1E6zHc/7CgYYi3ETwbIgj
 mbFcfL8+yIThVxyaM5yqzKqVzlOhbS7Sh+52csefM7CNU/VjC12u74505AsC2/CDRmNE
 0J1Q==
X-Gm-Message-State: AOAM530Di6WFvRL5tMuu0VeS1Stvo7t3jyiSK1K0EVag/rB4a7KxW81k
 w92MZw+kJSA3USbsIF3Rh3VyfLv8MeIADQ==
X-Google-Smtp-Source: ABdhPJxJJvUHfsEN0ZQc7BPgAju+RGW2R8VB092D+8MDWFIDSZWOKKeePRyHXB6l6ixQjmV1CaWnqg==
X-Received: by 2002:a63:230a:: with SMTP id j10mr14287324pgj.366.1607251744422; 
 Sun, 06 Dec 2020 02:49:04 -0800 (PST)
Received: from ?IPv6:2402:3a80:426:136e:8d5e:34bd:ef51:e7c9?
 ([2402:3a80:426:136e:8d5e:34bd:ef51:e7c9])
 by smtp.gmail.com with ESMTPSA id r11sm9568665pgn.26.2020.12.06.02.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 02:49:03 -0800 (PST)
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
References: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
 <dc09c6a2-dafd-c26e-19fb-ebd7eb212447@gmail.com>
 <CABJPP5AP-gFJEY9D70+HeHUfQC=MnRzps1dOx+Ev+pf3rxBmug@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <cffb4773-3396-6ebc-f556-2f5d2138b67e@gmail.com>
Date: Sun, 6 Dec 2020 16:18:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CABJPP5AP-gFJEY9D70+HeHUfQC=MnRzps1dOx+Ev+pf3rxBmug@mail.gmail.com>
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

On 5/12/20 9:24 pm, Dwaipayan Ray wrote:
> Hey Aditya,
> 
>> - The check with: "(! -e $git_clang_format_file)" doesn't work
>> correctly for me. Although the command runs properly, after I comment
>> out this if-section. Probably if we just check for a certain version
>> of git which added "git clang-format" for the first time, in users
>> system, it might do the trick.
>>
> 
> True, we need to track that version and terminate the script. Although I
> am curious why it didn't work in your case. Is that file non existent on your
> system?
> 
>> - Also "git branch --show-current" is compatible only with Git 2.22 or
>> above (For eg, mine is 2.17.1). Maybe replace it with "git rev-parse
>> --abbrev-ref HEAD"?
> 
> Yes, that version compatibility might be a problem.
> The other option is nice, but again it causes a certain conflict when the
> HEAD itself is detached.
> 
> In a detached HEAD state, "git rev-parse --abbrev-ref HEAD" just returns
> "HEAD".
> 
>> diff --git a/block/sed-opal.c b/block/sed-opal.c
>> index daafadbb88ca..f7929eb67f37 100644
>> --- a/block/sed-opal.c
>> +++ b/block/sed-opal.c
>> @@ -2322,7 +2322,7 @@ static int opal_add_user_to_lr(struct opal_dev *dev,
>>         mutex_lock(&dev->dev_lock);
>>         setup_opal_dev(dev);
>>         ret = execute_steps(dev, steps, ARRAY_SIZE(steps));
>> -       mutex_unlock(&dev->dev_lock);
>> +mutex_unlock(&dev->dev_lock);
>>
>>         return ret;
>>  }
>> --
>> 2.17.1
>>
>>
>> Now this patch gets applied to a new "test-xyz" branch, but it is not
>> formatted, ie the added line remains un-indented. Is this expected
>> behaviour from the script?
>>
> 
> Currently it should only output the diff. The --clang-format flag is to be used
> though. Maybe the diff could be written into a clang-format-fixes.patch file and
> apply it later on.
> That way the user has more control over what gets changed.
> 
Hi Dwaipayan,
I have modified your script with clang-format-diff here:
https://gist.github.com/AdityaSrivast/0fc57fbd49db8c05c7b1154d4289174a

As we wanted, it generates a modified patch which is clang formatted,
with suffix ".clang-format.EXPERIMENTAL". It also modifies the files
with clang-format in test-branch, which was desired with our
"--clang-format" flag to this script.

I think the code probably will need to be refactored once we are sure
that we are on the right track and the script does the desired job.

Lukas, what do you think?

Thanks
Aditya


>> I have also tried out something similar (using clang-format-diff
>> though). I'll try to add it in your script and send.
>>
> 
> Yep sure enough. The problem was somehow I didn't have it on
> my system. So I couldn't use that. But it should be easy to swap
> in git-clang-format for clang-format-diff.
> 
> But anyways thanks for testing it out!
> A lot more to be done but let's see where it goes :)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
