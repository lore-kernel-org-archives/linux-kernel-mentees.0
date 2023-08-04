Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A44C00528
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 11:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E03741C0F;
	Fri,  4 Aug 2023 11:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E03741C0F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sCs4YQV0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fAgQo3BXj6U; Fri,  4 Aug 2023 11:57:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5810640268;
	Fri,  4 Aug 2023 11:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5810640268
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4256FC0071;
	Fri,  4 Aug 2023 11:57:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BFE9C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6886A403D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6886A403D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CmZyFWftsMDZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:57:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC06441506
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC06441506
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0775E61FAA;
 Fri,  4 Aug 2023 11:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1664DC433C7;
 Fri,  4 Aug 2023 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691150267;
 bh=KcgazaGjBuDGqutZBwoUPbbDeArwjFsTuUJNqkdlBrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sCs4YQV0vLsYLvOvIfnyojGtS32CO3M3BKBOlN3IlaLuBvKtIJa/yuY462I4F+1/7
 CWmrMfYIK3kfPkwme+GD33CdIKXVvVvEdFx4mmAF04l2WBsnbaHQWn2n8MbqbJyjzf
 AY7yJ/yEJ690cC//eATkWFSzKopIEM7B97VvwSlo=
Date: Fri, 4 Aug 2023 13:57:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: coolrrsh@gmail.com
Subject: Re: [PATCH 2/2] fixes warning
Message-ID: <2023080435-knapsack-litter-2cbd@gregkh>
References: <20230804115121.34035-1-coolrrsh@gmail.com>
 <20230804115121.34035-2-coolrrsh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804115121.34035-2-coolrrsh@gmail.com>
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

On Fri, Aug 04, 2023 at 05:21:21PM +0530, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> drivers/spi/spi-mpc52xx-psc.c:332:5-13:
> WARNING: Unsigned expression compared with zero: mps -> irq < 0
> 
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> ---
>  drivers/spi/spi-mpc52xx-psc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Your subject lines are not correct :(
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
