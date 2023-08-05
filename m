Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8048DC001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Aug 2023 06:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E739E4186D;
	Sat,  5 Aug 2023 06:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E739E4186D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=krCquNPU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7aXaT_Ck69Z6; Sat,  5 Aug 2023 06:22:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D598440180;
	Sat,  5 Aug 2023 06:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D598440180
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF4E2C0071;
	Sat,  5 Aug 2023 06:22:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05B5EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Aug 2023 06:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD45883F15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Aug 2023 06:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD45883F15
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=krCquNPU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8huJtO7a0sRA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Aug 2023 06:22:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2810882140
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Aug 2023 06:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2810882140
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D4B160ACF;
 Sat,  5 Aug 2023 06:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165CEC433C8;
 Sat,  5 Aug 2023 06:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691216543;
 bh=71bkMSZKOc3HbinOnFH6CrCi9MNzOVOiV++TgrRs0RU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=krCquNPUKYxEdMuc6EYEPY8FF+8qdVLpNWeGVb7Bi4Lvanzga1ZgzDz72YEobrbwa
 liuvHaUB7WeuMZh01GdVUCh0ERZtx5s/3eemeuDuGdkY8XOl8D6uCxaLuSjVBpsZ3V
 bgyiYsgmXq2Nj4T1/pcvMARjJCAxLZMT2KMu2CMg=
Date: Sat, 5 Aug 2023 08:22:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: coolrrsh@gmail.com
Subject: Re: [PATCH v2] fixes warning
Message-ID: <2023080507-umbrella-automated-0db9@gregkh>
References: <20230804200711.65750-1-coolrrsh@gmail.com>
 <20230804200711.65750-2-coolrrsh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804200711.65750-2-coolrrsh@gmail.com>
Cc: broonie@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
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

On Sat, Aug 05, 2023 at 01:37:11AM +0530, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> Typecasting the interrupt number from "unsigned int" to "signed int" to compare with 0(signed int by default).
> Declaring interrupt number as "signed int" would violate kernel standards. So typecasting is the possible approach.
> The fix is for spi-mpc52xx.
> 
> This fixes warning such as:
> drivers/spi/spi-mpc52xx-psc.c:332:5-13: WARNING: Unsigned expression compared with zero: mps -> irq < 0
> 
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> ---
>  drivers/spi/spi-mpc52xx-psc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Your subject lines are still incorrect :(
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
