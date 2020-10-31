Return-Path: <SRS0=CDUK=EG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81ABFC4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 21:31:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1F1206E9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 21:31:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vWCONXYn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1F1206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CBF0C2A0D9;
	Sat, 31 Oct 2020 21:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3PV5UXx9nR+0; Sat, 31 Oct 2020 21:31:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8B5E5203D8;
	Sat, 31 Oct 2020 21:31:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 673FBC088B;
	Sat, 31 Oct 2020 21:31:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E27FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 21:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 54BC22A0D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 21:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ijvWWDZOcR54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 21:31:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 392C2203D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 21:31:45 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f38so7738144pgm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 14:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RCKrBdi/cuSwF+6eSqklRGXkPD1B4n+vjLH1fafi1Qg=;
 b=vWCONXYnUidMTCnGsyyuztaQpLNmqARfQJ2C/VrYifLJhCv0ExU4LHwl4x1PDDJW52
 aEDwrl+chZ+M4q2Fz3jSdvjrMu6MEtHbRBnI2q+Udub9vnLkD/w//X13eeed6WFBfnWa
 g3fpby3wVcwVlXlIBszHnmW5jLA5sfMM8uwaVj/X5SfQhh5zA+BVQgH6m5rfFn10K1Y5
 8PeFxiyoB0u8cf9q9DE2RWOyYCAg9AWjfX1Tfa4hgGwaVH7sIqXL37/rU0ce9E/YKBEJ
 qYSLiJ98ytk7J2BJMatoI7lwBJLuS9ZIZ9KRRiXqESTbPXkfSJa2RkBefDCMfuJ+Nup5
 iqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RCKrBdi/cuSwF+6eSqklRGXkPD1B4n+vjLH1fafi1Qg=;
 b=BZrTUCEOfiFCfR3mB04ZE6HwdGJORCoFDqwyuk0/HHgmgL6RMCnhfpzWha8o2/I/l9
 /o8AaQ/ACT9e6moLX57z0MMbjz/dj9boF7RLt94DnepVSc2UPqhPmED6JKrU6MW12qF+
 ydZzXKOeG6YJFVzDdMEEC/9M5Bx+iSE+f9DBdprHVkKImxsJgD52i54RcjjPG82VpBF7
 n0LoiOFh9QZqCxVRkf0OBoTI4+t3r8E+wv1TI9OuuNPxi8wX6ht2SciTXr44AYl/OppS
 L58Jv4uE6k3IwHGfEkmV9itUMTa44ZVDqSeQsZX+R1EgVHNfg4KASp2geqSG5sW/Qn3J
 jEIQ==
X-Gm-Message-State: AOAM532kvnOi005UzAPsoCQRKdNOaPOZzbY+ShM6xeUPsxMH5irylltw
 PscxgDMEmckk1YlqimRsinD3/qJCig9XVw==
X-Google-Smtp-Source: ABdhPJxoDqQlWCNGptgKYg0kKtOKxYD8uHOWpgQjtzMSrZJQccWOXnL0yAGVDp9mamOeM66SCupGPw==
X-Received: by 2002:aa7:989a:0:b029:18a:8d62:e024 with SMTP id
 r26-20020aa7989a0000b029018a8d62e024mr6251979pfl.71.1604179904084; 
 Sat, 31 Oct 2020 14:31:44 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.221.93])
 by smtp.gmail.com with ESMTPSA id s38sm8818573pgm.62.2020.10.31.14.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Oct 2020 14:31:43 -0700 (PDT)
To: Jakub Kicinski <kuba@kernel.org>
References: <20201010065623.10189-1-anant.thazhemadam@gmail.com>
 <20201029132256.11793-1-anant.thazhemadam@gmail.com>
 <20201031141143.5c8463e1@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <f31767d8-cb06-f5cb-bd48-5822d12132c2@gmail.com>
Date: Sun, 1 Nov 2020 03:01:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201031141143.5c8463e1@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Language: en-US
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: usbnet: update
 __usbnet_{read|write}_cmd() to use new API
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


On 01/11/20 2:41 am, Jakub Kicinski wrote:
> On Thu, 29 Oct 2020 18:52:56 +0530 Anant Thazhemadam wrote:
>> +	return usb_control_msg_recv(dev->udev, 0,
>> +			      cmd, reqtype, value, index, data, size,
>> +			      USB_CTRL_GET_TIMEOUT, GFP_KERNEL);
> Please align continuation lines after the opening bracket.

I will do that, and send in a v3 right away.

Thanks,
Anant

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
