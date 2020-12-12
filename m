Return-Path: <SRS0=PhKz=FQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AAFC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Dec 2020 09:13:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 741C523BCD
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Dec 2020 09:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 741C523BCD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D1DF87648;
	Sat, 12 Dec 2020 09:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKjer4kXTavn; Sat, 12 Dec 2020 09:13:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7697B86FC1;
	Sat, 12 Dec 2020 09:13:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FF06C0FA7;
	Sat, 12 Dec 2020 09:13:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB7D2C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 09:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A9A8287645
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 09:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKYaUDAE++hr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 09:13:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2400A86FC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 09:13:24 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id bj5so5924349plb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 01:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M3blX4ebgzOmC1ibVUtdieYotCdZaIvGFIl5g9Mx1bM=;
 b=SGoKVzdW6RfAXEdQPa/Vcb7xYBn0xLJ9IV9z/8qdkilrs5Ly5wXV3sNAatBQkdF64J
 ikjCjr7h7/DyOR/popglEgFSXVaO1NVpx8cxReyUrZUG/WeFttnSwPrFL53S4n4zzs4e
 bgtVcayVBlcTnNTwNZOOgqUv4G3c3Svi9bq1E1kaWYfE2g6iFDHT3mFsQlVOplIYHXxS
 NOQbUybXBkONVL40Mdq0OD5p9lfdPblGdnZY0b/UVEDijyo9N9BFS9+VOCK8x6MHHtdL
 echXUbOB7vIgpRDj5hUL08RDc4ipTjJb98SMwODYBIOiJ+ySRGCiq19yDmdS2L3Se7k5
 GgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M3blX4ebgzOmC1ibVUtdieYotCdZaIvGFIl5g9Mx1bM=;
 b=CdOqWiEA3onHoAJOwBinDzsiaZ6aOur/9sDjDm1+DhE/WTDWRuNNRoyOMAXDA7eJMF
 OhvrMYC8DJODaJ/5JNnQtmfP5U4tvrFZgA6lydv/7isB8gIktpqaKIkMQ2BdLarokeXE
 anmMkZTqJxQuDprLjLb0lSR3ep7iUKxP3wIIhZS7cwS4QsMTQOBU7qKuaokjmQNjs3Xh
 qRi5hkdlkJw/BmUjvshyp7hk9actnf193bh8todAMOZLj+KZ+GGBuuxAcXmkWR5DCRPJ
 WkLTfHGcVUfvFpqPto+AtrPKvHvN2o6+ssn51fvwDGuKKa9yE/pF3i7JB/xB7LQDtc7z
 gONA==
X-Gm-Message-State: AOAM533TNVGc67nT1HaXjv2VgwIqNhNhTRYHMnWh2DuutODAq3pLMNwA
 pRKgzuwVWr0tmWFKfQq6TtHl9mATRi9ucQ==
X-Google-Smtp-Source: ABdhPJzmXunP9aJI5dJe7vnwf1lZ++6gQd6nXFZCKzjircfV7qgLrdBagQDMBgYSapLNj+RnYc+2Yg==
X-Received: by 2002:a17:90b:d93:: with SMTP id
 bg19mr16859458pjb.46.1607764403417; 
 Sat, 12 Dec 2020 01:13:23 -0800 (PST)
Received: from ?IPv6:2402:3a80:406:cce5:4c09:a3c0:cad9:9548?
 ([2402:3a80:406:cce5:4c09:a3c0:cad9:9548])
 by smtp.gmail.com with ESMTPSA id s21sm13923056pgk.52.2020.12.12.01.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Dec 2020 01:13:22 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201209105833.9066-1-yashsri421@gmail.com>
 <CAKXUXMx_ypzYSCHLzQKY0Uq=M35V4kSd6aivCYBa8coR6jM0yw@mail.gmail.com>
 <bc8f9d46-1474-5470-aca4-c4470761efb6@gmail.com>
 <CAKXUXMz=AwR+3gPprE6eSkPxuXgVVTpXBe5yKV7tQNuaTPP9mg@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <0e52c716-25e8-398e-8269-27613d5775f8@gmail.com>
Date: Sat, 12 Dec 2020 14:43:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMz=AwR+3gPprE6eSkPxuXgVVTpXBe5yKV7tQNuaTPP9mg@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option and
 improve msg for BOOL_COMPARISON
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

On 9/12/20 10:39 pm, Lukas Bulwahn wrote:
> On Wed, Dec 9, 2020 at 4:59 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 9/12/20 5:17 pm, Lukas Bulwahn wrote:
>>> On Wed, Dec 9, 2020 at 11:58 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>>>
>>>> Currently, checkpatch warns if the user compares expression with boolean.
>>>>
>>>> E.g., running checkpatch on commit 3b3a1a0b7824 ("staging: rtl8723bs:
>>>> hal: Modify comparison to constant in rtl8723bs_xmit.c") reports:
>>>>
>>>> CHECK: Using comparison to true is error prone
>>>> +       if (ret == true)
>>>>
>>>> Provide a fix by replacing the expression with preferred expression. i.e.,
>>>>
>>>> 1) If the check is for a 'true' or 'not false' expression, the operand
>>>> will get replaced with empty string.
>>>>
>>>> 2) Else, the operand gets replaced with '!', and the arguments follow.
>>>>
>>>
>>> Can you show the test cases you used to test this?
>>>
>> Yes, I ran it over certain commits.
>>
>> Eg 1) commit 5c789e131cbb ("netfilter: nf_conncount: Add list lock and
>> gc worker, and RCU for init tree search"), where
>>
>> 1.i)
>> +       if (list->dead == true) {
>> gets changed to:
>> +       if (list->dead) {
>>
>> 1.ii)
>> +               if (rbconn->list.count == 0 && rbconn->list.dead == false) {
>> gets changed to:
>> +               if (rbconn->list.count == 0 && !rbconn->list.dead) {
>>
>> E.g. 2) commit 83ee6ec7740b75dc0db (Staging: rtl8723bs: os_dep: Fix
>> if-else coding style issues) where
>>
>> 2.i)
>> +       if (padapter->bDriverStopped == true) {
>> gets changed to:
>> +       if (padapter->bDriverStopped) {
>>
>> 2.ii)
>> +       if (pwrpriv->bInSuspend == true) {
>> gets changed to:
>> +       if (pwrpriv->bInSuspend) {
>>
>> 2.iii)
>> +       if (pwrpriv->bInSuspend == false) {
>> gets changed to:
>> +       if (!pwrpriv->bInSuspend) {
>>
>>> Can you show all findings of this rule on the current rc or linux-next?
>>>
>>
>> I have generated report on last 10k commits of latest next branch,
>> where the check was found to be reported 5 times.
>>
> 5 times in 10k commits? I am really wondering how you select the fix
> options you work on?
> 
> Do you consider this relevant when the number is so low?
> Are there potentially other classes that are much more relevant instead?
> 
> Can you run it over all files in the repository instead of git commits?
> 
> Commits really do not help when we want to fix this in the current kernel.
> 

Hi
So, I ran  grep -e
"==\s*true\|==\s*false\|!=\s*true\|!=\s*false\|true\s*==\|false\s*==\|true\s*!=\|false\s*!="
. -R over the repo.
We currently have ~1630 such occurrences in different files.

Detail findings can be found here:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/bool_comparison/file_results.txt

A large amount of these occurrences are found in drivers/, with
"drivers/gpu/drm/amd/display/dc/dml/" having most occurrences.

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
