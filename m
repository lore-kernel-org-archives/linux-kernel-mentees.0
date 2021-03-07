Return-Path: <SRS0=nuZf=IF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C98C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  7 Mar 2021 07:36:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 996DE60201
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  7 Mar 2021 07:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 996DE60201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FBB783CDE;
	Sun,  7 Mar 2021 07:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxV_4Wbj8Jn5; Sun,  7 Mar 2021 07:36:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4207C83CD8;
	Sun,  7 Mar 2021 07:36:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D827C000B;
	Sun,  7 Mar 2021 07:36:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD5DAC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  7 Mar 2021 07:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B611383CDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  7 Mar 2021 07:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HzCjW71Jm3zT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  7 Mar 2021 07:36:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07F2983CD8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  7 Mar 2021 07:36:06 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 q2-20020a17090a2e02b02900bee668844dso1330016pjd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 06 Mar 2021 23:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uKTFoNSndRX4SlCjlrIyTvDGYlDZG2N55rMO+ELI0qU=;
 b=I8BG7lVXrEj5VoT6+CQqfwf5C4c/3lOvXYEWsknxk+BWaRH6VyTJ6sewTkGebGljQR
 kd6pQ95DiYbhsuEvALprxkGG8o+wJf7ZxdM90IbSYZQ81cfj1c+tx+pLPH23YwcsgKXo
 zKmCaAC6GnyKDbFr5gjFzWhHjjsfkctvxa1ATgh8FwVDb2C/td676eMXM0qo7tbIWhjW
 XA+WocJXsnuQmyZffeirde1KddG6NFFPRuZrdZiUWxxMyNMA3OgAK+Q5+vwdbTlv6oNQ
 JN0BougCMjz13oIS1jGbPh3f5Vc/uSkmaGQkue8aIIbMvfqjzkVpaHxCOoBMZHjtFmCe
 8h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uKTFoNSndRX4SlCjlrIyTvDGYlDZG2N55rMO+ELI0qU=;
 b=G9GWWcf2wu26GJvjSsgtUB5UCPJzB092NhZaPwCOP5Wfu+9CKfkgVxWxaCWHN9FTag
 u2i73bFhAQdBTy+yabr4VSOOvb+qclGshCvhc8trF1SLEaKWPG3/N84lAQyY+KNLMcI2
 6RVnWy5av17U06QudGI9OP8CdohNntVcptWd6h2NXphLol/ev3tFs8xs/C1DF1bKMNzl
 MOOfXLP7iGob99WZKgsOiv6HGPerABZAlyEx6d5LtGhLs5N6Cml6pn4hASRYe3It0jXw
 Akml23a84x3d9yXUqe/Bc4uZ8d9r9QQlCKnhS0Xf07LVPqWcoVHqfwCyvqvgBf9QWzeP
 fVZg==
X-Gm-Message-State: AOAM531bEXN7j7rNDiA40DlFlmzj5rwHe6NI73ERWwKOi6dJcn+JmsF0
 qnu8FiFvFh9IGgKoNXNFFZhgLhWaOMY+LmqE
X-Google-Smtp-Source: ABdhPJxi677DhB/Abs4FPlKBS1Vi6AMpM5RLakMx4cIvbV9WE3AFgIWFIzOw/0cDKEBaOF29/oWLkw==
X-Received: by 2002:a17:90a:5d09:: with SMTP id
 s9mr18166436pji.172.1615102566122; 
 Sat, 06 Mar 2021 23:36:06 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:7154:efa8:e27f:8a00?
 ([2405:201:600d:a089:7154:efa8:e27f:8a00])
 by smtp.gmail.com with ESMTPSA id e12sm6782956pjj.23.2021.03.06.23.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Mar 2021 23:36:05 -0800 (PST)
Subject: Re: [RFC v3] scripts: kernel-doc: fix typedef support for
 struct/union parsing
To: Matthew Wilcox <willy@infradead.org>
References: <CAKXUXMzHPnM=ie06ZGuFXyJ7RcRjYomjyASbp3ND9-Mb2Es+2w@mail.gmail.com>
 <20210225145033.11431-1-yashsri421@gmail.com>
 <20210306043548.GO2723601@casper.infradead.org>
 <CAKXUXMwD_ZZA7EJaxZBRfMDEvwd4Ghsj2vy9KCfj0R-yx2_K0Q@mail.gmail.com>
 <6a75c9f4-460f-f83e-7fe2-5a3a4c64232b@gmail.com>
 <20210306152001.GP2723601@casper.infradead.org>
From: Aditya <yashsri421@gmail.com>
Message-ID: <a4d42880-4a91-e5ca-5096-bef498481039@gmail.com>
Date: Sun, 7 Mar 2021 13:06:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210306152001.GP2723601@casper.infradead.org>
Content-Language: en-US
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
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

On 6/3/21 8:50 pm, Matthew Wilcox wrote:
> On Sat, Mar 06, 2021 at 01:18:38PM +0530, Aditya wrote:
>> On 6/3/21 11:55 am, Lukas Bulwahn wrote:
>>> I agree. That might be a suitable clean-up to keep the code for
>>> functions and struct/union parsing similar in style/spirit.
>>>
>>> Aditya, would you like to create a patch for that?
>>
>> Sure Lukas.
>> I have a doubt though, Can't we use a single expression separated by
>> "|" here, instead of multiple lines? i.e.,
>>
>> $x =~
>> s/__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)\s*//;
>>
>>
>> Probably we could do something similar for dump_function, i.e.,
>> -    $prototype =~ s/^static +//;
>> -    $prototype =~ s/^extern +//;
>> -    $prototype =~ s/^asmlinkage +//;
>> -    $prototype =~ s/^inline +//;
>> -    $prototype =~ s/^__inline__ +//;
>> -    $prototype =~ s/^__inline +//;
>> -    $prototype =~ s/^__always_inline +//;
>> -    $prototype =~ s/^noinline +//;
>>
>> +    $prototype =~
>> s/^(?:static|extern|asmlinkage|__?inline__?|__always_inline|noinline) +//;
>> And so on for other regexps.
>>
>> What do you think?
> 
> I think there's a tradeoff between speed / compactness and readability.
> As someone who doesn't know perl particularly well, I can look at the
> series of lines and say "Oh, it's stripping out these unwanted things".
> Your one line, while undoubtedly more efficient, is considerably less
> easy to understand.
> 
> Maybe there's another way to do it that's more efficient while not
> sacrificing the readability?
> 
> Also, would your suggestion work for 'static inline void foo(void)'?
> I think it needs to remove multiple occurrences of the things in the
> regex.  

Ah, I get it.

But maybe that's what the ?: on the beginning is for?
> 

No, "?:" is just to use this regex for matching, without capturing.
So, the regex will just remove any of those 'starting' occurrences,
consequently, "static inline" occurrence will probably not be removed.
I think the reason for using multiple lines for substitution in
dump_function is for the same reason, ie, subsequent substitution.

But for dump_struct, it is probably not desired, i.e., subsequent
substitution/removal. Also, for the same reason, using it with
dump_struct may cause unwelcomed discrepancies, or cause the user to
understand that here multiple substitutions are required, but is not so.
So, I think that we should use a single expression substitution for
dump_struct, at best. But am not sure if that is required, as
currently also we are not capturing this part of the regex, as well
as, matching only at certain position of the definition expression.

But I am curious to what others think about this.
Will be happy to work on this patch :)

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
