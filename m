Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3196C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 21:22:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CCDB613AC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 21:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CCDB613AC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 319E040611;
	Mon,  4 Oct 2021 21:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-r8WmS_j8IU; Mon,  4 Oct 2021 21:22:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7D25C40628;
	Mon,  4 Oct 2021 21:22:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54547C0011;
	Mon,  4 Oct 2021 21:22:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60E45C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 21:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41F766073C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 21:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iR0KYnP6UeMv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 21:22:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8978760727
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 21:22:27 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id 5so9449117iov.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 14:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MuilptXu/lrbHdYIjm49Orq1L38EfLHYhkCQZMQN58Y=;
 b=YxVu7riC7j4LVz42GKgYXGTFCKJqdQPDoBbNgq6DmDMCPYIgq7r0JSZLEMwRUv3grr
 cdiedFdp4r+iNBBN/mXe7pWqYYu2JUV8jVVKsIYViY6+g5jaCREmtkDy07NScmLqvK+S
 JgdZ4x2qrsy/bvSg3+wlyjybySzvvSnkRl7J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MuilptXu/lrbHdYIjm49Orq1L38EfLHYhkCQZMQN58Y=;
 b=pR19RqiqE8V65FKXLTc1HY55+9g9p7Do9D6MZWp8zCuMPt8HoIgdMGAtrW70lNNbtn
 USaXDI/Qwx3rz2tRh+12amFmwki1zskI9XN7gmYUQhUoDyB9CuXpySfRTe4DUUkA8QVQ
 Yrpa5nhKQiYvJjJ0rQF0z7tkzUwGMDhztxVzOGtZ5nyVNTyALB0SwDfz2HX14NIU7FbE
 zhqUpGhx1B+J0gv0nXkGU4nV0qNF+DyvMVtZVqLDwhyGz9UI7nm1VqknO5DYKbDSN71q
 FK6TuIZ+1Nd1OxzurfD4tedlu03EqyZ7DAEbytX0PlDzQYldDm8mjopMQaKEreCWPNbA
 C3XQ==
X-Gm-Message-State: AOAM531JXORAsBisgq3nrsKLDeLj3DASB53ifbtYKH9YGBD35QwH8Ku3
 Orb9vaZkg6L8Vbi/PIBgtw633iP7
X-Google-Smtp-Source: ABdhPJx1RzTfEn170/4xRIBn0Qw7X57+hgrKnGZ4qAFynZArJaATjwdrmMQXQOmPcAV4ahbaG9Xzng==
X-Received: by 2002:a5e:a916:: with SMTP id c22mr10780139iod.211.1633382546674; 
 Mon, 04 Oct 2021 14:22:26 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id v63sm9635481ioe.17.2021.10.04.14.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 14:22:26 -0700 (PDT)
Subject: Re: [PATCH v3 1/8] PCI/AER: Remove ID from aer_agent_string[]
To: Naveen Naidu <naveennaidu479@gmail.com>, bhelgaas@google.com,
 ruscur@russell.cc, oohall@gmail.com
References: <cover.1633357368.git.naveennaidu479@gmail.com>
 <b4c5a5005d4549420cf6e86f31a01d3fb2876731.1633357368.git.naveennaidu479@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a51d90cb-2ffb-8d4e-6097-54d03e6ef693@linuxfoundation.org>
Date: Mon, 4 Oct 2021 15:22:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b4c5a5005d4549420cf6e86f31a01d3fb2876731.1633357368.git.naveennaidu479@gmail.com>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On 10/4/21 8:29 AM, Naveen Naidu wrote:
> Before 010caed4ccb6 ("PCI/AER: Decode Error Source RequesterID")
> the AER error logs looked like:
> 
>    pcieport 0000:00:03.0: AER: Corrected error received: id=0018
>    pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, id=0018 (Receiver ID)
>    pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
>    pcieport 0000:00:03.0:    [ 6] BadTLP
> 
> In 010caed4ccb6 ("PCI/AER: Decode Error Source Requester ID"),
> the "id" field was removed from the AER error logs, so currently AER
> logs look like:
> 
>    pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03:0
>    pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
>    pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
>    pcieport 0000:00:03.0:    [ 6] BadTLP
> 
> The second line in the above logs prints "(Receiver ID)", even when
> there is no "id" in the log line. This is confusing.
> 

Starting your commit log to say that message are confusing and then talk
about why will make it easier to understand why the change is needed.

> Remove the "ID" from the aer_agent_string[]. The error logs will
> look as follows (Sample from dummy error injected by aer-inject):
> 
>    pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03.0
>    pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver)
>    pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
>    pcieport 0000:00:03.0:    [ 6] BadTLP
> 

It is good to see before and after messages. However, it will be helpful
to know why this change is necessary. It isn't very clear why in this
commit log.

> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>

Extra signed-off-by?

> ---
>   drivers/pci/pcie/aer.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9784fdcf3006..241ff361b43c 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -516,10 +516,10 @@ static const char *aer_uncorrectable_error_string[] = {
>   };
>   
>   static const char *aer_agent_string[] = {
> -	"Receiver ID",
> -	"Requester ID",
> -	"Completer ID",
> -	"Transmitter ID"
> +	"Receiver",
> +	"Requester",
> +	"Completer",
> +	"Transmitter"
>   };
>   
>   #define aer_stats_dev_attr(name, stats_array, strings_array,		\
> @@ -703,7 +703,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   	const char *level;
>   
>   	if (!info->status) {
> -		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
> +		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent)\n",
>   			aer_error_severity_string[info->severity]);
>   		goto out;
>   	}
> 

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
