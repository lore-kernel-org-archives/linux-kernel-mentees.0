Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DEAR_SOMETHING,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15199C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 07:10:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C22A2072C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 07:10:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPfHmbLY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C22A2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D536987898;
	Wed, 14 Oct 2020 07:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UuwlhGd4u9FM; Wed, 14 Oct 2020 07:10:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E2140878BA;
	Wed, 14 Oct 2020 07:10:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8CCAC07FF;
	Wed, 14 Oct 2020 07:10:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EB49C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0280E86F99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SjXjVcv6QJXl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:10:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6609986F69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:10:24 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id b26so1434144pff.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 00:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8GC38s3dV2Thy4Y9lC7t9+yi0qPvnZXIEoHmTz/Evxc=;
 b=bPfHmbLYA0lqG0kl5/4vB57JZUsMFXCF5fBMuABlKh6DovlE0a4vcJHmEMz2kF0glV
 ijEigduFHbZMq5ufLLUaeamTfHJoMIqO/OlvlzC00kR8/bnojo4KUT/Ph9L0Jb1OCiYC
 +bhzHrJNxgZg9kR3xyAnkaBEr4SqEA2u4VXMJliYwv3/EecChcrj2WcX1AnkKuCiTb3n
 qh07KGfGY3MfnR9aDMhvDx8V5o6O1BgGPKK/n7X1E0X9cnRWYDlxAPg5By78V361/E4z
 SMMCdaTjK5VqAD1u5cD6lWElvY4MYoQW+QiQ2usv6qcWT+R5qaKcuVl+/P980scddXAx
 T11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8GC38s3dV2Thy4Y9lC7t9+yi0qPvnZXIEoHmTz/Evxc=;
 b=S0oUJsisvBcxkDslqf8CRcwMbBkKXPIoSQ/gHQtFtSMCCmi4QgZrB77bPumSM4PbJw
 Ahh+VaNBzxZj1tT7AwOjwohHQDYL05RVuo4qJ+jpzZEqFsunlKHr+lUv0JoNG820TT1S
 Prg8QjyJn9+8vktna1aiDpCVeQ0mwa4mtouPwfowjoTMKKMFNLoPnzlx9Qjxl2fJBR/9
 9SVHyfTvTmEZsLubeS752uqOpyBfFsj3IvLVGq1Uw8rhVHdT8yBEovK3Pf+CKb38wFKg
 N6iwrgMLtojZDYavit1ngs1VURkOG/YWQkXTYu31y8ucJAE0vfXnAPr1LevV2/2UK85K
 /XmA==
X-Gm-Message-State: AOAM532ElE8G/MYE9BfDKf+AfD+4ToD0YS/IUJ9ti3KfhHi3aVsgxL8R
 ejfHVW0mDNi3qjRCwJDEtvI=
X-Google-Smtp-Source: ABdhPJz3fo4Vluyqnq2WrwK4nstLyIDgQSQJhs46q6vHiGybt5UDMMsBhXw5cOgz3cHEfKRQDDAK6g==
X-Received: by 2002:a62:1844:0:b029:152:80d3:8647 with SMTP id
 65-20020a6218440000b029015280d38647mr3181340pfy.18.1602659423789; 
 Wed, 14 Oct 2020 00:10:23 -0700 (PDT)
Received: from [192.168.43.245] ([42.111.145.49])
 by smtp.gmail.com with ESMTPSA id d128sm2019098pfd.94.2020.10.14.00.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 00:10:23 -0700 (PDT)
From: Aditya <yashsri421@gmail.com>
To: dwaipayanray1@gmail.com
References: <CAJ7RK2spHzFJxAqkm+N=T4ZB8-SeqgCX+Bs5r5__eLJRbovL3w@mail.gmail.com>
 <CAKXUXMxyTdNSK0gR4FMkp29TrYX_G2Hwqor4UY2cWk45POyocQ@mail.gmail.com>
 <a1675970-9eb9-bd6a-31ff-d04f88ca30e2@gmail.com>
 <CAKXUXMy6AawtRNB6B3pPQK_QNT+NK1VT9QUBKQ4YGV-QbAkvBA@mail.gmail.com>
 <CAJ7RK2vQb=b6kGmZ3Xd7UKk9gieZbX+-CrTybqoksqjEh6m7Lg@mail.gmail.com>
Message-ID: <b8bea5b5-a8a0-b2b4-6c32-0fd071bb6ef7@gmail.com>
Date: Wed, 14 Oct 2020 12:40:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJ7RK2vQb=b6kGmZ3Xd7UKk9gieZbX+-CrTybqoksqjEh6m7Lg@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 13/10/20 2:41 am, Aditya Srivastava wrote:
> On Mon 12 Oct, 2020, 11:58 PM Lukas Bulwahn, <lukas.bulwahn@gmail.com>
> wrote:
>
>> On Mon, Oct 12, 2020 at 8:23 PM Dwaipayan Ray <dwaipayanray1@gmail.com>
>> wrote:
>>> On 12/10/20 6:27 pm, Lukas Bulwahn wrote:
>>>> On Mon, Oct 12, 2020 at 11:38 AM Aditya Srivastava <
>> yashsri421@gmail.com> wrote:
>>>>> Dear Sir/Ma'am
>>>>> I have performed some tasks on Checkpatch.pl to find out the
>> aggregate and summary of Errors and Warnings that have been generated on
>> certain Linux Kernel Versions' commits . The summary of my tasks are as
>> follows:
>>>>> 1. Task1: Create a list of all non-merge commits that were added in
>> the version v5.8 but were not there in v5.7. Run checkpatch.pl script on
>> these commits and create a statistical summary of findings.
>>>>> My findings:
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task1/reports/aggregate_report/analysis/summary.txt
>>>>> My Scripts for this task:
>> https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task1
>>>>> 2. Task2: Test what are errors and warnings by checkpatch.pl reports
>> on v5.6..v5.8. Generate a report with respect to changes suggested by
>> Dwaipayan Ray (
>> https://lore.kernel.org/linux-kernel-mentees/20201007192029.551744-1-dwaipayanray1@gmail.com/),
>> to present the differences in a suitable aggregated form, to find out the
>> kind of errors and warnings that are changing.
>>>>> My Findings:
>>>>> Change in the number of warnings and errors:
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt
>>>>> Individual summary report generated by checkpatch.pl:
>>>>> After the commit:
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/after_commit/summary_after_commit.txt
>>>>> Before the commit:
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/before_commit/summary_before_commit.txt
>>>>> Scripts used for this task:
>> https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task2
>>>> Your email client is broken; you cannot send emails to a kernel
>>>> mailing list with this email setup. I will not bother to use a proper
>>>> email client either :)
>>>>
>>>> summary at
>>>>
>>>>
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt
>>>> looks good.
>>>>
>>>> Dwaipayan probably needs to look into the details here.
>>>>
>>>> E.g., why did those really unrelated issues change?
>>>>
>>>> AVOID_BUG 240 239
>>>> TYPO_SPELLING 536 537
>>> Ya, this shouldn't happen.
>>>
>>> I checked the reports, and the new warnings appear as expected.
>>>
>>> Could Aditya perhaps find out which errors in this case have changed?
>>>
>> Dwaipayan, you can ask Aditya directly :)
>>
>> Aditya, can you help us and tell us which AVOID_BUG remained the same,
>> which appeared, and which disappeared?
>>
>> And the same for TYPO_SPELLING.
>>
>> Lukas
>>
Hi Sir,

I checked the warnings for AVOID_BUG and TYPO_SPELLING and I can confirm that they are occurring equally in both the cases(before and after the commit). The missed warning was just not in the expected format, in the report file.

For Eg. AVOID_BUG occurred as "cWARNING:AVOID_BUG: Avoid crash", but I was expecting the line to start with "WARNING:" or "ERROR:". This is why, this warning was not counted. Similar is the case for TYPO_SPELLING.

This probably happened because of multi-threading. To counter such occurrences, I have regenerated the summary report using regex. The summary can be found at the same url ie: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt

Kindly let me know if you have any questions.

Aditya

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
