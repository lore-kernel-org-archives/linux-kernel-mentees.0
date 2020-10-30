Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3F3C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 10:54:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11182224A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 10:54:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHKWpD8N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B11182224A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E4A886943;
	Fri, 30 Oct 2020 10:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcT9ZNNwcQOw; Fri, 30 Oct 2020 10:54:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 616DD85BA3;
	Fri, 30 Oct 2020 10:54:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D2EBC088B;
	Fri, 30 Oct 2020 10:54:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CC47C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6E3202047B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7lq6EpiW5Nb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:54:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 549BB20468
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:54:55 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id j18so4941829pfa.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=abj0AofaXlS5fyguGg6hcn9edy8IuCbUdvcLwbYsgN8=;
 b=JHKWpD8Nj3gnpTDQ8vZJTB/j9M+YPFtNTQUBuF7kWp29WrQfuwXJ+0LiS+jYD4XDsE
 QFtF974D5rpr2Vov/1cMJ0mqbdkj/QVWp+OKfjP8IvYQZhhdu8O5YJ5SkRRWraSwHjmE
 n8EJ53XzNJkWnlHuJUi2grpl1CLsuFIWfD0+irRDpbdMCpMMwFLdX3IPmA9ajnViI/CV
 HTDZfplBMuHiiA7MM9yo8GBhFI8QiqXuudGbCFDwLHLANpQFEkLMQDG7/+mSKTb8Lg6k
 /FJxikfkmSv/ugwfQYgL+JkN6Z7HXtpucdsYEt/5xgs8Fo/aSmISaGkS06E4RyMLC3ED
 hYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=abj0AofaXlS5fyguGg6hcn9edy8IuCbUdvcLwbYsgN8=;
 b=ei8uWIL0Byn5FiXPYTDs44vUHHC4oAgZfCHx6Kxv100isw0xfRQtY3hVvr7aTHKnKn
 xH1kB0Yp5raE9+yZUOVUGbxU+DZYx+eFEtQbmlJnetGrD4S7FmRSlboIlaVW02iR1G+f
 ho+lLod/4UHgSQxDBNlLOc8QclR28TEc5vtD8qyVEZy3jrGzYQLm7nCPhE3wmPVhG/E/
 rQMyRr8t48pAbkGWNihFm6K5Y/Yalt2s6bCmT65yidgDb3AVB+A7A7BeLt0WeUSs7s4e
 xY5uMwBwizg1UGI6Og53I8hRAQG1TAEKhiUzrawfzFd65J26kcKO3D91GFIsjCfgkIRo
 ARdg==
X-Gm-Message-State: AOAM530PbDHJzOuFwUH1Nxc+zBJX2EZ7x0xaaoOuOwhxp9vD5cGxQpII
 DYa+DB3HJe3Hew3H9DwvocgzGXZp8aSiDA==
X-Google-Smtp-Source: ABdhPJy4eRGAiNzAXgb4gKtuyRMu8OT14f/4P6BJMN4TZIwdi4XtfRThF8cZ2/ppeYKrEPZGZxkUNg==
X-Received: by 2002:a17:90a:840e:: with SMTP id
 j14mr2168592pjn.65.1604055294532; 
 Fri, 30 Oct 2020 03:54:54 -0700 (PDT)
Received: from ?IPv6:2402:3a80:43d:9a7f:2d51:fcbb:1c2a:666a?
 ([2402:3a80:43d:9a7f:2d51:fcbb:1c2a:666a])
 by smtp.gmail.com with ESMTPSA id x5sm5601907pfp.113.2020.10.30.03.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 03:54:54 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201030082335.14256-1-yashsri421@gmail.com>
 <a3c50073-4af5-9f58-bdb1-831c6e900b57@gmail.com>
 <alpine.DEB.2.21.2010301147150.16621@felia>
From: Aditya <yashsri421@gmail.com>
Message-ID: <84e3d147-097b-804b-405e-6f9a42157c81@gmail.com>
Date: Fri, 30 Oct 2020 16:24:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010301147150.16621@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	ERROR:GERRIT_CHANGE_ID
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

On 30/10/20 4:19 pm, Lukas Bulwahn wrote:
> 
> 
> On Fri, 30 Oct 2020, Aditya wrote:
> 
>> On 30/10/20 1:53 pm, Aditya Srivastava wrote:
>>> Currently, whenever gerrit change id is present in commit, checkpatch.pl
>>> gives an error to remove the change id before submitting the patch.
>>>
>>> For eg, running checkpatch on commit adc311a5bbf6 ("iwlwifi: bump FW
>>> API to 53 for 22000 series"), causes error:
>>>
>>> ERROR:GERRIT_CHANGE_ID: Remove Gerrit Change-Id's before submitting
>>> upstream
>>> Change-Id: I5725e46394f3f53c3069723fd513cc53c7df383d
>>>
>>> But there is no --fix option present for this error message, in case
>>> user wants to fix it immediately.
>>>
>>> To fix this error, delete the corresponding line from the patchfile when
>>> checkpatch.pl is executed with --fix
>>>
>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>> ---
>>>  scripts/checkpatch.pl | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index 7800a090e8fe..5329927fc1c1 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -2852,8 +2852,11 @@ sub process {
>>>  
>>>  # Check for Gerrit Change-Ids not in any patch context
>>>  		if ($realfile eq '' && !$has_patch_separator && $line =~ /^\s*change-id:/i) {
>>> -			ERROR("GERRIT_CHANGE_ID",
>>> -			      "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr);
>>> +			if (ERROR("GERRIT_CHANGE_ID",
>>> +			          "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr) &&
>>> +			    $fix) {
>>> +                                fix_delete_line($fixlinenr, $rawline);
>>> +                        }
>>>  		}
>>>  
>>>  # Check if the commit log is in a possible stack dump
>>>
>>
>> Sir I have a doubt: Can I start working on another patch and send that
>> too before the first one gets accepted?
>>
> 
> Sure, you can parallelize your work as much as you can.
> Review takes some time: we all have other full-time jobs and many other 
> tasks.
> 
> When you get feedback, though, I suggest to take that feedback immediately 
> and consider reworking your patch.
> 
> Lukas
> 

Thanks Sir. Sure, will keep that in mind.

Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
