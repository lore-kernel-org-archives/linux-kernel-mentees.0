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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1072BC5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 18:03:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63F8C2466D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 18:03:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGbGnATX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63F8C2466D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 058F8214D2;
	Tue, 17 Nov 2020 18:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfTQV2UhaEvz; Tue, 17 Nov 2020 18:03:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E3B862034B;
	Tue, 17 Nov 2020 18:03:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7D89C0FAA;
	Tue, 17 Nov 2020 18:03:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00864C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 18:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C004E87051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 18:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YYhNFnqU4eD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 18:03:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 73FE287047
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 18:03:27 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id m9so6946724pgb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yJij/PFIbXA76xkWTCGMIbxbA1RWhkztHlGCJzibzMI=;
 b=LGbGnATXDdIOCV77DNot/i+bGj2JvidtJXvPajWfxHXkTUjztQL00Y8YcBiDnCUX33
 VS+mXPS+JfCSwkWE69fJLfuVcfmBWf3/iIlKHRaYqq4iFjZaEdu+882WqvC5so9EyGhA
 2SOVy5VXmIGYOot8I/d7hjCH/iDUMhG/a48TRNKUhVbvmJ5MDE/ZekcAAb8ZCA7z/oKe
 iOO29sM3tv1RmMYQfQp4hYIx5+jYNZVmQy03K5SiNLXImhdIJTGOh81vvfF+UsvKMsDb
 sNIwWtAvn31o5KJdYfmixl8EfVSXi/ux5w16EJH0zO389TEiSC3AN0uV1wum/xyRU0EY
 TO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJij/PFIbXA76xkWTCGMIbxbA1RWhkztHlGCJzibzMI=;
 b=NkrFN3VZJ0O7TetbKV2+CGuZoMdRicUlQrnqVlqL4/O/FSxlJoznCCo0wOzkor7co8
 1ew22zr7ZukMLjoIdGtQEqz/eTh4oUAaVZv7x8jGOsXQuH+jED2jb6WPkx2nEJXrfZ32
 60HCdqH8eiPZjaRb0iEdUc0clE7G87umF5ZxUtMZPeCnpixxUlLivsDmwbVH32ZJi5Nv
 gyJlMKFYxiztAfmNYnYhJbmAELEGRSSv4pgNzupZbQi861PRuNhqY8Y+86vdod54FhC+
 nyOXWh8zcd/OenRffR42FWs/SIoxMKzmz174iqGUZhKVtnynKuyzTE8H+BPJfoJafEWS
 j9MA==
X-Gm-Message-State: AOAM531RIlf5ZRRAnNTGnMYgZOla4Xr+czcespYvc0HMj6VvDGPGV3Qv
 J1qQwXOlnRgwiUWFYL5rZ2G/wTrqc276wuE2
X-Google-Smtp-Source: ABdhPJwHZbb73H4d1eyEXW6jvoBbKOPfP5eqiN7DvaSrXy0XdYlRltdwzZ1ZbJk5ArZn/s1MXNrfqg==
X-Received: by 2002:a63:570e:: with SMTP id l14mr4202079pgb.302.1605636206464; 
 Tue, 17 Nov 2020 10:03:26 -0800 (PST)
Received: from ?IPv6:2402:3a80:425:6282:bc1b:1de0:7718:e8a1?
 ([2402:3a80:425:6282:bc1b:1de0:7718:e8a1])
 by smtp.gmail.com with ESMTPSA id t10sm4111674pfq.110.2020.11.17.10.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 10:03:25 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
 <CAKXUXMw2=4E8XpZFx04pkBmvwDSpcCedxE2ndX4DX5DTek_06g@mail.gmail.com>
 <ed152561-0932-65e2-fc86-3540fc456b09@gmail.com>
 <483df3b1-219c-129e-2c88-5411e012a9e1@gmail.com>
 <CAKXUXMx4-2-=XkXkvUcx6GuNmwfkSyYbOWc04uXkFgnHxsNNvQ@mail.gmail.com>
 <31eeb998-0f1a-5ae2-fd0a-62fd1cf3349b@gmail.com>
Message-ID: <bde0d09e-39fb-234c-c7b3-42d859414794@gmail.com>
Date: Tue, 17 Nov 2020 23:33:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <31eeb998-0f1a-5ae2-fd0a-62fd1cf3349b@gmail.com>
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

On 13/11/20 11:55 pm, Aditya wrote:
> On 13/11/20 8:56 pm, Lukas Bulwahn wrote:
>> On Fri, Nov 13, 2020 at 4:00 PM Aditya <yashsri421@gmail.com> wrote:
>>>
>>> On 13/11/20 8:05 pm, Aditya wrote:
>>>> On 12/11/20 1:34 am, Lukas Bulwahn wrote:
>>>>> On Wed, Nov 11, 2020 at 3:13 PM Aditya <yashsri421@gmail.com> wrote:
>>>>>>
>>>>>> Hi Sir
>>>>>> I have analyzed the checkpatch report for BAD_SIGN_OFF(over
>>>>>> v4.13..v5.8) for non-standard signature and generated reports for it.
>>>>>> Some mistakes are more frequent than others, whereas some mistakes
>>>>>> even have a frequency of 1.
>>>>>>
>>>>>> Non-standard signatures occurring with their frequency:
>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
>>>>>>
>>>>>> Complete warning messages:
>>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/warn_msgs.txt
>>>>>>
>>>>>> Should I implement the fix similar to TYPO_FIX, where we have a
>>>>>> separate file for common misspellings and corrected words? Or should I
>>>>>> make a hash of these misspellings in checkpatch.pl file as well?
>>>>>>
>>>>>> Also should I include all these misspelled words in it? Or omit words
>>>>>> below certain frequency?
>>>>>>
>>>>>
>>>>> I think the best way would be to compute some kind of edit distance to
>>>>> the known signature tags and if this edit distance is below a certain
>>>>> threshold, suggest that signature tag as the fix. We can then evaluate
>>>>> to determine the best suitable threshold. The edit distance between
>>>>> the different tags are so large that this should always work as
>>>>> intended.
>>>>>
>>>>> Then, we can look into these other creative tags and propose suitable
>>>>> existing tags for the more frequent ones that are non-standard. Or in
>>>>> the case, none of the existing ones fit we can start the discussion on
>>>>> proposing some new standard ones.
>>>>>
>>>>
>>>> I have generated a list of non-standard signatures and their fixes on
>>>> the basis of edit distance.
>>>>
>>>> This is the common list of non standard signatures and fixes (in
>>>> detail):
>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/min_dists.txt
>>>>
>>>> As I observed, I think, we can consider '<=2' as the threshold edit
>>>> distance.
>>>> List for non-standard signature and their proposed fix with edit
>>>> distance<=2 :
>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than_3.txt
>>>>
>>>> I have also generated lists for 3 and 4 edit distance separately for
>>>> reference:
>>>> Equal to 3:
>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_3.txt
>>>>
>>>> Equal to 4:
>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_4.txt
>>>>
>>>> For the rest I guess we'll need to hard code eg. for 'Debugged-by',
>>>> 'Requested-by' etc.
>>>>
>>>> These are the complete lists of non-standard signatures:
>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
>>>>
>>
>> Can you share which non-standard-signatures would be
>> handled/transformed with edit distance 2 and which would not in a
>> similar format to non_standard_signs.txt (so, ordered by frequency).
>>
>> We can then consider those that remain and find a good next strategy
>> for the most frequent non-standard signatures.
>>
> 
> Non standard signatures handled with edit distance 2:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than2/signs_freq.txt
> 
> Non standard signatures with edit distance greater than 2:
> https://github.com/AdityaSrivast/kernel-tasks/tree/master/random/non_standard_signature/more_than2
> 

I think this mail probably got missed. I'll summarize it a bit for
simplicity:
With edit distance approach and threshold as 2, we're able to handle
39 out of 109 'distinct' cases of non-standard signature. In this 39,
the maximum count of non-standard signature is 19 for 'Reviwed-by:'; 9
for 'Reviewd-by:' and other common mispellings.
Complete List:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than2/signs_freq.txt

However, still we are unable to account for 70 non-standard signatures
which occur more frequently (eg 'Debugged-by:', which has occurred 61
times; 'Requested-by:', 48 times; and so on).
Complete list:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/more_than2/signs_freq.txt

I think for these cases we'd need to make some file (as is used for
TYPO_SPELLING), or hash.
What do you think/suggest?

Thanks
Aditya

> Thanks
> Aditya
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
