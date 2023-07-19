Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0914CEB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Jul 2023 00:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80913414BE;
	Wed, 19 Jul 2023 00:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80913414BE
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wm3LPh5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9NV_g6hx1L6; Wed, 19 Jul 2023 00:39:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7D64640106;
	Wed, 19 Jul 2023 00:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D64640106
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F011C0072;
	Wed, 19 Jul 2023 00:39:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1BC4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jul 2023 00:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 990E981E5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jul 2023 00:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 990E981E5C
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=Wm3LPh5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEnQTdxvZsyY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jul 2023 00:39:55 +0000 (UTC)
X-Greylist: delayed 570 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 19 Jul 2023 00:39:55 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 571FE81E25
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 571FE81E25
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jul 2023 00:39:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5765615CD;
 Wed, 19 Jul 2023 00:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B9F3C433CA;
 Wed, 19 Jul 2023 00:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689726623;
 bh=ZUWCZ+GVZr3OC9mFjhPEqR3AZR02O8jnm9Irz0Ph/Fg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Wm3LPh5EP7nYKW2L8AVtVh7wleN3VhVKnqJ/v3k2okcZ1kIcGECcv40BLawenGdvY
 yq3uSbsaIhU560JU12E3AiTB3b4NmCfhPc7ZUmtn+IbBE189QrD7gpn0O5X8TakvCw
 x4vhJ3M5dU+jDfcrk/a1QEfc//14bl2wncJEQ8cttUX/GEFRUHLyxb0skpfCFp+y6D
 P3/1z15nkpK46zM277UKpl1OOqLttVWByGgN+44BlkYjaIyNh95bo4//i+PjAxyhrz
 8HOj1Ve6xrTEMjlqBZZdIpZjEd0kQiemB35vJYpH5sjuvAjCegXo/2wJjVWGpJnrKQ
 2ubaDNW9dPCog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F3493E22AE6; Wed, 19 Jul 2023 00:30:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] samples/bpf: README: Update build dependencies required
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168972662299.5728.14295244638929023303.git-patchwork-notify@kernel.org>
Date: Wed, 19 Jul 2023 00:30:22 +0000
References: <aecaf7a2-9100-cd5b-5cf4-91e5dbb2c90d@gmail.com>
In-Reply-To: <aecaf7a2-9100-cd5b-5cf4-91e5dbb2c90d@gmail.com>
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Cc: daniel@iogearbox.net, andrii@kernel.org, ast@kernel.org, sdf@google.com,
 bpf@vger.kernel.org, martin.lau@linux.dev,
 linux-kernel-mentees@lists.linuxfoundation.org
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

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Sun, 16 Jul 2023 23:13:51 +0700 you wrote:
> Update samples/bpf/README.rst to add pahole to the build dependencies
> list. Add the reference to "Documentation/process/changes.rst" for
> minimum version required so that the version required will not be
> outdated in the future.
> 
> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v3] samples/bpf: README: Update build dependencies required
    https://git.kernel.org/bpf/bpf-next/c/89dc4037dda1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
