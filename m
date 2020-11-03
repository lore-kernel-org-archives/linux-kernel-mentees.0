Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9C1C388F2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 08:38:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AA7422400
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 08:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbvEQTAQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AA7422400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C18AE85FC7;
	Tue,  3 Nov 2020 08:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVxyVCdTNId9; Tue,  3 Nov 2020 08:38:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 13C8985F80;
	Tue,  3 Nov 2020 08:38:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDF71C0889;
	Tue,  3 Nov 2020 08:38:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EECBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 08:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1237686A74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 08:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Xy3YjZnGhFK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 08:38:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 69EAD86A1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 08:38:47 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id w65so13585442pfd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 00:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gVdHv3c5PBHY99rALwx1lEhgfM1UO/EyS7VFkmwr7vA=;
 b=rbvEQTAQuyijhivByYwc12SS4n2icAmz8EFUl168axTfcCg6ju+YFkN5EfFuLzuCWl
 TC23plG5LQICGp2alwbDWfUNTat8S+U9s0cNIgXRkRHVVGzppeCVk8HRQ9E4+vWFd43E
 klZPE9BCnyrP1og6NnBwLDFJJ3EFd6z+iDAHVfbOg1jOV7BXOQh2GWhjZHxYiD0oNHM5
 T211j2ppI25vQV2gOSwFwHGw7Wlo58rx7YPdj3xHK52uy2SBSQTZ8FjgvjDIiXujpW1K
 DzEB/EhizwmZg0YnR0ZILzNMHV77poT/6msxSTj5+qYMwD8ML9rzUyBylr4VvRjglBd8
 OGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gVdHv3c5PBHY99rALwx1lEhgfM1UO/EyS7VFkmwr7vA=;
 b=JNd6WTfen9RvYXdNH28ZiuC3AGETxnbBCvIH62C3glz1Bx0bbNanFB2ayAGNw/zbBS
 H9p2EddNvNenpZAlfq5HbY/7zHl2hJFSGf7eiK2Hl0cjkGOBjMeFltIcYpSEyp6nr2bt
 Y8CauuXtup1AXQEo8wLTKgyWlbtKQIzocs0EKIHKRo/2pgCYg+tjS+zwB6nAgeiAR8hx
 vYDMujqnFP7wA3U/gpnpgfjEkpAJ5hOQkFay7Vh7DDDk1FEf49ut0EJkGSTtlmqczFb5
 bkyunu3kvnJEtrpDaFlroJrdVE6avcKMFsnfJHDvPRXrOH1ivNZtDnaSov7GFNCHJYNt
 iKvQ==
X-Gm-Message-State: AOAM530u0ZyMgnrrd1OplnLdfYJmQBP2C7Ltghm/dCM4cuLY501KUHt6
 M34tcS0WLOuqsqHGJCQ9fmDqj0BJpCW7Sw==
X-Google-Smtp-Source: ABdhPJxwxPqzbNCvcHOl4AFa4HeEgkZc6bDFswnsBO2Eug60Sz915Z+evHvQjnmSPP/HW5I7ocKL6A==
X-Received: by 2002:a65:50c9:: with SMTP id s9mr16428079pgp.20.1604392726632; 
 Tue, 03 Nov 2020 00:38:46 -0800 (PST)
Received: from ?IPv6:2402:3a80:41d:f163:ac:13ab:8c6a:34ab?
 ([2402:3a80:41d:f163:ac:13ab:8c6a:34ab])
 by smtp.gmail.com with ESMTPSA id y28sm415826pfp.167.2020.11.03.00.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 00:38:46 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201031132556.10379-1-yashsri421@gmail.com>
 <alpine.DEB.2.21.2011020808040.11801@felia>
 <0c7aec7d-3ec6-882f-062f-3b7683f8b594@gmail.com>
Message-ID: <1a4d2f16-fd08-197b-3e6c-b433e84ebcba@gmail.com>
Date: Tue, 3 Nov 2020 14:08:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0c7aec7d-3ec6-882f-062f-3b7683f8b594@gmail.com>
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

> On 2/11/20 12:55 pm, Lukas Bulwahn wrote:
>>
>> Or to prioritize another issue and possiblity for fix rules.
>>
>> You can see that there are potentially some good options for fixes around 
>> the tags and sign-offs Dwaipayan has investigated.
>>

Sir, I am working on BAD_SIGN_OFF, which occurs in multiple variants,
for eg.
1) WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to
attribute nominal patch author '"Zhang, Jun" <jun.zhang@intel.com>'

2) WARNING:BAD_SIGN_OFF: email address '"Matthew Wilcox (Oracle)"
<willy@infradead.org>' might be better as 'Matthew Wilcox (Oracle)
<willy@infradead.org>'

3) WARNING:BAD_SIGN_OFF: Duplicate signature
etc.

Should I answer all these variants in one patch?

Thanks
Aditya


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
