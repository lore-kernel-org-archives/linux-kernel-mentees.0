Return-Path: <SRS0=TDrl=LX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E620CC11F68
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 14:48:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92C4761DD1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 14:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92C4761DD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55FE083638;
	Tue, 29 Jun 2021 14:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wN6GtIjnfu6k; Tue, 29 Jun 2021 14:48:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 89BF98361C;
	Tue, 29 Jun 2021 14:48:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FCE0C0010;
	Tue, 29 Jun 2021 14:48:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C578C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A1FE4023D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ta4ejs8HE_Jn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:48:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A9BD40230
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:48:51 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id h1so11062087plt.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 07:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=koZtRUNjw4bYNAZV6JWLxfBDPL3I14Zph7TjpLy0UpA=;
 b=TooWxCAcuEemzgn3EAdG7nTJRrAJ8QghigYKwSlw5aodIB+yRqTVWNb/aydNu/NtXX
 tu5CsEXgtXvvZV1mTv5tLDhZhzxxBYkrIfWauY9PlVKerJkwfNJLGYVmbJ1BMoA4QwPj
 x5OoXpSGahS4Wmyn9czcbO4JsI99DKFlIulK5f+SOhjBVwj8FWw7BfUUen6rtI5JjTXK
 ECQKFrDI9SmThzfvtmkTzBZOLUpo5FCnqjGlzeAl7yCMGmf3shsYVkjBbzT27M+ZSTPg
 IZvieyGuaM4YLphD+xmvrd4UMjO5QoyGLGyBezfQqdJQoqEtu73vnv+Z3LMuBYgzknBy
 qX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=koZtRUNjw4bYNAZV6JWLxfBDPL3I14Zph7TjpLy0UpA=;
 b=lGrD85BFPgIFWfPlS1mWdGXkZuUMAsENIYxl/e5/gRvBPPe+i0OIGQOQkOdA4qxKHB
 mCzZ2VmwRvZFMC2QokrK6Lo4B+KWI2cUt37JpYV/kbpVjHBSMbCz7paLQp/wn6513YVQ
 PcZ3tcpcCTPXbdA9MTwZliIAyrTWURaYDY/1vfvNtNU9fQX/DLyq/7/G+Bu67xt/N2+h
 56OFtBv1jKmMUeFo7trsbzX8EKdLWsXpn4u94VbMTU647J2JIFCgqad6qpnWAi6LGqwX
 Aug8ZWdE6aiom51f4LmYJy3xg5DcgSZMScoSjf7HlFF/x7cTYrOoDcK57iiBR6CawQng
 MapQ==
X-Gm-Message-State: AOAM530BNoP0csLI/t8vpfNaPV6c/wXuSZZnMLZOJs7El0Mz35K7dgqw
 VK9ovKnp6efAuS1EdpF1eUY=
X-Google-Smtp-Source: ABdhPJzDOltMmEszV+HSvCrb8aMX9wydlrmi1DRwuaxNyG5WZixOQVcnzzn9OUmGR98tanV2a4V+uQ==
X-Received: by 2002:a17:902:bc4a:b029:129:ef:3c35 with SMTP id
 t10-20020a170902bc4ab029012900ef3c35mr2788828plz.46.1624978130555; 
 Tue, 29 Jun 2021 07:48:50 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i2sm3417262pjj.25.2021.06.29.07.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 07:48:50 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gustavoars@kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH 0/3] hfs: fix various errors
Date: Tue, 29 Jun 2021 22:48:00 +0800
Message-Id: <20210629144803.62541-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
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

Hi,

This series ultimately aims to address a lockdep warning in hfs_find_init reported by Syzbot:
https://syzkaller.appspot.com/bug?id=f007ef1d7a31a469e3be7aeb0fde0769b18585db

The work done for this led to the discovery of another bug, and the Syzkaller repro test also reveals an invalid memory access error after clearing the lockdep warning. Hence, this series is broken up into three patches:

1. Add a missing call to hfs_find_exit an error path in hfs_fill_super

2. Fix memory mapping in hfs_bnode_read by fixing calls to kmap

3. Add lock nesting notation to tell lockdep that the observed locking hierarchy is safe

Desmond Cheong Zhi Xi (3):
  hfs: add missing clean-up in hfs_fill_super
  hfs: fix high memory mapping in hfs_bnode_read
  hfs: add lock nesting notation to hfs_find_init

 fs/hfs/bfind.c | 14 +++++++++++++-
 fs/hfs/bnode.c | 18 ++++++++++++++----
 fs/hfs/btree.h |  7 +++++++
 fs/hfs/super.c |  1 +
 4 files changed, 35 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
