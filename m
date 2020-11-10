Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A88C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 06:43:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40B020639
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 06:43:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYLShqDT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C40B020639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D40987216;
	Tue, 10 Nov 2020 06:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sAlWc5yytmHu; Tue, 10 Nov 2020 06:43:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F4D3871C1;
	Tue, 10 Nov 2020 06:43:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82684C088B;
	Tue, 10 Nov 2020 06:43:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25FD7C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 06:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0FCC0871F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 06:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tj2o39gaMfok
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 06:43:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 19B55871C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 06:43:52 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v12so10485411pfm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Nov 2020 22:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=db8FoKEGOQOm+PsBwEgsEMaB8Vc6Jmw/zQmOjh1uAhg=;
 b=jYLShqDTMBMDmtBUlnM7IGNAJyP4IlGQry9/Ibw9sGelTXSe6wNdSzmDsrM/V2+8sw
 8tXejHBNkym4K/RwDDzPaN3z7s/NQz6DVUGhVlBBSPs+8L6muImIZMxMeRBg7EBYDqjL
 6xBXdrwPa3bhNd2D0nRj45vuvWW3On9YLZAq08JOous8x38fER0VyMTG0VK+z/JzGymy
 Ln4CuSERehv416oRvZQjG3rAeNdp/gYlncWcECCCApy7K8VFBZfjy6W3cOWJNeGMPiR/
 xj6cNgFtyKzMbEtW3D9u4e/BbYxoYSOt2Y5/9LgDAYoVnwcAbaqj6K0SeTMjTA03OQD2
 Ib5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=db8FoKEGOQOm+PsBwEgsEMaB8Vc6Jmw/zQmOjh1uAhg=;
 b=n0Y49cnFmZdjrpR++mEUBqoYN8mcezMYO/GJYMXvVwOEDzuFU1m1h7SBV+nUN16kwa
 P/ARVs9zvl3tIgYo/28En8hytQYjzrYP7PvV1QCUDWnx5sFTGIfmIu9HUDCDBPVnPjBB
 PUcutrhnzYdR3JDLFot0qCruQk43P2moWPpUGR87E4SU51yw2RF9kbmO9dYrurSZUkSZ
 58+AOuxYvpD/TEYZjQiKVWkU4rBsByrF47ahN6tmQnnVg2QCUgou0yB/eGfWKvVAeldr
 vwBwITK4/3KnhOrL1ijmOXNxFDIjUDRv26jx9DFTluRECjQVXc3FhvNpygZq8egeqrTn
 CauQ==
X-Gm-Message-State: AOAM531sjsb5vpbVHdHntdYRISC1xCAXL7X8USQSuo+Wie6PLl4FyRbd
 +thCcUIy/dVbt+ERocV9IqJkJ2/uVGLoAA==
X-Google-Smtp-Source: ABdhPJw54hLw+eYxXNbImupBv3uZl65sl71zK1ycmLXIeJR0RszfLgP8pCyK2XRJ9mkfAJHgxAEmGA==
X-Received: by 2002:a63:105c:: with SMTP id 28mr14857876pgq.99.1604990631257; 
 Mon, 09 Nov 2020 22:43:51 -0800 (PST)
Received: from ?IPv6:2402:3a80:413:8adf:79d0:1679:313c:70a2?
 ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.gmail.com with ESMTPSA id m6sm13089627pfa.61.2020.11.09.22.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 22:43:50 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201109131040.19266-1-yashsri421@gmail.com>
 <CAKXUXMyVqjG+XvZ+dnB=3NEnGcNOtcYFW2r5cJ3KCEzTE35rXQ@mail.gmail.com>
 <292a3930-9515-2387-40d3-63a14a61250b@gmail.com>
 <CAKXUXMwCT2DcE9iFQXfkaEuDpWW_yG=O2HuW-Vz3ek6Lsx25Lg@mail.gmail.com>
 <b1c10804-5d49-bb17-a228-66644a997961@gmail.com>
 <CAKXUXMz7gNS+oMYmRpcmj+4Y-d7n_BfZuOuJZhJqOhn_-dHA+g@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <f7ff3cbf-8573-5d4b-3546-76fc5484eed0@gmail.com>
Date: Tue, 10 Nov 2020 12:13:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMz7gNS+oMYmRpcmj+4Y-d7n_BfZuOuJZhJqOhn_-dHA+g@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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

On 9/11/20 11:20 pm, Lukas Bulwahn wrote:
> On Mon, Nov 9, 2020 at 5:35 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 9/11/20 8:15 pm, Lukas Bulwahn wrote:
>>> On Mon, Nov 9, 2020 at 3:33 PM Aditya <yashsri421@gmail.com> wrote:
>>>>
>>>> On 9/11/20 7:10 pm, Lukas Bulwahn wrote:
>>>>> On Mo., 9. Nov. 2020 at 14:10, Aditya Srivastava <yashsri421@gmail.com>
>>>>> wrote:
>>>>>
>>>>>> Currently checkpatch warns us if there is no 'Signed-off-by' line
>>>>>> for the patch.
>>>>>>
>>>>>> E.g., running checkpatch on commit f68e7927212f ("Revert
>>>>>> "powerpc/book3s32: Reorder _PAGE_XXX flags to simplify TLB handling"")
>>>>>> reports this error:
>>>>>>
>>>>>> ERROR: Missing Signed-off-by: line(s)
>>>>>>
>>>>>> Provide a fix by adding a Signed-off-by line corresponding to the author
>>>>>> of the patch before the start of diff(s)
>>>>>>
>>>>>
>>>>> Can you please provide an evaluation first?
>>>>>
>>>>> As far as remember, the fix is often not to add a Signed-off-by: tag but it
>>>>> requires something completely different.
>>>>>
>>>>
>>>> I have generated the 'git logs' of the commits causing
>>>> MISSING_SIGN_OFF at:
>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task7/summary_log.txt
>>>>
>>>> Actually this fix was suggested by Joe at:
>>>> https://lore.kernel.org/linux-kernel-mentees/e8fef5fbd71331b010988769b249af6a79048f48.camel@perches.com/
>>>>
>>>
>>> Yes I know. Now look at the reports.
>>>
>>> The rc and release commit tags do not get a Signed-off-by
>>> intentionally. Other than that, reverts (for reverts is probably best
>>> to explain how to do a revert... so that a sign-off-by is included)
>>> and typos.
>>>
>>>
>>> Lukas
>>>
>>
>> Yes, I agree. But for the typos, the user must get BAD_SIGN_OFF
>> warning for "Non-standard signature". So user will have to fix that
>> manually. If so, this error is already avoided.
>>
> 
> But then the fix should not be applied if there is a BAD_SIGN_OFF
> warning, right?
> 
> Typos can also be fixed automatically by a fuzzy match. That is a
> different feature, though and a different (next) patch.
> 
Okay.

>> For the release commits, I think the user(s) may not use checkpatch
>>
> 
> Agree. You can filter those out of your evaluation.
> 
>> For the rest (ie reverts) with no sign-offs, I think that if we just
>> add the sign off line, it serves our purpose.
>> Of course if we explain them to revert with sign-off, it will be
>> probably the same outcome.
>>
> 
> Then do both. Provide a fix in checkpatch.pl and provide documentation.
> 
Okay.

> So, how many are because of reverts and how many are because of typos?
> 

Reverts: 4,
Typos: 5
True positives: 2 (3c0edea9b29f9be6, 9ac060a708e05423)

> Also, how many reverts do currently include a proper sign-off?
>> When the majority does not include a proper sign-off on revert commit,
> maybe the convention is to not have a sign-off on reverts.
> When we have some data on that, we can discuss this with some central
> maintainers in the kernel community.
> 
> If that is the case, then the fix is to change checkpatch.pl not to
> complain on revert commits because of a missing sign-off.
>
So, there are 993 commits which are reverts. Out of these only 4 are
there which have missing sign offs.(over 4.13..5.8)

I have a doubt, How can I provide documentation? Couldn't find any doc
file for checkpatch

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
