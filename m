Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45D1C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Oct 2023 21:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40F0B6132B;
	Sat, 28 Oct 2023 21:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40F0B6132B
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aJrmrOER
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKEXh1QTQ91U; Sat, 28 Oct 2023 21:26:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0BB2261324;
	Sat, 28 Oct 2023 21:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BB2261324
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1927C0071;
	Sat, 28 Oct 2023 21:26:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF8E6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 21:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3AE342E18
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 21:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3AE342E18
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aJrmrOER
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zl2GXa3StFwn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 21:26:30 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1B0F42E11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 21:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1B0F42E11
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1cc2b8deb23so2448315ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 14:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698528389; x=1699133189;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+3EhqydIk8cWL76gCn5A4FQeZ+oe6v5e7gK0rC5kDqw=;
 b=aJrmrOEROPMDZMs7XdQjnGt9BGs5Zx4U81rUDqkzStDycKXkyqlnl6VKMszmbwex2L
 YZ+aLYQAJOLxD/RyRMJEURnxnRkTNQQDRmBm/FbdVEFWOXpNbOMSyAK2IQCo+3Z/F0ED
 Xn7R/IX/CNknnnn1S3emhk84S+dia9Nlrg05zQeZeFgYz2Kt4r3iPprDQ7w5IGPN653u
 TYYMs7I+lf5hxCC/G5kKd3pvTaQRxja1YBVj/sVQ519uaYDh1q1Lc+vdsmyym8HiZWsq
 zgkJccxy3CgE/Wv6vpR7uLGcHRUMNBdVjdQ6RcYKCoDI6HK2HV7P7irUtrbGntSfhYCR
 J37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698528389; x=1699133189;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+3EhqydIk8cWL76gCn5A4FQeZ+oe6v5e7gK0rC5kDqw=;
 b=G+GbbKtXBBCTy4v0RP9pmNEd+Z0u/9PRz0kh72kshBWDQ5zRC+qy/AgzNIMhxae3yx
 wSIKsc8UgEtKS+OeUhDYXxh9jXirYFhkaY6zXksA6lvI03+Uq7yE03ItTubkDhbeAkzD
 Y3MZBsLSGPAJsyD4azRaSSTtG2BM6BiRReC5HH9rhILuNSlGSYd+Fxq19JjVJELfb4W/
 5VqNFjl6GkRn88Eb5Z3Dv8heK2HZ+CG4MpfXu6ZWR1aN94MUP+O8PniAwtjqgiQmqppV
 qp5NH1hKR6YtQt8KtwFuCvQ3l19K50++PH45OfDX7sYUI9p3vHGhaRRdZ9fKgv4kBomj
 WH9A==
X-Gm-Message-State: AOJu0Yw7s7rzXeCB6tVURH+Jcl8hzAqv831vPC56St/FAHKuY4lzhan7
 pGoGNrtEijVM4Cl5eCISGRY=
X-Google-Smtp-Source: AGHT+IFJhiYxmbbhG89wSadf2t17HGRHnSMUp97sHZ9VZIMeyKHjtgzwFKu3r2YhZVGlGZpMGdFmXQ==
X-Received: by 2002:a17:902:f213:b0:1c4:1cd3:8062 with SMTP id
 m19-20020a170902f21300b001c41cd38062mr6495445plc.2.1698528389175; 
 Sat, 28 Oct 2023 14:26:29 -0700 (PDT)
Received: from [192.168.0.152] ([103.75.161.209])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902c21100b001bbb8d5166bsm3607338pll.123.2023.10.28.14.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Oct 2023 14:26:28 -0700 (PDT)
Message-ID: <19cec6f0-e176-4bcc-95a0-9d6eb0261ed1@gmail.com>
Date: Sun, 29 Oct 2023 02:56:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fixing warning cast removes address space '__iomem' of
 expression
Content-Language: en-US
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 KY Srinivasan <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 Nischala Yelchuri <Nischala.Yelchuri@microsoft.com>
References: <20231024112832.737832-1-singhabhinav9051571833@gmail.com>
 <SN6PR2101MB16937C421EA9CDF373835360D7A3A@SN6PR2101MB1693.namprd21.prod.outlook.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <SN6PR2101MB16937C421EA9CDF373835360D7A3A@SN6PR2101MB1693.namprd21.prod.outlook.com>
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 10/29/23 01:40, Michael Kelley (LINUX) wrote:
> From: Abhinav Singh <singhabhinav9051571833@gmail.com> Sent: Tuesday, October 24, 2023 4:29 AM
>>
> 
> Subject lines usually have a prefix to indicate the area of the kernel
> the patch is for.   We're not always super consistent with the prefixes,
> but you can look at the commit log for a file to see what is
> typically used.  In this case, the prefix is usually "x86/hyperv:"
> 
>>
>> This patch fixes sparse complaining about the removal of __iomem address
>> space when casting the return value of this function ioremap_cache(...)
>> from `void __ioremap*` to `void*`.
> 
> Should avoid wording like "this patch" in commit messages.  See
> the commit message guidelines in the "Describe your changes"
> section of Documentation/process/submitting-patches.rst.  A
> better approach is to just state the problem:  "Sparse complains
> about the removal .....".  Then describe the fix.  Also avoid
> pronouns like "I" or "you".
> 
>>
>> I think there are two way of fixing it, first one is changing the
>> datatype of variable `ghcb_va` from `void*` to `void __iomem*` .
>> Second way of fixing it is using the memremap(...) which is
>> done in this patch.
>>
>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>> ---
>>   arch/x86/hyperv/hv_init.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
>> index 21556ad87f4b..c14161add274 100644
>> --- a/arch/x86/hyperv/hv_init.c
>> +++ b/arch/x86/hyperv/hv_init.c
>> @@ -70,7 +70,7 @@ static int hyperv_init_ghcb(void)
>>
>>   	/* Mask out vTOM bit. ioremap_cache() maps decrypted */
> 
> This comment mentions ioremap_cache().  Since you are changing
> to use memremap() instead, the comment should be updated to
> match.
> 
>>              ghcb_gpa &= ~ms_hyperv.shared_gpa_boundary;
>> -           ghcb_va = (void *)ioremap_cache(ghcb_gpa, HV_HYP_PAGE_SIZE);
>> +          ghcb_va = memremap(ghcb_gpa, HV_HYP_PAGE_SIZE, MEMREMAP_WB);
> 
> As noted in the comment, ioremap_cache() provides a mapping that
> accesses the memory as decrypted.  To be equivalent, the call to
> memremap() should include the MEMREMAP_DEC flag so that it
> also is assured of producing a decrypted mapping.
> 
> Also, corresponding to the current ioremap_cache() call here,
> there's an iounmap() call in hv_cpu_die().   To maintain proper
> pairing, that iounmap() call should be changed to memunmap().
> 
> It turns out there are other occurrences of this same pattern in
> Hyper-V specific code in the Linux kernel.  See hv_synic_enable_regs(),
> for example.Did "sparse" flag the same problem in those
> occurrences?

The particular warning msg for this case is like this "warning: cast 
removes address space '__iomem' of expression". I only saw these warning 
one time inside the arch/x86/ directory.

>It turns out that Nischala Yelchuri at Microsoft is
> concurrently working on fixing this occurrence as well as the
> others we know about in Hyper-V specific code.

So should I continue or not with this patch?

> 
> Michael
> 
>>
>> --
>> 2.39.2
> 

Thanks for taking out the time for reviewing this and giving the 
suggestions.

Thank You,
Abhinav Singh



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
