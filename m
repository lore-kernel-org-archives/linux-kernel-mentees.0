Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4230C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Aug 2023 18:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C58261216;
	Wed,  2 Aug 2023 18:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C58261216
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JJiKTcQC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikEvPkjISirI; Wed,  2 Aug 2023 18:23:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6ABD861228;
	Wed,  2 Aug 2023 18:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ABD861228
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45C90C0072;
	Wed,  2 Aug 2023 18:23:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A61ECC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 18:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 735F4414E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 18:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 735F4414E9
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=JJiKTcQC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojyBiAhSMoY9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 18:23:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99B56414E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 18:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B56414E4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFB92615A2;
 Wed,  2 Aug 2023 18:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5489EC433C8;
 Wed,  2 Aug 2023 18:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691000606;
 bh=v7hq7FeZtaf/kJ+hTvesuISlZhktfFix0bKvyjiDK1A=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=JJiKTcQCxhGuYSfSrBd3pA0FHRLtvBii0EnE1kl8uhcV+h8Q0o/m7QviZYZZOurUY
 cQXuR6auCpB/vi6ldNAa6AkgfLfdZ3WRregvGvB1A9b3NWGExIReVHxTQhx+0c54eq
 O4lDYkXMlg2g/Sr7/EAXJepW2RnhyANAR0PSD3OaNKN6p0UFkZ5onmF6pb9z6696BL
 ZrnBn1Rem5uBkHq32412F048hPur3VOhd0pn1b4NZsX3aH5TJxorxB6gcOh0Xpe+Zm
 VvyEacYzUOWeOCkXNmC32rNEW5sMJBzep9Kcv8aGQjMDQ5Cm2AARa3DlEY9ykpU+cm
 7M/C4wFrFlLCQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath6kl: Fix debugfs_create_dir error checking
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230731024542.27248-1-rauji.raut@gmail.com>
References: <20230731024542.27248-1-rauji.raut@gmail.com>
To: Atul Raut <rauji.raut@gmail.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169100060344.669727.8392314523199758602.kvalo@kernel.org>
Date: Wed,  2 Aug 2023 18:23:25 +0000 (UTC)
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
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

Atul Raut <rauji.raut@gmail.com> wrote:

> The debugfs_create_dir function returns ERR_PTR
> in case of error and the correct way to check an
> error is 'IS_ERR' inline function.
> This patch will replace the null-comparison with IS_ERR
> 
> This issue was found with the help of Coccinelle.
> ./drivers/net/wireless/ath/ath6kl/debug.c:1796:6-21: Wrong debugfs call error processing on line 1796
> 
> Signed-off-by: Atul Raut <rauji.raut@gmail.com>

This has been already fixed:
https://git.kernel.org/kvalo/ath/c/1301783c8def

Patch set to Rejected.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230731024542.27248-1-rauji.raut@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
