Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D15DC282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 16:14:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 340FD20661
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 16:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TXzR4VXX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 340FD20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E9658843E9;
	Thu,  9 Jan 2020 16:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6cOmIRx09ivb; Thu,  9 Jan 2020 16:14:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8614E83616;
	Thu,  9 Jan 2020 16:14:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C1A2C18DC;
	Thu,  9 Jan 2020 16:14:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5E46C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 16:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A130121519
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 16:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3UrE3kSPIxXU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 16:14:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 68C6A203A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=23iMw4u+/DVo7oz9I68gScHBJuS7WAFFLyCdELFXaPM=; b=TXzR4VXX2s5VyCBs5oKtVPrTw
 yHb9OfAxH0ZDUVrcmxYyGIxXK33AvONs/jnHI5eyDzIAtRLeRlUQ3Qky4FzdNoM+5yQvPmDPcG6kL
 vSAKJ/yCH3gDvF1bthd/9HcvS8G0p9adTaMxExDSwPdKNP/g/NrMGK3hDlQb1F1Yk4EeoeTctjm+8
 aWHwvdNpdPML5xf6wdwIF+qVKhLHXgBpg2b6FfKGmZDTcjDDPrjWULZEnnTgUX37GkVtKZPs4mn3+
 TNq/smGYGs1u/LnHlGfwxs+IC/Xr3uTrxJh1WkoKZ4zlJqn7gltar1n/eiPgmb36YbyW+VsfSdgUk
 Z18m9BCVw==;
Received: from 177.206.132.169.dynamic.adsl.gvt.net.br ([177.206.132.169]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipaRd-0007cV-Ng; Thu, 09 Jan 2020 16:14:03 +0000
Date: Thu, 9 Jan 2020 17:13:45 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200109171345.2cf30990@kernel.org>
In-Reply-To: <20200109152408.919325-2-dwlsalmeida@gmail.com>
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
 <20200109152408.919325-2-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: sean@mess.org, linux-kernel@vger.kernel.org, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/1] media: dvb_dummy_tuner:
	implement driver skeleton
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

Em Thu,  9 Jan 2020 12:24:08 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Implement the skeleton for the tuner driver in a separate file.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/tuners/Kconfig           |   7 ++
>  drivers/media/tuners/Makefile          |   1 +
>  drivers/media/tuners/dvb_dummy_tuner.c | 153 +++++++++++++++++++++++++
>  drivers/media/tuners/dvb_dummy_tuner.h |  20 ++++
>  4 files changed, 181 insertions(+)
>  create mode 100644 drivers/media/tuners/dvb_dummy_tuner.c
>  create mode 100644 drivers/media/tuners/dvb_dummy_tuner.h
> 
> diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
> index e104bb7766e1..efa1591fe0ae 100644
> --- a/drivers/media/tuners/Kconfig
> +++ b/drivers/media/tuners/Kconfig
> @@ -296,4 +296,11 @@ config MEDIA_TUNER_QM1D1B0004
>  	default m if !MEDIA_SUBDRV_AUTOSELECT
>  	help
>  	  Sharp QM1D1B0004 ISDB-S tuner driver.
> +
> +config MEDIA_TUNER_DVB_DUMMY_TUNER
> +	tristate "Dummy tuner"
> +	depends on MEDIA_SUPPORT && I2C

> +	default m if !MEDIA_SUBDRV_AUTOSELECT

Actually, this is a dummy driver. It should not be auto-selected, as no
real hardware depends on it. We don't want production distros to come with
those test drivers.

When we add a bridge driver (let's say we call it DVB_DUMMY_BRIDGE), then
what we could do here would be something like:

	depends on DVB_DUMMY_BRIDGE
	default y

Cheers,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
