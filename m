Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899F4C5DF62
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:53:13 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48CD72087E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:53:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYo/5KBR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48CD72087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2B1A7DB5;
	Tue,  5 Nov 2019 21:53:13 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EFB48C2C
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:53:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7B29227B
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:53:11 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 3so16978377pfb.10
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 13:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=cc:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=4CXYo/cgnoTsCjAMMynzYTPUIwRzWVFEV0CA8Ua58Rw=;
	b=pYo/5KBRtiZGkS9XOGtjyGi+PMmOAuB114Bqxn0MWScWhMaw+OhvDkiP13vVvPf4Lo
	3NqKu7qhA9gYtLAJxsiIFxb94+ENYwN2awt+kv1aJ5aRfS92zbZdpo1HttOoQIVH+OkQ
	Ik0avMKoSNfN+iq5tMbl/fOjYTUNl8eLcHHXUt+9OqcvyJMBt7Lf5T5/heA7wr/gDfSs
	pgN/M+O3NjOBYwbEP3RByettcMZkmXQv8hpuRVncZ11LLJPxzMrLvDcBnv4Lq+OP3d5D
	m1iNQstaoyzBG8BqpJu7Ox6rEy/NeE0XcC+RysDNBIX/T88eBAaSeUI7Au4UoZH9CTtb
	1kCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:cc:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4CXYo/cgnoTsCjAMMynzYTPUIwRzWVFEV0CA8Ua58Rw=;
	b=K180xVF2/aRTQm+hpYCbHgrHIrPa6Mn8dTblyWkSPFOxWAfY5h/l1wjwIvSS3KsZxT
	6ZI1Jx0xzB+9V7CJYsWW72NYLk8dVTdLX9S6mCSlScE9qCiC2Dab9ZyG91OyzBcXvuNK
	L3igsegOjNguYrfumnHi4cIRarjH9+eI7JlSFi6YhT+s53VKD10O95dQC4NxV1d3oNiF
	IO18wadP3CNLE5CHe+M0cTA7zRlUpgkkeVMQsae8u1TFjVXzd9HvJQ3tEnp8XGwltJlS
	3aGTjudYzYBr+z5gRDElOXHCLEXNNSIAM4zbpV1cvx59PDDjiXgLH14/jVINJ6oeOkBL
	TSRA==
X-Gm-Message-State: APjAAAUNMS3rVZ56WdX9B2MWxHFmFQqNHkq7yy5Tc+9jW2ZIFylJlfM2
	thSJHfeGOxHd0cvFIZTrHEmoYoTyjzQ=
X-Google-Smtp-Source: APXvYqwO87q9uzOmJnztEtcJaqvZdxcCGQp4Nl/xpHUxsvGf6y9yLfWIWFVIDmQU67zH05Ip1BIgQA==
X-Received: by 2002:a65:55c3:: with SMTP id k3mr37746623pgs.155.1572990790523; 
	Tue, 05 Nov 2019 13:53:10 -0800 (PST)
Received: from ?IPv6:2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb?
	([2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb])
	by smtp.gmail.com with ESMTPSA id
	o191sm24793150pfg.64.2019.11.05.13.53.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 05 Nov 2019 13:53:09 -0800 (PST)
To: Amol Grover <frextrite@gmail.com>, paulmck@kernel.org
References: <20191102115517.6378-1-tranmanphong@gmail.com>
	<20191105165938.GA10903@workstation>
From: Phong Tran <tranmanphong@gmail.com>
Message-ID: <2e218986-1dd1-42d8-94dc-cce098533af0@gmail.com>
Date: Wed, 6 Nov 2019 04:53:05 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105165938.GA10903@workstation>
Content-Language: en-US
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, jiangshanlai@gmail.com,
	josh@joshtriplett.org, rostedt@goodmis.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	mathieu.desnoyers@efficios.com, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Doc: Improve format for
 whatisRCU.rst
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org



On 11/5/19 11:59 PM, Amol Grover wrote:
> On Sat, Nov 02, 2019 at 06:55:17PM +0700, Phong Tran wrote:
>> Adding crossreference target for some headers, answer of quizzes
>>
>> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
>> ---
>>   Documentation/RCU/whatisRCU.rst | 73 +++++++++++++++++++++++----------
>>   1 file changed, 52 insertions(+), 21 deletions(-)
>>
>> diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
>> index 70d0e4c21917..ae40c8bcc56c 100644
>> --- a/Documentation/RCU/whatisRCU.rst
>> +++ b/Documentation/RCU/whatisRCU.rst
>> @@ -1,4 +1,4 @@
>> -.. _rcu_doc:
>> +.. _whatisrcu_doc:
>>   
>>   What is RCU?  --  "Read, Copy, Update"
>>   ======================================
>> @@ -27,14 +27,21 @@ the experience has been that different people must take different paths
>>   to arrive at an understanding of RCU.  This document provides several
>>   different paths, as follows:
>>   
>> -1.	RCU OVERVIEW
>> -2.	WHAT IS RCU'S CORE API?
>> -3.	WHAT ARE SOME EXAMPLE USES OF CORE RCU API?
>> -4.	WHAT IF MY UPDATING THREAD CANNOT BLOCK?
>> -5.	WHAT ARE SOME SIMPLE IMPLEMENTATIONS OF RCU?
>> -6.	ANALOGY WITH READER-WRITER LOCKING
>> -7.	FULL LIST OF RCU APIs
>> -8.	ANSWERS TO QUICK QUIZZES
>> +:ref:`1.	RCU OVERVIEW <1_whatisRCU>`
>> +
>> +:ref:`2.	WHAT IS RCU'S CORE API? <2_whatisRCU>`
>> +
>> +:ref:`3.	WHAT ARE SOME EXAMPLE USES OF CORE RCU API? <3_whatisRCU>`
>> +
>> +:ref:`4.	WHAT IF MY UPDATING THREAD CANNOT BLOCK? <4_whatisRCU>`
>> +
>> +:ref:`5.	WHAT ARE SOME SIMPLE IMPLEMENTATIONS OF RCU? <5_whatisRCU>`
>> +
>> +:ref:`6.	ANALOGY WITH READER-WRITER LOCKING <6_whatisRCU>`
>> +
>> +:ref:`7.	FULL LIST OF RCU APIs <7_whatisRCU>`
>> +
>> +:ref:`8.	ANSWERS TO QUICK QUIZZES <8_whatisRCU>`
>>   
>>   People who prefer starting with a conceptual overview should focus on
>>   Section 1, though most readers will profit by reading this section at
>> @@ -52,6 +59,7 @@ everything, feel free to read the whole thing -- but if you are really
>>   that type of person, you have perused the source code and will therefore
>>   never need this document anyway.  ;-)
>>   
>> +.. _1_whatisRCU:
>>   
>>   1.  RCU OVERVIEW
>>   ----------------
>> @@ -120,6 +128,7 @@ So how the heck can a reclaimer tell when a reader is done, given
>>   that readers are not doing any sort of synchronization operations???
>>   Read on to learn about how RCU's API makes this easy.
>>   
>> +.. _2_whatisRCU:
>>   
>>   2.  WHAT IS RCU'S CORE API?
>>   ---------------------------
>> @@ -381,13 +390,15 @@ c.	RCU applied to scheduler and interrupt/NMI-handler tasks.
>>   Again, most uses will be of (a).  The (b) and (c) cases are important
>>   for specialized uses, but are relatively uncommon.
> 
> Hey,
> 
> The changes looks good overall, however a few areas would
> look even better after a bit of formatting.
> 
> The API methods text under this section could be converted
> to sub-headings (^^^) for improved readability.
> 
> rcu_dereference() sub-section under `Section 2` has 2
> footnotes which could be linked using
> http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#footnotes
> 

Okay, sent out the patch with the suggestions.

https://lkml.org/lkml/2019/11/5/996

Regards,
Phong.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
