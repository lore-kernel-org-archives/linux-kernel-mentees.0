Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEA9C61DD8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 18:25:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40FB8206E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 18:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/sjjkCk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40FB8206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A1F1B8746C;
	Fri, 13 Nov 2020 18:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGZQICSsgFMx; Fri, 13 Nov 2020 18:25:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9C70687458;
	Fri, 13 Nov 2020 18:25:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FB75C0891;
	Fri, 13 Nov 2020 18:25:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD7DFC0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 18:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9BD432047C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 18:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y55fJ9vTVP3f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 18:25:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by silver.osuosl.org (Postfix) with ESMTPS id C12C4203EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 18:25:52 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id r186so7779459pgr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 10:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G1QoO5KGAnssXJy8BQqXX/mA/RvCcC/VAoXV9KfstVI=;
 b=r/sjjkCkdeU/0dWErgu9ASr20TKMKVhcl3P5Nkjz+0g050MOxu+CfBaMf6ETvbY9HZ
 8zAb806rZGAYiJ3YzNFxbPCDPNoGvXgO6cuMvpEDbJzaWexJFUeRYn/hOsATpLVaLmSs
 NP3NMZ15UoiQpfYozs3he1Gb3Qda7XRfzZVsROSq6JpY/7gMkJT9wfEJu407XXFRvwfT
 wDbvWw6biexXiX2X276WEnlydLPYfiAV9biHqsOfrjUgJ37Dv7/gmj/67D/hGSBqNqwq
 I3iUvdd2nPivQKVJNXZWiASPZ47Hveszc0cbpjM1boM0lirCGPT8c0Rmpg+4UAy7f6NJ
 omkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G1QoO5KGAnssXJy8BQqXX/mA/RvCcC/VAoXV9KfstVI=;
 b=j1ZDbar5M/AXoio3uqBd/poYzCQfxGic2UWWupJzHYM/usY6N865CdNog3iIfj7evE
 P3AEV5UopGw3jjAvqgGU4Ibty6ga9G7lrIox2X6Xr7KvoxrQZghiixITgoeEN0ZNeLk8
 VcGsBtfqDabxXOhy0PyX7k4knXqFpesbK7V/IrMFyJQv2Hx3do9tMtQkXb00RWv2kG67
 B0RzrbaQVvZIqR/HMlJQLyZa9/J91H6s4tjckuTRtDqh0W6kWRfqnaekktqy6cRsH3ii
 PRwpesNFhQsA1dxQalGYCbUPqtD0C6XNKcy7cEZHBYiCPiGRtJ0g/+9O+Mc/SI0W+pqj
 KhPg==
X-Gm-Message-State: AOAM530E2fSYb4skTNOoYkRyZ2U/PbGCCK4rtG3TcJ7TwGcSVTlM3Zm0
 atMQPSFznRpt8PVvkp1OSWZaa3GuMpiNgA==
X-Google-Smtp-Source: ABdhPJwAcxXboInn5btxrjNKk68EXHGMQizzKOwi0tvMpmGcXHNiDPl6Ywpojciq0rxXbQNEqfdhFA==
X-Received: by 2002:a17:90b:118b:: with SMTP id
 gk11mr4476481pjb.178.1605291951632; 
 Fri, 13 Nov 2020 10:25:51 -0800 (PST)
Received: from [192.168.43.245] ([42.111.137.114])
 by smtp.gmail.com with ESMTPSA id u22sm9236515pgf.24.2020.11.13.10.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 10:25:51 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
 <CAKXUXMw2=4E8XpZFx04pkBmvwDSpcCedxE2ndX4DX5DTek_06g@mail.gmail.com>
 <ed152561-0932-65e2-fc86-3540fc456b09@gmail.com>
 <483df3b1-219c-129e-2c88-5411e012a9e1@gmail.com>
 <CAKXUXMx4-2-=XkXkvUcx6GuNmwfkSyYbOWc04uXkFgnHxsNNvQ@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <31eeb998-0f1a-5ae2-fd0a-62fd1cf3349b@gmail.com>
Date: Fri, 13 Nov 2020 23:55:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMx4-2-=XkXkvUcx6GuNmwfkSyYbOWc04uXkFgnHxsNNvQ@mail.gmail.com>
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

On 13/11/20 8:56 pm, Lukas Bulwahn wrote:
> On Fri, Nov 13, 2020 at 4:00 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 13/11/20 8:05 pm, Aditya wrote:
>>> On 12/11/20 1:34 am, Lukas Bulwahn wrote:
>>>> On Wed, Nov 11, 2020 at 3:13 PM Aditya <yashsri421@gmail.com> wrote:
>>>>>
>>>>> Hi Sir
>>>>> I have analyzed the checkpatch report for BAD_SIGN_OFF(over
>>>>> v4.13..v5.8) for non-standard signature and generated reports for it.
>>>>> Some mistakes are more frequent than others, whereas some mistakes
>>>>> even have a frequency of 1.
>>>>>
>>>>> Non-standard signatures occurring with their frequency:
>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
>>>>>
>>>>> Complete warning messages:
>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/warn_msgs.txt
>>>>>
>>>>> Should I implement the fix similar to TYPO_FIX, where we have a
>>>>> separate file for common misspellings and corrected words? Or should I
>>>>> make a hash of these misspellings in checkpatch.pl file as well?
>>>>>
>>>>> Also should I include all these misspelled words in it? Or omit words
>>>>> below certain frequency?
>>>>>
>>>>
>>>> I think the best way would be to compute some kind of edit distance to
>>>> the known signature tags and if this edit distance is below a certain
>>>> threshold, suggest that signature tag as the fix. We can then evaluate
>>>> to determine the best suitable threshold. The edit distance between
>>>> the different tags are so large that this should always work as
>>>> intended.
>>>>
>>>> Then, we can look into these other creative tags and propose suitable
>>>> existing tags for the more frequent ones that are non-standard. Or in
>>>> the case, none of the existing ones fit we can start the discussion on
>>>> proposing some new standard ones.
>>>>
>>>
>>> I have generated a list of non-standard signatures and their fixes on
>>> the basis of edit distance.
>>>
>>> This is the common list of non standard signatures and fixes (in
>>> detail):
>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/min_dists.txt
>>>
>>> As I observed, I think, we can consider '<=2' as the threshold edit
>>> distance.
>>> List for non-standard signature and their proposed fix with edit
>>> distance<=2 :
>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than_3.txt
>>>
>>> I have also generated lists for 3 and 4 edit distance separately for
>>> reference:
>>> Equal to 3:
>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_3.txt
>>>
>>> Equal to 4:
>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_4.txt
>>>
>>> For the rest I guess we'll need to hard code eg. for 'Debugged-by',
>>> 'Requested-by' etc.
>>>
>>> These are the complete lists of non-standard signatures:
>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
>>>
> 
> Can you share which non-standard-signatures would be
> handled/transformed with edit distance 2 and which would not in a
> similar format to non_standard_signs.txt (so, ordered by frequency).
> 
> We can then consider those that remain and find a good next strategy
> for the most frequent non-standard signatures.
> 

Non standard signatures handled with edit distance 2:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than2/signs_freq.txt

Non standard signatures with edit distance greater than 2:
https://github.com/AdityaSrivast/kernel-tasks/tree/master/random/non_standard_signature/more_than2

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
