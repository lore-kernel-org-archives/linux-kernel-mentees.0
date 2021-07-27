Return-Path: <SRS0=JmfH=MT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_RED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A0EC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 00:33:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0AF2600D0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 00:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0AF2600D0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A932A402C9;
	Tue, 27 Jul 2021 00:33:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xEbfffbDg-xZ; Tue, 27 Jul 2021 00:33:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A79BB4046C;
	Tue, 27 Jul 2021 00:33:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7146EC0010;
	Tue, 27 Jul 2021 00:33:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2173CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A7454046C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id acN69SzUbACu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:33:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47947402C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:33:45 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 f20-20020a9d6c140000b02904bb9756274cso11814280otq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 17:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iC2lsQe2MDT2Dw0Bnw8tHZWo81ltSa3YPIiU9h86nfs=;
 b=A/eBIUedc2REP6ixP3VEJwWwRCPrQfbqNssTNayrb+4n6Aka+BzBsAsNigcQD+CRJ4
 9bdU3MgeChdMOMFJZhS1u2Ux2CHuFHwvNlMaWd0buXp6fOwQXHMZhsHi8Tz9c6ECz0h4
 kQMqjuaqi0cHj+Pf3fEVr9/x+NHbOk7sin97A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iC2lsQe2MDT2Dw0Bnw8tHZWo81ltSa3YPIiU9h86nfs=;
 b=E4mVCcheT1napEVuh2Oc6pytJF4NADCZE+akrP6ik3ahfB9ZoF5qQyY2ywnXCP9W4w
 gl2h0w3SYaQf+QYPLhAi4cxZtcSSjDfv2OkS0BRAnvXRz8pq2OLxw0UGRfNzc7X23V+R
 mHxrc+gJVDM1rHYGLEPkeb72UteP9Fcqp5RjNtj2BVtCB5H4LD/bzdsnwqJ7lbL4EOV4
 3OGrGgmXxMq4qEXzLXOkRiiPA2sC9QqbSLNiLb0NaWk13bKXZD0KcZezu8iIfJUvRsdT
 ANmjjjw8xv+lvcKDMP3cNwU0u6Qdf8asCcBFtAV5coJ4gewDclCXHr7Z2YCW54UbJrtN
 RiDQ==
X-Gm-Message-State: AOAM530DzbiZ/WywUz7lDB4MytosU146jfPvf1sF2+Aaz7ueKLin5+b1
 oYi9/w5TDhs8FutYIkvewMlvvkD3
X-Google-Smtp-Source: ABdhPJzRX3BV7nJnuPEvMnpRf1mH9Meob7VI6Ej9oxHE6KBb43u7eLrYySmbeBS1h2wkMerlw/yOCQ==
X-Received: by 2002:a9d:7982:: with SMTP id h2mr12818502otm.291.1627346024286; 
 Mon, 26 Jul 2021 17:33:44 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id q24sm253489oot.3.2021.07.26.17.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 17:33:43 -0700 (PDT)
Subject: Re: patch suggestion: Kconfig symbols
To: Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <295b8f8c-4264-9f32-6723-9d2d574021ac@infradead.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <6795e614-8c26-83d4-97ce-b2510b299dab@linuxfoundation.org>
Date: Mon, 26 Jul 2021 18:33:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <295b8f8c-4264-9f32-6723-9d2d574021ac@infradead.org>
Content-Language: en-US
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

Hi Randy,

On 7/26/21 6:21 PM, Randy Dunlap wrote:
> Hi,
> 
> Running scripts/checkkconfigsymbols.py reports several hundred (maybe thousand)
> Kconfig symbols that are used questionably. Lots of these are false positives
> but lots of the remainder could use some cleaning up.
> 

Thank you for these patch suggestions. These will are helpful for
new developers looking for ways to get started.

thanks,
-- Shuah


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
