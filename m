Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6882FC3F68F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 21:00:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F73620721
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 21:00:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbHHztI+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F73620721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CFA9320418;
	Thu,  9 Jan 2020 21:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9d0BYu-dJpPf; Thu,  9 Jan 2020 21:00:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3CE982002D;
	Thu,  9 Jan 2020 21:00:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3137FC18DC;
	Thu,  9 Jan 2020 21:00:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C079C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 21:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6885F86A2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 21:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2v2TOwjmtxq9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 21:00:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2028686A2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 21:00:07 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k40so15276qtk.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Jan 2020 13:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/xvwQqyQ8+yjxyHa9VfJyTVc4pgN9X8nV0LcNR2KOME=;
 b=lbHHztI+gTzCiiH8w8iP08KLZlSVeeFrQZMly1jmHiP0HPEWRqKm2hfaUIZaT70LoR
 tnCYplz6vLjg6KEHsyJNt7sm5jZNDcClop4aJ1GdJ4COYJ3rhcr9MgnxPeVJzeCGUmpr
 PW1oETjR1AUvC8E+wbI+EZ0FPi5xDrP71uQtbpv4CXRXsHlNkZ4E+8j7gKhmQ2wk5iQi
 Xve+KAXZDKnnXqCSXBrNUncsab1O08JmRXc0hFrXNRPuosZLwAx3xGQ60DppbMYlKMui
 r8RpT5NOzorzFWJLTq/FRnOesDoGprakDDxgW87fWhfUQBhgOOYxck/79iYDhaX4Y039
 LYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/xvwQqyQ8+yjxyHa9VfJyTVc4pgN9X8nV0LcNR2KOME=;
 b=Dyud9tralV3T1WDT5rajY6IP4uxJGB7C24ooujXyHXufMMBdtvhrSn0UB+dWYx4XOU
 /Ywgh2eAfSFT48CkjAZvfejq/ejjydsY1nVKdnTAokSJGtEPpYT9C2kbWMBJNFMTdXvI
 pBu4U7lgK4VVu8PkpN5HWZZ23nLTdiF5KDayKjgLnXZCx9shHFMRsy39h+r9PkeELGQ+
 NjYAVZ+qeW7cnwOh93kMmKN3Fo9SSYJxi+pHtqTuj7iQoUFOd68Onurt0RCySuJE+ekG
 hTiiOnXiiduUcZK4JkS2m66p9Bgi7qVPkAn96t90fuDMtB7waNdixCHCuBO863R/U9W3
 9daA==
X-Gm-Message-State: APjAAAWumS8sbTfL/4VQbn8IPqlzW1+xX4pa1AUR/WnEvXpKvt8dyT8P
 AD+b9HNVSeZxvzYwMzg2K9tcZ/6dL74=
X-Google-Smtp-Source: APXvYqyRivoNnTw9ttnfJ8D2CRVbI5k/cuprBtIEQdwYCHvNWdSxL5IOXINmsdB826L+plB+Yk94FQ==
X-Received: by 2002:ac8:7b24:: with SMTP id l4mr9659546qtu.3.1578603606042;
 Thu, 09 Jan 2020 13:00:06 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id w21sm4112241qth.17.2020.01.09.13.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2020 13:00:05 -0800 (PST)
To: Shuah Khan <skhan@linuxfoundation.org>, mchehab@kernel.org,
 sean@mess.org, tglx@linutronix.de, gregkh@linuxfoundation.org
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
 <20200109152408.919325-2-dwlsalmeida@gmail.com>
 <5f296977-6aac-cfd9-9082-ff824f85ab43@linuxfoundation.org>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <ebec2bb5-8db0-76fe-9c66-0316c1800f7c@gmail.com>
Date: Thu, 9 Jan 2020 18:00:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <5f296977-6aac-cfd9-9082-ff824f85ab43@linuxfoundation.org>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/1] media: dvb_dummy_tuner:
	implement driver skeleton
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

Hi Shuah, thank you for you input!


>
> Looks like there is more code to be added to register/unregister 

Just to be clear, attach() is missing, but register / unregister belong 
in the bridge driver. Is this correct?


>
> Please add more detail here on what this driver does. What this
> driver is used for and so on.
>
>
> Samehere. Give more details on what this driver does. Add enough detail
> to help users decide why they should enable it or not. 
>
> General practice is the following.
>
> Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>

> Please add details about the driver similar to the .c file. 

OK.


Thanks

- Daniel


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
