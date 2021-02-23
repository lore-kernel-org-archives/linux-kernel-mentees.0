Return-Path: <SRS0=pe2G=HZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BA5C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Feb 2021 12:25:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01E6964E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Feb 2021 12:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01E6964E4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8822983880;
	Tue, 23 Feb 2021 12:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LsyLS6Cbi1T; Tue, 23 Feb 2021 12:25:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39D91835EF;
	Tue, 23 Feb 2021 12:25:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19250C000A;
	Tue, 23 Feb 2021 12:25:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 587C8C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 12:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 44FFB8702B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 12:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wEvqZJ1eUVwy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 12:25:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BC40687024
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 12:25:42 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id t29so8653490pfg.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 04:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QnraGrfKJNAuzXXyF+P/lQ9nJ4NmJUsr8wDqFM+qAdc=;
 b=B9tYIJ2ZtbhgYOYSgV9nO9ytK8kpwudwBaeVFnSQ3bmwKMBArML1cHY5cSkMAbJ1D0
 TKMn0OAFMu3skyau7AoAYsNyPXHtK1grug4tyTE2tk4gjf0IQ7xzCQqknj87CexzDG4x
 CSWg/T75EO3q89ggpk8KMpY7v8xiWtJZfBun2/yydEpO+mlh/Gxcq8VVDhJEebx7iEOZ
 1dyCKp9T9Vn9t0gInjqMmwUw12rdfN5X/IMN25wIs8t8O9UmM9z8fUdjVBz+mrWjmBK+
 rpzvkcVvIj3pOe3ASDwekn7Nm1A+WGjWa3wRU0I2DVx/4Xz2E4Lkobg0IL8EvvkW9yLz
 oDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QnraGrfKJNAuzXXyF+P/lQ9nJ4NmJUsr8wDqFM+qAdc=;
 b=Pv+KkueJr7zI59brn9tvEAKZuh3vHkbBYaFGPqFnPEgzXUSmcOV2LwOElX7UU+gpco
 cbT+A/uYBhCkK4JbBmP3sNtjT0QMx4Gjgsu9oKHIp4aXU+H2Men+6gR7/37E6zs2cz57
 /9krwhh3GTDxzEL9ql1/heF67ApEdLEnkcQC6xKJKGgACcLy4rA2uAWPXwCWarZXNhdW
 MtoNtS+RDZ+iz0LUXz3H14nHYww/0dM5R/ZlQWb/L6knBdqMzbEjG8r+PznNZGRV1j2W
 DPjd28fYEj+bIFyfedAKfyn5xlf+L3LH0X+138S9L3lB8wcSpzDKlVl+DAgk1q8xdd5C
 ObDw==
X-Gm-Message-State: AOAM532FBWL89lKLhgnSm3tgaG+JMq/vA/HaVcY00Zz1T5l6U+gksXqH
 5HGyMWquwtIsFRW/lfFpsKwORfSdqV2N6A==
X-Google-Smtp-Source: ABdhPJzaWSkZQ3bMSfxPGDzMRFmrkTy+76NiJP/lU1IrVVIMzlFFlSFM97ne2LmTLQPR3q70RC8qng==
X-Received: by 2002:a63:c343:: with SMTP id e3mr2971411pgd.8.1614083142017;
 Tue, 23 Feb 2021 04:25:42 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:71c8:9c21:1a6d:84ab?
 ([2405:201:600d:a089:71c8:9c21:1a6d:84ab])
 by smtp.gmail.com with ESMTPSA id h3sm21156348pgm.67.2021.02.23.04.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 04:25:41 -0800 (PST)
To: Jonathan Corbet <corbet@lwn.net>
References: <20210222160347.23410-1-yashsri421@gmail.com>
 <875z2jlr2j.fsf@meer.lwn.net>
From: Aditya <yashsri421@gmail.com>
Message-ID: <19d41289-cf8e-881d-cc0d-9c7e193db242@gmail.com>
Date: Tue, 23 Feb 2021 17:55:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <875z2jlr2j.fsf@meer.lwn.net>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC] scripts: kernel-doc: fix typedef
	support for struct parsing
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

On 23/2/21 3:10 am, Jonathan Corbet wrote:
> Aditya Srivastava <yashsri421@gmail.com> writes:
> 
>> There are files in kernel, which use 'typedef struct' syntax for defining
>> struct. For eg, include/linux/zstd.h, drivers/scsi/megaraid/mega_common.h,
>> etc.
>> However, kernel-doc still does not support it, causing a parsing error.
>>
>> For eg, running scripts/kernel-doc -none on include/linux/zstd.h emits:
>> "error: Cannot parse struct or union!"
>>
>> Add support for parsing it.
>>
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>>  scripts/kernel-doc | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
>> index 8b5bc7bf4bb8..46e904dc3f87 100755
>> --- a/scripts/kernel-doc
>> +++ b/scripts/kernel-doc
>> @@ -1201,12 +1201,20 @@ sub dump_union($$) {
>>  sub dump_struct($$) {
>>      my $x = shift;
>>      my $file = shift;
>> +    my $decl_type;
>> +    my $members;
>>  
>>      if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
>> -	my $decl_type = $1;
>> +	$decl_type = $1;
>>  	$declaration_name = $2;
>> -	my $members = $3;
>> +	$members = $3;
>> +    } elsif ($x =~ /typedef\s+(struct|union)\s*\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*\s*(\w*)\s*;/) {
> 
> So this isn't your fault, but these regexes are really getting out of
> hand.  I would *really* like to see some effort made into making this
> code more understandable / maintainable as we tweak this stuff.  So:
> 
>  - Splitting out the common part, as suggested by Lukas, would be really
>    useful.  That would also avoid the problem of only occurrence being
>    edited the next tine we add a new qualifier.
> 
>  - Splitting out other subsections of the regex and giving them symbolic
>    names would also help.
> 
>  - We really could use some comments before these branches saying what
>    they are doing; it is *not* obvious from the code.
> 
> See what I'm getting at here?
> 
Yep.
Thanks for the feedback Lukas and Jonathan. I'll get back with a v2
for the patch.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
