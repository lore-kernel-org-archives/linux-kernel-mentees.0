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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF7BC4320E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 11:03:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FE0D60F43
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 11:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FE0D60F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F279606DC;
	Wed,  4 Aug 2021 11:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UjRuDkz2GyFQ; Wed,  4 Aug 2021 11:03:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3CCD060667;
	Wed,  4 Aug 2021 11:03:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FA05C001A;
	Wed,  4 Aug 2021 11:03:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6EEDC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B968783C4C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Vn1reAmGnys
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:03:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90DC083C3D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:03:38 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id mt6so2422380pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 04:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jwMjX9uKOX34bxHroGHlO+KGwPb8TW7nGHLpbS6oqzs=;
 b=aWH8FPQcF8fQhUjm6O6pl9YL1byqoTvc6uU8AhtNMeTd3lIAGuZ25KPl6MaM9FpcYg
 AK72GH7TbKLvTXOMi4bnhw6zIlMm8Kx6ogrRfFOc+nwM+/I6c665iHHH+STgum4xFhUC
 pN6hTal3G3Fj1RZKfX4RW3kuk7DfkGgnS/rgwqjyfxmqwX1JXbkFHYfoaCpN+nJP4oNk
 d4g39isClzgBy70grsZ4r3rizQnGgZOhAh+6BFUus/Q5ACrgoYviYj1glJEeQmpuzml9
 UVE4iAb3aY2t88ryjV6Mqvn44EzuXlMttt9Nn9fMW68uxyHNpxw+vhQTDkcNvxz20pfa
 AP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jwMjX9uKOX34bxHroGHlO+KGwPb8TW7nGHLpbS6oqzs=;
 b=sqQcwdSsazx123O2o+6aZVUltN95Aie8vS0MOUuSeGLXJT7V/85XpKL17vdjOEgz+/
 uiG9sA+wuqRHbxSaM+OI0xBnnV8aJz3mRPGCsKeCAL9qXbaf/bOfZWRF8kfPK/Jut+KD
 1Be6Y45P/QxWsCzZNpvXtMTe40XZGuU/cvr/L+8YH0qBRrfApFgv3kISjn4lpGLtx1wk
 U00lv6JNPObc9A1GuB2Gm4Pggq4NXL4xzsrSHHHwxbw+MWS7XB3y1VOhnCI1C+WMPJf4
 5xTPQV+O1XCKF/ey3KO0xyGbRW8hzYQ8eAyIoiSgBP3zBH31Sqy6d9eOfR0Yno8Lgp2I
 DgwQ==
X-Gm-Message-State: AOAM530MRdzLqWyl4JZyE/U9RV0x5CC9l9DcyeqFmuDdtXAr8eku3EqU
 AK8a4/cgVUrfEjJ/FHz6NI4=
X-Google-Smtp-Source: ABdhPJxkL6C5JVgPh+WmVxXS7CD5vAKQHOzGQMgYJ68HC5d8vmswPnC0kPLsa24Tquu4MnmcgF4YGA==
X-Received: by 2002:aa7:804f:0:b029:334:4951:da88 with SMTP id
 y15-20020aa7804f0000b02903344951da88mr26922729pfm.29.1628075017777; 
 Wed, 04 Aug 2021 04:03:37 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id k4sm2206147pjs.55.2021.08.04.04.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:03:37 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [PATCH v5 0/6] Bluetooth: fix locking and socket killing in SCO and
 RFCOMM
Date: Wed,  4 Aug 2021 19:03:02 +0800
Message-Id: <20210804110308.910744-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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
