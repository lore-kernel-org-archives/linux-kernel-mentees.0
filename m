Return-Path: <SRS0=K9e5=JS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2986AC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Apr 2021 00:35:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A6DB613F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Apr 2021 00:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A6DB613F5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AC45608BD;
	Wed, 21 Apr 2021 00:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qyqa-dgEHD3X; Wed, 21 Apr 2021 00:35:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32FDB606F1;
	Wed, 21 Apr 2021 00:35:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A23CC000F;
	Wed, 21 Apr 2021 00:35:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C911FC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Apr 2021 00:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B945C405B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Apr 2021 00:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dgHEIaRgPyG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Apr 2021 00:35:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86A4B405AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Apr 2021 00:35:00 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id c15so33603907ilj.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Apr 2021 17:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lZ75kKR09Cg1mp89ak/GHGrgfA4eYmZt4RYzMcI2u3U=;
 b=KuUC1c5ONujfTXgammOTURk1E4agy7onJm4cA7d745MM8iMoL86db4E6M/5Uf3wiLz
 RiPiB0AB+NQw6uMG9lnsTdyg05arx0JXq0RNZsBhOfO3/r2Qze/KN+LDNlsI+wT8dw9D
 FFCtcvnYcmd8scBIRgPofRKIZ/KkfRGQHd1tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lZ75kKR09Cg1mp89ak/GHGrgfA4eYmZt4RYzMcI2u3U=;
 b=b29YS1h9fd4EmVFI+R3swbsSqS5kdqo56AXAUafDwxNO55ofp6t8PL9TH1ARwi83Dn
 ZxEkOq4cobYiwwLVxg4jOmSoAWP4GkLROJNUKee96cvtcUfR64Pdg6oy2caKZh862ifz
 JTO/Ole2YIGw2VdpIGXqIeaExUeaVranWMhLDhBcu1kV5G0GRTEU80GYL3txkiVMPAyv
 BzFHpfeu8p7PapOBiKrEHGdjoNCR3EZkfTWi1cxgpGMn9wU5fWLsKpSS8RGyL4Hjlja+
 2GxhL4QiRoHq7+iORVyg6vbsPuUbOw8gUahqy9QIcvrEqOo30XJdTxcJs/hnipRlAI5P
 ceJA==
X-Gm-Message-State: AOAM533CA9zQqf06GEdHn1GIry3LLJ0H/6orwBdCFYZvyHC0cE3tlN+V
 ip2rcCvTkE/GD3J0Zhp1u1+p1K5Q
X-Google-Smtp-Source: ABdhPJyXCG5iItk0h7FraL6DAdOoZnM/67buUF1Q4Y5zDV4e39KvsNuvOzeKTZhj2TtDcOBTQRLPrw==
X-Received: by 2002:a92:1a0f:: with SMTP id a15mr25408587ila.266.1618965299696; 
 Tue, 20 Apr 2021 17:34:59 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id 6sm241569iog.36.2021.04.20.17.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 17:34:59 -0700 (PDT)
Subject: Re: [QUERY]drivers: pnp: isapnp:proc.c: assignment inside if statement
To: anupamakpatil123 <anupamakpatil123@gmail.com>,
 kernelnewbies@kernelnewbies.org
References: <20210420180525.m2fckb2iowrzo2c4@ubuntu>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <1aad00cf-fb4e-8d8d-775b-2d202133bdee@linuxfoundation.org>
Date: Tue, 20 Apr 2021 18:34:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420180525.m2fckb2iowrzo2c4@ubuntu>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, bkkarthik@pesu.pes.edu
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

On 4/20/21 12:05 PM, anupamakpatil123 wrote:
> This is a code snippet from line 63 of drivers: pnp: isapnp: proc.c
> This is an error I came across while looking through some checkpatch
> errors.
> 
> if (!(de = bus->procdir)) {
>                  sprintf(name, "%02x", bus->number);
>                  de = bus->procdir = proc_mkdir(name, isapnp_proc_bus_dir);
>                  if (!de)
>                          return -ENOMEM;
>          }
> 
> In the above code snippet is assignment inside the if statement
> necessary? Can the assignment be done outside the if statement as it is
> a good coding style practice?
> Is that change sufficient? I dont want to just shut checkpatch errors as I
> really want to improve the code.
> 
> Thankyou for taking your time to go through this.
> 

This looks correct to me. However, it could be changed to get rid
of the checkpatch error. It would be simple fix.

You could send patch in and get feedback from the driver maintainer.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
