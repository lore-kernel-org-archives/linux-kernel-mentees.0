Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EBCC433F1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 16:25:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C347206E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 16:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="AJgFVAeq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C347206E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7E923203A4;
	Mon, 27 Jul 2020 16:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TF+ugtdJCys4; Mon, 27 Jul 2020 16:25:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1C044204E7;
	Mon, 27 Jul 2020 16:25:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07BF7C004F;
	Mon, 27 Jul 2020 16:25:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8009C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 16:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C411D876DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 16:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hN5ASkrTcrxp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 16:25:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C8DB9872E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 16:25:44 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id k1so9767052pjt.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PgFDMWbXvBiEOAL8M87yEjCfGoE6x1y/jQ7//nauM8k=;
 b=AJgFVAeqNc0eTNWKlRiSdboLLmWGtucMVtlkCPLfxpBGGAOOTw7XJMakcq6cwtXPte
 LEWZgdT2NaR/JInb5XxIN5Smg+ng7vi9zQeZMCLwjk1ov8i28QxqN+dvgNRo6VfRyAGc
 GBFvwT83gAamdChAgmQR7vLsWjeOfx5Uw2LjnV++DPbvKy39G2ymgTSAdCMm2x6Our1I
 94YsqiAYqbGhTjUwF1TYPnjl7nZPE4pLK5AeHvUmbBHlUPuq7gkHP2amjZG1T8c4njdx
 M1wCjXnOwFI6Xm2Go58ZuKECCu6Tjw7+nmjJ0ZRUF/3Eill1r/Y0cYhEGxbrQi2p6703
 1Qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PgFDMWbXvBiEOAL8M87yEjCfGoE6x1y/jQ7//nauM8k=;
 b=RRCbPFb271on82g2D257tn4/mcEd9j4vqgCtPeOb6UfaB9RuVlBUEef1XmE2X0S2Z9
 TjIbKEyHmQjr1yWl8JkJuwpnjycj/gItGXrFXixNMhegTr8KoMbfs78NC0O0DvgAYn7u
 xz/onsbFuN4h5h2Nr3vARVPqMgRax3iPbiD+9V8V8QtSiG7waQtlOElFUwh3lwv2DDTG
 VkvlnQtKzq9qswYZuXPzoPabsbwCEqk7zuZseB32vlLh2YgfvISuIGeaX5c3K+T5Qqx1
 vQA94nHedjAjZ2SfMpmLMTjP0v+8+xBXLJEX4jkRyaNLt8+OidDWQaEQyl2lyf/25SyT
 2FLw==
X-Gm-Message-State: AOAM533GCGUadoXsJmjIn0vd3SZIm2lBDj4c5NkgFEhcFv9kDSKraEln
 FKJsDcnoE7hf6DFVXolp3p0uTw==
X-Google-Smtp-Source: ABdhPJzhbpBDCDrPt1P1xzvTKEDPhAXqIMc+mtjQuLAEnv/alhrt/rhN2nq6GrLuC3iTTLwresjkGw==
X-Received: by 2002:a17:902:900b:: with SMTP id
 a11mr19177442plp.315.1595867144116; 
 Mon, 27 Jul 2020 09:25:44 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id v15sm15621045pgo.15.2020.07.27.09.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 09:25:43 -0700 (PDT)
To: Peilin Ye <yepeilin.cs@gmail.com>
References: <20200727161932.322955-1-yepeilin.cs@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <78d90a98-7bd5-1604-cc27-90842c365ecf@kernel.dk>
Date: Mon, 27 Jul 2020 10:25:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727161932.322955-1-yepeilin.cs@gmail.com>
Content-Language: en-US
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] block/scsi-ioctl: Prevent
 kernel-infoleak in scsi_put_cdrom_generic_arg()
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

On 7/27/20 10:19 AM, Peilin Ye wrote:
> scsi_put_cdrom_generic_arg() is copying uninitialized stack memory to
> userspace due to the compiler not initializing holes in statically
> allocated structures. Fix it by initializing `cgc32` using memset().

Could also just add the appropriate pad, so the compiler does the
right thing.


diff --git a/block/scsi_ioctl.c b/block/scsi_ioctl.c
index ef722f04f88a..72108404718f 100644
--- a/block/scsi_ioctl.c
+++ b/block/scsi_ioctl.c
@@ -651,6 +651,7 @@ struct compat_cdrom_generic_command {
 	compat_int_t	stat;
 	compat_caddr_t	sense;
 	unsigned char	data_direction;
+	unsigned char	pad[3];
 	compat_int_t	quiet;
 	compat_int_t	timeout;
 	compat_caddr_t	reserved[1];

-- 
Jens Axboe

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
