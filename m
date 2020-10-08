Return-Path: <SRS0=Bf+q=DP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA89C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 20:00:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39AFC22228
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 20:00:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjcX2uHr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39AFC22228
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B4CF48754D;
	Thu,  8 Oct 2020 20:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GI4WtaOiTZ6L; Thu,  8 Oct 2020 20:00:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 49A8D8754F;
	Thu,  8 Oct 2020 20:00:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05758C0895;
	Thu,  8 Oct 2020 20:00:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EC47C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 20:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 272E187556
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 20:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2NPJP6hMRb21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 20:00:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A97538731A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 20:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602187205;
 bh=eZsDfZl5sMC9EEWPMUZ2j8FlHfnnmv/xFAcWNb6R59U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WjcX2uHrv0Xbas8veuzNPB4flcN7rXquCQ0Pk/sg9WhCDaJvl06geKEiqeONC6rbA
 CPQXolfyVmvGcBjMrJi3VrhPIQHL5+IDtRl1TcoPP+1Z6XEzWnSOvVCpyqfiTklnEN
 fzHDdOHmi7TgZg5aoR0baLLMDDNa916IAmaK8D7s=
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <160218720521.8125.768342314968863398.git-patchwork-notify@kernel.org>
Date: Thu, 08 Oct 2020 20:00:05 +0000
References: <20201007035401.9522-1-anant.thazhemadam@gmail.com>
In-Reply-To: <20201007035401.9522-1-anant.thazhemadam@gmail.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Cc: , linux-kernel-mentees@lists.linuxfoundation.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kuba@kernel.org, johannes@sipsolutions.net,
 syzbot+b1bb342d1d097516cbda@syzkaller.appspotmail.com, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: wireless: nl80211: fix
 out-of-bounds access in nl80211_del_key()
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

On Wed,  7 Oct 2020 09:24:01 +0530 you wrote:
> In nl80211_parse_key(), key.idx is first initialized as -1.
> If this value of key.idx remains unmodified and gets returned, and
> nl80211_key_allowed() also returns 0, then rdev_del_key() gets called
> with key.idx = -1.
> This causes an out-of-bounds array access.
> 
> Handle this issue by checking if the value of key.idx after
> nl80211_parse_key() is called and return -EINVAL if key.idx < 0.
> 
> [...]

Here is the summary with links:
  - net: wireless: nl80211: fix out-of-bounds access in nl80211_del_key()
    https://git.kernel.org/netdev/net/c/3dc289f8f139

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
