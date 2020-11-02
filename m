Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274FBC4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 13:31:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C1FB2054F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 13:31:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o92Hurbm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C1FB2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D202C20459;
	Mon,  2 Nov 2020 13:31:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tN1OAHSbgjT0; Mon,  2 Nov 2020 13:31:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9E5D8203F4;
	Mon,  2 Nov 2020 13:31:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 947BFC088B;
	Mon,  2 Nov 2020 13:31:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C885C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 13:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3B708871B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 13:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DM97yktP2C9x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 13:31:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8309F871B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 13:31:14 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 10so11126906pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 05:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qsyqL6gisfl01oj5qq7IaTy1MmLybqVqoA1VRG/RaQo=;
 b=o92HurbmAF2SXnL9rNcuDhJS6XQiSzmRxnscsvGd2lpfeH0INeC+zWm/M5Zpv9wR45
 sSU2I0efEUgPvhZJtM4UMLRhgjvTe4OjlVCkuHHtdh+KrC5ZEaCr2fI+JBQDjxOv5E98
 IOcyx+h3o8A81VWfl0xAO9k0v4CMrQz634BVVBrxDL0PM8o1QzMj7Tr5f77xyMu5W2Ff
 6RHcKod0HcrcOXst/pCl2OJScG59Xkc4DMORWlntJ63hm63Uu/oBxY8YGH6N7+qMJ+s8
 RiWkJpmiuen8sOUVDo6BpB1qc4cHUQT1UlBncimOdQSesCZSSwz08LeHKn9GFmmIYu6J
 /hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qsyqL6gisfl01oj5qq7IaTy1MmLybqVqoA1VRG/RaQo=;
 b=QXeWYX9JQIsf3ewBE5ijaw4HXfaCPtT/UNsDGaNM9E//w1Ut8uSBW/zQ+OfjjZurIC
 Gzgt0bRfc4+vVHMditosc3k7JGo79ygzwfWotu2vnZDtuA1CKmOw5UdXOheQOFKeqod8
 RGaBkW0v+sDgeqCIzgQ/xRX1CG9efOlxQskgaan9Yk74BZxhBToaHQFS6+EXukeNBeSn
 yG9UGcFi7d0MieVJEcfyUlIsXBjBaSAT6FOFY1bmpqx5ModUIJaqwClbZSygEQhFIjjQ
 Xu/HHHI9KKVujvRP2ZxTBWJ7SaKsIFPBoM42iI1LNml/ykRfGf2c7fgSvRAzePdEf502
 MqEQ==
X-Gm-Message-State: AOAM531VAfWlL7SiVbdABO7oYJUY7EyzGn/uo8BujQINqdKfpDrlwhm2
 VTdAdLBsXMK4XNBdTftiNs4cwXFjeX27vA==
X-Google-Smtp-Source: ABdhPJzzo0mDIT8w6vLYm1CaAnVyBOzPM42u6A0By3vjIHfaCsCgg4vcM+UIGlsjs3xr2fZe5NnLyQ==
X-Received: by 2002:a17:90a:a4c6:: with SMTP id
 l6mr6539762pjw.91.1604323873699; 
 Mon, 02 Nov 2020 05:31:13 -0800 (PST)
Received: from ?IPv6:2402:3a80:433:ab23:cf2:3723:5ad5:55a4?
 ([2402:3a80:433:ab23:cf2:3723:5ad5:55a4])
 by smtp.gmail.com with ESMTPSA id 16sm13127682pjf.36.2020.11.02.05.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 05:31:13 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201031132556.10379-1-yashsri421@gmail.com>
 <alpine.DEB.2.21.2011020808040.11801@felia>
From: Aditya <yashsri421@gmail.com>
Message-ID: <0c7aec7d-3ec6-882f-062f-3b7683f8b594@gmail.com>
Date: Mon, 2 Nov 2020 19:01:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011020808040.11801@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	COMMIT_LOG_LONG_LINE
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

On 2/11/20 12:55 pm, Lukas Bulwahn wrote:
> 
> 
> On Sat, 31 Oct 2020, Aditya Srivastava wrote:
> 
>> Currently, if a line exceeds 75 characters in a commit message,
>> checkpatch.pl gives a warning corresponding to the same.
>>
>> E.g., running checkpatch on commit a1af2afbd244 ("drm/nouveau/volt:Fix
>> for some cards having 0 maximum voltage") reports this warning:
>>
>> WARNING: Possible unwrapped commit description (prefer a maximum 75
>> chars per line)
>>
>> Some, mostly Fermi, vbioses appear to have zero max voltage. That causes Nouveau to not parse voltage entries, thus users not being able to set higher clocks.
>>
>> Fix this warning by truncating the line after 75 chars, and push the
>> remaining content to the next line
>>
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> 
> This is wrong on multiple levels:
> 
> 1. We must first ensure that the COMMIT_LOG_LONG_LINE are actually 
> largely true positives, i.e., it really makes sense to break those lines. 
> In my evaluations, I found many cases where it is clear that lines should 
> not be broken because it is tool output etc.
> 
> 2. You cannot just break at character 75. You would need to identify word 
> boundaries and break there.
> 
> 3. The proper fix is to identify the whole paragraph and then word-wrap 
> the whole paragraph with a limit of 75. Just adding some content in a new 
> line will make the commit message even more unreadable than before. So, 
> that is not a fix.
> 
> 
> So, I suggest to come up with a good strategy to really identify 
> COMMIT_LOG_LONG_LINE that sensibly can be word-wrapped, i.e.,
> distinguish between free-floating commit description and tool output,
> and then implement that word wrap properly.
> 
> Or to prioritize another issue and possiblity for fix rules.
> 
> You can see that there are potentially some good options for fixes around 
> the tags and sign-offs Dwaipayan has investigated.
> 

I agree. I'll take it up again after sometime.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
