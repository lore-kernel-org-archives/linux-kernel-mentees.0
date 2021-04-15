Return-Path: <SRS0=fLed=JM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF6DC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Apr 2021 17:25:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48885610F7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Apr 2021 17:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48885610F7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F28D8608A3;
	Thu, 15 Apr 2021 17:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxIaLRfpCg9R; Thu, 15 Apr 2021 17:25:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3429E60067;
	Thu, 15 Apr 2021 17:25:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E7B9C000B;
	Thu, 15 Apr 2021 17:25:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38AECC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 17:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26E9B608A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 17:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYnmTw9kQAq9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 17:25:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D26FC60067
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 17:25:26 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id v123so18141061ioe.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 10:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GsOuPPXVW4w5SaKrHkuMOlALa3wJPeUiMP2AEL1u7RQ=;
 b=eR+MqiJAciFex4xEzDJOxPmcm+q5i26BkgezRf1x0fEQl3NHSgBLa5TP9pR1npDIV5
 Yf7CxrFd9udDLyWpBXidSszqjF4yCcJ8OgP2xzlTsWBmBqCdjoKaYCu9QurjwYwXGUbN
 ANMBU5zoI2Uha5/2D9YnRWL4btVeSg+eINYkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GsOuPPXVW4w5SaKrHkuMOlALa3wJPeUiMP2AEL1u7RQ=;
 b=rxfzfVr+zqCVvwFAm1mwQrWoz5LmO+7MQfjoZRuZPKR03TP2d5qczdQ/hCA9gyYFss
 WRZIzE0uI8jjeN1aeMIuiBjn5PSCvwfFVlbj9uEDPxIoNLnmYv7qHMUWKXnNUnSSdcIT
 FMZ8wDUTXZ385jKqv6E5pzzOLBFPQfxl6JFqU/MTYO0mNrhIR6tvurJwT55JcintuKmF
 +TxhGT4t4hMjMHYLfQKOUTw70ArhChv6hUqimYTQTfAXMwB8Nqtsa5Key8YYmYlM8p8p
 6WicBHlv/RPwFHcxcMGIQkxVIdnpDrBYp+g/5lAFGouH7hlvOzFvpM+SNcO94UieNaZm
 GJ/w==
X-Gm-Message-State: AOAM530aGYvBNaLI/xB9gY83OQo7XcuTxIKuiUEK5HucOQCrhtzIJvSK
 mSptwDkbI4sj9hn8ZfdsyQoG241L
X-Google-Smtp-Source: ABdhPJzgOh/139WOD+rz5V+xMN7wmmK6v8ZYRYPnJaypimqhkKwPfTv427lLvsMaBebjSO5kLG45pA==
X-Received: by 2002:a5d:9659:: with SMTP id d25mr280546ios.146.1618507526027; 
 Thu, 15 Apr 2021 10:25:26 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id h18sm1346069ioh.42.2021.04.15.10.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 10:25:25 -0700 (PDT)
Subject: Re: [PATCH RFC v3] media: em28xx: Fix race condition between open and
 init function
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>, mchehab@kernel.org
References: <20210415140724.15398-1-igormtorrente@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d254bf85-5185-6b21-afc6-fb00a9278186@linuxfoundation.org>
Date: Thu, 15 Apr 2021 11:25:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415140724.15398-1-igormtorrente@gmail.com>
Content-Language: en-US
Cc: kernel test robot <lkp@intel.com>,
 syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
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

On 4/15/21 8:07 AM, Igor Matheus Andrade Torrente wrote:
> Fixes a race condition - for lack of a more precise term - between
> em28xx_v4l2_open and em28xx_v4l2_init, by detaching the v4l2_dev,
> media_pad and vdev structs from the em28xx_v4l2, and managing the
> lifetime of those objects more dynamicaly.
> 
> The race happens when a thread[1] - containing the em28xx_v4l2_init()
> code - calls the v4l2_mc_create_media_graph(), and it return a error,
> if a thread[2] - running v4l2_open() - pass the verification point
> and reaches the em28xx_v4l2_open() before the thread[1] finishes
> the deregistration of v4l2 subsystem, the thread[1] will free all
> resources before the em28xx_v4l2_open() can process their things,
> because the em28xx_v4l2_init() has the dev->lock. And all this lead
> the thread[2] to cause a user-after-free.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-and-tested-by: syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com
> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
> ---
> 
> V2: Add v4l2_i2c_new_subdev null check
>      Deal with v4l2 subdevs dependencies
> 
> V3: Fix link error when compiled as a module
> 
> ---
>   drivers/media/usb/em28xx/em28xx-camera.c |   4 +-
>   drivers/media/usb/em28xx/em28xx-video.c  | 300 +++++++++++++++--------
>   drivers/media/usb/em28xx/em28xx.h        |   6 +-
>   3 files changed, 209 insertions(+), 101 deletions(-)
> 

The changes looks good to me. Have you tried building as a modules and
running modprobes and rmmods? You can do that without a device.

thanks,
-- Shuah


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
