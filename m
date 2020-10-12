Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DEAR_SOMETHING,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA73C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 18:24:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB00B20708
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 18:24:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKtFhO3p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB00B20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 464D3226D4;
	Mon, 12 Oct 2020 18:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8nxGwJF48f6; Mon, 12 Oct 2020 18:23:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3C67F204A9;
	Mon, 12 Oct 2020 18:23:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14899C0052;
	Mon, 12 Oct 2020 18:23:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 319F5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1AFF685DF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EloY6VugR6um
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:23:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 59A0A85C62
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:23:57 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n9so1698353pgt.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=fBhhcQGfQLk0pj6yJlFQKTnV5zXTvW8UWQsaYhWfi0o=;
 b=tKtFhO3pZjK+lB1XI8siad6iGT+MVVV2yLS3i0pL3aKqgrm5vLb3rBt4Tsb8i/gr6t
 yHCqLmkXCnWLmKEK6zbUr8tn2hWXgTVKjDvp2M8QZIrzphwYr2hKpBySi5Wl8BtLY1CG
 nImLTuDxoZxnbcgHjft9RA42QZGtTbHloabE+UdYEKzvtnzKWmcMc6q6voXt/wITh9tj
 MBb81ga/FBo2KHAA/XrWqI7TN3v3tavGRtofUEkSGBj2gXzSeO6pRftiPLhDf0KW+zls
 2IPOlUTt3A8cK/TVeNNga9Me89oXD16xSABQLLuMZNpq+TurGqkKnJhDH4utJDcC8Llb
 mKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fBhhcQGfQLk0pj6yJlFQKTnV5zXTvW8UWQsaYhWfi0o=;
 b=eMbVRKP9MMguRql3a5lc295wZ62D0WH7Q2XeyF+HvEHpzJSU0lQ6dgcmxuRK6rheLj
 vmZXUe2eBrF99Sn+qyyCQ0hqPyJwdbP/V2w/rGU+BmK3bcAD6j4ff/Jo6Tz5o/uuGcz1
 4E+dygOCGiV7Doa43J43pBJWfsh/p6aKO/M0vObf6YH2Po5H490rDm5p9Sdr8r68ynMS
 SY0VZaVShSL9t6CoRYNCPXHY9S8YyDy4zlZTlHb47HAtVmpf2C79298sSjx6wJl6gbhO
 0ZaqApJ5h4RzJT3SWcXHOB2vqlSK0f5qOpKlHUVhB2eLJoffKt+tVWz9VtgXuTgMTjId
 iWow==
X-Gm-Message-State: AOAM532cJoQBwZqyaWgHinoT2JOcK/6lv3m7cn1RHkjkO7fDsNaAjqEx
 Upr77AAEPLLbRJzoFAOkJT7Aa/FyOnl4IU6r
X-Google-Smtp-Source: ABdhPJzBAeT9vB57mPhP943lNmM9DUoU05ebP7gXJBVWOwOVO/UxpdIwBsE1KMIWXHz3BP80rXjx+g==
X-Received: by 2002:a17:90a:1bc3:: with SMTP id
 r3mr21914607pjr.196.1602527036515; 
 Mon, 12 Oct 2020 11:23:56 -0700 (PDT)
Received: from ?IPv6:2405:201:9004:60cf:bb87:436f:3a5f:b4e6?
 ([2405:201:9004:60cf:bb87:436f:3a5f:b4e6])
 by smtp.gmail.com with ESMTPSA id f2sm4973750pfk.187.2020.10.12.11.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 11:23:56 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Aditya Srivastava <yashsri421@gmail.com>
References: <CAJ7RK2spHzFJxAqkm+N=T4ZB8-SeqgCX+Bs5r5__eLJRbovL3w@mail.gmail.com>
 <CAKXUXMxyTdNSK0gR4FMkp29TrYX_G2Hwqor4UY2cWk45POyocQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <a1675970-9eb9-bd6a-31ff-d04f88ca30e2@gmail.com>
Date: Mon, 12 Oct 2020 23:53:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxyTdNSK0gR4FMkp29TrYX_G2Hwqor4UY2cWk45POyocQ@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Checkpatch.pl tasks for Community Bridge
 Program
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


On 12/10/20 6:27 pm, Lukas Bulwahn wrote:
> On Mon, Oct 12, 2020 at 11:38 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>> Dear Sir/Ma'am
>> I have performed some tasks on Checkpatch.pl to find out the aggregate and summary of Errors and Warnings that have been generated on certain Linux Kernel Versions' commits . The summary of my tasks are as follows:
>> 1. Task1: Create a list of all non-merge commits that were added in the version v5.8 but were not there in v5.7. Run checkpatch.pl script on these commits and create a statistical summary of findings.
>> My findings: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task1/reports/aggregate_report/analysis/summary.txt
>> My Scripts for this task: https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task1
>>
>> 2. Task2: Test what are errors and warnings by checkpatch.pl reports on v5.6..v5.8. Generate a report with respect to changes suggested by Dwaipayan Ray (https://lore.kernel.org/linux-kernel-mentees/20201007192029.551744-1-dwaipayanray1@gmail.com/), to present the differences in a suitable aggregated form, to find out the kind of errors and warnings that are changing.
>>
>> My Findings:
>> Change in the number of warnings and errors: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt
>>
>> Individual summary report generated by checkpatch.pl:
>> After the commit: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/after_commit/summary_after_commit.txt
>>
>> Before the commit: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/before_commit/summary_before_commit.txt
>>
>> Scripts used for this task: https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task2
>>
> Your email client is broken; you cannot send emails to a kernel
> mailing list with this email setup. I will not bother to use a proper
> email client either :)
>
> summary at
>
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt
>
> looks good.
>
> Dwaipayan probably needs to look into the details here.
>
> E.g., why did those really unrelated issues change?
>
> AVOID_BUG 240 239
> TYPO_SPELLING 536 537

Ya, this shouldn't happen.

I checked the reports, and the new warnings appear as expected.

Could Aditya perhaps find out which errors in this case have changed?


Regards, Dwaipayan.

> Let us see if we can make sense of this evaluation.
>
> Lukas
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
