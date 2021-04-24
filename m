Return-Path: <SRS0=958C=JV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF477C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Apr 2021 11:57:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67B02611CB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Apr 2021 11:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67B02611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3051F843A4;
	Sat, 24 Apr 2021 11:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9wJfMSpiVpo; Sat, 24 Apr 2021 11:57:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2603D8438C;
	Sat, 24 Apr 2021 11:57:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0149EC000E;
	Sat, 24 Apr 2021 11:57:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF12DC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Apr 2021 11:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9398403C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Apr 2021 11:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHSIXTxjFPs3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Apr 2021 11:57:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C589A403A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Apr 2021 11:57:40 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 e8-20020a17090a7288b029014e51f5a6baso2573834pjg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Apr 2021 04:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1obLN2ZKP0a6DWoAypmeePpnDE55lbsbkQk2JOkaCSk=;
 b=HRurumi9Ig08GEqMevUwh9x1pdZ+Tc5efvmB7V5OVryoc2S942DNxWaqwG+zRO3wK1
 3NiewSlC31NchUoDxyenWjclG2fAZIYQMkq1p34frHEoiaP3XZsZOWceBWr1VeQtdqFF
 yMvDqTZUlN3Ei6nHxWB6uko4dPWcnR+jB+gyhsa7qs3GMHiwez8CavN8xvN/ifNsRfzA
 L7Ad6j1Q3EULz2CF47mPMe8hyx5GX3cfeFnzLIYZdCjqoFL25Ta6PNXSoGAFEzLEb8lt
 Wqsv/wi1s0gYkhF2IOEfjCgYWDcO5LcNNjzjXSKt9yM69xqq3q0/WG2XfjdVcpXC5pDD
 ZD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1obLN2ZKP0a6DWoAypmeePpnDE55lbsbkQk2JOkaCSk=;
 b=AnQt4zfEe11ntLzz7g92NFd93dwLmi94c7voJG5GtOSJ1ifqHqYnV3Z2W/6EvbUaDB
 WiptOpcFy+p7eZkSRsj3SQU0azs+GMOFQbD3a8obllODAO5kCVRbLtHb+SVhvXZwu/L3
 +lQFiJoSshU5OSlkvhm3QEchFA3Yull3WFK35QF4tBwMQTKLBbe6vrO5RMB5+iF5tWPh
 zAQKBhAfskTGdnLiYLaU3tM1/pdUWDLFm4p8ZbDEoCYr4gNxnHljkGsd0oB2FJX8XRYT
 ukJHsH+pBFeBg6/aJ06Nuvr94hIUHfZOEqfqVpj0mT4d4P0x/DXbOuNmVF1oZ2ftkzvG
 Dq2Q==
X-Gm-Message-State: AOAM533rQSlLRtdM3aV45FOVOw6I6wUtWcy2ssnBxzCXUbbmHIL1QIVb
 nhKXPUpgOMKw8LHLJTtrFIo=
X-Google-Smtp-Source: ABdhPJzOc524x4lR1bVjUOUQNmGWBNhq285gGf0/lJhTrxE8haEuCHcaBPoDETYQXzwxMRjXC70a+w==
X-Received: by 2002:a17:90b:e8b:: with SMTP id
 fv11mr9674312pjb.66.1619265460165; 
 Sat, 24 Apr 2021 04:57:40 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a089:2cc5:55e8:20f9:7536?
 ([2405:201:600d:a089:2cc5:55e8:20f9:7536])
 by smtp.gmail.com with ESMTPSA id 14sm6770579pfl.1.2021.04.24.04.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 04:57:39 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [RFC] scripts: kernel-doc: reduce repeated regex expressions into
 variables
To: Matthew Wilcox <willy@infradead.org>
References: <20210422191839.6119-1-yashsri421@gmail.com>
 <20210423132117.GB235567@casper.infradead.org>
Message-ID: <6f76ddcb-7076-4c91-9c4c-995002c4cb91@gmail.com>
Date: Sat, 24 Apr 2021 17:27:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210423132117.GB235567@casper.infradead.org>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net
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

On 23/4/21 6:51 pm, Matthew Wilcox wrote:
> On Fri, Apr 23, 2021 at 12:48:39AM +0530, Aditya Srivastava wrote:
>> +my $pointer_function = qr{([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)};
> 
> Is that a pointer-to-function?  Or as people who write C usually call it,
> a function pointer?  Wouldn't it be better to call it $function_pointer?
> 
Will do it.

>> @@ -1210,8 +1211,14 @@ sub dump_struct($$) {
>>      my $decl_type;
>>      my $members;
>>      my $type = qr{struct|union};
>> +    my $packed = qr{__packed};
>> +    my $aligned = qr{__aligned};
>> +    my $cacheline_aligned_in_smp = qr{____cacheline_aligned_in_smp};
>> +    my $cacheline_aligned = qr{____cacheline_aligned};
> 
> I don't think those four definitions actually simplify anything.
> 
>> +    my $attribute = qr{__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)}i;
> 
> ... whereas this one definitely does.
> 
>> -	$members =~ s/\s*__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)/ /gi;
>> -	$members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
>> -	$members =~ s/\s*__packed\s*/ /gos;
>> +	$members =~ s/\s*$attribute/ /gi;
>> +	$members =~ s/\s*$aligned\s*\([^;]*\)/ /gos;
> 
> Maybe put the \s*\([^;]*\) into $aligned?  Then it becomes a useful
> abstraction.

Actually, I had made these variables as they were repeated here and at
-    my $definition_body =
qr{\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*};
+    my $definition_body =
qr{\{(.*)\}(?:\s*(?:$packed|$aligned|$cacheline_aligned_in_smp|$cacheline_aligned|$attribute))*};

So, defining them at a place might help.

What do you think?

> 
>> -    } elsif ($prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>> -	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>> -	$prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
>> -	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+\s*)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/)  {
>> +    } elsif ($prototype =~ m/^()($name)\s*$prototype_end1/ ||
>> +	$prototype =~ m/^(\w+)\s+($name)\s*$prototype_end1/ ||
>> +	$prototype =~ m/^(\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
>> +	$prototype =~ m/^(\w+\s+\w+)\s+($name)\s*$prototype_end1/ ||
>> +	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
>> +	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end1/ ||
>> +	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
>> +	$prototype =~ m/^()($name)\s*$prototype_end2/ ||
>> +	$prototype =~ m/^(\w+)\s+($name)\s*$prototype_end2/ ||
>> +	$prototype =~ m/^(\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
>> +	$prototype =~ m/^(\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
>> +	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
>> +	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
>> +	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
>> +	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
>> +	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
>> +	$prototype =~ m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+\s*)\s*($name)\s*$prototype_end2/)  {
> 
> This is probably the best patch I've seen so far this year.
> 
> Now, can we go further?  For example:
> 	$prototype_end = $prototype_end1|$prototype_end2
> That would let us cut the number of lines here in half.
> > Can we create a definition for a variable number of \w and \s and '*'
> in the return type?  In fact, can we define a regex that matches a type?
> So this would become:
> 
>> +    } elsif ($prototype =~ m/^($type)\s*($name)\s*$prototype_end/) {
> 

I have been able to reduce these expressions furthermore. Will send a
v2 in few..

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
