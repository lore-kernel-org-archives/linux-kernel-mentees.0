Return-Path: <SRS0=Yqm+=IE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4F7C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Mar 2021 07:48:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7431364E2E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Mar 2021 07:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7431364E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E15443016;
	Sat,  6 Mar 2021 07:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id taB-pZfvIgc5; Sat,  6 Mar 2021 07:48:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50D83414E0;
	Sat,  6 Mar 2021 07:48:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 318E7C000B;
	Sat,  6 Mar 2021 07:48:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42171C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 07:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22E81842EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 07:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQcHeX9c2Bos
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 07:48:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D36C8424C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 07:48:46 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d11so2543040plo.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Mar 2021 23:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DSZXu94+R555WhtuFMRch+eV8hmVBvr/x43d2hheJJc=;
 b=VluraUHuZsIPa2k+Kvj6GH7BSkPT41eqr4M/CQ/PUSvCotnYQfO6dOYS7/3E6EecX2
 2+MnYrBdCyZRgy4So3JceeAQkU/QAp5BVIV74Lefs08LkPlmCV5ZdKJreID3r/1VeepX
 q3McCPKRMX8szQ0hAEX13XyB7Z6raB0oihzyt7ukQ23MDkt5uzxTnXfexj4ogbw20IFC
 bQNvhn0GKIv4RtUmsgauvLn4+PnLWHrk5RjHRBfv5Xofv1r8w88hhM4ZWZoxZkong2DQ
 e5v4d5dAUmMeZQyHpOeCU5apI0HruD/KYJyLElAZXp72x7+ifWCkAtMcmOuVZ3CKAGvf
 n/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DSZXu94+R555WhtuFMRch+eV8hmVBvr/x43d2hheJJc=;
 b=l7sMyWgUlT/UFX7BvTGcWlTz3qbzQjUhCQqeUmNzOOpyK6E3dy1o6TMIj8y3vyeiQX
 WBjNpP+eKsJHu00lKlyDzAAxtA5DFiXCFh82s5gokk6c3XiloyBIXHA2fbAwR1gEJPCq
 Y3nDcvacDGLqNhPTdWanjgpgS9Xoubu7Y5doSMDEqLuaf1amB2wDZeYKaua9bjMnOGm1
 NbGj4h0Aw2Vb48bBPgv0MxsaRgnS5btY2lMhpkIFGNszQEY+k+CXHtadZbLONsJljgsJ
 ypor8RXTytmsWP0/hTl7wzBDcd17YCjCGrHZF5uIoQZxVi4SdQ2jHYkg9rcPyjhEt2iz
 zM9A==
X-Gm-Message-State: AOAM533997l8UtXQtUh5lvL7AT4XlXYADNmH8eMuo3v1sSoH2o3vsB7I
 uX7QXYi++n2uZo74YlFqEXkffaOUvMTCtw==
X-Google-Smtp-Source: ABdhPJx9oouAzAWFEXuhiUUwFZmuNk93Mo4/2GAEE/laT9yMPbZYkKWgCky8dE7eqgyhymy47DspLw==
X-Received: by 2002:a17:902:b7cb:b029:e4:55cd:ddf0 with SMTP id
 v11-20020a170902b7cbb02900e455cdddf0mr11953507plz.45.1615016925270; 
 Fri, 05 Mar 2021 23:48:45 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:2cbb:f743:ffa5:41bc?
 ([2405:201:600d:a089:2cbb:f743:ffa5:41bc])
 by smtp.gmail.com with ESMTPSA id x23sm4452314pff.133.2021.03.05.23.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 23:48:44 -0800 (PST)
Subject: Re: [RFC v3] scripts: kernel-doc: fix typedef support for
 struct/union parsing
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
References: <CAKXUXMzHPnM=ie06ZGuFXyJ7RcRjYomjyASbp3ND9-Mb2Es+2w@mail.gmail.com>
 <20210225145033.11431-1-yashsri421@gmail.com>
 <20210306043548.GO2723601@casper.infradead.org>
 <CAKXUXMwD_ZZA7EJaxZBRfMDEvwd4Ghsj2vy9KCfj0R-yx2_K0Q@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <6a75c9f4-460f-f83e-7fe2-5a3a4c64232b@gmail.com>
Date: Sat, 6 Mar 2021 13:18:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMwD_ZZA7EJaxZBRfMDEvwd4Ghsj2vy9KCfj0R-yx2_K0Q@mail.gmail.com>
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

On 6/3/21 11:55 am, Lukas Bulwahn wrote:
> On Sat, Mar 6, 2021 at 5:35 AM Matthew Wilcox <willy@infradead.org> wrote:
>>
>> On Thu, Feb 25, 2021 at 08:20:33PM +0530, Aditya Srivastava wrote:
>>> +++ b/scripts/kernel-doc
>>> @@ -1201,12 +1201,23 @@ sub dump_union($$) {
>>>  sub dump_struct($$) {
>>>      my $x = shift;
>>>      my $file = shift;
>>> +    my $decl_type;
>>> +    my $members;
>>> +    my $type = qr{struct|union};
>>> +    # For capturing struct/union definition body, i.e. "{members*}qualifiers*"
>>> +    my $definition_body = qr{\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*};
>>> -    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
>>> -     my $decl_type = $1;
>>> +    if ($x =~ /($type)\s+(\w+)\s*$definition_body/) {
>>> +     $decl_type = $1;
>>>       $declaration_name = $2;
>>> -     my $members = $3;
>>> +     $members = $3;
>>> +    } elsif ($x =~ /typedef\s+($type)\s*$definition_body\s*(\w+)\s*;/) {
>>> +     $decl_type = $1;
>>> +     $declaration_name = $3;
>>> +     $members = $2;
>>> +    }
>>
>> In the same spirit as dump_function, would something like this work?
>>
> 
> I agree. That might be a suitable clean-up to keep the code for
> functions and struct/union parsing similar in style/spirit.
> 
> Aditya, would you like to create a patch for that?
> 

Sure Lukas.
I have a doubt though, Can't we use a single expression separated by
"|" here, instead of multiple lines? i.e.,

$x =~
s/__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)\s*//;


Probably we could do something similar for dump_function, i.e.,
-    $prototype =~ s/^static +//;
-    $prototype =~ s/^extern +//;
-    $prototype =~ s/^asmlinkage +//;
-    $prototype =~ s/^inline +//;
-    $prototype =~ s/^__inline__ +//;
-    $prototype =~ s/^__inline +//;
-    $prototype =~ s/^__always_inline +//;
-    $prototype =~ s/^noinline +//;

+    $prototype =~
s/^(?:static|extern|asmlinkage|__?inline__?|__always_inline|noinline) +//;
And so on for other regexps.

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
