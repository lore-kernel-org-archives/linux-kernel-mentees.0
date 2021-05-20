Return-Path: <SRS0=G2n4=KP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F699C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 22:30:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B21DE613BD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 22:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B21DE613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D3484023F;
	Thu, 20 May 2021 22:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3noT4mQEomF; Thu, 20 May 2021 22:30:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAC3F40223;
	Thu, 20 May 2021 22:30:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FCD1C000E;
	Thu, 20 May 2021 22:30:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B3B3C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 22:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D76B0844DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 22:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id erPwLQo0qFDs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 22:30:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15CCE843EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 22:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 62039613AC;
 Thu, 20 May 2021 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621549810;
 bh=5cDZduWBJFBYYAmarnpupAcbglPvZM4E9xEdY5bWkPE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SAUlCG1Fv3QQlODUOis6erQ5rGNwqQkoURWfCGKra2fC2rOhan45l28ksz0NF0leA
 B5daeNJEQDicc5GzMENmFUE+SZmPxeq634MiCJB7km4YtKqH/RwzwCkOXQF6e6gadr
 EAvT3J1NtozLHSIBD/E5QTBGFZNBIA9MEHb4ZxgcnERxJut5U/m3/6BvrkldCy7bNW
 tcSPUYqMM0/MSzUAso2L1RQTa5hkLed7E6IZTDt8QzQ7eEOJI6xB6qdmy8Rqp0wM06
 fEC5pgklUJ+TOvsXJ0qnOWLwbxIsV04EmRSLUYrGpLCLWRIHGinwTeH9Cl9xctyOUp
 VOzuoWUhyElsw==
MIME-Version: 1.0
Subject: Re: [PATCH] net: encx24j600: fix kernel-doc syntax in file headers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162154981031.17678.7698185941474619213.git-patchwork-notify@kernel.org>
Date: Thu, 20 May 2021 22:30:10 +0000
References: <20210520184915.588-1-yashsri421@gmail.com>
In-Reply-To: <20210520184915.588-1-yashsri421@gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org,
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

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri, 21 May 2021 00:19:15 +0530 you wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/net/ethernet/microchip/encx24j600 files follows
> this syntax, but the content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc.
> For e.g., running scripts/kernel-doc -none
> drivers/net/ethernet/microchip/encx24j600_hw.h emits:
> warning: expecting prototype for h(). Prototype was for _ENCX24J600_HW_H() instead
> 
> [...]

Here is the summary with links:
  - net: encx24j600: fix kernel-doc syntax in file headers
    https://git.kernel.org/netdev/net/c/503c599a4f53

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
