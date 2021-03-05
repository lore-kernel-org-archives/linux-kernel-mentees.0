Return-Path: <SRS0=DOtU=ID=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826BCC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Mar 2021 19:39:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A81A65009
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Mar 2021 19:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A81A65009
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE1EB83A54;
	Fri,  5 Mar 2021 19:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N2SuajTWpW_y; Fri,  5 Mar 2021 19:39:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED8CA842DE;
	Fri,  5 Mar 2021 19:38:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C504EC000A;
	Fri,  5 Mar 2021 19:38:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D46C8C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Mar 2021 19:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6781605FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Mar 2021 19:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w9EIbZ11NQXx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Mar 2021 19:38:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17F57600C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Mar 2021 19:38:58 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id p21so2057918pgl.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Mar 2021 11:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qAJgbNw9KBqNioDnptWCHAlDfIWtd5u8+ZRDe39se/w=;
 b=BoJ5pB1gsmBYyhYj6uXrjMiM/HZVJKlQ3H2cdr7ls3HPILovWa4gmUYX5CHtDqqpzz
 JO9Px+5oacSMkKj1TBCvgRttIvpKSLHD3PIYNFU8rJZWm2jp6lZkp2jt1BA5dLjuqgsA
 MUrtdTuVjvfbU1SDZZW8xOHrBqoBIAj15P24+3f+MkIvYKnPPQ2S06rBOZTNpqLwXLHF
 iuykssBPu0zMvBNJwTAHrNUsmfOX+kBWdmYAU5JTm/Gx/T6cWNL30hOjlm8l981vOvww
 FosprjLZ1CJYjMUtfyYnw+46PZkBK8XSl5Z43ho5WESW26llmU5NtfUEstASOPofayA8
 gxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qAJgbNw9KBqNioDnptWCHAlDfIWtd5u8+ZRDe39se/w=;
 b=sPN1pQuE+mlPOqOpGvsfmR9bkqQg9OPmvZblSULSUlfJC2lWVmgJybXISH/+d2kiVC
 vUSir0gatJ7anoQ1zEZs56F3NnKnj1lvZ8YdAy4eiGQquzkFbreoROQygi7DbzoOEc/7
 OfjzCUd/e04NVsL9JwH0s1PU5F5G0mC9CywzepW8OtvGbIxCNIgH3vLeYHfgG7Ofx8yU
 tra281pi2xefGACf2tp/CmENChSVLRcNrmPLZSmmwOAUIsNBDi4UWWVlu4rakD+JlFmg
 +GC8vADKC/YYe5Ttng+LPsLAkNKmTk9MKHtfQmVuCQfBUvw70YF5fIhEBg5dFnDDb9kw
 0v5g==
X-Gm-Message-State: AOAM531+mX/KKyx9mo3POVLSzMKwrm/mRN7kb3TE4AEWocF70+uwGuMd
 0VFIWY+ZysGJucm1HXsVCJsBb5CDz8C56w==
X-Google-Smtp-Source: ABdhPJyxrxQRE8Hql05EoHrzeYX0bTCaIz+xT1bVtCRehDR1Cbi5fj5I7E+a27xt0AB8zVohEhteBA==
X-Received: by 2002:a05:6a00:1a01:b029:1da:a7ee:438f with SMTP id
 g1-20020a056a001a01b02901daa7ee438fmr10643151pfv.77.1614973137167; 
 Fri, 05 Mar 2021 11:38:57 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:58af:ffb4:5a90:f2bc?
 ([2405:201:600d:a089:58af:ffb4:5a90:f2bc])
 by smtp.gmail.com with ESMTPSA id i22sm3108234pjz.56.2021.03.05.11.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 11:38:56 -0800 (PST)
Subject: Re: [RFC] scripts: kernel-doc: fix attribute capture in function
 parsing
To: Matthew Wilcox <willy@infradead.org>
References: <20210305182000.8363-1-yashsri421@gmail.com>
 <20210305184322.GN2723601@casper.infradead.org>
From: Aditya <yashsri421@gmail.com>
Message-ID: <bcd38964-bfff-99c2-eb24-1942836e9526@gmail.com>
Date: Sat, 6 Mar 2021 01:08:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305184322.GN2723601@casper.infradead.org>
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

On 6/3/21 12:13 am, Matthew Wilcox wrote:
> On Fri, Mar 05, 2021 at 11:50:00PM +0530, Aditya Srivastava wrote:
>> Provide a simple fix by adding "__attribute_const__" in the corresponding
>> regex expression.
>>
>> A quick evaluation by running 'kernel-doc -none' on kernel-tree reveals
>> that no additional warning or error has been added or removed by the fix.
> 
> I'm no perlmonger, but why isn't this simply:
> 
> +++ b/scripts/kernel-doc
> @@ -1753,6 +1753,7 @@ sub dump_function($$) {
>      $prototype =~ s/^__inline +//;
>      $prototype =~ s/^__always_inline +//;
>      $prototype =~ s/^noinline +//;
> +    $prototype =~ s/__attribute_const__ +//;
>      $prototype =~ s/__init +//;
>      $prototype =~ s/__init_or_module +//;
>      $prototype =~ s/__meminit +//;
> 
> (completely untested)
> 
>> +++ b/scripts/kernel-doc
>> @@ -1753,6 +1753,7 @@ sub dump_function($$) {
>>      my $prototype = shift;
>>      my $file = shift;
>>      my $noret = 0;
>> +    my $attribute_const = qr{__attribute_const__};
>>  
>>      print_lineno($new_start_line);
>>  
>> @@ -1808,7 +1809,7 @@ sub dump_function($$) {
>>  	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>>  	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>>  	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>> -	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>> +	$prototype =~ m/^(\w+\s+\w+\s*\*+$attribute_const?)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>>  	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>>  	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>>  	$prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||

Hi Matthew
You are correct, it should be placed there. I was considering it as a
return type instead.
I'll send a modified v2 with the changes.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
