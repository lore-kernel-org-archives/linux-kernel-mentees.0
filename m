Return-Path: <SRS0=cwSI=GZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B05CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Jan 2021 20:13:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9806323AFC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Jan 2021 20:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9806323AFC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C487873AA;
	Fri, 22 Jan 2021 20:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSDKlwUf3b+e; Fri, 22 Jan 2021 20:13:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A06F9873A9;
	Fri, 22 Jan 2021 20:13:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9346EC088B;
	Fri, 22 Jan 2021 20:13:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F26EC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 20:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 504CD86FDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 20:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uQXOIlYSIC8l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 20:13:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CE87B86FD2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 20:13:25 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id i7so4549697pgc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 12:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P9tYxUwkT1diagUtKn01/sYWnChBZ13cYDuFtjNNJ6E=;
 b=RqFQHT/cm0iQdmZST9Af5cM0lNKHS3FPYNpey9Rusbswe4Eejn7P9J/PJDFYk/sOf5
 6L+h0hTGGx/vMVX0WCGGwzZRGR8wfUMM9QaHDJHglbJ2Nf6pHt4jHnITtqc687r+Jn9w
 AKRiIcQLAEbYBRSXAikrBuJv9FUjVwT7S6FuDBOTz63bh/g2CgFTobIwko8nrBRa/TLe
 ljMD50xpn5V9gvMtAjnYGF4uq68WPtm/vq0l4JbJYVD+whlYA+Q8ufEmTXrkPGZNfQsI
 GXzqFlKycnXMUHSblx+4TL70ee4oZsiml/Pb+kR5P1TGA1IasGGGjYP/AgSiMBmRDa3S
 pLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P9tYxUwkT1diagUtKn01/sYWnChBZ13cYDuFtjNNJ6E=;
 b=h4llMjG4vXy7jyQdJYSqAuzAU+KsmGklRvzUXqSyzZBKb9Tumi7KgAEYuP7brt8JeC
 3+QtlAXObT1gqJlmbZn48grYzZEN85ble3M7uwvB6we/h5V+LH5GoZxgiwadB1LholKE
 V37yHFNDI4vvEKym6246iKwt/z9qHXVdC/gvkYecTOnlwjO9jXg6IQSk21eOZhdz6mkh
 BF6N56ngJpBSdNTQTLwbsF7f1hBu5nNeZlO1V5G+hD4tO1UDYj5wWPt4VxV3HCdqi4XD
 Q0LVJvhMzu9hBBOcTOvHX2YcwqKTMIvampNIwLhkrAGV69dW2Nrker0lOatN1YdghGWY
 4mrg==
X-Gm-Message-State: AOAM532xeJLYmrNrHGBkRhbka6AHpGxoSgRcCvVxw2th4PlQsvD2j/Ou
 S72RwVZkrJJX19z2g+RUdFs=
X-Google-Smtp-Source: ABdhPJzYbDnJqvneR1TTA42JC4Jy5xe6d5Fir/gFzfPWl+44ER4KNbtUbUh8p4gVanrenaI8p3YbZw==
X-Received: by 2002:a65:5b47:: with SMTP id y7mr6136443pgr.221.1611346405325; 
 Fri, 22 Jan 2021 12:13:25 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:5548:7837:8dcd:a8?
 ([2405:201:600d:a089:5548:7837:8dcd:a8])
 by smtp.gmail.com with ESMTPSA id n1sm9689327pjv.47.2021.01.22.12.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:13:24 -0800 (PST)
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
References: <20210120072547.10221-1-yashsri421@gmail.com>
 <e5c5f8495fbdd063f4272f02a259bbf28b199bdd.camel@perches.com>
 <14707ab9-1872-4f8c-3ed8-e77b663c3adb@gmail.com>
 <fb1b511d71761c99a9bece803f508b674fce9962.camel@perches.com>
 <98d40817-1f80-c772-eb9e-a6c3c04625b3@gmail.com>
 <27366417ad75e0300d4647f776ca61bb1b132507.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <bd560a8e-7949-933a-e4a9-508cb42c2570@gmail.com>
Date: Sat, 23 Jan 2021 01:43:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <27366417ad75e0300d4647f776ca61bb1b132507.camel@perches.com>
Content-Language: en-US
Cc: broonie@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 clang-built-linux@googlegroups.com, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for
 avoiding .L prefix symbols in assembly files
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

On 23/1/21 12:40 am, Joe Perches wrote:
> On Fri, 2021-01-22 at 18:48 +0530, Aditya wrote:
>> On 21/1/21 12:13 am, Joe Perches wrote:
>>> I believe the test should be:
>>>
>>> 	if ($realfile =~ /\.S$/ &&
>>> 	    $line =~ /^\+\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
>>
>> Joe, with this regex, we won't be able to match
>> "jmp  .L_restore
>> SYM_FUNC_END(\name)"
> 
> I think that's not an issue.
> 
>> which was replaced in this patch in the discussion:
>> https://groups.google.com/g/clang-built-linux/c/-drkmLgu-cU/m/phKe-Tb6CgAJ
>>
>> Here, "jmp  .L_restore" was also replaced to fix the error.
> 
> Notice that this line was also replaced in the same patch:
> 
>  #ifdef CONFIG_PREEMPTION
> -SYM_CODE_START_LOCAL_NOALIGN(.L_restore)
> +SYM_CODE_START_LOCAL_NOALIGN(__thunk_restore)
> 
> 
>> However, if this
>> regex(/^\+\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) is
>> correct, maybe we don't need to check for $file as we are now checking
>> for just one line.
>>
>> What do you think?
> 
> The test I wrote was complete, did not use $file and emits a
> warning on the use of CODE_SYM_START_LOCAL_NOALIGN(.L_restore)
> 
> I think it's sufficient.
> 

Okay, Thanks.. I will send the modified patch :)

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
