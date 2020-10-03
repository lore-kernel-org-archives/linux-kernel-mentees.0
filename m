Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEB3C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 05:54:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E60C206CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 05:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IO+9gt4y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E60C206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C669986C99;
	Sat,  3 Oct 2020 05:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTilDATXfkhc; Sat,  3 Oct 2020 05:54:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B05F886C8F;
	Sat,  3 Oct 2020 05:54:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A05AC0889;
	Sat,  3 Oct 2020 05:54:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8CEBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 05:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A93E8204D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 05:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWDlRG0k9-kH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 05:54:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id A906420420
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 05:54:39 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id q4so2440108pjh.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 22:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=m4KS3848PrcvqXAzCFiimfxqlRCB/TpZjyjy6cihM+Q=;
 b=IO+9gt4yl9NCpu4sQPrBhRhiq5PV/m3qFdVc/+KFj2wzRA54BRBSYhOFP4yre5nL1Z
 IvyPI5DZJfh1pijkFXH987LFSnTBVMRjhchmXLXetC9o2ANdZw/k3XIL1n8iI/laaYEd
 8VSL/vFWvDG22QjOI2U4WEjNmvqd2LuXbmIwxXVH6mUqaKW1Rwq2cBPVeCVOt1DT8aKN
 bqjRNeYSkp14h2PoUGJ+ubwJdAK9o4emmXR1wjlAlqhfTob8AeeMy5V1H3A8vNYehaOV
 K3nSRxXhAWNzjNKYzK//SAKFxwVg+2LRaxusM0Rulwcp5k+sRWWLpq5hNKTG/DHmstLk
 +nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=m4KS3848PrcvqXAzCFiimfxqlRCB/TpZjyjy6cihM+Q=;
 b=PIKnFTm561r3/JgxNxyjQh5GMx5yc0YFp++pXAnS7AcEs0XumwsUz5zBu4o9r6akDi
 Va5/JRHSGKEPfkMXGYVqHLuEopGaXmIuG0sHRal2vkZ6Msmlxd/DdVGAc3qI95JFX+Bm
 aYK3xrMiRwwQMP2Lax8KuO7ScxoEh8MGaFj8DZU9HkL8Seb8X05lOJwy5nB1J9AyvXNa
 gIm5Gamzex6eM/3ZzfDcrEeGA1/1ZfkCMrRZe+hIcYx5neDDzMd2KoLjDLHpA2FTdnoo
 MfaMjJ0dhtx7N1r/wcR+f6P9Ly08w/W6rCogD04hapq98hFzIzTqTby/EHfaSDgpZyay
 l72g==
X-Gm-Message-State: AOAM532nl+EEM/A9e82Xh1L09Y1wxUTalhwSysDc8Mwfn3S3gAlr10uY
 BBCetKWRw/2o5nW4ODaJGNU=
X-Google-Smtp-Source: ABdhPJwH2hfwWWdulLEsYcNVwJzjU39Yd92fij21PqSuzUnMzFUBCn3JLuFtQAF1U5BbEiTcaEkSFA==
X-Received: by 2002:a17:90a:5588:: with SMTP id
 c8mr6110448pji.224.1601704479116; 
 Fri, 02 Oct 2020 22:54:39 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id j19sm4245113pfi.51.2020.10.02.22.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 22:54:38 -0700 (PDT)
To: David Miller <davem@davemloft.net>
References: <20201001073221.239618-1-anant.thazhemadam@gmail.com>
 <20201001.191522.1749084221364678705.davem@davemloft.net>
 <83804e93-8f59-4d35-ec61-e9b5e6f00323@gmail.com>
 <20201002.153849.1212074263659708172.davem@davemloft.net>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <2e4f7bdb-76c0-9ee4-88bf-5d31ded17116@gmail.com>
Date: Sat, 3 Oct 2020 11:24:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201002.153849.1212074263659708172.davem@davemloft.net>
Content-Language: en-US
Cc: petkan@nucleusys.com, syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: rtl8150: prevent
 set_ethernet_addr from setting uninit address
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 03-10-2020 04:08, David Miller wrote:
> From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> Date: Fri, 2 Oct 2020 17:04:13 +0530
>
>> But this patch is about ensuring that an uninitialized variable's
>> value (whatever that may be) is not set as the ethernet address
>> blindly (without any form of checking if get_registers() worked
>> as expected, or not).
> Right, and if you are going to check for errors then you have to
> handle the error properly.
>
> And the proper way to handle this error is to set a random ethernet
> address on the device.

Yes, I've understood that now.
I've prepared and tested a v3 accordingly, and will have it sent in soon en=
ough.
Thank you so much for this!=A0 :)

Thanks,
Anant

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
