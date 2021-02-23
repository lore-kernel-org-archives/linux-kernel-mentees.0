Return-Path: <SRS0=pe2G=HZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F4DC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Feb 2021 11:35:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FF9264D8F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Feb 2021 11:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FF9264D8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8F81605EA;
	Tue, 23 Feb 2021 11:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3_DKZqn9cOw; Tue, 23 Feb 2021 11:35:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id C24AE605DC;
	Tue, 23 Feb 2021 11:35:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 963B7C000B;
	Tue, 23 Feb 2021 11:35:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4286C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 11:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D57583438
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 11:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2ecVAc-o7g8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 11:35:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A30A68321B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 11:35:40 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id c11so8584139pfp.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZXknYZa22rU4H1Kyhm91bekSW7PvKMTDIpqNkOqobg0=;
 b=CVmm/41qEVa8VkqYO/9hoDhX1BID2L/663fz5V7U+F4AZkVdnGavR376wsVaYXywWv
 GwaxEEG7ONNBS3a2yM1x56LTm3nuDPq1uFXJjz0zHD7LJfVpMhzcT/0am1a+pSHHe8fp
 DMdjnmnXYq/+FU0IzTGSoyNWULwftomnuO9VsI7U2rVxA8toBCTlAb/uEHd2CHyVKwdy
 yAF6dHL5Tz+nkNM+q84Fg82BhD42/Q6znMcw1086F25m89CGXK5YgSGhwwpzwIqGJLs9
 HBg/GBQ4EU49gd5yXsMj3njGJKQrWmLmha8gigkWuwTDoxh9iAUlhW91D7SmlKhP//CT
 3C6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZXknYZa22rU4H1Kyhm91bekSW7PvKMTDIpqNkOqobg0=;
 b=uZknpQVAADs8lJFLSiXlKQMQhdPBuZ/qrc5ubvb/oeVuwBbkawbodTMcUDONLaxPVH
 vV7rdrNd4OJpD8VcRIm9NfIQIgyLUEYy6O6Oa+UfkoLNcIpYpPJQbk1wTGfdAxvnBTSw
 IEy7Iftz+JhRFnaI8rhEnhLvroZ4+dZaRSlJg/eK6P65X/65LlVe9PRxotez99hgwcqp
 WujVb41cUasS3UCaqPfplhSlQttNQSf8s97hN9r4PQeNch/G3/lHH0pk+p57pZegsGKj
 1nGzLGbJzz6ek7GFf/pwFaAffdu417BVg1/TojI2hesteJks/JhKOZbty0gEITs7yhKz
 uYfQ==
X-Gm-Message-State: AOAM530JzFKJNf49KVlNolBJfeWGWUe48Rebwpo4U/KiLhchTAHCc5Z5
 HjZi+AVvSB2DFcRuCMqESpI=
X-Google-Smtp-Source: ABdhPJx9a0hukooQl+z13/uQEycH7Ffx7KnAqyXf1sCpbyl4sm/4sgSImvbkUxroEOUNSBqVplDsIw==
X-Received: by 2002:a63:f953:: with SMTP id q19mr3171093pgk.125.1614080139936; 
 Tue, 23 Feb 2021 03:35:39 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:71c8:9c21:1a6d:84ab?
 ([2405:201:600d:a089:71c8:9c21:1a6d:84ab])
 by smtp.gmail.com with ESMTPSA id b7sm21630037pfp.139.2021.02.23.03.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 03:35:39 -0800 (PST)
To: Jonathan Corbet <corbet@lwn.net>
References: <20210217145625.14006-1-yashsri421@gmail.com>
 <878s7flrdf.fsf@meer.lwn.net>
From: Aditya <yashsri421@gmail.com>
Message-ID: <1e4c4108-feb4-9ab6-7c1c-13200658470c@gmail.com>
Date: Tue, 23 Feb 2021 17:05:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <878s7flrdf.fsf@meer.lwn.net>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC] scripts: kernel-doc: fix array
 element capture in pointer-to-func parsing
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

On 23/2/21 3:03 am, Jonathan Corbet wrote:
> Aditya Srivastava <yashsri421@gmail.com> writes:
> 
>> Currently, kernel-doc causes an unexpected error when array element (i.e.,
>> "type (*foo[bar])(args)") is present as pointer parameter in
>> pointer-to-function parsing.
>>
>> For e.g., running kernel-doc -none on kernel/gcov/gcc_4_7.c causes this
>> error:
>> "Use of uninitialized value $param in regexp compilation at ...", in
>> combination with:
>> "warning: Function parameter or member '' not described in 'gcov_info'"
> 
> In the future, please quote error messages from the kernel verbatim.
> You can trim irrelevant stuff before or after, but please do not edit
> them in this way.  That helps me to understand what you are fixing, and
> is also useful for anybody else who might be searching for a solution to
> the same problem.
> 
>> Here, the parameter parsing does not take into account the presence of
>> array element (i.e. square brackets) in $param.
>>
>> Provide a simple fix by adding square brackets in the regex, responsible
[]
>> -- 
> 
> ...meanwhile, I have applied this one, thanks.
> 

Thanks Jonathan! Will keep this in mind..

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
