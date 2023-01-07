Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84956C46467
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Jan 2023 10:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B9482156;
	Sat,  7 Jan 2023 10:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08B9482156
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NZKJx7Js
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGjYTfgsXJvr; Sat,  7 Jan 2023 10:16:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D9AEA8212A;
	Sat,  7 Jan 2023 10:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9AEA8212A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACCBFC0033;
	Sat,  7 Jan 2023 10:16:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF839C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Jan 2023 10:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A53440112
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Jan 2023 10:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A53440112
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=NZKJx7Js
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0biiIgyKEZxe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Jan 2023 10:16:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 975844010D
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 975844010D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Jan 2023 10:16:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D0F060AE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Jan 2023 10:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B3DC433EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Jan 2023 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673086602;
 bh=rkJDIkBl3ZSE0jaDiEPxN/L389QTct8mzqQLw9qqMNQ=;
 h=From:Date:Subject:To:Cc:From;
 b=NZKJx7Jsm251wl9Yml4HWRuvg6jlfMwisJnB3bmWs72H6r4xK7b00N3Mu7uDMrN3v
 nPG69RjVjrG3sOf2T6dzA7OW8Bsn3tP2GHRaIhnPkX89eOKAgYGxDLcXTQYp/lr2uk
 qWKc2DCxnqHv5cvg5iieEcvBzHwr/lYdTRuNK74YVdrWpQADWtjo7+PbCZDsPLdq3j
 pSaxnCLjY25SB2k0u5Mo6+YKfnS4dHK1UJZ8W+hnKp2QhC89m3nJhyTpO+Xr7hrHyO
 ibV3ZfP2N5wjDfYSm6vGA5jVqF9xZnm5sdb1lOJeqp/eTdluhrpiz4vbGb9OY9PeJU
 Uv3X3zPq5kpZA==
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-1322d768ba7so4053854fac.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Jan 2023 02:16:41 -0800 (PST)
X-Gm-Message-State: AFqh2kpagZkZ5MR/C0C1DZ+AA4ssK6aSz6jMkUeNOxrZrOCdh9jD0EDz
 TUpAlf4u9H53uDLIPW3u7mt18zTNgUxLbwcyu5s=
X-Google-Smtp-Source: AMrXdXvmEbVbVrBrfabMBmBobpDxTPhhZM70q1oVll6EWFkbSM2J13nz5tY7iGhkrTF3NbM40V8fgvKA4E96AeHo7B8=
X-Received: by 2002:a05:6870:cc89:b0:150:39e2:c688 with SMTP id
 ot9-20020a056870cc8900b0015039e2c688mr2635017oab.287.1673086600814; Sat, 07
 Jan 2023 02:16:40 -0800 (PST)
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Jan 2023 19:16:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNARPzpMfZ7QB58nj5L_nULP-E5J1CAzT6=kcU9nHa_G5JA@mail.gmail.com>
Message-ID: <CAK7LNARPzpMfZ7QB58nj5L_nULP-E5J1CAzT6=kcU9nHa_G5JA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.2-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hello Linus,

Please pull some Kbuild fixes.

Thank you.




The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

  Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.2-2

for you to fetch changes up to 735aec59afb18c3e2da0a637037e69ad62dbda6a:

  kbuild: readd -w option when vmlinux.o or Module.symver is missing
(2023-01-05 16:53:48 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.2 (2nd)

 - Fix single *.ko build

 - Fix module builds when vmlinux.o or Module.symver is missing

----------------------------------------------------------------
Masahiro Yamada (2):
      kbuild: fix single *.ko build
      kbuild: readd -w option when vmlinux.o or Module.symver is missing

 Makefile                 | 2 +-
 scripts/Makefile.modpost | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)


Best Regards
Masahiro Yamada
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
