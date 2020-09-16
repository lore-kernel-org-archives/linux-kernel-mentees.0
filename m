Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89328C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 11:36:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E672522208
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 11:36:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBdm/Wxo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E672522208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8860420784;
	Wed, 16 Sep 2020 11:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRW3ebVBFZoe; Wed, 16 Sep 2020 11:36:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8184E271D6;
	Wed, 16 Sep 2020 11:36:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 685B6C0859;
	Wed, 16 Sep 2020 11:36:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEF0FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 11:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AD00F872B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 11:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d+FM31WPGiPD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 11:36:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 15D4A872AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 11:36:37 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id s14so1358967pju.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 04:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BtbkqbRGHH1teE+SmTFVcnFGvM9yYgjFdppnEBo9SDA=;
 b=LBdm/WxomsQ822rb/Rcv5spmtFUuzUe18eV7ncf+/iKqV+/s7/kRwXTD+Ov+i64zuV
 SkW+8kUNMkuRzNr6thTCun4MXC5ARGfAcxG1sg2DLia8TxjM3n/MO/AJNAalH2uT2yZH
 WoUJzUrVhlY+OOzZRVNkiyAwVKDJgmsDlVT1ZCMbZEJgiGjzE00D7n7C41dJKysptDFS
 gPLXnTqWUfNzmL6b3TreJcX7YkHwSRR+cuIscA99wguSkTfFr+ueTmibCkjtcFQSuKBT
 tL6hDUN9+fxnQi3ZXh50iHm0mOFyxt2jIYg+ea6JZ/0HoADhXUxdHjvhtQuwwwLXNbIv
 3N9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BtbkqbRGHH1teE+SmTFVcnFGvM9yYgjFdppnEBo9SDA=;
 b=AbHUELNt0/JmqWnUD6HE8Z37Xh0Dqz5Hh479zevF9r1BTsDXs2t7B76SmrWy9wxWaV
 Qyd5qkw2Bo6JU3ErYAkJlQ77/MJ87UmfrJ0C+jujcGf6kXd5itvAiBElRKmZdNxyFDqI
 GviEJssWxMQk/ctnMMBFMpQD1D9dIBMwgFa2wHu0XXScv1CI3eiAM6zhEaqHx+v/uYe4
 GKmcZR95tQwMZGu4fMbqg08Zna/wpdKKqvMP7HSXCylbmImUs6DJxlvOwzXxwtEbH/N3
 /nxopFDXCSiIQwDqJyLMQkUU6PwhmiUDlVSMWQzkw631PrZeZHz7g6EKRVCYZOx6ipaM
 50aA==
X-Gm-Message-State: AOAM533buukpPMiTiDbkrXAtb79VJOr+fCAH6HGz059SPW1rnDTvhxa4
 cvFwm7U1t64PrWxNcRkhEnc=
X-Google-Smtp-Source: ABdhPJzu4OzTsE7RyLVVHvn3cWdD3rbRhxwnEU2JXBPKNRP+rg/ldC74lLhkcYp+kEH479XdchfdMw==
X-Received: by 2002:a17:902:eac2:b029:d1:e603:af72 with SMTP id
 p2-20020a170902eac2b02900d1e603af72mr5513749pld.48.1600256196528; 
 Wed, 16 Sep 2020 04:36:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:20c9:9c65:b4f8:be85:95bb])
 by smtp.gmail.com with ESMTPSA id g129sm5150484pfb.9.2020.09.16.04.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 04:36:35 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <6a2bdeea-265b-5cd0-78c2-aa865b0d5bb7@gmail.com>
 <alpine.DEB.2.21.2009121343290.13082@felia>
 <23226f28-dcc4-dba3-dac9-636464d37b03@gmail.com>
 <alpine.DEB.2.21.2009121422520.3770@felia>
 <4fe9f9e4-f016-6c1c-4ac6-7af82212d392@gmail.com>
 <alpine.DEB.2.21.2009131307420.22585@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <e6fa87d7-3b80-390f-4db2-40e977a4b635@gmail.com>
Date: Wed, 16 Sep 2020 17:06:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009131307420.22585@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Evaluate and Improve checkpatch: tasks
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

On 13/09/20 4:45 pm, Lukas Bulwahn wrote:
> 
> 
> On Sun, 13 Sep 2020, Ujjwal Kumar wrote:
> 
>> On 12/09/20 6:02 pm, Lukas Bulwahn wrote:
>>> On Sat, 12 Sep 2020, Ujjwal Kumar wrote:
>>>
>>>> On 12/09/20 5:14 pm, Lukas Bulwahn wrote:
>>>>>
>>>>>
>>>>> On Sat, 12 Sep 2020, Ujjwal Kumar wrote:
>>>>>
>>>>>> Hello Lukas,
>>>>>>
>>>>>> I attempted the tasks.
>>>>>>
>>>>>> Below is the link of GitHub repository containing my write-up and findings.
>>>>>> https://github.com/Ujjwal0501/lkmp-checkpatch
>>>>>>
>>>>>
>>>>> Thanks, it shows 404. Good luck next time.
>>>>
>>>> I'm really sorry for the noise. The link is active now.
>>>
>>> Okay, scripts and data looks sound. So, let us try those scripts.
>>>
>>> Please have a look at this patch:
>>>
>>> https://lore.kernel.org/linux-kernel-mentees/20200912094826.150170-1-ayush@disroot.org/
>>>
>>> The author states:
>>>
>>> This issue was discovered through a thorough analysis of checkpatch.pl
>>> errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and
>>> v5.8.
>>>
>>> Before applying this patch, checkpatch.pl reported 342 errors of type
>>> GIT_COMMIT_ID. After applying patch, errors reduced to 284.
>>>
>>>
>>> If your scripts work, you should be able to confirm the statement.
>>>
>>
>> I'm unable to reproduce the same count as above because the script is run 
>> on different sets of commits.
>>
> 
> So, you say the evaluation from Ayush was not really a good evaluation of 
> v5.7..v.5.8 due to some misconception of Ayush how to obtain the set of 
> proper commits from v5.7..v5.8?

That is not totally correct as he correctly generated the list of commits in 
the first task. But the script used to generate the statistics used a 
different way so I was trying to point that specific thing.

>>
>>> The tasks are:
>>>
>>> 1. Run your scripts and create a full statistics of all error types with
>>> their according count for v5.7..v5.8.
>>>
>>> 2. Apply the patch with git am.
>>>
>>> 3. Run your scripts again and create a new statistics.
>>>
>>> 4. Compare before and after
>>>
>>> 5. Make all results available on your github repository.
>>>
>>
>> The results are available at the link 
>> https://github.com/Ujjwal0501/lkmp-checkpatch/blob/master/tasks.md
>>
>> Kindly take a look at it.
>>
> 
> Can you share the errors that have changed after the patch was applied?
> 
> - Which cases of GIT_COMMIT_ID have disappeared?
> - Which cases of GIT_COMMIT_ID are new?
> - Which cases of GIT_COMMIT_ID have changed?
> - Have cases of other type of errors/warnings/checks/notes disappeared, 
> been added or changed?
> 
> You state GIT_COMMIT_ID changed from 272 to 230, but the tester in
> 
> https://lore.kernel.org/linux-kernel-mentees/CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com/
> 
> claimed that it changed from 270 to 251.
> 
> Which numbers are right? Why is there a difference in both statistics?

The patch from Ayush appears to have a bug which I have detailed in my write up.

Kindly take a look at the link.
https://github.com/Ujjwal0501/lkmp-checkpatch/blob/master/followuptask1.md

> 
> Lukas
> 

Thanks,
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
