Return-Path: <SRS0=0eHf=HI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC85C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Feb 2021 14:05:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6031364E24
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Feb 2021 14:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6031364E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 21D5B20133;
	Sat,  6 Feb 2021 14:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FHH7ASFkg4ds; Sat,  6 Feb 2021 14:05:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AEB5F2042E;
	Sat,  6 Feb 2021 14:05:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A55A4C0174;
	Sat,  6 Feb 2021 14:05:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC7F4C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Feb 2021 14:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B0F678715F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Feb 2021 14:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skvBzk4lg1QM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Feb 2021 14:05:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 050FE87158
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Feb 2021 14:05:26 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id my11so7734578pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 06 Feb 2021 06:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vHtJ4epU8ukJ6dsFRySzGH7TXjloMIWGB/KMNAbUyuU=;
 b=r5V32Y0URZdyvEA1bQHJ9uA7XROebAwmaIgR4K/Q9xpEgXNnDKbmVjBczgbOjPdRZI
 uaa5inx19I/5IoKoMh+hioCLn0FzO5ez9Jxbg9+T0sCfrWDNozouez9i9HKAI4WNoHKD
 +5Q5Ko6nOlqhv50MkuFflegfu+bW24YANVDMDD/aaFZfUFHnUExE73sQAcY/4Et3OGr7
 YL67xXMFlQBu5PqWvsEMU6UrAx4LEJQb2gO3qYZZxKEl8ISaIT/7ibbLxg7ajx6VNgy4
 /G+pBS2gkIb3MNazxSaxIn3tx5bWc9FYKMu3Ca1X/4e5hW028NQsgZnQ7lvUsLMLJLrW
 PLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vHtJ4epU8ukJ6dsFRySzGH7TXjloMIWGB/KMNAbUyuU=;
 b=D/btzWdTs3EZThK/DfRcaWQmtwvmxzBBQQbPUeRphNEhK4SvjqOikCnvK8edU4/z6f
 roc1MN8FJtBN/H4BQCS20Wi/5IzeDbvdwyMJwfRs1y2X1FDcQurdW8/nBFaeEgaYpWWq
 a3gJu4TzYGuHh0kFQqR4fiM5jb2cJQdcIjm/jkRUujNv55Ve33NJ9P0wfN5Hv1HTZ1rS
 Xy9ltKulU+FeBftOhD3Ik4oXM/kCfSS8qrGgoI3YakSilXjd9qs+uCKpMX7OA60B/Mwo
 zTySX9PyAx1AmlZ6i1CWMw4TvB6vzaMRbDQkeQB3JVjc86IvBZVWtU96grF8M56e5w23
 BdpA==
X-Gm-Message-State: AOAM533Z5V48jLOrnitbuV4zqI3JyN8ruHP0g1LIbPZ7dMbuNKMdyfTe
 1SmWL89+sNL9LNvpPwApCqu4Ityt28/CSA==
X-Google-Smtp-Source: ABdhPJxeSuAUQCuQht1gHYkp3oGIjFE6hM5vTsT3ZbngVEKty2H9wraay1fViZHLL748HhcUN2AZVQ==
X-Received: by 2002:a17:90b:70b:: with SMTP id
 s11mr9137625pjz.20.1612620325171; 
 Sat, 06 Feb 2021 06:05:25 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:c813:cd8d:a2cd:e741?
 ([2405:201:600d:a089:c813:cd8d:a2cd:e741])
 by smtp.gmail.com with ESMTPSA id x81sm13345939pfc.46.2021.02.06.06.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Feb 2021 06:05:24 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201209105833.9066-1-yashsri421@gmail.com>
 <CAKXUXMx_ypzYSCHLzQKY0Uq=M35V4kSd6aivCYBa8coR6jM0yw@mail.gmail.com>
 <bc8f9d46-1474-5470-aca4-c4470761efb6@gmail.com>
 <CAKXUXMz=AwR+3gPprE6eSkPxuXgVVTpXBe5yKV7tQNuaTPP9mg@mail.gmail.com>
 <0e52c716-25e8-398e-8269-27613d5775f8@gmail.com>
 <CAKXUXMytLeZ6czkg6Ezjp1BFV1NQM5rraJn76bxFN6N5CBDccA@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <2424de4f-8219-5d70-f282-adea7e278f4e@gmail.com>
Date: Sat, 6 Feb 2021 19:35:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMytLeZ6czkg6Ezjp1BFV1NQM5rraJn76bxFN6N5CBDccA@mail.gmail.com>
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

On 13/12/20 1:33 pm, Lukas Bulwahn wrote:
> On Sat, Dec 12, 2020 at 10:13 AM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 9/12/20 10:39 pm, Lukas Bulwahn wrote:
>>> On Wed, Dec 9, 2020 at 4:59 PM Aditya <yashsri421@gmail.com> wrote:
>>>>
>>>> On 9/12/20 5:17 pm, Lukas Bulwahn wrote:
>>>>> On Wed, Dec 9, 2020 at 11:58 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>>>>>
>>>>>> Currently, checkpatch warns if the user compares expression with boolean.
>>>>>>
>>>>>> E.g., running checkpatch on commit 3b3a1a0b7824 ("staging: rtl8723bs:
>>>>>> hal: Modify comparison to constant in rtl8723bs_xmit.c") reports:
>>>>>>
>>>>>> CHECK: Using comparison to true is error prone
>>>>>> +       if (ret == true)
>>>>>>
>>>>>> Provide a fix by replacing the expression with preferred expression. i.e.,
>>>>>>
>>>>>> 1) If the check is for a 'true' or 'not false' expression, the operand
>>>>>> will get replaced with empty string.
>>>>>>
>>>>>> 2) Else, the operand gets replaced with '!', and the arguments follow.
>>>>>>
>>>>>
>>>>> Can you show the test cases you used to test this?
>>>>>
>>>> Yes, I ran it over certain commits.
>>>>
>>>> Eg 1) commit 5c789e131cbb ("netfilter: nf_conncount: Add list lock and
>>>> gc worker, and RCU for init tree search"), where
>>>>
>>>> 1.i)
>>>> +       if (list->dead == true) {
>>>> gets changed to:
>>>> +       if (list->dead) {
>>>>
>>>> 1.ii)
>>>> +               if (rbconn->list.count == 0 && rbconn->list.dead == false) {
>>>> gets changed to:
>>>> +               if (rbconn->list.count == 0 && !rbconn->list.dead) {
>>>>
>>>> E.g. 2) commit 83ee6ec7740b75dc0db (Staging: rtl8723bs: os_dep: Fix
>>>> if-else coding style issues) where
>>>>
>>>> 2.i)
>>>> +       if (padapter->bDriverStopped == true) {
>>>> gets changed to:
>>>> +       if (padapter->bDriverStopped) {
>>>>
>>>> 2.ii)
>>>> +       if (pwrpriv->bInSuspend == true) {
>>>> gets changed to:
>>>> +       if (pwrpriv->bInSuspend) {
>>>>
>>>> 2.iii)
>>>> +       if (pwrpriv->bInSuspend == false) {
>>>> gets changed to:
>>>> +       if (!pwrpriv->bInSuspend) {
>>>>
>>>>> Can you show all findings of this rule on the current rc or linux-next?
>>>>>
>>>>
>>>> I have generated report on last 10k commits of latest next branch,
>>>> where the check was found to be reported 5 times.
>>>>
>>> 5 times in 10k commits? I am really wondering how you select the fix
>>> options you work on?
>>>
>>> Do you consider this relevant when the number is so low?
>>> Are there potentially other classes that are much more relevant instead?
>>>
>>> Can you run it over all files in the repository instead of git commits?
>>>
>>> Commits really do not help when we want to fix this in the current kernel.
>>>
>>
>> Hi
>> So, I ran  grep -e
>> "==\s*true\|==\s*false\|!=\s*true\|!=\s*false\|true\s*==\|false\s*==\|true\s*!=\|false\s*!="
>> . -R over the repo.
>> We currently have ~1630 such occurrences in different files.
>>
>> Detail findings can be found here:
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/bool_comparison/file_results.txt
>>
>> A large amount of these occurrences are found in drivers/, with
>> "drivers/gpu/drm/amd/display/dc/dml/" having most occurrences.
>>
>> What do you think?
>>
> 
> I suggest you submit a few patches correcting this style to a few
> driver maintainers to see if they are in favor of this checkpatch
> rule.
> 

Hi Lukas
I tried submitting the patches correcting this style, in various
subsystems as you suggested. Except staging/atomisp, every other
subsystem accepted the correction.

Do you think I should proceed with it?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
