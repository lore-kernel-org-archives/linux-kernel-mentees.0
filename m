Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95A4C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 05:59:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6F4120732
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 05:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXdOlXHy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6F4120732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7CF1E86B96;
	Fri, 21 Aug 2020 05:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0DDzoAq7AOG; Fri, 21 Aug 2020 05:59:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 64D0186B93;
	Fri, 21 Aug 2020 05:59:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55CB1C07FF;
	Fri, 21 Aug 2020 05:59:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FFD2C0051
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 05:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 281D788635
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 05:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnh2S6skuzap
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 05:59:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 47C7888632
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 05:59:45 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id a79so540947pfa.8
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 22:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HJaBYb7AvJ87p10OXwEUIIzHxcoAy0dPkIZBjVasAzA=;
 b=XXdOlXHyNf1rLzdjS4d8kAHpC3AZx0o+emyWmMwD49isPDmH94vfT3qUbYG2wyDqfG
 MBSfbGhDuOFo57rzEWnjLoiP1uunv9CWKlK0MvStyg8filHAy3w79EX8oE1uBe7MzSYz
 +3NsBn1eC7UGknRzdmHiMMQl12HHcnglR9kh4pU95YpS5I4+NPDVOyiZtPIopn/1ASG6
 kQokmCu1pFujL6ArLGH+MRB8qjZxs7q7y2IIiUpmVSrmdmSsl70LWwS1MEvKpsxg8sGd
 MZwoZxsG70uS1mZoXvCK5BmYmWwGQRoNRqHkUzuBNgMaOv0ukR6Mc0RDbFUZmzGcCiAe
 +/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HJaBYb7AvJ87p10OXwEUIIzHxcoAy0dPkIZBjVasAzA=;
 b=bbWYmsyg1UNhyuw6dgOE10LwjWdG5iIBew7ewSM7XM3LJVS1bAM+ZsHqm5rlW9KxuV
 BJuHbWWrDA0EEPlncCG3KPJiWSbdRRpfO/uMmiRbO0Yj/jpYKVOtIkOAZKKnjEjqwtRI
 fMp1PtvYwx6WymNwuBjPfVtwMQspMSYvW9J820Bp6J8FL5vSy1AsCURrLB1sO6Tm8vus
 IfatiGyatEF5kQhEwdfJHmiolgoI+tboh3UgtNCyYhRsJ/SfVbScIIX5s6D0rLQ4yxN1
 Bf8MT1DXgdrXor2HobpLl9+76xnbZ4Atk5ZtsQQb0UzMSs7ewKodjwQ5kn6FueyYzBJ1
 +0Nw==
X-Gm-Message-State: AOAM530RmPbdUcpSfzxXi3mUZDbepcSILiLU2d/i3GHb5JdDl9OuwMrM
 YN7MlE6t8lyvG3aEGFGmfWPegc0kblPmWw==
X-Google-Smtp-Source: ABdhPJxPhlt3Z17K9azAb40W4lX/BbYqkzL7EKAKbEfg1VvlulAIeBRCkJjQMRVLXK1qhhAs7yFDVA==
X-Received: by 2002:aa7:9551:: with SMTP id w17mr1193990pfq.167.1597989584409; 
 Thu, 20 Aug 2020 22:59:44 -0700 (PDT)
Received: from [192.168.43.159] ([49.35.207.162])
 by smtp.gmail.com with ESMTPSA id lj3sm763382pjb.26.2020.08.20.22.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 22:59:43 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <b842e923-f7b0-e732-7c0e-bdd795d905ae@gmail.com>
 <alpine.DEB.2.21.2008171132050.8645@felia>
From: Piyush Thange <pthange19@gmail.com>
Message-ID: <0e4f5ecc-0708-b64f-288b-a232afc46ac6@gmail.com>
Date: Fri, 21 Aug 2020 11:29:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008171132050.8645@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linux-foundation.org
Subject: Re: [Linux-kernel-mentees] Evaluate and Improve checkpatch
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

On 17/08/20 3:05 pm, Lukas Bulwahn wrote:
> 
> Hi Piyush,
> 
> On Fri, 14 Aug 2020, Piyush Thange wrote:
> 
>> Hello sir, myself Piyush Thange I'm a junior student of Computer Engineering.
>> I'm interested in the project - "Evaluate and Improving checkpatch.pl" and
>> willing to contribute to the project.
>> Please I would like to know more about this project and if you have any
>> specific task please provide it to me.
>>
> 
> The zeroth task is to learn suitable netiquette for the communication with
> the kernel community.
> 
> First, please do not top-post.
> 
>      A: Because we read from top to bottom, left to right.
>      Q: Why should I start my reply below the quoted text?
> 
>      A: Because it messes up the order in which people normally read text.
>      Q: Why is top-posting such a bad thing?
> 
>      A: The lost context.
>      Q: What makes top-posted replies harder to read than bottom-posted?
> 
>      A: Yes.
>      Q: Should I trim down the quoted part of an email to which I'm
> replying?
> 
> Second, please always CC: linux-kernel-mentees@lists.linux-foundation.org.
> 
> Third, set up your email client according to the kernel community rules.
> 
> 
> 
> Then, the first task is to run checkpatch.pl on a few kernel patches and
> collect the results. When you have that, please share your script with
> me, e.g., in a github repository.
> 
> 
> Hints to the first task:
> 
> Can you create a list of all non-merge commits that were added in the
> version v5.8 of the kernel, i.e., all non-merge commits that are in v5.8
> and not already in v5.7?
> 
> Can you share the script/command you executed and the resulting list on
> github?
> 
> Can you run your script on all commits of this list above and record
> all checkpatch.pl reports, and store them in your github repository?
> 
> Can you suggest ideas how to aggregate the findings and create a
> statistics? For example: Which type of error is reported most?
> Can you implement that idea?
> 
> 
> I also suggest to have a look at
> the options ./scripts/checkpatch.pl --list-types and
> ./scripts/checkpatch.pl --show-types. The option --show-types changes
> the output of checkpatch.pl to list type identifiers, so it is easier
> to parse and aggregate the output.
> 
> Please also share the script you create for that purpose on your
> github repository.
> 
> 
> 
> The second task is to pick one warning that appears often and improve
> checkpatch.pl to handle that better and get it accepted by the kernel
> community.
> 
> Hints to the second task follow when the first task is solved.
> 
> If you fail on any of those tasks, you are out of the selection process.
> 
> 
> Lukas
> 

Hello everyone,
As mentor Lukas Bulwahn have provided the first task 1, I've collected 
some results for the patches on kernel v5.8
Please do check. And If any issues please respond

https://github.com/its-crypted/Evaluate-and-Improve-checkpatch.pl


Regards,

Piyush Thange
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
