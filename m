Return-Path: <SRS0=yQZp=EE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0152CC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 15:03:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D33D20759
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 15:03:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwkCfRp7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D33D20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AAEE8875EB;
	Thu, 29 Oct 2020 15:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZClGy-bdFx4N; Thu, 29 Oct 2020 15:03:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 16272875E5;
	Thu, 29 Oct 2020 15:03:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F228CC0859;
	Thu, 29 Oct 2020 15:03:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 733ABC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 15:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5FDB9875E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 15:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Isfvhn7Kfrgg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 15:03:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 01BE0875E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 15:03:39 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w65so2565394pfd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 08:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yeacpbfY2n/PWtupMaTkajDX0M/SWTXv73vwdUfOass=;
 b=dwkCfRp7mdiGnZWadpew88hHAgPDgTbB2mCHZARnQFJ7pXmx3HnotQxsu6iU4QIbtg
 eoCUk+TgpeGjZSe77iVKWqqWdo/lM2Bw4XxlSAVY8PcVBqSLYiDAQqpEF+Rdk9sf8IEB
 1kqUHlz/Ykpw9qr4nbDWbiYwMKyEbapu0SbaH+DW5yxNtYtoQPsjG1bysUGEj+Iu3yQZ
 Z01zWaP2wlEREB6U9OnZpq1PeCb8hZTC9PlZDL8KU7dnojz/Su7Of+1nH6RtF20jVWgF
 V01boCrNjlLUpCjnHTr+2Lys3SrKrYjsaJsn0cI4TnC0N+2jcIoL598A0fmcsVAk7FbQ
 QMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yeacpbfY2n/PWtupMaTkajDX0M/SWTXv73vwdUfOass=;
 b=UK/CsIoXXYGMBx05kM78Xk+HLFiaCiDorcwJVXH2i4gLafKvFb6/zUUlmDFmTAs7qR
 uDz6nOP8ROrWR/ssBjgodH00YTNMhHe2WgtQbzERcLhaRKiqzFWYCx+FfArS12NrpyIe
 WuIJTWqclUL7FnWCH8NruHehvjLVmv/eP/2O4k6tjQcYdmOUCmpaeTdXeQE8ygBKGHss
 udHZuwM4lF3XeIm+jCZxsKQcSUH8OodX34dfekxdmudi2KnLN2vGt5iBH22JFdsHGtNc
 2FxL/Mzk/IPX7qHuwFgWU8ChLnAMug3MQhdni2imEjKLi+Tt8PRt8qhNKKVPUMz0yc62
 nuIw==
X-Gm-Message-State: AOAM533eK1RzUGlV3RmI5Fc6aXs2kxPNbW/qKoPSEpiDGJ7ZtP0mhTXG
 TWFWbfVCvCCH0Hfp0/XrhdB8W3VpX3EpeQ==
X-Google-Smtp-Source: ABdhPJyjLZYPwIcNHj0mXGSqEGyFjHe/Dj6wu0U3fjr/gyLYkZ/MUtcEEgPRfP5qUSnJmL+Hcj1aIQ==
X-Received: by 2002:a17:90a:6901:: with SMTP id
 r1mr228380pjj.178.1603983819227; 
 Thu, 29 Oct 2020 08:03:39 -0700 (PDT)
Received: from ?IPv6:2402:3a80:40e:9d64:dca2:d22c:e8e:bf29?
 ([2402:3a80:40e:9d64:dca2:d22c:e8e:bf29])
 by smtp.gmail.com with ESMTPSA id b1sm3150498pft.127.2020.10.29.08.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 08:03:38 -0700 (PDT)
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
References: <20201028152501.106117-1-dwaipayanray1@gmail.com>
 <CABJPP5CkzaQ8x+b8UYZCLwXC1WaZL6+rpkespV684zkPAeJXrA@mail.gmail.com>
 <alpine.DEB.2.21.2010281659160.13040@felia>
 <b66e212e-ce43-3284-e3c1-8882412a3961@gmail.com>
 <CABJPP5Ai3aEH9YLGdEujq_XDeGDFHNv3pxUvtdS83i=YcNJJKQ@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <752a8d52-e597-5dc6-4848-e6a0640030b8@gmail.com>
Date: Thu, 29 Oct 2020 20:33:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CABJPP5Ai3aEH9YLGdEujq_XDeGDFHNv3pxUvtdS83i=YcNJJKQ@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: improve handling
	of email comments
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

On 28/10/20 10:08 pm, Dwaipayan Ray wrote:
>>> Aditya, can you help us here with evaluation?
>>>
>>> E.g., Dwaipayan takes from v5.4 into the future, e.g., until v5.8/v5.9 or
>>> so.
>>>
>>> Aditya, you could then check e.g., v5.0..v5.4, so v5.4 down to the past as
>>> far as your computer and scripts handles within roughly half a day...
>>>
>>> An evaluation on 100,000 commits is certainly a good basis.
>>>
>>> Of course, every mentorship candidate can join here as well and show off
>>> their own evaluation script.
>>>
>>> Lukas
>>>
>>
>> Sure, would love to help.
>> Just to clear, I have to apply this patch over my last patch right? Or
>> do I need to apply any more patch before it?
>>
> 
> Thanks Aditya.
> 
> I think you can apply the patch directly on the latest official tree.
> 
> The patch is here:
> https://lore.kernel.org/linux-kernel-mentees/20201028152501.106117-1-dwaipayanray1@gmail.com/
> 
> Regards,
> Dwaipayan.
> 

Hi Dwaipayan,
I have generated reports on v5.0..v5.4.

Relative change in warnings/errors before/after your patch:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task4/relative_summary/summary_relative.txt

Dropped warnings:
https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task4/relative_summary/dropped_warnings

There may be some discrepancies due to multi-threading. But it should
give us a rough idea.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
