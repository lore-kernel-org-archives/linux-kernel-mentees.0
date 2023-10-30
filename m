Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B9AC00144
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 00:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 927CC7094B;
	Mon, 30 Oct 2023 00:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 927CC7094B
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nUf647P5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3FQjAfczMbs; Mon, 30 Oct 2023 00:02:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8B90970657;
	Mon, 30 Oct 2023 00:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B90970657
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61673C0039;
	Mon, 30 Oct 2023 00:02:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63199C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 00:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3789370657
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 00:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3789370657
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dfui2HhJk0Yy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 00:02:36 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84EA47038D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 00:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84EA47038D
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1cc30bf9e22so9866885ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 17:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698624156; x=1699228956;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2PTmft0JlMHLfMqnzsQ/EQfttlgxRD47/P/YZu8JPJY=;
 b=nUf647P5ESSSzSZY8FGpnJx0zG6VefpyJVWF2BbtLRthbjc5H8yUjicQd025QZfoCE
 kM7EIg7xZoZAyxmDWRDla9GDjbRQNPjublKS/wSlOl5wd31z586ihG+3nrd1G13GMmCt
 6G+dkOD3GWcosUN4g+FPsgWNuDPVNuw2ovTjmI48+hLx3uqyj52jDjuqvTUek7jkxDHJ
 YFGgdB0lR2pRm1sXO0IaJWYHOzdAYLJedy7a7jec264RaWWH/XEr0pVC6O/3ZH/Qemxv
 ODKn8/DoXOrzsfuVergaYE7eZo12XlGce1oXSHlA/+hytnjso5POkWbk7qkAwwNuXHpC
 yURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698624156; x=1699228956;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2PTmft0JlMHLfMqnzsQ/EQfttlgxRD47/P/YZu8JPJY=;
 b=AWZNoHt9gb2TFPZauCGM73rf0OHrYa9/+x5QxaOJpPMIPWwlv+f1TkgzD6HfPzDPW+
 5D9l51BH0ZKdRKBgL6lF1lRC+mPY321tDDnulc9ZfXL5UWioLsHt4orVGIyCDlogNHxo
 eqZ8+kZvKrkHjvf9PrbpJFLlKozJdR/kGY8HM+zUIxi+doLS8NSNgD8epHesGnYobAcg
 RbfdEYPirZnLZ6wPBWsRfPCRanUpOKLnmDFuknEqTaer9JJcPnWXRQRz5oMPrI+bsQ+t
 JMmxhoKnKJb++95Bzf6YK/3mTwyHQT4WaFVV8r9OqZR7+Y/VineHuWe5GFe15pftlYHN
 ybcw==
X-Gm-Message-State: AOJu0YyN354KIo6ebqRMFVEBp1IsVnXMgyPuvtrtm90BZpvb+lq+T3zw
 VdgJX4plqBJ3yaoGLZB7F1I=
X-Google-Smtp-Source: AGHT+IGVJwzMgaVnk2ohcb8d0cpNEFNBQ4prSyD76h7ze5Iu0tN6vL97hDVtvuBcunoMhCxAkxz15g==
X-Received: by 2002:a17:902:e543:b0:1c9:ddd8:9950 with SMTP id
 n3-20020a170902e54300b001c9ddd89950mr10633604plf.21.1698624155841; 
 Sun, 29 Oct 2023 17:02:35 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp.
 [106.167.171.201]) by smtp.gmail.com with ESMTPSA id
 u2-20020a1709026e0200b001c625acfed0sm5145703plk.44.2023.10.29.17.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Oct 2023 17:02:35 -0700 (PDT)
Message-ID: <645ffbbc-8b33-4a93-94b6-6487e31c7f4b@gmail.com>
Date: Mon, 30 Oct 2023 09:02:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: corbet@lwn.net
References: <87a5s15mm5.fsf@meer.lwn.net>
Subject: Re: [PATCH] scripts/kernel-doc: fix make htmldoc warning
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87a5s15mm5.fsf@meer.lwn.net>
Cc: swarupkotikalapudi@gmail.com, Akira Yokosawa <akiyks@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, yujie.liu@intel.com,
 linux-doc@vger.kernel.org
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

Hi,

On Date: Sun, 29 Oct 2023 12:06:58 -0600, Jonathan Corbet wrote:
> Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com> writes:
> 
>> make htmldocs has below warnings:
>>
>> ..
>> Variable length lookbehind is experimental in regex;
>> marked by <-- HERE in m/(?<=^|\s)-Werror(?=$|\s)
>> <-- HERE / at ./scripts/kernel-doc line 188.
>> ...
> 
> So how do you get this warning?  I've not seen it.  Which version of
> Perl? 

I get this warning on Ubuntu 22.04LTS, whose perl is v5.34.0.

Swarup's change silences the warning there.

I could provide a tested-by: tag if I was familiar with that
"variable length lookbehind" thing ...

        Thanks, Akira

> 
>> "-Werror" option in make command,
>> needs "-Werror" to have space before
>> and after while running make command,
>> hence space checking is sepratly done,
>> and is not part of lookbehind regular expression.
>>
>> Below command also didn't
>> show any error:
>>  make KCFLAGS="-Werror=return-type" W=1 kernel/fork.o
>>
>> Fixes: 91f950e8b9d8 ("scripts/kernel-doc: match -Werror flag strictly")
>> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
>> ---
>>  scripts/kernel-doc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
>> index d660e1f4b483..aa9e3e198d12 100755
>> --- a/scripts/kernel-doc
>> +++ b/scripts/kernel-doc
>> @@ -185,7 +185,7 @@ if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
>>  if (defined($ENV{'KCFLAGS'})) {
>>  	my $kcflags = "$ENV{'KCFLAGS'}";
>>  
>> -	if ($kcflags =~ /(?<=^|\s)-Werror(?=$|\s)/) {
>> +	if ($kcflags =~ /(?<=^|)(\s)-Werror(?=$|)(\s)/) {
>>  		$Werror = 1;
>>  	}
>>  }
> 
> Thanks,
> 
> jon

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
