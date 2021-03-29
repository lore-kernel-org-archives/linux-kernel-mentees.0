Return-Path: <SRS0=0o+h=I3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9627EC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 15:10:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FE2E61968
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 15:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FE2E61968
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FC93402F6;
	Mon, 29 Mar 2021 15:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5U7G9hIgYEt; Mon, 29 Mar 2021 15:10:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A39C402F2;
	Mon, 29 Mar 2021 15:10:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 536ADC000C;
	Mon, 29 Mar 2021 15:10:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47244C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 15:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21BB84011A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 15:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-GJKamT_--s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 15:10:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B48CC400A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 15:10:43 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id t18so6139403pjs.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N/NFcCbZ8SKrCYRliun6T/1PmIMqL/U+dGOxSrfuAnc=;
 b=CpLS08yoL0mgc/0jXiOqpJ1zYGIuIpq/bs/oA1AEx50zpsGFJc41Fsu0G4trNuVdqV
 IXy1vasTJYKOJQa66t3Rww7mrUxBdLFoWorvsm6EjqHzjWX3mWDw+DtzIRKCLefZb1a+
 7+yAxkDR+KPI3rbx8lyfBEAgSQWpswkhnpOmSFSxn51oM4UAYxD/4m/55ih2RLUG88wb
 cjLUxVHlEAVjye3+nRXv2vrsHUn7ajNRUPvuyFXm0yM0NWL8fNdQOnC4tm59kDgwSYJT
 tmffZR3ig0SjSIy55FZFTnNHH3693W/0uctfpQHqI3h0lM6xuGucjXWIS/uzn9iQl9mD
 Y/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N/NFcCbZ8SKrCYRliun6T/1PmIMqL/U+dGOxSrfuAnc=;
 b=D0jU1zTRgznj2qfCz/frv3a98vCsjb3+heWPEs3dm2G7NtLkaHmeBA14qnKTu/Yd2v
 2V+2fNUN3AFzFD5x932OT3WQo96i7N2lZyizRrJAZu3qeaxNPLm934S13RrZ+dggGouQ
 lb3Ou4LoKnC3HLghGpRPewI3SxL7rXFfkee68t0yOHiXVwJcetXJhP0xuKyTq2VsSWQH
 mVze4zPZs2XZDogVvjKbaYrKD/r0nACf6Ds4jtYk0wMbh6BKYjm+HrTuFmoe2Km+a9he
 2qQgdt5rtLhViWOipa1xMhzvLTes0MDNo8ohEKb/X5WFiCZFH7TiVtWXOTIBodvMLuLc
 u9eA==
X-Gm-Message-State: AOAM530+fTONn+zFhdmN+sroE6FhXF5Nr+A3rr6S5F15BkUGlkcXCsne
 6E1WeJhsYFaEnmRVWmFrw1M=
X-Google-Smtp-Source: ABdhPJzqN2E68plwn/1hbIWAe8x57eA/rAEk/eQn0HrGMkeiOAN0s/buYE1hQii3Fd0eVYWo/4Xf2g==
X-Received: by 2002:a17:902:820e:b029:e6:f006:fcff with SMTP id
 x14-20020a170902820eb02900e6f006fcffmr28543194pln.60.1617030642988; 
 Mon, 29 Mar 2021 08:10:42 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a089:b513:fdab:ff5:9ffb?
 ([2405:201:600d:a089:b513:fdab:ff5:9ffb])
 by smtp.gmail.com with ESMTPSA id q184sm17486614pfc.78.2021.03.29.08.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 08:10:42 -0700 (PDT)
Subject: Re: [PATCH] scripts: kernel-doc: add warning for comment not
 following kernel-doc syntax
To: Jonathan Corbet <corbet@lwn.net>
References: <20210329092945.13152-1-yashsri421@gmail.com>
 <87czvit65m.fsf@meer.lwn.net>
From: Aditya Srivastava <yashsri421@gmail.com>
Message-ID: <a35096d5-99e7-6b69-c959-1136d511a0ff@gmail.com>
Date: Mon, 29 Mar 2021 20:40:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87czvit65m.fsf@meer.lwn.net>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

On 29/3/21 7:26 pm, Jonathan Corbet wrote:
> Aditya Srivastava <yashsri421@gmail.com> writes:
> 
>> Currently, kernel-doc start parsing the comment as a kernel-doc comment if
>> it starts with '/**', but does not take into account if the content inside
>> the comment too, adheres with the expected format.
>> This results in unexpected and unclear warnings for the user.
>>
>> E.g., running scripts/kernel-doc -none mm/memcontrol.c emits:
>> "mm/memcontrol.c:961: warning: expecting prototype for do not fallback to current(). Prototype was for get_mem_cgroup_from_current() instead"
>>
>> Here kernel-doc parses the corresponding comment as a kernel-doc comment
>> and expects prototype for it in the next lines, and as a result causing
>> this warning.
>>
>> Provide a clearer warning message to the users regarding the same, if the
>> content inside the comment does not follow the kernel-doc expected format.
>>
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>>  scripts/kernel-doc | 17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> This is definitely a capability we want, but I really don't think that
> we can turn it on by default - for now.  Experience shows that if you
> create a blizzard of warnings, nobody sees any of them.  How many
> warnings does this add to a full docs build?
> 

Hi Jonathan, here's the diff I have created for the warnings before
and after the changes:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/kernel_doc_comment_syntax.txt

Around ~1320 new warnings of this type are added to the kernel tree,
and around ~1580 warnings are removed.

Thanks
Aditya

> For now I think we need a flag to turn this warning on, which perhaps
> can be set for a W=1 build.
> > Thanks,
> 
> jon
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
