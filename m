Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FA2C04FE0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Aug 2023 21:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A180160E19;
	Mon,  7 Aug 2023 21:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A180160E19
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zvf0yctA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Se6ZwPDkXO2e; Mon,  7 Aug 2023 21:57:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 946C460E17;
	Mon,  7 Aug 2023 21:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 946C460E17
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B5B5C0072;
	Mon,  7 Aug 2023 21:57:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B925C0DD5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 21:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4371460E17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 21:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4371460E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JpWOjPhJBVKR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 21:57:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65ADE60E19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 21:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65ADE60E19
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B1B16228F;
 Mon,  7 Aug 2023 21:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F283C433C8;
 Mon,  7 Aug 2023 21:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691445454;
 bh=ZBdsSzFVKRY6PmokTMG4ushfFOwsRYYskB/P5mPnNWc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Zvf0yctAVdibWfzojglrSgk/ffqQTc8vzB7IJkrzcfZa7QH0MZn98vW69pVpZkVIR
 nI9PyeW7HU5Nk6/Py7tx3PcwF1ZxIDqPnkgu/XO//NKjxtW3CzP774YZcBZgF4rOvH
 4kPMD4JQIisVzh4aoAEzpec2w/tZgAUqBCx1o9gd/2fCVZTZIixYh2g6TT7uJv9M28
 o/y15aCYTKSeh8AC4/X+aDpB6iEBG6SrWksS+/otxQSmly4nkyMlYnXOuyMREA2QWx
 Pp+omntF00A+zNsHqsTUA7DyHr7YkAD/pqGLRuRv1Q45jfC7y4HrjF5GEQrkkXazdq
 I33L5xUJA5GOQ==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coolrrsh@gmail.com
In-Reply-To: <20230807144942.30317-2-coolrrsh@gmail.com>
References: <20230807144942.30317-1-coolrrsh@gmail.com>
 <20230807144942.30317-2-coolrrsh@gmail.com>
Subject: Re: [PATCH v2] spi: spi-mpc52xx-psc: Fix an unsigned comparison
 that can never be negative
Message-Id: <169144545291.329334.7193582247834857976.b4-ty@kernel.org>
Date: Mon, 07 Aug 2023 22:57:32 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-034f2
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, 07 Aug 2023 20:19:42 +0530, coolrrsh@gmail.com wrote:
> In struct mpc52xx_psc_spi, the variable 'irq' is declared as an unsigned int.
> The comparison of variable 'irq'  with signed int operand is incorrect. Also,
> the return value from the call to platform_get_irq(pdev,0) is int and it is
> assigned to an unsigned int variable 'irq', thus redeclaring the type of
> variable 'irq' to signed int.
> 
> This fixes warning such as:
> drivers/spi/spi-mpc52xx-psc.c:332:5-13:
> WARNING: Unsigned expression compared with zero: mps -> irq < 0
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mpc52xx-psc: Fix an unsigned comparison that can never be negative
      commit: 4f5177458ba97734149897c5d4d44f85b8fe0348

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
