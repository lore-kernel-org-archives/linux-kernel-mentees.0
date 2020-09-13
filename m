Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9919FC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 09:36:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F162076C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 09:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZlkfIdd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04F162076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8D0362042C;
	Sun, 13 Sep 2020 09:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ckUwaHGXA9Sz; Sun, 13 Sep 2020 09:36:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A6D77203B1;
	Sun, 13 Sep 2020 09:36:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C5B8C0859;
	Sun, 13 Sep 2020 09:36:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EE48C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 09:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 71C0C871F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 09:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAATxDWpDnuZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 09:35:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7F73B84C08
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 09:35:57 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id md22so4108248pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 02:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=59Wpcy3bFq2ElrGc868E6UxvR16dOf5icI9VqaQMLVs=;
 b=NZlkfIddCmXtua8OVYwMFQIj6Mb0cSdQxvskceFRhndsadvxRGrnvIQx0QNhGAIXnh
 NX/YM6DGYNkIiCMIT2krQMruVMWHmQLhLaGXym8v75czk/+e/F69C2I1DcAvyIHNX+VL
 tIXQ2T9fBzcliPxbYjAYClLAaYzgUkIM1tuM8LKHxh/xK4friGmQmawai+55a+HpAQL8
 31OSd/glbIdkBKJ5SdJPW1t6CA3Q3dN9KtUSpShQwgOmV7FsqZfv7KR/7QUoel7AJdWe
 /nPdwmEXpP8xLJnYh3pNIAFWkjV6V/cCLXvWkJxd6M8s0Ew+sSmN0vnHbJl3uA1C+zCU
 D8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=59Wpcy3bFq2ElrGc868E6UxvR16dOf5icI9VqaQMLVs=;
 b=k2/yan9u5Zv7xJk+17SWd5JHDLknvwYq6QjINs5/5bEeE3/OBKZ/L5YmFXFnDC5rd8
 gmqL62KPlpnO0ejtQ8Pxf0jDrjKfU+WDN3S4l5iYzac+hdO84zvzLXFGj8bNoYP0HkYa
 gdQgnqgAFDWe53V8RC9T55p9hLwB+mJ1lPxD0Bb6DyLJ6XYy6bmFU8KcVJRmTmJWJvos
 HnBOJ4LHnlNivDgzgexjveRcvzXU+amcwh59z3yxO4P7h4vMjxWMYyhnxS0Xy0e5JTo6
 ChOPM8O+UywmfEbuXyU0aYzdQ5poyeX3cogCG8heP64DMvp06kd0YCoG5Z9EpPbvFd4O
 hnww==
X-Gm-Message-State: AOAM5320NIkyCnFyte8QehOk7oDYovHhF/jdkKC2g2s9Au9MXdSmEeAH
 y8ZDJb/R63We8JEHDlXOSITDjliKe38XMA==
X-Google-Smtp-Source: ABdhPJy0TydM0mSgv+ilptFXqktucsirDs8EDK2DLZ27IHTHzjtpL/q8Ve3LHSX9TewB4LJPXrU0eQ==
X-Received: by 2002:a17:90a:aa94:: with SMTP id
 l20mr9059608pjq.95.1599989756719; 
 Sun, 13 Sep 2020 02:35:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:20c9:9c65:b4f8:be85:95bb])
 by smtp.gmail.com with ESMTPSA id k28sm7226490pfh.196.2020.09.13.02.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2020 02:35:56 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <6a2bdeea-265b-5cd0-78c2-aa865b0d5bb7@gmail.com>
 <alpine.DEB.2.21.2009121343290.13082@felia>
 <23226f28-dcc4-dba3-dac9-636464d37b03@gmail.com>
 <alpine.DEB.2.21.2009121422520.3770@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <4fe9f9e4-f016-6c1c-4ac6-7af82212d392@gmail.com>
Date: Sun, 13 Sep 2020 15:05:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009121422520.3770@felia>
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

On 12/09/20 6:02 pm, Lukas Bulwahn wrote:
> On Sat, 12 Sep 2020, Ujjwal Kumar wrote:
> 
>> On 12/09/20 5:14 pm, Lukas Bulwahn wrote:
>>>
>>>
>>> On Sat, 12 Sep 2020, Ujjwal Kumar wrote:
>>>
>>>> Hello Lukas,
>>>>
>>>> I attempted the tasks.
>>>>
>>>> Below is the link of GitHub repository containing my write-up and findings.
>>>> https://github.com/Ujjwal0501/lkmp-checkpatch
>>>>
>>>
>>> Thanks, it shows 404. Good luck next time.
>>
>> I'm really sorry for the noise. The link is active now.
> 
> Okay, scripts and data looks sound. So, let us try those scripts.
> 
> Please have a look at this patch:
> 
> https://lore.kernel.org/linux-kernel-mentees/20200912094826.150170-1-ayush@disroot.org/
> 
> The author states:
> 
> This issue was discovered through a thorough analysis of checkpatch.pl
> errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and
> v5.8.
> 
> Before applying this patch, checkpatch.pl reported 342 errors of type
> GIT_COMMIT_ID. After applying patch, errors reduced to 284.
> 
> 
> If your scripts work, you should be able to confirm the statement.
> 

I'm unable to reproduce the same count as above because the script is run 
on different sets of commits.


> The tasks are:
> 
> 1. Run your scripts and create a full statistics of all error types with
> their according count for v5.7..v5.8.
> 
> 2. Apply the patch with git am.
> 
> 3. Run your scripts again and create a new statistics.
> 
> 4. Compare before and after
> 
> 5. Make all results available on your github repository.
> 

The results are available at the link 
https://github.com/Ujjwal0501/lkmp-checkpatch/blob/master/tasks.md

Kindly take a look at it.


> ---
> 
> Ujjwal, I can see that your evaluation shows
> 
> 272 ERROR:GIT_COMMIT_ID
> 
> different from what the author reports. Maybe you apply the patch and 
> check the difference for your evaluation first.
> 
> Afterwards, you might want to reach out to the author, cc this mailing 
> list and check the difference of the configurations for the evaluation.
> 

I haven't contacted the author yet. But I have included an explanation 
for this in my GitHub repository.


> Then you can confirm the other evaluation as well.
> 
> Lukas
> 

Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
