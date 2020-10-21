Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7429C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 08:37:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C8012177B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 08:37:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdEz1bem"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C8012177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A1856867CF;
	Wed, 21 Oct 2020 08:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hWfQRqxm5uKB; Wed, 21 Oct 2020 08:37:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EECCC85FC0;
	Wed, 21 Oct 2020 08:35:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C639BC088B;
	Wed, 21 Oct 2020 08:35:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2A0AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B588F871EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ixGs1rFw4av
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:35:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 36D3481514
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:35:52 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id v22so838183ply.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 01:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nU4pSYSVqgezf8LN7YQVK22orjTHRcBoVvx2UUIr73w=;
 b=gdEz1bemOFy5Oj3ZctTrPCb8/SDCl2Q5ztbVzG5jrJ1tEReWcMRv1lfQdaHP5UROzj
 VaDzHxG6Dvb5JjlYWGbziNuw4u9tMVRRTPp/XNSlGQH2fxPFpH9yrIBEr60LbZQbrOXk
 8TQw0XlKED7i9hba1O9j+5GbM8WP8QV5GDFbgQtxl2KTmr7Derg54pP6n8+QBiHF5mNp
 WxBQMowEv+bl+ccx1E1K0ziOYE6zRFhb39dyXiygfEizX1QP5L7x4s9G/3WHQxu24lS4
 Vtvavx3ihGYWZe8rkGnaDZc1603qQ+VADVPEAw007tZyxBc3O44eKHn8QZfshyVf4BNr
 Fsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nU4pSYSVqgezf8LN7YQVK22orjTHRcBoVvx2UUIr73w=;
 b=XOObL0C0Q16DmQ67kGi2QXo3DuirrDdDY8B5nmBRL6pcTMqk/wOp6inCxO5feGqJjG
 asBFLUpB4Zevtd65bxb9UsAU+Y+/8KLKE6nr3H8qLNjJRkjUBMWUvhOg1HBq9FOQWOn4
 rZrLKQd6587Wal/vMwKlI3L5LDc9uWP1kt30shqxh7WFn8lvLhXEHpIp0o7iJEy9HLer
 i6z4mAGc2bycB3xGOXnVfHMx6xH92a+ZUFE2YrM6CYlGWlpOO6WIHj2725J//qoX9GVL
 iQLmKzaD5CCvtgVc7Prj2T9nCh9lrV5fE4oojblrxXD6733pUat7Gz5kRqbaui0DsX/e
 tMxA==
X-Gm-Message-State: AOAM5303Y60bkRGL7jkG1jytmElfpZWFfvlefyADQtPaiWFJGVtCkkO0
 7j10nsFGJQk668DvneG+xocHuCzTbbzgAmcG
X-Google-Smtp-Source: ABdhPJysNP0N8nrLkz3eEJyx5i1bhvTf+m+6Mv40LvR2OfCpVzl52dkd0BVCHXt2990Nw66ERJir6g==
X-Received: by 2002:a17:902:c086:b029:d3:deab:e812 with SMTP id
 j6-20020a170902c086b02900d3deabe812mr2465351pld.51.1603269351384; 
 Wed, 21 Oct 2020 01:35:51 -0700 (PDT)
Received: from ?IPv6:2402:3a80:401:55e5:8cb2:c45f:197:35d9?
 ([2402:3a80:401:55e5:8cb2:c45f:197:35d9])
 by smtp.gmail.com with ESMTPSA id q5sm1040440pjj.26.2020.10.21.01.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 01:35:50 -0700 (PDT)
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201021050027.13253-1-yashsri421@gmail.com>
 <75340ad4-d0c1-4b60-9a2f-ea68ab97fe67@gmail.com>
 <alpine.DEB.2.21.2010210801120.8328@felia>
 <CABJPP5CRJTe3wuLwo8HpFX_dygThic6Ci1=L1=6x0p6e+yR32g@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <e50f6236-e4a2-49e5-c777-358de7b2ffe6@gmail.com>
Date: Wed, 21 Oct 2020 14:05:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CABJPP5CRJTe3wuLwo8HpFX_dygThic6Ci1=L1=6x0p6e+yR32g@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
	for REPEATED_WORD warning
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

On 21/10/20 1:50 pm, Dwaipayan Ray wrote:
> Hey Aditya and Lukas,
> 
>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>>> index 9b9ffd876e8a..181c95691715 100755
>>>> --- a/scripts/checkpatch.pl
>>>> +++ b/scripts/checkpatch.pl
>>>> @@ -3052,7 +3052,9 @@ sub process {
>>>>
>>>>  # check for repeated words separated by a single space
>>>>             if ($rawline =~ /^\+/ || $in_commit_log) {
>>>> -                   while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
>>>> +                   # avoid repeating hex occurrences like 'ff ff fe 09 ...'
>>>> +                   while ($rawline !~ /((\s)*[0-9a-z]{2}( )+){4,}/ &&
> 
> Pattern is probably wrong. It doesn't recognize word boundaries or
> tabs between words. Example of the first type:
> 
> 000 00 ff ff ...
> 
> The regex matches "00 00 ff ff" ignoring the first 0.
> 
> I think it could be perhaps better with something like:
> 
>  # check for repeated words separated by a single space
> -               if ($rawline =~ /^\+/ || $in_commit_log) {
> +               if (($rawline =~ /^\+/ || $in_commit_log) &&
> +                   $rawline !~ /(?:\b(?:[0-9a-f]{2}\s+){4,})/) {
>                         pos($rawline) = 1 if (!$in_commit_log);
>                         while ($rawline =~ /\b($word_pattern)
> (?=($word_pattern))/g) {
> 
> Please test it though. I only ran it on a few patterns.
> 
> Apart from it, this does fix the problem. But I am quite sceptical about
> matching 4 or more 2 lettered words in a row. There could be counter
> examples but I guess that is very rare. It's not very general, but for
> the moment it does the job.
> 
> So I think it's probably good with some changes. Not sure what Joe
> would have in mind though.
> 
> Lukas, I think with the changes in place, it is ready to go for discussion.
> 
> Thanks,
> Dwaipayan.
> 

Thanks Dwaipayan. You're correct.
I'll use \b for checking the word boundaries and regenerate the
reports. I used 4 as the minimum as there were some occurrences with 4
hex words, For eg,
WARNING:REPEATED_WORD: Possible repeated word: 'ff'
#15:
 d68:	61 29 ff ff 	ori     r9,r9,65535

for the commit 332ce969b763 ("powerpc/8xx: Reduce time spent in
allow_user_access() and friends")

In addition to your changes, I also plan to modify regex with [0-9a-f]
(instead of a-z).
I'll apply all the changes and send the report, along with the removed
warnings again.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
