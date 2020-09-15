Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4E8C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 19:26:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C064520770
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 19:26:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yG5g2Q6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C064520770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 353E98705B;
	Tue, 15 Sep 2020 19:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2WC+TzUpUVE; Tue, 15 Sep 2020 19:26:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F85D87029;
	Tue, 15 Sep 2020 19:26:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8593CC0864;
	Tue, 15 Sep 2020 19:26:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BC05C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 19:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 47413863FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 19:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sN1vStbA6TiI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 19:26:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1FB6485F92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 19:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=3UzI3IjsClMWUJX1nUX65h/Tlg3lK3F1wNRbBid3FZ4=; b=yG5g2Q6MTrlrhesPzS1nGJWY9Q
 k4fQu3tt1MQidVFriNjN9keacOE2CeL6VcSJBWtHkZsigxv3O8axfhGAuDzkFf2XxrYHGjaSR9VNy
 SuW+2s2zYERk7kQVDzwOEbXUmGXGq+l5VpONnphH7mN+3jXfWkDJFYgD67DmCWbj3qHJNXEN/HnaG
 9wFTbr7gFmJenxAcUXhW12BpUabQRdurgPiPpViID7GclV7oqBAY2HZzqWXm6YuG+9hROzgflVAp1
 PWrmwGFs36dWADf0N0Jo16HgoFXKIZtcOGVCvJNQjsoz1ykLaSKuiRx8zFzqIdF9LG+3h9O+joHJV
 pRJTE2zg==;
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIGaU-0007Wo-4m; Tue, 15 Sep 2020 19:25:58 +0000
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, mchehab@kernel.org
References: <20200915180509.2661572-1-dwlsalmeida@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2280c5d7-7362-6760-fe70-54845c427bc5@infradead.org>
Date: Tue, 15 Sep 2020 12:25:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915180509.2661572-1-dwlsalmeida@gmail.com>
Content-Language: en-US
Cc: r.verdejo@samsung.com, linux-kernel@vger.kernel.org, nicolas@ndufresne.ca,
 geert@linux-m68k.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media: vidtv: fix build on 32bit
	architectures
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

On 9/15/20 11:05 AM, Daniel W. S. Almeida wrote:
> From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> Fix the following error for builds on 32bit architectures:
> 
> ERROR: modpost: "__udivdi3"
> [drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!
> 
> Which is due to 64bit divisions that did not go through the helpers
> in linux/math64.h
> 
> As vidtv_mux_check_mux_rate was not operational in its current form,
> drop the entire function  while it is not fixed properly.
> 
> For now, call vidtv_mux_pad_with_nulls with a constant number of packets
> to avoid warnings due to unused functions when building this driver.
> 
> Fixes: f90cf6079bf67988 ("media: vidtv: add a bridge driver")
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/vidtv_mux.c  | 34 +------------------
>  .../media/test-drivers/vidtv/vidtv_s302m.c    |  4 +--
>  2 files changed, 3 insertions(+), 35 deletions(-)
> 

Works for me.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


-- 
~Randy
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
