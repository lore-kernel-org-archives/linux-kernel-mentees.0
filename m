Return-Path: <SRS0=Jn8L=IJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0C9C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Mar 2021 21:04:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0575C64E44
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Mar 2021 21:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0575C64E44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 911BB4ED0E;
	Thu, 11 Mar 2021 21:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRrTKE4cU-f0; Thu, 11 Mar 2021 21:04:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A9604ED0D;
	Thu, 11 Mar 2021 21:04:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 637AFC000A;
	Thu, 11 Mar 2021 21:04:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67992C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Mar 2021 21:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 552BC6F9C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Mar 2021 21:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9yRscbnGWoAd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Mar 2021 21:04:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61AFD6F9A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Mar 2021 21:04:02 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id o38so14450151pgm.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Mar 2021 13:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ALluUOsoSqK4P+is/Y65pRMrQ+pvKVSisjX8vHlvv0Y=;
 b=L+SgzsufpGKpowTezzieLVjENQonW5ufjAo6UGxYlvwEYAI4R3Qj8ejfabUzZ/E35o
 eP9qU2CcWjrsiUp0VsPN31ep4vrG2ZKq3HcgPOxDBjbUXCYSXAWaZ+pmUCv+heU0V5oW
 /N+1KeI7yCDxPza1UrJh8a7SkpoEKLDHq4B+3hXsZXbrxyg/dy+zV98l3aAz6sMVOA3s
 Hjit8bp39EJkvN5r58j4op+3TcIFxih28ZAKczlzbdGAvz2SPAuwELFxIL8tExshpE0O
 NiOLjc2mc0mkMvJuD1RhE5BztpkbE4VkrEIxUTb2+BzrwzAHTdIVr3aSp3zFY9z7YoB6
 XjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ALluUOsoSqK4P+is/Y65pRMrQ+pvKVSisjX8vHlvv0Y=;
 b=nvhlD7RxAqzy2fX2j2uQxQpjK9CtWi16eitJeFdsJQSI4G3xjFkvBa/yW1HhOODoT8
 zCFVTplfKG3Z7UZDFMcr5wCV95iPLDe3vWLmzBAoK3TrjSs+WANNROAEPxPmm3ZNz2dj
 8DLzg5gKdLquN/4QxK8hxUGzNRNshpw0MJD27ckYl3AaZkUA6sAhf4UmFuqjOjTkZFkF
 Amu3rsWgUk+27ZFR3BnXDTwvxPX9VBX0w/wSIo62XbH15nb3HYndNt+MiZ621l8SC/2Y
 8F1/uoD7tXerx2nnD0mV3PD9LIlVQ4w66hu2MgqZTyTxvHHN55QOcGl1/mRhsR/A/3JT
 6rgQ==
X-Gm-Message-State: AOAM5313LEHUaq71bXXVysXl3hd5u9iUMEi1yuvOih5N7vFy9CeT7ggr
 FnyY7UPTvTmMG5YB/rZJvq7Ne1p6Ja/jHoUi
X-Google-Smtp-Source: ABdhPJwkBvX01oEU2foX84xttZrz/R4IafR2gkTb0wcgibS6UEN6hIYEQ+Oza7/LP/IS8mv91M7qkQ==
X-Received: by 2002:a63:161c:: with SMTP id w28mr8872540pgl.341.1615496641519; 
 Thu, 11 Mar 2021 13:04:01 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:c1b4:679a:535a:d260?
 ([2405:201:600d:a089:c1b4:679a:535a:d260])
 by smtp.gmail.com with ESMTPSA id s28sm3336112pfd.155.2021.03.11.13.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 13:04:01 -0800 (PST)
Subject: Re: [RFC] scripts: kernel-doc: avoid warnings due to initial
 commented lines in file
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20210309125324.4456-1-yashsri421@gmail.com>
 <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
 <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com>
 <CAKXUXMwg7Vs5hm_X3ZHJj9309w5VYbnNeqXaajHBHS1oAKQydw@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <838a823b-f3fd-ed1b-70d1-82611f9f4ada@gmail.com>
Date: Fri, 12 Mar 2021 02:33:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMwg7Vs5hm_X3ZHJj9309w5VYbnNeqXaajHBHS1oAKQydw@mail.gmail.com>
Content-Language: en-US
Cc: Markus Heiser <markus.heiser@darmarit.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
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

On 10/3/21 11:49 am, Lukas Bulwahn wrote:
> On Tue, Mar 9, 2021 at 10:24 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 9/3/21 7:00 pm, Markus Heiser wrote:
>>>
>>> Am 09.03.21 um 13:53 schrieb Aditya Srivastava:
>>>> Starting commented lines in a file mostly contains comments describing
>>>> license, copyright or general information about the file.
>>>>
>>>> E.g., in sound/pci/ctxfi/ctresource.c, initial comment lines describe
>>>> its copyright and other related file informations.
>>>
>>> The opening comment mark /** is used for kernel-doc comments [1]
>>>
>>> [1]
>>> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#how-to-format-kernel-doc-comments
>>>
>>
>> Hi Markus!
>> That's true. But the content inside the comment does not follow
>> kernel-doc format.
>> For e.g., try running kernel-doc -none/man/rst on the above file in
>> the example("sound/pci/ctxfi/ctresource.c").
>> The starting 2-3 lines in files generally do not contain any
>> struct/enum/function, etc. declaration.
>>
> 
> Aditya, can you provide a diff of the warnings over the whole kernel tree?
> 
> At the moment, your patch just implements ignoring the initial
> comment, which probably is good for experimentation.
> 
> Alternatively, we could simply have a dedicated warning and then
> ignore it or even warn and then parse it as-if.
> 
> In the "long run", we would probably want to fix all current files in
> the repository by just replacing '/**' by '/*' and have kernel-doc
> warn about this suspicious pattern, when new files appear (maybe even
> configurable, but that is another feature to enable or disable certain
> kernel-doc checks and warnings). I would certainly assist and
> contribute to such a clean-up task.
> 
> I think the first step is to look at the diff, and see how many cases
> really appear in the tree... then check how many patches throughout
> the whole tree are required and if they are generally accepted.
> 

Hi Lukas!
This is the diff of the warnings over kernel tree before and after
applying these changes.
There are 2 sections in this report:
1) for the warnings present before, but not after, and;
2) after but not before

The part (2) contains, for some cases, where the warning for "warning:
Incorrect use of kernel-doc format:" type has changed to "warning:
wrong kernel-doc identifier on line:" type.

The diff file can be found at:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/avoid_init_line_diff.txt


Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
