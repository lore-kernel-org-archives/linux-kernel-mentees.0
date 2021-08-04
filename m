Return-Path: <SRS0=2i/r=M3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067DAC4320E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 15:48:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A529860FC4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 15:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A529860FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B5CF60614;
	Wed,  4 Aug 2021 15:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cjz2Ksb9pixo; Wed,  4 Aug 2021 15:48:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 79EF16069C;
	Wed,  4 Aug 2021 15:48:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53EB7C0010;
	Wed,  4 Aug 2021 15:48:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE05FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEA714035E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JkXIqSKCLPE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D69940239
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:29 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id e5so3446415pld.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uVR++srqzKEza84ydvF70klwPUW2q5Z+fc6h5nNUeDg=;
 b=BYWKWBBOHSR/q8Uy3UaPYy/sQ9tzQdEo4/S2QQOHlt9zrb7a9UT1xin+7kdUX4fJgK
 CD/gmsb57b8iY0xid1jg+27JYiSPWIqkmKUj/RF+MsX8u2SWsgfkpWlB0yYsgs5hF6RD
 kin6iRb/iIAXKXTbi5Du/MoR4sjspc/uz9AukKHusuOfgKyGlWAB+rxzg5+b6EID5iXa
 qRmCwwiq+tqVkqhI3O7ZWI+G/IVhkr3y8upHltX1bX0gPhmO2CH3R3fH5nnTKcSPZWU5
 Bqz1vgNJDFjlUGRZNE4oyZiAqs0sJYymGnhTW1VeA2bUyOFGtQzlcdvEEcPvKuBLNjpk
 3G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uVR++srqzKEza84ydvF70klwPUW2q5Z+fc6h5nNUeDg=;
 b=q0I1BBnGJyfdx0tU86TMt/vFv5GRcE77kK6nWQy+hlyfQGFYLUygclFXbE33C3grbY
 NFMF1CEkxAea1f2oM0w5JFblfcZnQmo2q6JF6A3mjsTuHa36jWY+j6NZRv3T/cfydr98
 ECMOYHJsPeA6miRn9QzLOuEaT99LFGZljAydtI5bHqteoU20PPzs1gJbcc5sxU1ruAL+
 Vex1jZW1XbHOGdlqqwQI+1m00nP5aR1Bjmw/KiOKEh9pbsXfTfXoeJDy4FfE/b6EGF1k
 CkRYBdLswNNf5R3AyWtyKf96Rejc8k0gLLE1UbUWA5t9frYFFJwdoXw9Hw25aXwOgxhW
 Tw4w==
X-Gm-Message-State: AOAM531crw/KvRJ+hdyeBe7EYwW6XRWfjxfrNrLoJYxKAoL8tl1u43px
 hAv0LjzZsBCVX5AkOpHcGPc=
X-Google-Smtp-Source: ABdhPJz1ZiBXE1dBU67RCm2FBYwTbdo5gF6c/WDoBiwc/NjeTHlH4M6mxtO41aiH3+6suNYGFGGK+A==
X-Received: by 2002:a17:90a:2ec6:: with SMTP id
 h6mr10206833pjs.9.1628092108733; 
 Wed, 04 Aug 2021 08:48:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b15sm4007274pgj.60.2021.08.04.08.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 08:48:28 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [RESEND PATCH v5 0/6] Bluetooth: fix locking and socket killing in
 SCO and RFCOMM
Date: Wed,  4 Aug 2021 23:47:06 +0800
Message-Id: <20210804154712.929986-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
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

Apologies, resending because I botched the previous cover-letter and
linux-bluetooth was left out of the cc. Just noticed when the
bluez.test.bot didn't respond. Please reply to this series rather than
the one sent previously.

Hi,

This patch series started out as a fix for "inconsistent lock state in
sco_sock_timeout" reported by Syzbot [1].

Patch 1 is sufficient to fix this error. This was also confirmed by the
reproducer for "BUG: corrupted list in kobject_add_internal (3)" [2]
which consistently hits the inconsistent lock state error.

However, while testing the proposed fix, the reproducer for [1] would
randomly return a human-unreadable error [3]. After further
investigation, this bug seems to be caused by an unrelated error with
forking [4].

While trying to fix the mysterious error, additional fixes were added,
such as switching to lock_sock and serializing _{set,clear}_timer.

Additionally, as the reproducer kept hitting the oom-killer, a fix for
SCO socket killing was also added.

The reproducer for [1] was robust enough to catch errors with these
additional fixes, hence all the patches in this series were squashed then
tested with the reproducer for [1].

Overall, this series makes the following changes:

- Patch 1: Schedule SCO sock timeouts with delayed_work to avoid
inconsistent lock usage (removes SOFTIRQs from SCO)

- Patch 2: Avoid a circular dependency between hci_dev_lock and
lock_sock (enables the switch to lock_sock)

- Patch 3: Switch to lock_sock in SCO now that SOFTIRQs and potential
deadlocks are removed

- Patch 4: Serialize calls to sco_sock_{set,clear}_timer

- Patch 5: Switch to lock_sock in RFCOMM

- Patch 6: fix SCO socket killing

v4 -> v5:
- Renamed the delayed_work variable, moved checks for sco_pi(sk)->conn
into sco_sock_{clear,set}_timer, as suggested by Luiz Augusto von Dentz
and Marcel Holtmann.
- Added check for conn->sk in sco_sock_timeout, accompanied by a
sock_hold to avoid UAF errors.
- Added check to flush work items before freeing conn.
- Avoid a circular dependency between hci_dev_lock and lock_sock.
- Switch to lock_sock in SCO, as suggested by Marcel Holtmann.
- Serial calls to sco_sock_{set,clear}_timer.
- Switch to lock_sock in RFCOMM, as suggested by Marcel Holtmann.
- Add a fix for SCO socket killing.

v3 -> v4:
- Switch to using delayed_work to schedule SCO sock timeouts instead
of using local_bh_disable. As suggested by Luiz Augusto von Dentz.

v2 -> v3:
- Split SCO and RFCOMM code changes, as suggested by Luiz Augusto von
Dentz.
- Simplify local bh disabling in SCO by using local_bh_disable/enable
inside sco_chan_del since local_bh_disable/enable pairs are reentrant.

v1 -> v2:
- Instead of pulling out the clean-up code out from sco_chan_del and
using it directly in sco_conn_del, disable local softirqs for relevant
sections.
- Disable local softirqs more thoroughly for instances of
bh_lock_sock/bh_lock_sock_nested in the bluetooth subsystem.
Specifically, the calls in af_bluetooth.c and rfcomm/sock.c are now made
with local softirqs disabled as well.

Link: https://syzkaller.appspot.com/bug?id=9089d89de0502e120f234ca0fc8a703f7368b31e [1]

Link: https://syzkaller.appspot.com/bug?extid=66264bf2fd0476be7e6c [2]

Link: https://syzkaller.appspot.com/text?tag=CrashReport&x=172d819a300000 [3]

Link: https://syzkaller.appspot.com/bug?id=e1bf7ba90d8dafcf318666192aba1cfd65507377 [4]

Best wishes,
Desmond

Desmond Cheong Zhi Xi (6):
  Bluetooth: schedule SCO timeouts with delayed_work
  Bluetooth: avoid circular locks in sco_sock_connect
  Bluetooth: switch to lock_sock in SCO
  Bluetooth: serialize calls to sco_sock_{set,clear}_timer
  Bluetooth: switch to lock_sock in RFCOMM
  Bluetooth: fix repeated calls to sco_sock_kill

 net/bluetooth/rfcomm/sock.c |   8 +--
 net/bluetooth/sco.c         | 107 +++++++++++++++++++++---------------
 2 files changed, 66 insertions(+), 49 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
