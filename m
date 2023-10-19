Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3076CDB47E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Oct 2023 01:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F4586F7B4;
	Thu, 19 Oct 2023 01:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F4586F7B4
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sMU+hWZx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuaxiTANj08f; Thu, 19 Oct 2023 01:26:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 942396F78F;
	Thu, 19 Oct 2023 01:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 942396F78F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7750EC0039;
	Thu, 19 Oct 2023 01:26:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A048C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 01:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 132DA83265
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 01:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 132DA83265
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=sMU+hWZx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FxITQW_f74Tw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 01:26:01 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2274083260
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 01:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2274083260
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 01360CE27B1;
 Thu, 19 Oct 2023 01:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6704C433C8;
 Thu, 19 Oct 2023 01:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697678756;
 bh=Bo2rNx1P5rqGaRjEElKR9ESp+uBQTFt4srxoPCP49qg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sMU+hWZx+AHKSSgK5/4oSCK2E6eC9t2jpi3nyN5NybU+tl2tCFztBba96/APfBvvq
 u/qJp3EtjORVy7stL42taf3tyMTEI213hGi0U+r5iH2qAwdLwTfxURxu9Z29EDSRnS
 5Kfkm6s2DzVngw5z1tzt9dguOMfONFXhab5MIE590zpON8/3hJnjVjg1JdmaSwcYe9
 RwIxwSU+x+FGYErCc5CwSe3ipiRRhmkAOM0F8me9v/oioEr+u+JZBe08YCfSfA8CJW
 HxPgYb+V5eGyrExTi/yKZG3TKXYJWyVcJQ4cSvoEreID/PpI8fhCDPx6Gj51r8/ym3
 u22ebC2xUj6+A==
Date: Wed, 18 Oct 2023 18:25:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Juntong Deng <juntong.deng@outlook.com>
Subject: Re: [PATCH v2] net/tls: Fix slab-use-after-free in tls_encrypt_done
Message-ID: <20231018182555.28f1a774@kernel.org>
In-Reply-To: <VI1P193MB0752321F24623E024C87886A99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
References: <VI1P193MB0752321F24623E024C87886A99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Cc: syzbot+29c22ea2d6b2c5fd2eae@syzkaller.appspotmail.com,
 Sabrina Dubroca <sd@queasysnail.net>, borisp@nvidia.com,
 netdev@vger.kernel.org, john.fastabend@gmail.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

On Wed, 18 Oct 2023 00:22:15 +0800 Juntong Deng wrote:
> In the current implementation, ctx->async_wait.completion is completed
> after spin_lock_bh, which causes tls_sw_release_resources_tx to
> continue executing and return to tls_sk_proto_cleanup, then return
> to tls_sk_proto_close, and after that enter tls_sw_free_ctx_tx to kfree
> the entire struct tls_sw_context_tx (including ctx->encrypt_compl_lock).
> 
> Since ctx->encrypt_compl_lock has been freed, subsequent spin_unlock_bh
> will result in slab-use-after-free error. Due to SMP, even using
> spin_lock_bh does not prevent tls_sw_release_resources_tx from continuing
> on other CPUs. After tls_sw_release_resources_tx is woken up, there is no
> attempt to hold ctx->encrypt_compl_lock again, therefore everything
> described above is possible.

Whoever triggered the Tx should wait for all outstanding encryption 
to finish before exiting sendmsg() (or alike).  This looks like 
a band-aid. Sabrina is working on fixes for the async code, lets
get those in first before attempting spot fixes.
-- 
pw-bot: cr
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
