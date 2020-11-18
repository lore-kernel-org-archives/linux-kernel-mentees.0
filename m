Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61ACEC5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 10:12:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9325E20936
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 10:12:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXLDkBix"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9325E20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ED50087028;
	Wed, 18 Nov 2020 10:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MiHx4Y8EMmQq; Wed, 18 Nov 2020 10:12:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0044686631;
	Wed, 18 Nov 2020 10:12:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF599C0891;
	Wed, 18 Nov 2020 10:12:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA80AC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 10:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E6327854DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 10:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCfOAhBhTufI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 10:12:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F22A3850E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 10:12:13 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id r9so793162pjl.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 02:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pv779P3gbrfU3JN/GQkNQSHNkVaq4RcflFVs5CYeRC8=;
 b=ZXLDkBixP3p3CInTqOlyduUYzjFdrcPoDG5pkaFT7sm0urZsK2w+M66Y5uVAppHKTz
 1R3ffTsvOq9MiLaCBTx9DV7t7Z1aqamLMvkKQfMPuKWhNTlD1Q/o3cqsyOIoSYmuQjMD
 DIkwSrYo/tsr1YhWDSiTI5wgd3y79vVnNvxNux3gSMlgRKukhiisGh4h3Gsti5j+693+
 nQYLChdi3PpX9RdvwV30C6nL0rNKJOSL1xVxEM+HLFJIsTFEVosB/ExQvdE3t51/ealg
 C5KzcNMtOCoGkAi7iNkxI7wu2wQGeq9hGG4WsNeC/rUcaweaOFToBaWtdcD3IVJ+7UZt
 2NTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pv779P3gbrfU3JN/GQkNQSHNkVaq4RcflFVs5CYeRC8=;
 b=SywQWtSeR+CXUdm9pKJOPTrpFHk+N4SmHgCICXLM89n4N7qft9A/FtV4QviESR3QJN
 GcNvHcwHF2zAFzAXWvJYYbejd21YwOGrMT1xV4cp16HwP8lyoqca0V+QyHFwt5Jz6gUH
 T0PopFUcibeNij1O7uVJ4tGOTrCcXg+uvuzhTgOLnBMVnS60E9A+rigC6URtnkduUNj7
 qrq5AR01ITo2DCaUVKaQX3X7lNgQa/NOtaPzIth3cLmrgUiendWgrdf9QahwvtSga1QJ
 SamFLana4NI6fwNGNq68gCB91hvlYgs/gcLZJ5jP6ZwcxuMvv99zZMiTUWnB9+JCj6Nb
 NwSw==
X-Gm-Message-State: AOAM533XrjbypsJzes1bw+mVXz0FQqn8CAQYwVUBHBn8oZeLL6W0fwKH
 p0I+EXOXZMn14sGOZaFqXT8fErGEltteE2k3
X-Google-Smtp-Source: ABdhPJy2M++zPYsooeyejQM/EDu0fwvywOkG8dJShPHDLDTwlZ3P/ZzmzkV9qx3pgf1PAMescIO7LA==
X-Received: by 2002:a17:90a:5d0d:: with SMTP id
 s13mr3312863pji.230.1605694332900; 
 Wed, 18 Nov 2020 02:12:12 -0800 (PST)
Received: from ?IPv6:2402:3a80:43c:f24e:b031:6d03:e76d:9978?
 ([2402:3a80:43c:f24e:b031:6d03:e76d:9978])
 by smtp.gmail.com with ESMTPSA id y3sm23979930pfl.77.2020.11.18.02.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 02:12:12 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
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
Message-ID: <056fae30-efa1-7758-c4bb-04bb90a03f8a@gmail.com>
Date: Wed, 18 Nov 2020 15:42:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <050ddb53-33ff-83bc-7f91-b7c2874211f6@gmail.com>
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

On 18/11/20 2:24 am, Aditya wrote:
> On 17/11/20 11:12 pm, Lukas Bulwahn wrote:
>> On Tue, Nov 17, 2020 at 7:03 PM Aditya <yashsri421@gmail.com> wrote:
>>>
>>> On 13/11/20 11:55 pm, Aditya wrote:
>>>> On 13/11/20 8:56 pm, Lukas Bulwahn wrote:
>>>>> On Fri, Nov 13, 2020 at 4:00 PM Aditya <yashsri421@gmail.com> wrote:
>>>>>>
>>>>>> On 13/11/20 8:05 pm, Aditya wrote:
>>>>>>> On 12/11/20 1:34 am, Lukas Bulwahn wrote:
>>>>>>>> On Wed, Nov 11, 2020 at 3:13 PM Aditya <yashsri421@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>> Hi Sir
>>>>>>>>> I have analyzed the checkpatch report for BAD_SIGN_OFF(over
>>>>>>>>> v4.13..v5.8) for non-standard signature and generated reports for it.
>>>>>>>>> Some mistakes are more frequent than others, whereas some mistakes
>>>>>>>>> even have a frequency of 1.
>>>>>>>>>
>>>>>>>>> Non-standard signatures occurring with their frequency:
>>>>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
>>>>>>>>>
>>>>>>>>> Complete warning messages:
>>>>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/warn_msgs.txt
>>>>>>>>>
>>>>>>>>> Should I implement the fix similar to TYPO_FIX, where we have a
>>>>>>>>> separate file for common misspellings and corrected words? Or should I
>>>>>>>>> make a hash of these misspellings in checkpatch.pl file as well?
>>>>>>>>>
>>>>>>>>> Also should I include all these misspelled words in it? Or omit words
>>>>>>>>> below certain frequency?
>>>>>>>>>
>>>>>>>>
>>>>>>>> I think the best way would be to compute some kind of edit distance to
>>>>>>>> the known signature tags and if this edit distance is below a certain
>>>>>>>> threshold, suggest that signature tag as the fix. We can then evaluate
>>>>>>>> to determine the best suitable threshold. The edit distance between
>>>>>>>> the different tags are so large that this should always work as
>>>>>>>> intended.
>>>>>>>>
>>>>>>>> Then, we can look into these other creative tags and propose suitable
>>>>>>>> existing tags for the more frequent ones that are non-standard. Or in
>>>>>>>> the case, none of the existing ones fit we can start the discussion on
>>>>>>>> proposing some new standard ones.
>>>>>>>>
>>>>>>>
>>>>>>> I have generated a list of non-standard signatures and their fixes on
>>>>>>> the basis of edit distance.
>>>>>>>
>>>>>>> This is the common list of non standard signatures and fixes (in
>>>>>>> detail):
>>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/min_dists.txt
>>>>>>>
>>>>>>> As I observed, I think, we can consider '<=2' as the threshold edit
>>>>>>> distance.
>>>>>>> List for non-standard signature and their proposed fix with edit
>>>>>>> distance<=2 :
>>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than_3.txt
>>>>>>>
>>>>>>> I have also generated lists for 3 and 4 edit distance separately for
>>>>>>> reference:
>>>>>>> Equal to 3:
>>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_3.txt
>>>>>>>
>>>>>>> Equal to 4:
>>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_4.txt
>>>>>>>
>>>>>>> For the rest I guess we'll need to hard code eg. for 'Debugged-by',
>>>>>>> 'Requested-by' etc.
>>>>>>>
>>>>>>> These are the complete lists of non-standard signatures:
>>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
>>>>>>>
>>>>>
>>>>> Can you share which non-standard-signatures would be
>>>>> handled/transformed with edit distance 2 and which would not in a
>>>>> similar format to non_standard_signs.txt (so, ordered by frequency).
>>>>>
>>>>> We can then consider those that remain and find a good next strategy
>>>>> for the most frequent non-standard signatures.
>>>>>
>>>>
>>>> Non standard signatures handled with edit distance 2:
>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than2/signs_freq.txt
>>>>
>>>> Non standard signatures with edit distance greater than 2:
>>>> https://github.com/AdityaSrivast/kernel-tasks/tree/master/random/non_standard_signature/more_than2
>>>>
>>>
>>> I think this mail probably got missed. I'll summarize it a bit for
>>> simplicity:
>>> With edit distance approach and threshold as 2, we're able to handle
>>> 39 out of 109 'distinct' cases of non-standard signature. In this 39,
>>> the maximum count of non-standard signature is 19 for 'Reviwed-by:'; 9
>>> for 'Reviewd-by:' and other common mispellings.
>>> Complete List:
>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than2/signs_freq.txt
>>>
>>> However, still we are unable to account for 70 non-standard signatures
>>> which occur more frequently (eg 'Debugged-by:', which has occurred 61
>>> times; 'Requested-by:', 48 times; and so on).
>>> Complete list:
>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/more_than2/signs_freq.txt
>>>
>>> I think for these cases we'd need to make some file (as is used for
>>> TYPO_SPELLING), or hash.
>>> What do you think/suggest?
>>>
>>
>> Yes, I agree.
>>
>> Goal 1: Try to map all the non-default signatures to their "standard"
>> counterpart as much as possible.
>>
>> Goal 2: Introduce a few very little signatures to handle those cases
>> that really cannot be mapped to a non-default signature.
>>
>> Provide good rationales that you can defend and provide documentation
>> for when checkpatch shall explain the fix it proposes.
>>
>> Here an example for the first ten cases:
>>
>> 1)Debugged-by: 61 -> Codeveloped-by:
>>
>> Rationale: Debugging is part of Software Development; so
>> Codeveloped-by is perfectly fine, even if the contributor did not
>> create code.
>>
>> (alternatively: maybe a new Assisted-by would do here.)
>>
>> 2)Requested-by: 48 -> Suggested-by:
>>
>> Rationale: In an open-source project, there are "no requests", just
>> "suggestions" to convince a maintainer to accept your patch.
>>
>> 3)Co-authored-by: 43 -> Codeveloped-by:
>>
>> Rationale: clear. Codeveloped-by and Co-authored-by are synonyms.
>>
>> 4)Originally-by: 39
>>
>> Maybe something like this deserves to be a new tag. There is a
>> significant difference to codeveloped-by. But that needs discussion.
>>
>> 5)Analyzed-by: 22
>>
>> Rationale: Analyzing is part of Software Development; so
>> Codeveloped-by is perfectly fine, even if the contributor did not
>> create code.
>> (alternatively: maybe a new Assisted-by would do here.)
>>
>> 6)Bisected-by: 20
>>
>> Difficult...
>> (maybe a new Assisted-by would do here.)
>>
>> 7)Improvements-by: 19 -> Codeveloped-by:
>>
>> 8)Generated-by: 17 -> Reported-by: ?
>>
>> What does generated-by actually mean?
>>
>> 9)Noticed-by: 11 -> Reported-by:
>>
>> 10)Inspired-by: 11 -> Suggested-by:
>>
>> Maybe you can come up with a list for the next twenty and then we
>> discuss them with Joe Perches and then a larger group?
>>

This is the list for next 20:

11)Original-patch-by: 11 -> co-developed-by / Originally-by (a new
signoff)
Rationale: I checked mailing list for one of these signoffs.
Link1:
https://lore.kernel.org/linux-perf-users/20190221122306.1511-1-jonas.rabenstein@studium.uni-erlangen.de/
Link2:
https://lore.kernel.org/linux-perf-users/20190307174433.28819-32-acme@kernel.org/

Here it seems like someone who started working on the patch but
couldn't complete it, but still has
significant contribution in the patch.
Maybe signing off as codeveloper suffices the purpose. I'm not sure though

12)Diagnosed-by: 11 -> Maybe 'Reviewed-by' or 'Acked-by'
Rationale: Observed a few mailing lists, eg here:
https://lore.kernel.org/lkml/20190609164128.000227333@linuxfoundation.org/
But could not decide as the user is not adding it along the mails, but
seems like a maintainer.

13)Based-on-a-patch-by: 8 -> Similar to 'Originally-by'

14)Verified-by: 8 -> Tested-by
Rationale: Used by a single user. On reading, mailing list, it seems
that 'Tested-by' tag might be a suitable alternative.
Link:
https://lore.kernel.org/lkml/CA+jURcugFhSt9GGRZELQUCnupOf2Ns96Ao5ZruWfVtq=z_7ytw@mail.gmail.com/

15)Okay-ished-by: 8 -> Acked-by
Rationale: Used by a single user. On reading, mailing list, it seems
that 'Acked-by' tag might be a suitable alternative.
Link:
https://lore.kernel.org/lkml/f06e74e9a38b83ec273196bce727295b828c5870.1507769413.git.rgb@redhat.com/

16)Based-on-patch-by: 7 -> Similar to (13) Based-on-a-patch-by

17)Root-caused-by: 6 -> Maybe 'Fixes:' followed by the commit it is
fixing.
Rationale: Going through mailing list, it comes up added with the
patch. So I couldn't be sure

18)Original-by: 6 -> Similar to '(4)Originally-by'

19)Acked-for-MFD-by: 6 -> Acked-by:

20)Reviewed-off-by: 5 -> Reviewed-by:

21)Based-on-patches-by: 5 -> Similar to (13)

22)Analysed-by: 5 -> Co-developed-by/Reviewed-by
Rationale: Similar to '(5)Analyzed-by'

23)Based-on-work-by: 5 -> Not sure. Maybe 'Suggested-by'

24)Proposed-by: 5 -> Maybe 'Suggested-by'
Rationale: The tag comes up added with the patch,and the user is also
given the tag 'Signed-off-by', but does not seem to participate in the
conversation.
Maybe he is a maintainer, who suggested the patch.
mailing list:
https://lore.kernel.org/linux-nvme/20200501212545.21856-3-sagi@grimberg.me/

25)Reported-and-bisected-by: 4 -> Two different tags: 'Reported-by:'
and 'Bisected-by'

26)Fixed-by: 3 -> Co-developed-by
Rationale: I observed one of these commit conservations here:
https://lore.kernel.org/lkml/1b45ffd1-99bb-4ac1-fb65-0de3e42c1c0a@amd.com/
It seems like there was some bug with this patch, which was fixed by
the user. I guess Co-developed-by should go well as alternative.

27)Pointed-out-by: 3 -> Suggested-by
Rationale: For commit 87bd4c26a6c8 ("clocksource/drivers/tegra: Lower
clocksource rating for some Tegra's"), this warning occurs, where
the patch is also 'Acked-by' Peter De Schrijver. So, it seems like he
is a maintainer who must have suggested these changes

28)Suggestions-by: 3 -> Suggested-by

29)Celebrated-by: 3 -> Might be suggested to remove
Rationale: This tag is used for a single commit 3 times, seems like a
tag used for celebration of a particular patch
Link:
https://lore.kernel.org/lkml/CANRm+CyonYOzGdXo+D8gr8n04=f=S92QH-HxETKnoGGxhMFREA@mail.gmail.com/

30)Pointed-at-by: 2 -> Suggested-by
Rationale: One of these tags is named for Greg Kroah-Hartman
<gregkh@linuxfoundation.org>, who is probably a maintainer.
Here, the user might just want to acknowledge him for his suggestion,
so 'Suggested-by' seems appropriate.

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
