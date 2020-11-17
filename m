Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C007C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 20:32:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858562225B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 20:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeNa7LHE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 858562225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 41F9C8574B;
	Tue, 17 Nov 2020 20:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XD2UqTGWT1PS; Tue, 17 Nov 2020 20:32:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BBA1785683;
	Tue, 17 Nov 2020 20:32:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93540C0891;
	Tue, 17 Nov 2020 20:32:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0899DC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 20:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EA56B85683
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 20:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_JobgRyQXyY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 20:32:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7DE9185551
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 20:32:22 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id l11so1125216plt.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 12:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5+ymwfagSIRQOkqqnEnUTwj2p7nXktO9WkHM8gsv90o=;
 b=aeNa7LHEWOkNKlQ/VU2rX1dcvbu+8EJM77jIf3hGFscomyPaPZXP1sdCxHI5s1Seom
 adL0m5UcKKh0oh0DQnUbPSQoNXixxuRV8Y1eMT5Vs5CJ+rA+7v1mrFzBYFmqy0yQJBWg
 bB5KWgwSIeVxmo2Vw317S5mQMv/Coq8wJoy81tMcm9g4ZB7oCL4LePPIhn+VCEWd1yyf
 RYiNU9EAtOcDUFOOU5EqOjBEcqUfUATBiym8cpGh42KT6Me4QREekrSTASlry/Slr036
 zRbLQJLCzbXdJoUfFHosTCuo9VYdjV+Ch7bjrhgBi3/tJEa3ilmGheYr2nomRbPeXfAT
 F9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5+ymwfagSIRQOkqqnEnUTwj2p7nXktO9WkHM8gsv90o=;
 b=ZAqW1mQszMY1ynCWJlEnKJ4KBZzqB1a77rc7cGtCVqlnRPdbuT8kZlrDuluhCOdGLo
 SQ8zlpC1lSayp5K+3vn2tyIoA//1wWHzGYkBovjAC93zWO15KALQY8h7BVB5M4Zww74e
 QxKtWlDtoi5K229JV0FC+KWEpAxzhkFGi0qJaUsYrnGaROeDu7oRbtORzc3vtAuQ0ZSN
 lzT5qU6/NOusHKxSqCcOmNyKl/YFxQUoo4pyzo0KUxpif0HB4Rbg0sbQepq/R6WWMdrb
 kZtRLCTg7Eic93XctlWp9XyRp4rCtIDaML/MJKu7UEpD8MQQ4IXYiL5H1H1ZNAVDF/1L
 W9Aw==
X-Gm-Message-State: AOAM533JS+v/3/ZLVNpyc1LpYQyHN01novDNulhmc5mOh/zZQyyMYiUW
 NZpXAIKzGimSksMrjGv7TFw=
X-Google-Smtp-Source: ABdhPJxmJpRlUoDLjNS4hVcNJSgahdYvoerLTWsz8Y+hiM2zFU+S21Pi8edDVGaSdEYY56S/GQMD+Q==
X-Received: by 2002:a17:902:be07:b029:d8:afa1:3d76 with SMTP id
 r7-20020a170902be07b02900d8afa13d76mr931181pls.14.1605645141830; 
 Tue, 17 Nov 2020 12:32:21 -0800 (PST)
Received: from ?IPv6:2402:3a80:425:6282:bc1b:1de0:7718:e8a1?
 ([2402:3a80:425:6282:bc1b:1de0:7718:e8a1])
 by smtp.gmail.com with ESMTPSA id a3sm22066070pfo.46.2020.11.17.12.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 12:32:21 -0800 (PST)
To: Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201111090143.9230-1-yashsri421@gmail.com>
 <CAKXUXMzg6Wg310s-N8hWOEiXFkg1ZAga+NkFQkFQ5_bS16TLnA@mail.gmail.com>
 <2b640e8b-69dc-2ade-3b9f-fae14eed1b17@gmail.com>
 <f21acc492ab37acc42390abffb61aed370a22118.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <13f3fc34-0ca4-66d4-92ca-db80b66f5fb4@gmail.com>
Date: Wed, 18 Nov 2020 02:02:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f21acc492ab37acc42390abffb61aed370a22118.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for MISSING_SIGN_OFF
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

On 11/11/20 9:20 pm, Joe Perches wrote:
> On Wed, 2020-11-11 at 16:39 +0530, Aditya wrote:
>> On 11/11/20 4:00 pm, Lukas Bulwahn wrote:
>>> On Wed, Nov 11, 2020 at 10:01 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>>>
>>>> Currently checkpatch warns us if there is no 'Signed-off-by' line
>>>> for the patch.
>>>>
>>>> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
>>>> Completely remove --version flag") reports this error:
>>>>
>>>> ERROR: Missing Signed-off-by: line(s)
>>>>
>>>> Provide a fix by adding a Signed-off-by line corresponding to the author
>>>> of the patch before the patch separator line. Also avoid this error for
>>>> the commits where some typo is present in the sign off.
> []
>>> I think it should still warn about a Missing Signed-off-by: even when
>>> we know there is a $non_standard_signature. So, checkpatch simply
>>> emits two warnings; that is okay in that case.
>>>
>>> It is just that our evaluation shows that the provided fix option
>>> should not be suggested when there is a $non_standard_signature
>>> because we actually would predict that there is typo in the intended
>>> Signed-off-by tag and the fix that checkpatch would suggest would not
>>> be adequate.
>>>
>>> Joe, what is your opinion?
>>>
>>> Aditya, it should not be too difficult to implement the rule that way, right?
>>>
>>
>> No, I'd probably just have to add the check with $fix, instead of with
>> $signoff
> 
> I think it does not matter much which is chosen.
> 
> The bad signed-off-by: line would still need to be corrected one
> way or another and the added signed-off-line is also possibly
> incorrect so it could need to be modified or deleted.
> 
> 

I think I might have misunderstood here that I do not need to make
changes. Just confirming, Do I need to modify the patch?
Pardon me for my late attention to it.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
