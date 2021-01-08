Return-Path: <SRS0=oxYf=GL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED000C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Jan 2021 19:41:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C22223A79
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Jan 2021 19:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C22223A79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7BFB887238;
	Fri,  8 Jan 2021 19:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUbhWl7okV1O; Fri,  8 Jan 2021 19:41:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8177987236;
	Fri,  8 Jan 2021 19:41:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B9D6C088B;
	Fri,  8 Jan 2021 19:41:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5816AC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 19:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3AB898745D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 19:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbmirWGv4am5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 19:41:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0FCA88745C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 19:41:23 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id 15so12605649oix.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 08 Jan 2021 11:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bloxaOqCPwKMlXiotLGhy7r42MyPMqUNsVDO+0panUs=;
 b=Q2DzmpC6G2Ho+ySgesuMl1NfH6wgvOBvMZMqDPTmWwZwzJaVdGXpVMAhro6CX4tRcq
 S9Uvu5qVrQ/H86tGDUh4OAoxNSYhEsNukqWtRGZ9R8aHSiXu8VIMWeFoTRXGow6ffZYO
 H3ydzODDh6Llg7GAsQqLjX8Ad7ShyJo8bDPR87i47yAiQ+TdVEkjKn97oWC++DecWqjD
 WZdSuHbhf1HRiVX1as76/AbKbRp67ExuQ29fvyeoRJW9+W/qUyy3Xy/HFDCedjQ7HZEb
 e87xvAR18pSwDwvbalm6HE8whTUkkO7n5G5aTYj4nBichdWM9DZ2m6NuJiaBPTHMNIgb
 Q6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bloxaOqCPwKMlXiotLGhy7r42MyPMqUNsVDO+0panUs=;
 b=JmZ5I4n55lf97RMM1oQIjh2CSox4wLRQEJ4Yhwr+2WVtM8OJagsTc2uBrLzWibH4Bn
 kgcntmopKlAcHanHdFyiIgXTV+G5oJH5ZLLO6i97aQSCH7rlbtKK7EtQEd2si0x1pOtk
 q0wrM8IwT6ua87oabvQdyR+YZNzNHKO2GnmvHTB0cWCToyZmKUiqOlggWINe3yZEO7oZ
 Ktv1yn8U+Paiu4/X/w18FbUUohaYVYPV5gLPWeUjSYsA91RLCerMjbKqWso14N3LHmYR
 hQkRuJ9YAYmCgvMuWUTrT3G5g5k4zhIwqumXpuuGZSNchIeHQM+PU1+/mi5MUfhMZeLX
 YbEA==
X-Gm-Message-State: AOAM531aRrbTQTucMJkSNAqvPO21SSnLMbOPL265MDvxmSS2MgZ6+hn9
 +kpWsQA2KgZFQcIztVn00Xw=
X-Google-Smtp-Source: ABdhPJxbMX6pytlq+5CKW1fXJu7TJe79uCuJJ3Ws0aKgQt7kTLqX8B6mwICmkpDxQwsivSHS4Qg0dg==
X-Received: by 2002:aca:3784:: with SMTP id e126mr3332568oia.170.1610134882338; 
 Fri, 08 Jan 2021 11:41:22 -0800 (PST)
Received: from localhost.localdomain (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id t72sm2130001oie.47.2021.01.08.11.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 11:41:21 -0800 (PST)
To: Aditya Srivastava <yashsri421@gmail.com>, linux-wireless@vger.kernel.org
References: <20210108153208.24065-1-yashsri421@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <3c121981-1468-fc9d-7813-483246066cc4@lwfinger.net>
Date: Fri, 8 Jan 2021 13:41:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108153208.24065-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: pkshih@realtek.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, kvalo@codeaurora.org
Subject: Re: [Linux-kernel-mentees] [PATCH] drivers: net: wireless: rtlwifi:
 fix bool comparison in expressions
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

On 1/8/21 9:32 AM, Aditya Srivastava wrote:
> There are certain conditional expressions in rtlwifi, where a boolean
> variable is compared with true/false, in forms such as (foo == true) or
> (false != bar), which does not comply with checkpatch.pl (CHECK:
> BOOL_COMPARISON), according to which boolean variables should be
> themselves used in the condition, rather than comparing with true/false
> 
> E.g., in drivers/net/wireless/realtek/rtlwifi/ps.c,
> "if (find_p2p_ie == true)" can be replaced with "if (find_p2p_ie)"
> 
> Replace all such expressions with the bool variables appropriately
> 
> Signed-off-by: Aditya Srivastava<yashsri421@gmail.com>
> ---
> - The changes made are compile tested
> - Applies perfecly on next-20210108
> 
>   drivers/net/wireless/realtek/rtlwifi/ps.c                 | 4 ++--
>   drivers/net/wireless/realtek/rtlwifi/rtl8188ee/dm.c       | 8 ++++----
>   drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c       | 4 ++--
>   drivers/net/wireless/realtek/rtlwifi/rtl8192c/dm_common.c | 4 ++--
>   drivers/net/wireless/realtek/rtlwifi/rtl8192se/hw.c       | 4 ++--
>   drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c      | 8 ++++----
>   6 files changed, 16 insertions(+), 16 deletions(-)

As has been stated several times, this form of the subject is incorrect. It 
should be: "rtlwifi: <driver_name>: <subject>

I would prefer that there be separate patches for each driver, not that the 
changes be lumped into a single patch as was done here. Such organization makes 
it a lot easier to find the patches for a given driver in case something goes 
wrong.Note: The driver for ps is rtl_pci, and that for rtl8192c is 
rtl8192c-common. The other driver names match their directory.

Larry

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
