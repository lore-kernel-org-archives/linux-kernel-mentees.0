Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9734C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:45:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E8E2072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zco6WLh1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E8E2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E02C893BD;
	Mon, 13 Jul 2020 13:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMxj0hdfc18b; Mon, 13 Jul 2020 13:45:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 04B60893BA;
	Mon, 13 Jul 2020 13:45:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E52E4C0888;
	Mon, 13 Jul 2020 13:45:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57FF8C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 50FC0893BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMIldUSV8elC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:45:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8EF97893BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:45:38 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id g20so13775521edm.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qhevLNzqIY18aN/wr6u6dhwAFYFM0C8iq2L8OEb+kGs=;
 b=Zco6WLh1gHLq9ofieCcTsVnVgxGxMSvX5PMVP8dScAEfSEcZIM6fzvoI2YCUiTr953
 E0+6tQCtFpYLamgC7BJpN1bH4rJWf2vFJ/hN+z5CkAd5wN78F9Ug5OUX+zTkdJOYoQ/W
 r4gk2qpTW2sV0FeMHlTZS/uid7ltOJpq9BGS3MfLJPIpMz2ZPRRd7NXz9yFkXihCPo9x
 Q009oqUiWBL24xy3wxUGX7NjLj9TJAgokQ/XlNj8QZs2zGDv9kL5ScadFMWXfPBnHzKu
 7r/5BVy/aiMJJuytWkgd8QvxYC3afecfyvK1UM3OnbnG1Ixkw4tuzppAF7x4Dr3GD/31
 JDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qhevLNzqIY18aN/wr6u6dhwAFYFM0C8iq2L8OEb+kGs=;
 b=aNSdQ222NJf22/7yqu4443sJ5yXrXWfMkBly3aHwDWTqG1UT9sZNHkjyIDUHT6l5Hr
 C0FIGG92KVaKMrrWa04c3doCdWMP4y1KHEpDRRl78PgKXo/sTo1B9zSGzdUMsmO03WQK
 4XcIYyizbqHYvjgl8gdfA8Q+djva9Glr4hMv4ZrYvs7RJlG3Mqy71iaM58HTbrMhtrIN
 yiKjzN87dHKbI6/y+2W34tSZ3GmIoGiPCV/+EmNiqJkjSYqCmF7DubpY+/Yi5cNkb+Wu
 ri3IrtRwzpVV/HtQPaluLqd0ZaWlM2cy2egX3LtODjDyP37A5+AIGywZ92lBDWoDdxIa
 x93w==
X-Gm-Message-State: AOAM532ET1naE3W4JVsr9Wy4t07ii6IdSlVmDN3jBkh4MQlEpVJdBxLf
 IDKFpOcIjGLEKda2f/4XeR4=
X-Google-Smtp-Source: ABdhPJw8tcl7JEi/xxx+7c1G1kruZxLTgevyq466t9suOvpPgeEnjCnFABfVtglpp72QMrlY9qInqQ==
X-Received: by 2002:a05:6402:b4c:: with SMTP id
 bx12mr33646902edb.157.1594647937071; 
 Mon, 13 Jul 2020 06:45:37 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f23:5700:d1f7:b47e:ecba:b607?
 (p200300ea8f235700d1f7b47eecbab607.dip0.t-ipconnect.de.
 [2003:ea:8f23:5700:d1f7:b47e:ecba:b607])
 by smtp.googlemail.com with ESMTPSA id gr15sm9522994ejb.84.2020.07.13.06.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 06:45:36 -0700 (PDT)
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>, helgaas@kernel.org,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-13-refactormyself@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <e6610668-4d16-cbaa-8513-9ca335b06225@gmail.com>
Date: Mon, 13 Jul 2020 15:45:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713122247.10985-13-refactormyself@gmail.com>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 12/35] r8169: Tidy
	Success/Failure checks
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

On 13.07.2020 14:22, Saheed O. Bolarinwa wrote:
> Remove unnecessary check for 0.
> 
> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
> ---
> This patch depends on PATCH 11/35
> 
>  drivers/net/ethernet/realtek/r8169_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
> index 206dac958cb2..79edbc0c4476 100644
> --- a/drivers/net/ethernet/realtek/r8169_main.c
> +++ b/drivers/net/ethernet/realtek/r8169_main.c
> @@ -2656,7 +2656,7 @@ static void rtl_csi_access_enable(struct rtl8169_private *tp, u8 val)
>  	 * first and if it fails fall back to CSI.
>  	 */
>  	if (pdev->cfg_size > 0x070f &&
> -	    pci_write_config_byte(pdev, 0x070f, val) == 0)
> +	    !pci_write_config_byte(pdev, 0x070f, val))
>  		return;
>  
>  	netdev_notice_once(tp->dev,
> 
Patches 11 and 12 are both trivial, wouldn't it make sense to merge them?
Apart from that: Acked-by: Heiner Kallweit <hkallweit1@gmail.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
