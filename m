Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FADC00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 08:31:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19D1A2075E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 08:31:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="veNOTKo/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19D1A2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 65DFE86821;
	Fri, 30 Oct 2020 08:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CY-m5RFvedyz; Fri, 30 Oct 2020 08:31:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D17A8681D;
	Fri, 30 Oct 2020 08:31:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7EE76C0893;
	Fri, 30 Oct 2020 08:31:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FA78C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 08:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 030E22049E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 08:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BtjGEOlo-WB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 08:31:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 07D6D20033
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 08:31:39 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id h6so4597108pgk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K+jppZ6mRpSsYhVy5c19fM5pwcuDnUCTBHtgxz3NZs4=;
 b=veNOTKo/uu7iu0mcz7QHrny9rppQN/SA31Ezk4kc+lCI8uvkFfpjPd3EY4PByJb/QJ
 3P7lo1LZvYE/j/YfrOQcdO7NaNp5Ku+7abqkB6dp90WztGUi8wYZ3OqDq6iHsqHCwz23
 kCdsk8P/We/tBcpIrmlwXxvsEtaBTUdAKN25y2r34iFgP8L6LP769iox10Y7l421Mwkg
 H/dSnjDVu6gkTkQpnbOzmvKBkGD+ZOgPPs5sU0M6Y4ogS+F01vTS8H5CqJGPQRrtxsz0
 0NQcvY/LV3gfhW6SDrsyOVfIvdFQa0cZwiq+f21CES0dg612zhEscEZggNCsiYZkVjOK
 CaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K+jppZ6mRpSsYhVy5c19fM5pwcuDnUCTBHtgxz3NZs4=;
 b=qvJNdEkK0InsvM7hQrmze8+OJEpHpToj2jjeLo+2WiTmwdWXlGIfPda0z+VSsanN0s
 jzyBYqGTaQ8GaQc6QR7A5+0fNwiqMuOw/ji++S19n166PxgboivCzhc76V3FBuW7L3FF
 sMAeyF4BnagyzyRd35glP4o3AQQH0RCTvjkR2hEuh58ADdwph4LyY8PN7mM4sLUrfCLD
 GwSUpFYUyWAmJ/gbC4DlDy1louQh2c5vDbH0CfBeqU4NOfi3jJJr4hISnhphFpj5b4yQ
 v6d6AIepyyaOHnru5Zm4C27No6YWAsVLHdsu6utkJUJnUoRkqgKu5nIeOrbJpCyuxoJl
 iZzw==
X-Gm-Message-State: AOAM5325/WdLKb1tiCCeqs8E1aFl4uTXaHWhhAxGpQ49Z16cfr/X5TnQ
 83LcPBRoI55oajaUH5fuGhDtwSUH7fuhug==
X-Google-Smtp-Source: ABdhPJx+kpG5MJtiLx5Hc0iSaqn8SdCNRzV/Ob/cymsIV6Rxy+74iSkXfYL4sl0otoWyAXekA4X2Kg==
X-Received: by 2002:a17:90b:438c:: with SMTP id
 in12mr1622849pjb.170.1604046698237; 
 Fri, 30 Oct 2020 01:31:38 -0700 (PDT)
Received: from ?IPv6:2402:3a80:43d:9a7f:2d51:fcbb:1c2a:666a?
 ([2402:3a80:43d:9a7f:2d51:fcbb:1c2a:666a])
 by smtp.gmail.com with ESMTPSA id a4sm5200486pfa.65.2020.10.30.01.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 01:31:37 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
References: <20201028152501.106117-1-dwaipayanray1@gmail.com>
 <CABJPP5CkzaQ8x+b8UYZCLwXC1WaZL6+rpkespV684zkPAeJXrA@mail.gmail.com>
 <alpine.DEB.2.21.2010281659160.13040@felia>
 <b66e212e-ce43-3284-e3c1-8882412a3961@gmail.com>
 <CABJPP5Ai3aEH9YLGdEujq_XDeGDFHNv3pxUvtdS83i=YcNJJKQ@mail.gmail.com>
 <752a8d52-e597-5dc6-4848-e6a0640030b8@gmail.com>
 <CABJPP5CWehE68jJVo5MUha0VxMVvV86pNCOB2w5-gsyWA9g8MA@mail.gmail.com>
 <CABJPP5AmE1QVMonmvz7TZrEmEqXvd+LUmKzV7Wd5X-2rz8jOHg@mail.gmail.com>
 <CAKXUXMxE6e6NpkYBwB1UtBHvx=s2mANzGcTRr-MGW34HNjRQAQ@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <e49b5562-b712-e56a-1ef7-5a06309d2845@gmail.com>
Date: Fri, 30 Oct 2020 14:01:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxE6e6NpkYBwB1UtBHvx=s2mANzGcTRr-MGW34HNjRQAQ@mail.gmail.com>
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

On 30/10/20 11:00 am, Lukas Bulwahn wrote:
> On Thu, Oct 29, 2020 at 8:43 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>
>> On Thu, Oct 29, 2020 at 9:17 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>>
>>>>
>>>> Hi Dwaipayan,
>>>> I have generated reports on v5.0..v5.4.
>>>>
>>>> Relative change in warnings/errors before/after your patch:
>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task4/relative_summary/summary_relative.txt
>>>>
>>>> Dropped warnings:
>>>> https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task4/relative_summary/dropped_warnings
>>>>
>>>> There may be some discrepancies due to multi-threading. But it should
>>>> give us a rough idea.
>>>>
>>>
>>> Thanks Aditya.
>>>
>>> Seems like 763 false positives were resolved successfully.
>>> So I guess the patch is working as intended.
>>>
>>> My evaluation is currently running and might need a few
>>> hours more. I will share it once it completes.
>>>
>>
>> The summary of the analysis is as follows:
>>
>> Commits checked: 47, 377 from v 5.4
>>
>> Before the patch:
>> BAD_SIGN_OFF: 1516
>> FROM_SIGN_OFF_MISMATCH: 931
>> NO_AUTHOR_SIGN_OFF: 54
>>
>> After the patch:
>> BAD_SIGN_OFF: 756
>> FROM_SIGN_OFF_MISMATCH: 898
>> NO_AUTHOR_SIGN_OFF: 54
>>
>> A total of 793 false positives were resolved.
>>
>> I think this patch does the job.
>> Lukas, what do you think?
>>
> 
> Agree. The numbers and my quick spot checks suggest it is a good fix
> to get merged.
> 
> Update the commit message to provide the overall summary of the two
> evaluations (by adding them up for the combined git range) and send
> the patch to Joe for a quick check.
> 
> By the way, I guess it is a good time to share the checkpatch.pl
> evaluation scripts with each other, compare them and settle among us
> for one common script to use.
> 
> (That gives away the mentee intro coding challenge but I am sure we
> can come up with a new one...)
> 
> 
> Lukas
> 

Sure. The scripts I am using are:
For generating checkpatch reports over commit ids:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/before_commit/script.pl

For finding difference in errors/warning messages with count:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task4/relative_summary/script.pl

For generating dropped warnings:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task4/relative_summary/dropped_warnings/from_sign_off_mismatch/script.pl


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
