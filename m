Return-Path: <SRS0=/60u=EZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32653C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 14:09:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E90424655
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 14:09:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwXlXRds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E90424655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C3560873F4;
	Thu, 19 Nov 2020 14:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JoznQjFbzl7g; Thu, 19 Nov 2020 14:09:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EB34186372;
	Thu, 19 Nov 2020 14:09:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0177C1825;
	Thu, 19 Nov 2020 14:09:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54C4CC0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 14:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3813B204E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 14:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBjdyulrApsb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 14:09:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by silver.osuosl.org (Postfix) with ESMTPS id 4A6C3204D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 14:09:40 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id j19so4304979pgg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 06:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R3w2s54aHz5GVdYnn+3GAAXtbrGQYuUHs8E7joLnTGY=;
 b=JwXlXRdsIsWrO8jaBFoJL/O9Vb9g2NmcomTx4ZJGtobYlFVBS7R8O5sP/5nDQ/CzQc
 fJNomCUaHcDdJCeewey+cvDbiAhSDf3ra1m8ex6hS8jDUxZvXxbZ1Bi61TN+Yyci0Dx2
 kdItQ6ySpGU7VDrp5eEgGq9WeqQ0meENd3d5FWEQ67aYrf5ELvfYeG+hhoYx5510PHOE
 AWEBFlxaVkR4gJQz4bXc0ltBNMvvYnnsarVUz5d+PyjAKw4mGn8x2/jVfYZ59w066p3z
 LvhDewXCQSWMraJ/AzBkLA0xQHPdErMwJnBMTUT+noSRSp+4zOtKccYPCfw0XfAd35Xt
 jxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R3w2s54aHz5GVdYnn+3GAAXtbrGQYuUHs8E7joLnTGY=;
 b=HoFvjcFUhVTvGT5RrH5H/vmENouRf6fJjI5wAGXo0M6rIAkMbI9trTjE9gfr0w5r4D
 Xug59gQAvLyIwTyFNpaG3aWv7Xfd4dDDfyRsTYmleG8XdGgoNHoTrBF/8T9uoCqaCTPa
 6Yf61eXZ0hdYtZSPg1FimWstJq77kA5J/EcbUE5rUToO+k+bt1Qfi4bdq4ZfExUaAe9D
 uagfzLaiRkRtgek1m+4z6McjB5dss8icbXyp7ZMnmpqBSTsYKszsYmHOqrEM5QvJQC6f
 I4QL9SrpDixKULb2ejBfp2Xzlo0qxW2YIbXtB6RDM5XJJCqrC6HT8Jd6JXYDWAtqtGnn
 iOLw==
X-Gm-Message-State: AOAM532bUavt7lN1rdnA4eMLJH1Ru79CC3N/qQA1sFuLv+Nbvs8K5MFq
 cCIALUYpxS1z0BDP81we8ds1A7GnvBzEjq09
X-Google-Smtp-Source: ABdhPJwshkDg9lyN7D2SY/ue7fpAwsrzAW8bKHAPgT72moDmU/Jq1FnXRzxiFrw4mx9WL12JsFvGGw==
X-Received: by 2002:a63:cb51:: with SMTP id m17mr12686179pgi.337.1605794977038; 
 Thu, 19 Nov 2020 06:09:37 -0800 (PST)
Received: from ?IPv6:2402:3a80:40b:78c1:cd74:e812:328:9205?
 ([2402:3a80:40b:78c1:cd74:e812:328:9205])
 by smtp.gmail.com with ESMTPSA id g2sm28128427pfq.107.2020.11.19.06.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 06:09:36 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
 <CAKXUXMw2=4E8XpZFx04pkBmvwDSpcCedxE2ndX4DX5DTek_06g@mail.gmail.com>
 <ed152561-0932-65e2-fc86-3540fc456b09@gmail.com>
 <483df3b1-219c-129e-2c88-5411e012a9e1@gmail.com>
 <CAKXUXMx4-2-=XkXkvUcx6GuNmwfkSyYbOWc04uXkFgnHxsNNvQ@mail.gmail.com>
 <31eeb998-0f1a-5ae2-fd0a-62fd1cf3349b@gmail.com>
 <bde0d09e-39fb-234c-c7b3-42d859414794@gmail.com>
 <CAKXUXMwsUYgg+oOADM3wrryr2Vob_Yo1YX-ms5eKCeCAx7HTpw@mail.gmail.com>
 <050ddb53-33ff-83bc-7f91-b7c2874211f6@gmail.com>
 <056fae30-efa1-7758-c4bb-04bb90a03f8a@gmail.com>
 <CAKXUXMwX5=+ri9uCMbqa6HNyt7JRN=048zo7GaXt1PAVRPzizQ@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <da375716-721c-e4d8-27a9-f8d576741d65@gmail.com>
Date: Thu, 19 Nov 2020 19:39:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMwX5=+ri9uCMbqa6HNyt7JRN=048zo7GaXt1PAVRPzizQ@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Fix for BAD_SIGN_OFF: non-standard
	signature
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

On 19/11/20 11:23 am, Lukas Bulwahn wrote:
>>>> Goal 1: Try to map all the non-default signatures to their "standard"
>>>> counterpart as much as possible.
>>>>
>>>> Goal 2: Introduce a few very little signatures to handle those cases
>>>> that really cannot be mapped to a non-default signature.
>>>>
>>>> Provide good rationales that you can defend and provide documentation
>>>> for when checkpatch shall explain the fix it proposes.
>>>>
>>>> Here an example for the first ten cases:
>>>>
>>>> 1)Debugged-by: 61 -> Codeveloped-by:
>>>>
>>>> Rationale: Debugging is part of Software Development; so
>>>> Codeveloped-by is perfectly fine, even if the contributor did not
>>>> create code.
>>>>
>>>> (alternatively: maybe a new Assisted-by would do here.)
>>>>
>>>> 2)Requested-by: 48 -> Suggested-by:
>>>>
>>>> Rationale: In an open-source project, there are "no requests", just
>>>> "suggestions" to convince a maintainer to accept your patch.
>>>>
>>>> 3)Co-authored-by: 43 -> Codeveloped-by:
>>>>
>>>> Rationale: clear. Codeveloped-by and Co-authored-by are synonyms.
>>>>
>>>> 4)Originally-by: 39
>>>>
>>>> Maybe something like this deserves to be a new tag. There is a
>>>> significant difference to codeveloped-by. But that needs discussion.
>>>>
>>>> 5)Analyzed-by: 22
>>>>
>>>> Rationale: Analyzing is part of Software Development; so
>>>> Codeveloped-by is perfectly fine, even if the contributor did not
>>>> create code.
>>>> (alternatively: maybe a new Assisted-by would do here.)
>>>>
>>>> 6)Bisected-by: 20
>>>>
>>>> Difficult...
>>>> (maybe a new Assisted-by would do here.)
>>>>
>>>> 7)Improvements-by: 19 -> Codeveloped-by:
>>>>
>>>> 8)Generated-by: 17 -> Reported-by: ?

So, I checked mailing list. Generated-by is used by the user to quote
script(s) and not the person.
E.g., Generated-by: scripts/coccinelle/api/alloc/kzalloc-simple.cocci

Maybe, it should be suggested to delete this tag.
What do you think?

>>>>
>>>> What does generated-by actually mean?
>>>>
>>>> 9)Noticed-by: 11 -> Reported-by:
>>>>
>>>> 10)Inspired-by: 11 -> Suggested-by:
>>>>
>>>> Maybe you can come up with a list for the next twenty and then we
>>>> discuss them with Joe Perches and then a larger group?
>>>>
>>
>> This is the list for next 20:
>>
>> 11)Original-patch-by: 11 -> co-developed-by / Originally-by (a new
>> signoff)
>> Rationale: I checked mailing list for one of these signoffs.
>> Link1:
>> https://lore.kernel.org/linux-perf-users/20190221122306.1511-1-jonas.rabenstein@studium.uni-erlangen.de/
>> Link2:
>> https://lore.kernel.org/linux-perf-users/20190307174433.28819-32-acme@kernel.org/
>>
>> Here it seems like someone who started working on the patch but
>> couldn't complete it, but still has
>> significant contribution in the patch.
>> Maybe signing off as codeveloper suffices the purpose. I'm not sure though
>>
> 
> Agree, that is up for discussion. Either co-developed-by or one new tag.
> 
>> 12)Diagnosed-by: 11 -> Maybe 'Reviewed-by' or 'Acked-by'
>> Rationale: Observed a few mailing lists, eg here:
>> https://lore.kernel.org/lkml/20190609164128.000227333@linuxfoundation.org/
>> But could not decide as the user is not adding it along the mails, but
>> seems like a maintainer.
>>
> 
> I do not think Acked-by, maybe co-developed-by or reviewed-by.
> 
>> 13)Based-on-a-patch-by: 8 -> Similar to 'Originally-by'
>>
>> 14)Verified-by: 8 -> Tested-by
>> Rationale: Used by a single user. On reading, mailing list, it seems
>> that 'Tested-by' tag might be a suitable alternative.
>> Link:
>> https://lore.kernel.org/lkml/CA+jURcugFhSt9GGRZELQUCnupOf2Ns96Ao5ZruWfVtq=z_7ytw@mail.gmail.com/
>>
> 
> Agree.
> 
>> 15)Okay-ished-by: 8 -> Acked-by
>> Rationale: Used by a single user. On reading, mailing list, it seems
>> that 'Acked-by' tag might be a suitable alternative.
>> Link:
>> https://lore.kernel.org/lkml/f06e74e9a38b83ec273196bce727295b828c5870.1507769413.git.rgb@redhat.com/
>>
> 
> Agree.
> 
>> 16)Based-on-patch-by: 7 -> Similar to (13) Based-on-a-patch-by
>>
> 
> Agree.
> 
>> 17)Root-caused-by: 6 -> Maybe 'Fixes:' followed by the commit it is
>> fixing.
>> Rationale: Going through mailing list, it comes up added with the
>> patch. So I couldn't be sure
>>
> 
> Hmm... you need to show me the cases where this tag is used.
> 
These are some of the examples:
https://lore.kernel.org/lkml/20200904120257.464056467@linuxfoundation.org/

https://lore.kernel.org/lkml/20200904120257.464056467@linuxfoundation.org/

https://lore.kernel.org/lkml/20190507053235.29900-78-sashal@kernel.org/

Not sure if it is used as git blame or maybe to define the 'root' of
the tree at the time, etc


> If the tag is not followed by an identity (name + email), it should
> not be a signature tag anyway.
> 
>> 18)Original-by: 6 -> Similar to '(4)Originally-by'
>>
> 
> Agree.
> 
>> 19)Acked-for-MFD-by: 6 -> Acked-by:
>>
> 
> Agree.
> 
>> 20)Reviewed-off-by: 5 -> Reviewed-by:
>>
> 
> Agree.
> 
>> 21)Based-on-patches-by: 5 -> Similar to (13)
>>
> 
> Agree.
> 
>> 22)Analysed-by: 5 -> Co-developed-by/Reviewed-by
>> Rationale: Similar to '(5)Analyzed-by'
>>
> 
> Agree.
> 
>> 23)Based-on-work-by: 5 -> Not sure. Maybe 'Suggested-by'
>>
> 
> Or similar to 13?
> 
Yes, agree.

>> 24)Proposed-by: 5 -> Maybe 'Suggested-by'
>> Rationale: The tag comes up added with the patch,and the user is also
>> given the tag 'Signed-off-by', but does not seem to participate in the
>> conversation.
>> Maybe he is a maintainer, who suggested the patch.
>> mailing list:
>> https://lore.kernel.org/linux-nvme/20200501212545.21856-3-sagi@grimberg.me/
>>
> 
> Agree.
> 
>> 25)Reported-and-bisected-by: 4 -> Two different tags: 'Reported-by:'
>> and 'Bisected-by'
>>
> 
> Agree.
> 
>> 26)Fixed-by: 3 -> Co-developed-by
>> Rationale: I observed one of these commit conservations here:
>> https://lore.kernel.org/lkml/1b45ffd1-99bb-4ac1-fb65-0de3e42c1c0a@amd.com/
>> It seems like there was some bug with this patch, which was fixed by
>> the user. I guess Co-developed-by should go well as alternative.
>>
> 
> Agree.
> 
>> 27)Pointed-out-by: 3 -> Suggested-by
>> Rationale: For commit 87bd4c26a6c8 ("clocksource/drivers/tegra: Lower
>> clocksource rating for some Tegra's"), this warning occurs, where
>> the patch is also 'Acked-by' Peter De Schrijver. So, it seems like he
>> is a maintainer who must have suggested these changes
>>
> 
> Agree.
> 
>> 28)Suggestions-by: 3 -> Suggested-by
>>
> 
> Agree.
> 
>> 29)Celebrated-by: 3 -> Might be suggested to remove
>> Rationale: This tag is used for a single commit 3 times, seems like a
>> tag used for celebration of a particular patch
>> Link:
>> https://lore.kernel.org/lkml/CANRm+CyonYOzGdXo+D8gr8n04=f=S92QH-HxETKnoGGxhMFREA@mail.gmail.com/
>>
> 
> Agree. Let us suggest deleting such tags.
> 
>> 30)Pointed-at-by: 2 -> Suggested-by
>> Rationale: One of these tags is named for Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org>, who is probably a maintainer.
>> Here, the user might just want to acknowledge him for his suggestion,
>> so 'Suggested-by' seems appropriate.
>>
> 
> Agree.
> 
>> What do you think?
>>
> 
> Can you start to implement a patch that creates the basic logic to let
> checkpatch.pl suggest the alternatives for those 30 cases above.
> 
Okay. One doubt though, do I need to create a separate patch for edit
distance fix? I am planning to create a hash for these typos(which do
not fulfill edit distance criteria) in checkpatch.pl itself.

What do you think?

> Also, it might be good if checkpatch.pl also provides the explanation
> why that alternative is proposed (when it is not totally obvious).
> 
> Can you also summarize which of the 30 cases need a further discussion with Joe?
> 
Debugged-by: co-developed-by/reviewed-by/new tag

Originally-by: Co-developed-by / maybe a new tag

Bisected-by

Diagnosed-by

Root-caused-by: not sure if it is used as git blame or maybe to define
the 'root' of the tree at the time, etc

> Lukas
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
