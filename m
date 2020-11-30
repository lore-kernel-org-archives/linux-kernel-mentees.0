Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1FEC63777
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 16:47:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FEE02073C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 16:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apHuYSUu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FEE02073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 75B9E21519;
	Mon, 30 Nov 2020 16:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qkgx93Pzc5H; Mon, 30 Nov 2020 16:47:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CF651203F8;
	Mon, 30 Nov 2020 16:47:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDD70C163C;
	Mon, 30 Nov 2020 16:47:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89140C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7ECE02107D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15DAxnWvUCH8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:47:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 7D6CF203F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:47:11 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id j13so1712830pjz.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 08:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uLhfNO8gkzHBckqCtkmMDANV5DkWjUw+EqpHZ/WZxrg=;
 b=apHuYSUuPIfgiPm1UhT1JdRuy9WVTyvgqIgXrCW9rzK7QvhHn3qVeVTCXXvl4XvLJW
 xfHB4OqefivI30getRBWG6GFVTW1+leT4tJVu9IvUHcCH2lbyQM0YPu2SJEAKNWPeFPa
 pD3u8Yvy2cVVJHQ1UhqX4P0a/DxwUXjQartH+bASJRaC0TS3ZURWOGWNzlp9u5FFCPJH
 Fx62tYqzNgvpFdLQB22zZxtKhCajtPlXABGW+fPeoaxKiuwzEzRGuKCXpZUig+n849pq
 OHpcHbT5ETjelgNlmOulwFoGWVQ2EolHEN9Y3KQGC2NxbHEr0kYTRZl/ihEP/YMS3gBq
 mbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uLhfNO8gkzHBckqCtkmMDANV5DkWjUw+EqpHZ/WZxrg=;
 b=qpf2/fWnwOS44XaHYHyEFnVBzEvbGNzyzG3XlcKq8gxPBYnPNnWItWEYKZrU1qfbEM
 hPWq0Bhxm6ECe8VjpvpSOaVC58BqoN9wbY9rHCvHaw6l7eEgry9KIc1qkeqRA0e7XEXO
 hjtDVWg5jVzb+Rh19105PCmITm2b3D2qCMKCkfTmYFATh7QdMRnVZ/X2Egz+yGYOsBoV
 dZb8YJrBWJt7diNHgi2atpq8SYqblOnvJxx+/qUping3gffoqXqW4D0zk3aWwv3V0fNH
 wp0BMovIdf481bvfApdYe1/ZnaaSnHJtwuf95OyEKoQGxXT74O8Gugm5hJRZs3AxC7C0
 Lucg==
X-Gm-Message-State: AOAM531IzMmkZ4C6kfGDFIcr5Y0OAjzqJVuLrhsBvsFtAjWjPLVTIyVh
 aNgUxorIHZ7DcHaCSiLo+eBiPQA4lfbvrg==
X-Google-Smtp-Source: ABdhPJzGn5T/8au4NwXGMyU0L5lZGtnGj0rw5QaZCoMhLtEiQEKF5Ue5tsWcUFq+4ti76Vl4Ush7lA==
X-Received: by 2002:a17:902:8d95:b029:d8:c2ee:7dc with SMTP id
 v21-20020a1709028d95b02900d8c2ee07dcmr19800806plo.57.1606754830591; 
 Mon, 30 Nov 2020 08:47:10 -0800 (PST)
Received: from ?IPv6:2402:3a80:419:6b90:c59c:7043:caf9:832d?
 ([2402:3a80:419:6b90:c59c:7043:caf9:832d])
 by smtp.gmail.com with ESMTPSA id d19sm23335719pjs.0.2020.11.30.08.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 08:47:10 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <357371d0-a445-181a-3565-a3ec0debc622@gmail.com>
 <20201118173950.32660-1-yashsri421@gmail.com>
 <CAKXUXMw=NnO4pU01bmTH+pkLckcJzByPktGJPuLf9st+x4VbXQ@mail.gmail.com>
 <30d4ab51-41e7-d535-7cb2-5ae9d02cf58b@gmail.com>
 <CAKXUXMx9J4uJcjsUXQS0heV80qf6d0OgzJ-0kHtimW7nd3dXKw@mail.gmail.com>
 <b2d1808d-1657-67c8-507e-b317b1ad86e8@gmail.com>
 <CAKXUXMxA9jR00-qv7ng748hCx5GVN6zvR9uHfYQTdf0D35ju8Q@mail.gmail.com>
 <CAKXUXMy-S8VpR4-aTQcx-zg_4SXsb4Dj6qRS2ACi1TrgYjNa6g@mail.gmail.com>
 <cfff5784-9ca3-07f8-c51c-f1c82b2871e3@gmail.com>
 <CAKXUXMxmLmdj8wXsAfjGX3Kc8OgU7M78P6jruGAKM9iRA3PbOA@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <d785e5c6-99d5-40d1-4eae-c7209ec86380@gmail.com>
Date: Mon, 30 Nov 2020 22:17:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxmLmdj8wXsAfjGX3Kc8OgU7M78P6jruGAKM9iRA3PbOA@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
 for NETWORKING_BLOCK_COMMENT_STYLE
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

On 30/11/20 3:40 pm, Lukas Bulwahn wrote:
> On Sun, Nov 29, 2020 at 3:58 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 25/11/20 6:08 pm, Lukas Bulwahn wrote:
>>> On Wed, Nov 25, 2020 at 8:19 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>>>>
>>>> On Wed, Nov 25, 2020 at 8:02 AM Aditya <yashsri421@gmail.com> wrote:
>>>>>
>>>>> On 22/11/20 12:22 pm, Lukas Bulwahn wrote:
>>>>>> On Thu, Nov 19, 2020 at 11:44 AM Aditya <yashsri421@gmail.com> wrote:
>>>>>>>
>>>>>>> On 19/11/20 12:30 am, Lukas Bulwahn wrote:
>>>>>>>> On Mi., 18. Nov. 2020 at 18:40, Aditya Srivastava <yashsri421@gmail.com>
>>>>>>>> wrote:
>>>>>>>>
>>>>>>>>> Currently, checkpatch warns us for files in 'net/' and 'drivers/net',
>>>>>>>>> if we use an empty '/*' line for comment and contents of comments are
>>>>>>>>> in next line
>>>>>>>>>
>>>>>>>>> E.g., running checkpatch on commit 0d52497ac8ee ("iwlwifi: pcie: remove
>>>>>>>>> the refs / unrefs from the transport") reports this warning:
>>>>>>>>>
>>>>>>>>> WARNING: networking block comments don't use an empty /* line, use /*
>>>>>>>>> Comment...
>>>>>>>>> +               /*
>>>>>>>>> +                * If the TXQ is active, then set the timer, if not,
>>>>>>>>>
>>>>>>>>> Provide a fix by appending the current line contents to previous line
>>>>>>>>> and removing the current line
>>>>>>>>>
>>>>>>>>
>>>>>>>> Patch generally looks good.
>>>>>>>>
>>>>>>>> Can you check how many comments in net actually follow that style and how
>>>>>>>> many follow another style?
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>> In drivers/net:
>>>>>>> Wrong style: 14695 lines
>>>>>>> Correct style: 147961 lines (ie around 10 times)
>>>>>>>
>>>>>>> In net/:
>>>>>>> Wrong style: 5090 lines
>>>>>>> Correct style: 30485 lines
>>>>>>>
>>>>>>
>>>>>> Can you find out where the wrong style is used?
>>>>>>
>>>>>> Maybe the documentation is a bit outdated.
>>>>>>
>>>>>> For example, some drivers and some subdirectories might have settled
>>>>>> for another commenting style.
>>>>>>
>>>>>> I guess you can submit the fix option, but it could be that the whole
>>>>>> rule/feature is broken anyway... so I do not know if that fix is of
>>>>>> any good...
>>>>>>
>>>>>> I think it is better to actually understand, document and encode the
>>>>>> current rule that applies.
>>>>>>
>>>>>> Can you provide an evaluation where the different styles for
>>>>>> commenting are aggregated in a good way?
>>>>>> E.g., consistently within a file with style XYZ; mixed style but
>>>>>> 80-90% are of style ABC; consistent within a directory.
>>>>>>
>>>>>> If you think some cases are in the wrong style for some specific
>>>>>> files, simply send a patch correcting the commenting style and see.
>>>>>>
>>>>> Hi Lukas
>>>>> I have generated the reports regarding the comments used in various
>>>>> files at net/ and drivers/net.
>>>>> Directory wise reports:
>>>>>
>>>>> net/:
>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/net/cumulative.txt
>>>>>
>>>>> drivers/net:
>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/drivers_net/cumulative.txt
>>>>>
>>>>
>>>> Can you sort that by the overall number of comments per directory?
>>>>
>>>>> File wise reports:
>>>>>
>>>>> net/:
>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/net/cumulative_file.txt
>>>>>
>>>>> drivers/net:
>>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/drivers_net/cumulative_file.txt
>>>>>
>>>>> Some files in 'net/' follow the accepted syntax, such as:
>>>>> 'net/batman-adv => 985    0'.
>>>>>
>>>>> However, some completely not, such as:
>>>>> 'net/ax25 => 0    103'.
>>>>>
>>>>> Some even follow mixed syntax such as:
>>>>> 'net/netfilter => 87    125'.
>>>>>
>>>>> Similarly for drivers/net:
>>>>> drivers/net/ethernet/mellanox/mlxsw => 1071    0
>>>>> completely follow accepted syntax.
>>>>>
>>>>> drivers/net/wireless/ralink/rt2x00 => 98, 2082
>>>>> follow unaccepted syntax largely.
>>>>>
>>>>> whereas files such as drivers/net/wireless/ath/ath5k => 304, 486
>>>>> follow mixed syntax.
>>>>>
>>>>> It seems to me as the documentation might be outdated, as you had also
>>>>> suggested earlier, or maybe users are unaware of the documentation and
>>>>>  just use the syntax for conserving consistency of the code.
>>>>>
>>>>> What do you think?
>>>>>
>>>>
>>>> I think it largely depends on the history of the code and developers
>>>> that take care...
>>>>
>>>> We might just start to ask the larger areas to modify the rule for
>>>> their directory.
>>>>
>>>
>>> I suggest we start with looking at the (let us say 10) "largest"
>>> directories with respect to number of comment blocks and then decide
>>> on a refinement of the rule for those subdirectories:
>>>
>>> A. Directory follows NETWORKING COMMENT STYLE; checkpatch shall warn
>>> to follow NETWORKING COMMENT STYLE.
>>> B. Directory follows GENERAL KERNEL COMMENT STYLE; checkpatch shall
>>> warn to follow GENERAL KERNEL COMMENT STYLE.
>>> C. Directory is too mixed; checkpatch shall not warn on any comment style.
>>>
>>> We can then start the discussion with the appropriate maintainer (and
>>> check what else this maintainer might maintain and if that is
>>> consistent) if they agree or disagree on that.
>>>
>>
>> Hi Lukas
>> Here is the list I have generated with the directories sorted on the
>> basis of comment count and labelled the top 10 directories as
>> following NETWORKING, GENERIC or MIXED comment style(s):
>>
>> At "drivers/net":
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/drivers_net/cumulative_sorted.txt
>>
>> At "net":
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/net/cumulative_sorted.txt
>>
>> What do you think?
>>
> 
> Obviously, this existing rule needs to be refined.
> 
> Do you have a proposal? Probably, you would like to have each
> maintainer state which comment style is preferred or so.
> 
> How could this be technically done?
> 

We can probably Cc all the corresponding maintainers checking from the
MAINTAINERS file.
Since we are considering only the top 10 directories, this probably
shouldn't be much time consuming.

Or we can probably mail any central maintainer(s) for all net and
drivers/net directories (for eg, someone who decided the comment rule
in the beginning for both the directories) and discuss.

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
