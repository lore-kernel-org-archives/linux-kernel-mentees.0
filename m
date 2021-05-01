Return-Path: <SRS0=C2G1=J4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FCEC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 May 2021 15:03:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE957613F0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 May 2021 15:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE957613F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A6185374;
	Sat,  1 May 2021 15:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyNCz2caEQml; Sat,  1 May 2021 15:03:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80DE385375;
	Sat,  1 May 2021 15:03:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5EBB6C000E;
	Sat,  1 May 2021 15:03:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7437AC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 15:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E8BD402BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 15:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=lwn.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvpiIOKq8CV7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 15:03:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2B5A4028C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 15:03:26 +0000 (UTC)
Received: from localhost (unknown
 [IPv6:2601:281:8300:104d:444a:d152:279d:1dbb])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 6D2142DD;
 Sat,  1 May 2021 15:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6D2142DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1619881405; bh=xiUPjVQBLypVmmHFGUuNCDr9cDHqM/YBFlPvHnb84os=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jN8i5S4IfYqrKNIICU2CvnzCY5G5LyjU0vt55s+ZZ5mSUzYdfMoHfHbMpXgJUP/RU
 rM2KAJr0tewI8typMBOclpKHDZHlbSrCg8doaIv7NcRUFQ9igy7hlUAufeMClhrH0y
 Vik6XynVb/wNTKJ/875tPSTqWLeg7LVCxkYOww5eA0Q1r6LzVyWvnlOPACjM9uQboR
 YYTL5Js/aF3rgFJHD6YNVHkbvjLMeTgAWuLAZM18EkGXy3Wkm7gaBLPqepRMc2JaN1
 QbumUeC1fE0+e3FKmmQL6K9N69jk/LX031jh3MfCoAq8XmGpdFcgo3W5UcT6edO6jx
 SWdTq8NSWh8CQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [RFC v3] scripts: kernel-doc: reduce repeated regex expressions
 into variables
In-Reply-To: <99186604-8ed6-ff72-0308-9ca788db3a51@gmail.com>
References: <20210427165633.GA235567@casper.infradead.org>
 <20210429063729.8144-1-yashsri421@gmail.com> <8735v8d5ja.fsf@meer.lwn.net>
 <99186604-8ed6-ff72-0308-9ca788db3a51@gmail.com>
Date: Sat, 01 May 2021 09:03:24 -0600
Message-ID: <87bl9ujy2r.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, linux-doc@vger.kernel.org
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

Aditya Srivastava <yashsri421@gmail.com> writes:

> On 30/4/21 5:09 am, Jonathan Corbet wrote:
>> Aditya Srivastava <yashsri421@gmail.com> writes:
>> 
>>> There are some regex expressions in the kernel-doc script, which are used
>>> repeatedly in the script.
>>>
>>> Reduce such expressions into variables, which can be used everywhere.
>>>
>>> A quick manual check found that no errors and warnings were added/removed
>>> in this process.
>>>
>>> Suggested-by: Jonathan Corbet <corbet@lwn.net>
>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>> ---
>>> Changes in v3:
>>> - Remove variables for separate qualifiers in "sub dump_struct"
>>> - Make a common variable for all the qualifiers
>>> - Make $attribute global variable to use it at "sub check_sections" as well
>>>
>>> Changes in v2:
>>> - Rename $pointer_function to $function_pointer
>>> - Combine elsif-block expressions at "sub dump_function" into lesser regex expressions
>>> - Combine $prototype_end1,$prototype_end2 expressions into a common $prototype_end
>>>
>>>  scripts/kernel-doc | 71 ++++++++++++++++++++++------------------------
>>>  1 file changed, 34 insertions(+), 37 deletions(-)
>> 
>> So this looks good but ... it adds a warning to the build:
>> 
>> /stuff/k/git/kernel/Documentation/driver-api/media/v4l2-controls:823: ./include/media/v4l2-ctrls.h:964: WARNING: Invalid C declaration: Expected identifier in nested name. [error at 6]
>>   const * v4l2_ctrl_get_menu (u32 id)
>>   ------^
>> 
>> So it looks like something isn't being parsed quite identically?
>>
>
> Hi Jonathan!
> I could not reproduce this error..
> Can you suggest me how can I reproduce this error?
> I ran kernel-doc -none {$file} over the tree.
>
> Probably, this is not a kernel-doc error

It's a Sphinx error; run "make htmldocs" to see it.  That said, the
error itself should be enough to point at where the problem is.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
