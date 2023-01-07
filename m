Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0A6C54EBE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Jan 2023 18:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3EC7404BA;
	Sat,  7 Jan 2023 18:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3EC7404BA
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RIkIs5/n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyRZyOwcMZvG; Sat,  7 Jan 2023 18:43:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EDE2440395;
	Sat,  7 Jan 2023 18:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDE2440395
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA287C0033;
	Sat,  7 Jan 2023 18:43:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A747C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Jan 2023 18:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F93260BC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Jan 2023 18:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F93260BC7
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=RIkIs5/n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4FeEnGvbxnmb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Jan 2023 18:43:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77A4C60BBF
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77A4C60BBF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Jan 2023 18:43:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F41960BC7;
 Sat,  7 Jan 2023 18:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C29B0C433EF;
 Sat,  7 Jan 2023 18:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673116992;
 bh=7y0ii0V5eIVZvh1u+jhGken8Zwt5dxFLiW5P+vAC7P0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=RIkIs5/nGqHmIRcBoG7ghzvSyugnOqbIIepe3jttHpacHr/QQnwrDzEX1k6rKBj/x
 e2XwezsopmVTNSKro+28VykaCaHetC0Wunw1FybUgrNenUJ/ffqIAebR/ESmWmvqBE
 UODyJiAdzM4tGIEiLQB5My8T1cSTmkCh03gENRmtR2BQSwW5sMRB6YvBROB3aAErht
 Cu+Ufy8+LZd9n6uAmRd1PF2r57V53OmlNheK4Vpxp7YZTfY59La5esgioUDsu7q9aK
 g+hE75bX9KPigv717reOCxAYC58OxOb7iqHZpsQtvQ2h+f63+Bu+X4Xnw1b5eplwxf
 XVpEbINkZnQ+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A9D63E5724A; Sat,  7 Jan 2023 18:43:12 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.2-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNARPzpMfZ7QB58nj5L_nULP-E5J1CAzT6=kcU9nHa_G5JA@mail.gmail.com>
References: <CAK7LNARPzpMfZ7QB58nj5L_nULP-E5J1CAzT6=kcU9nHa_G5JA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNARPzpMfZ7QB58nj5L_nULP-E5J1CAzT6=kcU9nHa_G5JA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-fixes-v6.2-2
X-PR-Tracked-Commit-Id: 735aec59afb18c3e2da0a637037e69ad62dbda6a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a7c4127a29ce222c9fa4fb4ae5b15e182a1ee5c9
Message-Id: <167311699268.9095.10330813377295740669.pr-tracker-bot@kernel.org>
Date: Sat, 07 Jan 2023 18:43:12 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The pull request you sent on Sat, 7 Jan 2023 19:16:04 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a7c4127a29ce222c9fa4fb4ae5b15e182a1ee5c9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
