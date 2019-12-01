Return-Path: <SRS0=yDVd=ZX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3C7C432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 07:57:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C74C20833
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 07:57:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WayxkVcF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C74C20833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2E17E89434;
	Sun,  1 Dec 2019 07:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4T4uDrw7mg2p; Sun,  1 Dec 2019 07:57:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A3F3889432;
	Sun,  1 Dec 2019 07:57:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DB9DC1DD9;
	Sun,  1 Dec 2019 07:57:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D46AC087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3BA9B8669A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XC33pVDmwBfr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:57:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9758088FF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R3O1tEL04g7Y6dxw+q2oztyWrq1wqe4VVQQmpY4zt24=; b=WayxkVcFZEUtUXElTZL7Dnkui
 k1XHIze17aRY6C6J08uel9NS1euiilhi2fLM/5acu99zv3YuAfO+gCJcf7I9mO33o6TwuC/2ZIV+L
 8atxQsqXY7Ahz89hn1bU6fjeJbAsKG8zxMpMxv5D51PiOkm+IAkpHlGTo/ObYNfWYQBN5Y+OIuPo1
 icTEnWZCGSHFnMKEaHQ0ca+jfTggXruKSdi9QbPg35zW/Ij9nbEMbj6pTTqCBn+7YOUvtC/qTtmT3
 YEKI04cI2isUC1cwhPBCFaE9tuWuSeAjSevA9tSJG0ZPKNAbqjQlBPdFZICA5g2pWISYuTaoVUpV7
 ymwzoYYAg==;
Received: from [80.156.29.194] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibK6y-0004py-Nx; Sun, 01 Dec 2019 07:57:44 +0000
Date: Sun, 1 Dec 2019 08:57:41 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191201085741.67d9389c@kernel.org>
In-Reply-To: <20191126164051.39920-1-dwlsalmeida@gmail.com>
References: <20191126164051.39920-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 p.zabel@pengutronix.de
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: media:
 dtv-frontend.rst: fix a few minor typos
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

Em Tue, 26 Nov 2019 13:40:51 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Fix a few minor typos throughout the document without changing the
> meaning of the sentences.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Looks OK on my eyes.

> ---
>  Documentation/media/kapi/dtv-frontend.rst | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/media/kapi/dtv-frontend.rst b/Documentation/media/kapi/dtv-frontend.rst
> index fbc5517c8d5a..b362109bb131 100644
> --- a/Documentation/media/kapi/dtv-frontend.rst
> +++ b/Documentation/media/kapi/dtv-frontend.rst
> @@ -15,8 +15,8 @@ The header file for this API is named ``dvb_frontend.h`` and located in
>  Demodulator driver
>  ^^^^^^^^^^^^^^^^^^
>  
> -The demodulator driver is responsible to talk with the decoding part of the
> -hardware. Such driver should implement :c:type:`dvb_frontend_ops`, with
> +The demodulator driver is responsible for talking with the decoding part of the
> +hardware. Such driver should implement :c:type:`dvb_frontend_ops`, which
>  tells what type of digital TV standards are supported, and points to a
>  series of functions that allow the DVB core to command the hardware via
>  the code under ``include/media/dvb_frontend.c``.
> @@ -120,7 +120,7 @@ Satellite TV reception is::
>  
>  .. |delta|   unicode:: U+00394
>  
> -The ``include/media/dvb_frontend.c`` has a kernel thread with is
> +The ``include/media/dvb_frontend.c`` has a kernel thread which is
>  responsible for tuning the device. It supports multiple algorithms to
>  detect a channel, as defined at enum :c:func:`dvbfe_algo`.
>  
> @@ -220,11 +220,11 @@ Signal strength (:ref:`DTV-STAT-SIGNAL-STRENGTH`)
>    - As the gain is visible through the set of registers that adjust the gain,
>      typically, this statistics is always available [#f3]_.
>  
> -  - Drivers should try to make it available all the times, as this statistics
> +  - Drivers should try to make it available all the times, as these statistics
>      can be used when adjusting an antenna position and to check for troubles
>      at the cabling.
>  
> -  .. [#f3] On a few devices, the gain keeps floating if no carrier.
> +  .. [#f3] On a few devices, the gain keeps floating if there is no carrier.
>       On such devices, strength report should check first if carrier is
>       detected at the tuner (``FE_HAS_CARRIER``, see :c:type:`fe_status`),
>       and otherwise return the lowest possible value.
> @@ -232,7 +232,7 @@ Signal strength (:ref:`DTV-STAT-SIGNAL-STRENGTH`)
>  Carrier Signal to Noise ratio (:ref:`DTV-STAT-CNR`)
>    - Signal to Noise ratio for the main carrier.
>  
> -  - Signal to Noise measurement depends on the device. On some hardware, is
> +  - Signal to Noise measurement depends on the device. On some hardware, it is
>      available when the main carrier is detected. On those hardware, CNR
>      measurement usually comes from the tuner (e. g. after ``FE_HAS_CARRIER``,
>      see :c:type:`fe_status`).
> @@ -323,8 +323,8 @@ A typical example of the logic that handle status and statistics is::
>  		.read_status = foo_get_status_and_stats,
>  	};
>  
> -Statistics collect
> -^^^^^^^^^^^^^^^^^^
> +Statistics collection
> +^^^^^^^^^^^^^^^^^^^^^
>  
>  On almost all frontend hardware, the bit and byte counts are stored by
>  the hardware after a certain amount of time or after the total bit/block



Cheers,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
