Return-Path: <SRS0=BNRj=NA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C4FC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Aug 2021 18:09:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3472360F02
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Aug 2021 18:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3472360F02
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DB5D40114;
	Mon,  9 Aug 2021 18:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4WVGoLssZRH2; Mon,  9 Aug 2021 18:09:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D13AE40128;
	Mon,  9 Aug 2021 18:09:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A576CC0010;
	Mon,  9 Aug 2021 18:09:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB36EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 18:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB9116062D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 18:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovyXeN7iG1Ik
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 18:09:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 774DA6058D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 18:09:28 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id v16so3072284ilj.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Aug 2021 11:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sOfCnoHruzCebMSr2SvdR9+AUtEZINZARB15NoQk+xI=;
 b=hNRHglcuwHhaE934wIRrSYDvOOCUGgxKaiq+964oxT0NJrgPsdgbI1pvCtv/jRrKIZ
 e0Mh6Z9lQhQd/ohiBuXoEB0M//otqKA5X+CeajJaMCJptscRJ9Dz3oDtiyhYlTAfahd5
 GyL8TcGQCidFZ66RTykzjUfJuD827WotBEvmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sOfCnoHruzCebMSr2SvdR9+AUtEZINZARB15NoQk+xI=;
 b=oOchT+i3Zfbe6xN22apsSxho3pnWR6hTwbdPGBxh5uz9oIDZVEesW90NhIq8kTvQll
 nFHa+mcviPsAEeBp4idkQNweQ92fQjs02DFOsmt9BwckGKHIayvMCYD0s4EqduLNNt3K
 zZu1YhhOflVvLUlFLnTVODi1QNnSvL89AycAdPcB0wDZbaefCdez2UMaZS2b9MKgSaI3
 WNkDI2U5heQQq3Imc7+QkbyMzP7wHTuyna4ygXootm2cfBTIyYnKIOwX6Bzm2HJlHH+D
 vL13Xmno4S2GhE0pCbrfpM23pXYxr6EQtWHFSnko8UBqlEECJmN+mS6bEVqIblRqqybD
 i3JQ==
X-Gm-Message-State: AOAM532KsCuchgOo7DbVFkdCGS/uSo69EFycozUUaOmZlE2BSUxEy3aY
 vhrBKtUsVVtc2LgDzjwfgnyionw1
X-Google-Smtp-Source: ABdhPJzJwmDs/bZ8lXpP15+3bebOUNeoVDi0mBFHZJs4ZSRRJE4CZB+l2g4jTfJFehqOMsMExMN2eg==
X-Received: by 2002:a92:9412:: with SMTP id c18mr150057ili.38.1628532567479;
 Mon, 09 Aug 2021 11:09:27 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id i18sm1742310ilk.84.2021.08.09.11.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 11:09:27 -0700 (PDT)
Subject: Re: [PATCH v2] Task2: checkpatch.pl documentation mentorship: Remove
 semicolon warnings
To: Rahul Balaji <rahulbalaji78@gmail.com>, lukas.bulwahn@gmail.com
References: <20210803141049.80422-1-rahulbalaji78@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <80a40cfc-ead5-dfc4-bad4-4dc54ea3f0a9@linuxfoundation.org>
Date: Mon, 9 Aug 2021 12:09:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210803141049.80422-1-rahulbalaji78@gmail.com>
Content-Language: en-US
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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

On 8/3/21 8:10 AM, Rahul Balaji wrote:
> Signed-off-by: Rahul Balaji <rahulbalaji78@gmail.com>
> 
> no functional changes.

Where is the change log for this? Explain how you found
these problems in the change log and include output from
the tool you used to find them.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
