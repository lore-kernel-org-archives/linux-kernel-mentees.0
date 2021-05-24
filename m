Return-Path: <SRS0=DeHd=KT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4E0C47082
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 May 2021 01:00:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FF98611CB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 May 2021 01:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FF98611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F269A4031D;
	Mon, 24 May 2021 01:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TXBCtNgOq8u9; Mon, 24 May 2021 01:00:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id E24074031C;
	Mon, 24 May 2021 01:00:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C88A9C000E;
	Mon, 24 May 2021 01:00:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5103C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 01:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE7DA82E57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 01:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2oeWIkaU3yAS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 01:00:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22D7182A17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 01:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9792F611CC;
 Mon, 24 May 2021 01:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621818009;
 bh=IJCBZy0bLfcVnY1Igy7njpQmormYRMAMJFq6XLkGtdI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=a7wB2czDoCf5Obt5PsguKxQ04dRSQciM8em+pDQ0xXV7eiTUitgw2ER45oXHd8wqE
 HsLT0q5VsCUxi44UdHz+qbHfHgIM9x7noc78NqlFwGDGJliMA2bAFXcuR2oWyuhj/t
 TpQZp20ObSfXUdrk6qTRE6XfzNXCNCVLOFxsMT15SL1pzEdCepW/8vCdJ8HOflTzdk
 A0NuuWTjHQaGG6z5s/Vz6qdPcraqraUjTGmg8GqsMrSPAplVBlhYJfPem+hLelKUCY
 uPBDTdwtFEs3xjQ8ifEnp34ExfHzfekp+UX6k2lhhMoEQa5Zkp7Yplg/cpSrOY/lLN
 qvvwbxRzVEIUg==
MIME-Version: 1.0
Subject: Re: [PATCH] NFC: nfcmrvl: fix kernel-doc syntax in file headers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162181800956.10357.9521863900425218837.git-patchwork-notify@kernel.org>
Date: Mon, 24 May 2021 01:00:09 +0000
References: <20210523210909.5359-1-yashsri421@gmail.com>
In-Reply-To: <20210523210909.5359-1-yashsri421@gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-nfc@lists.01.org, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 krzysztof.kozlowski@canonical.com
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

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Mon, 24 May 2021 02:39:09 +0530 you wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/nfc/nfcmrvl follows this syntax, but the content
> inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
> For e.g., running scripts/kernel-doc -none on drivers/nfc/nfcmrvl/spi.c
> causes warning:
> warning: expecting prototype for Marvell NFC(). Prototype was for SPI_WAIT_HANDSHAKE() instead
> 
> [...]

Here is the summary with links:
  - NFC: nfcmrvl: fix kernel-doc syntax in file headers
    https://git.kernel.org/netdev/net/c/4dd649d130c6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
