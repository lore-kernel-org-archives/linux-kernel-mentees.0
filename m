Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65401C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Jul 2022 19:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB98E410D9;
	Thu,  7 Jul 2022 19:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB98E410D9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ePE8YIlk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8HPClhm3JF5; Thu,  7 Jul 2022 19:53:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C7A20400D1;
	Thu,  7 Jul 2022 19:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7A20400D1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADF7EC0033;
	Thu,  7 Jul 2022 19:53:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D69A4C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 19:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A318C400D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 19:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A318C400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pdt_MkqK34Qk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 19:53:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEF72410D9
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEF72410D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 19:53:41 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id n7so7320553ioo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 07 Jul 2022 12:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rbpdA+BUxTlil+WefB4QZKW00HISZttMClbHdZNclx8=;
 b=ePE8YIlkrDxomnHx5zf9YabSCOdJyVxTdJRZfRTShjLWmoCFgjDmrPs1xDYbjks/pz
 qSr/0NwRSJa1CI49afC6wfy5s/FTk7lsrvYaInfrY5pORwhgYDG95OULyjphk2itGMjU
 iBJoD5hdf/iJHB6oAIg/GvpqP6HU3GGAVdIUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rbpdA+BUxTlil+WefB4QZKW00HISZttMClbHdZNclx8=;
 b=NaU8SgVzabTwDRGuqXzpknEqZu7D7JZt6soh4ePSrTWBD8XR73ZoS5opFTxPoNupSE
 dySJW4fjP5vLpt8Sn/PQxT5V6FYpZvF1e6lKuephnlnPUFvCGglK6eZB7r2jdlqNGqGB
 GkE8t0TG0xlKg9y5acVXEgwBx0+hXyYZXhAx7fYOBZ+5Y19coVIH7GPJvxHZYHSn7gTA
 Vsufc/5prRMrzCUGXldjjtykK7mSYphBVb3R4EwXPK1mMtUcYvTyyduQ8IWFpOCq3qA8
 /DfUv38W0snyMtN+2fCERRnihX9SS12Qkot87HcfA5tXCPRPnu/XpUMtU7gPbwKHJ/OK
 IDvQ==
X-Gm-Message-State: AJIora8tyb5SUMguyLlDV4aX2ruvM26BoP0roT4me140/CrRFxYK7p96
 eVX3sHTbWLSMrQ5VWxyP4LSHb3Ba
X-Google-Smtp-Source: AGRyM1vAORWCXL6p9WH1nWaLYP0Q2q2CjsamNu14jSepUKFmKrG2v+RTUiKQTyaAtPkTQAD0veh98A==
X-Received: by 2002:a02:c05a:0:b0:33f:1a87:966c with SMTP id
 u26-20020a02c05a000000b0033f1a87966cmr2766999jam.311.1657223620876; 
 Thu, 07 Jul 2022 12:53:40 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 i21-20020a056638381500b0032ec5c47c17sm14671321jav.46.2022.07.07.12.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 12:52:45 -0700 (PDT)
Subject: Re: [RFT PATCH] isdn: capi: Add check for controller count in
 detach_capi_ctr()
To: Soumya Negi <soumya.negi97@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>
References: <20220701235014.13025-1-soumya.negi97@gmail.com>
 <ee159745-07d2-dca3-6be3-bef823090088@gmail.com>
 <20220702093734.GA24575@Negi> <20220705030315.GA16609@Negi>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d0bb6593-958f-3c19-d67b-759c249c61d5@linuxfoundation.org>
Date: Thu, 7 Jul 2022 13:51:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220705030315.GA16609@Negi>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On 7/4/22 9:03 PM, Soumya Negi wrote:
> Hi,
> I was just told on the syzkaller mailing list that this bug had been
> fixed long back and syzbot didn't catch it as the commit didn't have
> a Fixes tag.
> 
> -Soumya
> 

You can check to see how the problem was fixed and if it is different
from your fix. Might help in fixing other such problems in the future.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
