Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80D6C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 20:54:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AFB0221FD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 20:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rjld799J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AFB0221FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D915486F6F;
	Tue, 17 Nov 2020 20:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3J08SE+Pp1T4; Tue, 17 Nov 2020 20:54:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2545686F65;
	Tue, 17 Nov 2020 20:54:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 160F7C0891;
	Tue, 17 Nov 2020 20:54:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F21EC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 20:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 22F098508A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 20:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zI-ttV9M25aA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 20:54:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 560F584CF4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 20:54:38 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id q10so18144752pfn.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 12:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T9B/BRZgENt84CxLCW3RSrFqMb+lo5B1E7TfMNGP66c=;
 b=Rjld799JSEOoIAqVC4rwtNw0Ow+LFsrMLTu/ip2CtZvDhcKjBhGmGrdTYRrBitmmEw
 hEJJfOhxE0gVQMGtsdIJ7W2y04Z7soyWcM2PKQ1hec5gizNLQBr+Yp7hoqJoj6k0FxlZ
 axItNxZA1A7rCsJ+SSQs5MjV7/Z+SEJelfdiI781J1bkhObqUWGWOU+ypPS/WDv/aPKv
 2i+Xt5OUmSTrBc2a1ID3qDnlxLGL/TZEy6bSDL3uYbdGYbpHl5X9Ah1876UOumJP/zgE
 AoD9KCGK3ym7BebFishi+jw0q5CXSRuCiJwAJjyyz22h34vPIbya/UgqSCt8D9RK1ELE
 Kcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T9B/BRZgENt84CxLCW3RSrFqMb+lo5B1E7TfMNGP66c=;
 b=eff3rBe4LhfmdR1y89s7qGiSIFkcYcHEy1EEVR/wBwlP6fYxoPvYGth9d6Vt9V5yBI
 45VDUvgJyptDOSI6H/hfM5FKIpC/grnLf3+KXo5eQy64nPC8g64K0h0H9pxjaaIDAV4M
 aFK429RFa8ix/PttxPkAyH/rRkrDDckAd3K2M1Xrudw1H7i36vFPYYM2wV3GdT/BxUCm
 wodbcmomKK3wquWBrjsUmYWAv6A7wkP6nf7hTwGVW3Os916R8MmrouSMxTAFij5CuGWg
 2wR+q3Pg5w6WHWKH5419cedgRUSrbR+XFOh8LE9yW/VBx52hHY/EDddKwLPwbkZzB1uD
 IZzA==
X-Gm-Message-State: AOAM531nMrD0sobq4joywv9o8b+xy7dVITMXvV0iqY4kA3swPFAIgdiU
 arka0QOFrnJA4RSW+bM53KtaJJ/u56YXw96i
X-Google-Smtp-Source: ABdhPJx44HeXjbgMdMAnTddbop21cWZyqn95grdVlCZ3mMKp1I1+JUMg/8quQuDLKS5JFg8sV3UK7g==
X-Received: by 2002:a62:1901:0:b029:18c:659c:e55f with SMTP id
 1-20020a6219010000b029018c659ce55fmr1125913pfz.51.1605646477340; 
 Tue, 17 Nov 2020 12:54:37 -0800 (PST)
Received: from ?IPv6:2402:3a80:425:6282:bc1b:1de0:7718:e8a1?
 ([2402:3a80:425:6282:bc1b:1de0:7718:e8a1])
 by smtp.gmail.com with ESMTPSA id w66sm25470055pff.171.2020.11.17.12.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 12:54:36 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
 <CAKXUXMw2=4E8XpZFx04pkBmvwDSpcCedxE2ndX4DX5DTek_06g@mail.gmail.com>
 <ed152561-0932-65e2-fc86-3540fc456b09@gmail.com>
 <483df3b1-219c-129e-2c88-5411e012a9e1@gmail.com>
 <CAKXUXMx4-2-=XkXkvUcx6GuNmwfkSyYbOWc04uXkFgnHxsNNvQ@mail.gmail.com>
 <31eeb998-0f1a-5ae2-fd0a-62fd1cf3349b@gmail.com>
 <bde0d09e-39fb-234c-c7b3-42d859414794@gmail.com>
 <CAKXUXMwsUYgg+oOADM3wrryr2Vob_Yo1YX-ms5eKCeCAx7HTpw@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <050ddb53-33ff-83bc-7f91-b7c2874211f6@gmail.com>
Date: Wed, 18 Nov 2020 02:24:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMwsUYgg+oOADM3wrryr2Vob_Yo1YX-ms5eKCeCAx7HTpw@mail.gmail.com>
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

On 17/11/20 11:12 pm, Lukas Bulwahn wrote:
> On Tue, Nov 17, 2020 at 7:03 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 13/11/20 11:55 pm, Aditya wrote:
>>> On 13/11/20 8:56 pm, Lukas Bulwahn wrote:
>>>> On Fri, Nov 13, 2020 at 4:00 PM Aditya <yashsri421@gmail.com> wrote:
>>>>>
>>>>> On 13/11/20 8:05 pm, Aditya wrote:
>>>>>> On 12/11/20 1:34 am, Lukas Bulwahn wrote:
>>>>>>> On Wed, Nov 11, 2020 at 3:13 PM Aditya <yashsri421@gmail.com> wrote:
>>>>>>>>
>>>>>>>> Hi Sir
>>>>>>>> I have analyzed the checkpatch report for BAD_SIGN_OFF(over
>>>>>>>> v4.13..v5.8) for non-standard signature and generated reports for it.
>>>>>>>> Some mistakes are more frequent than others, whereas some mistakes
>>>>>>>> even have a frequency of 1.
>>>>>>>>
>>>>>>>> Non-standard signatures occurring with their frequency:
>>>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
>>>>>>>>
>>>>>>>> Complete warning messages:
>>>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/warn_msgs.txt
>>>>>>>>
>>>>>>>> Should I implement the fix similar to TYPO_FIX, where we have a
>>>>>>>> separate file for common misspellings and corrected words? Or should I
>>>>>>>> make a hash of these misspellings in checkpatch.pl file as well?
>>>>>>>>
>>>>>>>> Also should I include all these misspelled words in it? Or omit words
>>>>>>>> below certain frequency?
>>>>>>>>
>>>>>>>
>>>>>>> I think the best way would be to compute some kind of edit distance to
>>>>>>> the known signature tags and if this edit distance is below a certain
>>>>>>> threshold, suggest that signature tag as the fix. We can then evaluate
>>>>>>> to determine the best suitable threshold. The edit distance between
>>>>>>> the different tags are so large that this should always work as
>>>>>>> intended.
>>>>>>>
>>>>>>> Then, we can look into these other creative tags and propose suitable
>>>>>>> existing tags for the more frequent ones that are non-standard. Or in
>>>>>>> the case, none of the existing ones fit we can start the discussion on
>>>>>>> proposing some new standard ones.
>>>>>>>
>>>>>>
>>>>>> I have generated a list of non-standard signatures and their fixes on
>>>>>> the basis of edit distance.
>>>>>>
>>>>>> This is the common list of non standard signatures and fixes (in
>>>>>> detail):
>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/min_dists.txt
>>>>>>
>>>>>> As I observed, I think, we can consider '<=2' as the threshold edit
>>>>>> distance.
>>>>>> List for non-standard signature and their proposed fix with edit
>>>>>> distance<=2 :
>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than_3.txt
>>>>>>
>>>>>> I have also generated lists for 3 and 4 edit distance separately for
>>>>>> reference:
>>>>>> Equal to 3:
>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_3.txt
>>>>>>
>>>>>> Equal to 4:
>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_4.txt
>>>>>>
>>>>>> For the rest I guess we'll need to hard code eg. for 'Debugged-by',
>>>>>> 'Requested-by' etc.
>>>>>>
>>>>>> These are the complete lists of non-standard signatures:
>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
>>>>>>
>>>>
>>>> Can you share which non-standard-signatures would be
>>>> handled/transformed with edit distance 2 and which would not in a
>>>> similar format to non_standard_signs.txt (so, ordered by frequency).
>>>>
>>>> We can then consider those that remain and find a good next strategy
>>>> for the most frequent non-standard signatures.
>>>>
>>>
>>> Non standard signatures handled with edit distance 2:
>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than2/signs_freq.txt
>>>
>>> Non standard signatures with edit distance greater than 2:
>>> https://github.com/AdityaSrivast/kernel-tasks/tree/master/random/non_standard_signature/more_than2
>>>
>>
>> I think this mail probably got missed. I'll summarize it a bit for
>> simplicity:
>> With edit distance approach and threshold as 2, we're able to handle
>> 39 out of 109 'distinct' cases of non-standard signature. In this 39,
>> the maximum count of non-standard signature is 19 for 'Reviwed-by:'; 9
>> for 'Reviewd-by:' and other common mispellings.
>> Complete List:
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than2/signs_freq.txt
>>
>> However, still we are unable to account for 70 non-standard signatures
>> which occur more frequently (eg 'Debugged-by:', which has occurred 61
>> times; 'Requested-by:', 48 times; and so on).
>> Complete list:
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/more_than2/signs_freq.txt
>>
>> I think for these cases we'd need to make some file (as is used for
>> TYPO_SPELLING), or hash.
>> What do you think/suggest?
>>
> 
> Yes, I agree.
> 
> Goal 1: Try to map all the non-default signatures to their "standard"
> counterpart as much as possible.
> 
> Goal 2: Introduce a few very little signatures to handle those cases
> that really cannot be mapped to a non-default signature.
> 
> Provide good rationales that you can defend and provide documentation
> for when checkpatch shall explain the fix it proposes.
> 
> Here an example for the first ten cases:
> 
> 1)Debugged-by: 61 -> Codeveloped-by:
> 
> Rationale: Debugging is part of Software Development; so
> Codeveloped-by is perfectly fine, even if the contributor did not
> create code.
> 
> (alternatively: maybe a new Assisted-by would do here.)
> 
> 2)Requested-by: 48 -> Suggested-by:
> 
> Rationale: In an open-source project, there are "no requests", just
> "suggestions" to convince a maintainer to accept your patch.
> 
> 3)Co-authored-by: 43 -> Codeveloped-by:
> 
> Rationale: clear. Codeveloped-by and Co-authored-by are synonyms.
> 
> 4)Originally-by: 39
> 
> Maybe something like this deserves to be a new tag. There is a
> significant difference to codeveloped-by. But that needs discussion.
> 
> 5)Analyzed-by: 22
> 
> Rationale: Analyzing is part of Software Development; so
> Codeveloped-by is perfectly fine, even if the contributor did not
> create code.
> (alternatively: maybe a new Assisted-by would do here.)
> 
> 6)Bisected-by: 20
> 
> Difficult...
> (maybe a new Assisted-by would do here.)
> 
> 7)Improvements-by: 19 -> Codeveloped-by:
> 
> 8)Generated-by: 17 -> Reported-by: ?
> 
> What does generated-by actually mean?
> 
> 9)Noticed-by: 11 -> Reported-by:
> 
> 10)Inspired-by: 11 -> Suggested-by:
> 
> Maybe you can come up with a list for the next twenty and then we
> discuss them with Joe Perches and then a larger group?
> 

Sounds good. Will send by tomorrow morning :)

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
