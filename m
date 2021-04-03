Return-Path: <SRS0=w/H4=JA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C752AC43460
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Apr 2021 12:43:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 655146121F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Apr 2021 12:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 655146121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 316F184EE0;
	Sat,  3 Apr 2021 12:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iafXG7nn24GS; Sat,  3 Apr 2021 12:43:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FAE384EDA;
	Sat,  3 Apr 2021 12:43:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15174C000C;
	Sat,  3 Apr 2021 12:43:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DE59C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Apr 2021 12:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5753B403DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Apr 2021 12:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0d0jIhXF_D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Apr 2021 12:43:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 094B3403D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Apr 2021 12:43:44 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so5752929pjc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Apr 2021 05:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l9J7Rrtr5vX5sTUcC2BnLF28M3UYe4/pHrGKjFh6MSM=;
 b=rAvyolEtINNdsn5rcy3zoxvT4KgaWso521j7kK32Tou5ahiOGCzNYoJ/C4JX+3MyMz
 RuO8HtjcUj6jQbZ0zPkrFOvwSHYK7c4sFBj0SALgClqXcSnkc625rREamCwz8icGWz8B
 HdRZDnhHJ1gD6QFeGH17t+PXvSbMnVkJ5S6a6avakA5oVvrCmjXiEr2t0l6gzarNTf/v
 lkqakN/ko91X4kdjY+DifBrSEwT74Hfi4Br6zngZ55TRS5PfVtAqWtouvQxlQqqOL/5g
 01ZPIjSK4reAESN0t6s8FrUTYvIqqBhBflJQC3U9LL8HOYkMbRBHGVhY1VUJXYBe3J0R
 T19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l9J7Rrtr5vX5sTUcC2BnLF28M3UYe4/pHrGKjFh6MSM=;
 b=PllY6DtXofNjkQjnH/uQhWn/nQot4217VstuDQaWtr6pZ5IP+SLHcszfv2bNcMpF0h
 MqKh5XXjl3AcOzmjAL1VuWzl7NmNW57nsZUaiPkUzy1VN5Z1KW1fnUrMdKqWCcWHipeg
 pC0pbCHjGrTqwGAt3jExnfvOaZoUXljP22O+qcfB6cVkTi/jBFY3Rv2hviItwJeJ5y91
 Vs0iGtwRiEbWlmBWNhxn8cK5Tg2P8cy24LcFywZYKZrBZDIk+vKkNy4NIfp0Z00L8zAU
 5MeuReua8DhV3w3D3cFQG6Kb09flrzKXzDey04uyaFSoV0Y1rmwTM38tgS/COCtBlEEN
 rHVg==
X-Gm-Message-State: AOAM532RimmjkSmAsfwfut+lbM5OGlXdn6pzHgqZym79T3tu0pUuK/4H
 Gomg1u5GuH4UXdFELpZXAvo=
X-Google-Smtp-Source: ABdhPJw9MyAP3c9lzuu0qApDj+cYYiZVnB1RR6reKtnceMO8i0UaIlAmY2rHQmXQ9cZHZD59gERA2Q==
X-Received: by 2002:a17:90a:1b0e:: with SMTP id
 q14mr17620107pjq.41.1617453824146; 
 Sat, 03 Apr 2021 05:43:44 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a089:150c:a6c7:d4:6d35?
 ([2405:201:600d:a089:150c:a6c7:d4:6d35])
 by smtp.gmail.com with ESMTPSA id g4sm11158310pgu.46.2021.04.03.05.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Apr 2021 05:43:43 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] scripts: kernel-doc: add warning for comment not
 following kernel-doc syntax
To: Jonathan Corbet <corbet@lwn.net>
References: <20210329092945.13152-1-yashsri421@gmail.com>
 <87czvit65m.fsf@meer.lwn.net>
 <a35096d5-99e7-6b69-c959-1136d511a0ff@gmail.com>
 <87mtujktl2.fsf@meer.lwn.net>
Message-ID: <0b5cedae-d89e-e558-906d-846ed01f27ca@gmail.com>
Date: Sat, 3 Apr 2021 18:13:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87mtujktl2.fsf@meer.lwn.net>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
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

On 1/4/21 1:02 am, Jonathan Corbet wrote:
> Aditya Srivastava <yashsri421@gmail.com> writes:
>
>> On 29/3/21 7:26 pm, Jonathan Corbet wrote:
>>> Aditya Srivastava <yashsri421@gmail.com> writes:
>>>
>>>> Currently, kernel-doc start parsing the comment as a kernel-doc comment if
>>>> it starts with '/**', but does not take into account if the content inside
>>>> the comment too, adheres with the expected format.
>>>> This results in unexpected and unclear warnings for the user.
>>>>
>>>> E.g., running scripts/kernel-doc -none mm/memcontrol.c emits:
>>>> "mm/memcontrol.c:961: warning: expecting prototype for do not fallback to current(). Prototype was for get_mem_cgroup_from_current() instead"
>>>>
>>>> Here kernel-doc parses the corresponding comment as a kernel-doc comment
>>>> and expects prototype for it in the next lines, and as a result causing
>>>> this warning.
>>>>
>>>> Provide a clearer warning message to the users regarding the same, if the
>>>> content inside the comment does not follow the kernel-doc expected format.
>>>>
>>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>>> ---
>>>>  scripts/kernel-doc | 17 +++++++++++++----
>>>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>>
>>> This is definitely a capability we want, but I really don't think that
>>> we can turn it on by default - for now.  Experience shows that if you
>>> create a blizzard of warnings, nobody sees any of them.  How many
>>> warnings does this add to a full docs build?
>>>
>>
>> Hi Jonathan, here's the diff I have created for the warnings before
>> and after the changes:
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/kernel_doc_comment_syntax.txt
>>
>> Around ~1320 new warnings of this type are added to the kernel tree,
>> and around ~1580 warnings are removed.
>
> So I finally got around to looking at this again...  How did you
> generate that file?
>

I ran scripts/kernel-doc -none on all the files in the kernel tree
before and after appying the changes, and then generated their diff to
find the warnings removed and added.

> I tried applying the patch and doing a normal full htmldocs build and
> got all of four warnings:
>
>   ./include/linux/seqlock.h:829: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>    * DEFINE_SEQLOCK(sl) - Define a statically allocated seqlock_t
>   ./fs/jbd2/journal.c:1391: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>    *  journal_t * jbd2_journal_init_dev() - creates and initialises a journal structure
>   ./fs/jbd2/journal.c:1422: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>    *  journal_t * jbd2_journal_init_inode () - creates a journal which maps to a inode.
>   ./include/linux/dcache.h:309: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>    *      dget, dget_dlock -      get a reference to a dentry
>

I think there should be more warnings. For e.g., running kernel-doc
-none ./drivers/usb/mtu3/mtu3.h gives these warnings:

./drivers/usb/mtu3/mtu3.h:75: warning: This comment starts with '/**',
but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst
./drivers/usb/mtu3/mtu3.h:86: warning: This comment starts with '/**',
but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst
./drivers/usb/mtu3/mtu3.h:143: warning: This comment starts with
'/**', but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst

> Two observations:
>
>  - This is not an awful lot of warnings - not the blizzard I had
>    feared.  At this level, I think we can just merge the patch and
>    then, hopefully, fix those cases.
>
>  - All of the warned-about places are *attempts* to write real kerneldoc
>    comments, they just got the syntax wrong in one way or another.  It's
>    probably not worth the effort to try to detect this case - the
>    warning is enough to draw attention to the comment in question.
>

I agree. Above are some of the cases which are not getting detected by
this patch.
This may be so as I am only allowing the function syntax as mentioned
in the rst file, i.e., "^\s*\*\s*([\w\s]+?)(\(\))?\s*([-:].*)?$" or
("* foo(\(\))? - description")

I probably need to check for pointers as well and other similar case(s).
Maybe I should design a separate check for functions than assigning
$decl_type = 'function' in the first check.

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
