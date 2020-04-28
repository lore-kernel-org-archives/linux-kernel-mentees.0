Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEE7C83000
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:54:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8913320757
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:54:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzIrlcfl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8913320757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 61ABE880CA;
	Tue, 28 Apr 2020 17:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNMEBi7ISp59; Tue, 28 Apr 2020 17:54:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C88A188072;
	Tue, 28 Apr 2020 17:54:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD7FBC0863;
	Tue, 28 Apr 2020 17:54:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 099C6C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D5F7022176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QsOZoqYKwjxT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:54:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 6798720345
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:54:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x25so3843642wmc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kPRhUAruP9ZZUlUSalbcEM5n1KiKrGdKS/bI8RHpGas=;
 b=VzIrlcflOdjeR1fwYDtSL89m6SsO89lykIMEOlJGtenVL2zFa2SH6rFqFT2UjF9URv
 x32R7h+ehd5+fCqDs4i2QqTqMtbtJq7ksUvi3NPdpi4zt8iCnqxR7eHuiXWsh0iFPQdd
 VW3ZJ8CLhQuk5ZyRewNoQE9q53fMqZgE4MJgZYHYFO6pZU4HswzKQfJTV9Ie76OTWKy4
 Oag+9MLENJI88mGlyNlnpYFfJCaiw3rj0OlZcqNzrEVAKj16nsAqby9J1nicQvGyu8RQ
 CNSkSX4q9L1knk3X4R3ywUWJQxzv/GWi0t1T9RoFMNDgTjBKPf6xC5/MYBEu52PTum69
 GdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kPRhUAruP9ZZUlUSalbcEM5n1KiKrGdKS/bI8RHpGas=;
 b=AmDR7rI94MwPnBahVuQJIbEdbzaGiPllokxf3k2ARGJZ9uCWk58n8MME/Dc3+mWKPt
 nVrQgrHhqUlGJnMACG51X9/KF36tX3WeNehwQ5XcQ/tWo0Tp21AzrAXs/0BVJvE8dYWp
 8R5zMoTfKYSUFUIMaAA6rN2wqyXYKjJWKOVQs46c5V39PjplwH1jdL5nnPPSWOU/LQVO
 tmZEp24c4Oin9A2Vytb9ULEMfMWSxDYx+017LS7p4M2hpWZET9eDGYfHd7G3Fsk9/JL5
 rCEX9Vw1o0dP+MYvcpnUJr8mdWxiRoSQlLfRqSoUSu1VWq8Gyakvpdr9JQHa/iBMkV3t
 MZzg==
X-Gm-Message-State: AGi0Puamy24vveU9Wjm5Sfs1ts1bu1AAHHUKWiGCD+vMIJbc3YurOGAW
 AtbHOm2GXUChZ/Avw07NLAw=
X-Google-Smtp-Source: APiQypI5c0tioNdOcBvuFeeB/URE9SL/vqn9mnUU2V5ut1ZclmE1JVgT+DvDyIe3sxH/nNTp8KLb+w==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr6170922wmi.83.1588096459599;
 Tue, 28 Apr 2020 10:54:19 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f3a:4f00:8150:1bad:dbab:ce5a?
 (p200300EA8F3A4F0081501BADDBABCE5A.dip0.t-ipconnect.de.
 [2003:ea:8f3a:4f00:8150:1bad:dbab:ce5a])
 by smtp.googlemail.com with ESMTPSA id j17sm29522553wrb.46.2020.04.28.10.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2020 10:54:18 -0700 (PDT)
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Shannon Nelson <snelson@pensando.io>, Jakub Kicinski <kuba@kernel.org>,
 Martin Habets <mhabets@solarflare.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, netdev@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, linux-kernel-mentees@lists.linuxfoundation.org,
 rjw@rjwysocki.net
References: <20200428144314.24533-1-vaibhavgupta40@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <d33991cc-c219-dc27-7559-f30dd5f4aa0a@gmail.com>
Date: Tue, 28 Apr 2020 19:54:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428144314.24533-1-vaibhavgupta40@gmail.com>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 0/2] realtek ethernet : remove
 legacy power management callbacks.
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

On 28.04.2020 16:43, Vaibhav Gupta wrote:
> The purpose of this patch series is to remove legacy power management callbacks
> from realtek ethernet drivers.
> 
> The callbacks performing suspend() and resume() operations are still calling
> pci_save_state(), pci_set_power_state(), etc. and handling the powermanagement
> themselves, which is not recommended.
> 
Did you test any of the changes? If not, then mention this at least.
A typical comment in the commit message would be "compile-tested only".

In addition the following should be changed.
[Linux-kernel-mentees] [PATCH v2 0/2]
Use
[PATCH net-next v2 0/2]
instead.

> The conversion requires the removal of the those function calls and change the
> callback definition accordingly.
> 
> Vaibhav Gupta (2):
>   realtek/8139too: Remove Legacy Power Management
>   realtek/8139cp: Remove Legacy Power Management
> 
>  drivers/net/ethernet/realtek/8139cp.c  | 25 +++++++------------------
>  drivers/net/ethernet/realtek/8139too.c | 26 +++++++-------------------
>  2 files changed, 14 insertions(+), 37 deletions(-)
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
