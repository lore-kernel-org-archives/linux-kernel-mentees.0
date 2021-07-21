Return-Path: <SRS0=/QuR=MN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1960C12002
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 09:39:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C26D6023F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 09:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C26D6023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377BF828E3;
	Wed, 21 Jul 2021 09:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QoKs2aU9wNsi; Wed, 21 Jul 2021 09:39:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6567582890;
	Wed, 21 Jul 2021 09:39:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3480DC001A;
	Wed, 21 Jul 2021 09:39:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 651CCC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 09:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 543DF82890
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 09:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkvrT2MGpFe6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 09:38:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8AC782861
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 09:38:59 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id y17so1306533pgf.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 02:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i9lkhl5CGNwVkPr4Gc/fkK8jj+kqc00wstH/fPwiQoY=;
 b=hH2Z4OaAClP5KljSyPIFjkVHl1LF2NfPBN/bNCaI0eAGcpgtt2DbKCB6S0XKzS8s42
 /oZP5LmeyfDv8Caqje9WS3sgtklqdfYTMkuPq32Ew7XqxVFvcgD6wHm6XhrzeVZAAcGi
 11iJy/iIb7wcGE2RZq119eDp6TtBD95RcgfOTzPAtySSptZsmEUPvV/ajbVmASxQl0M5
 IIcQ1C+hiqd4WWu2yzvmMR9eegWTfQYD4GtMndBT9/7Pgs3EXpTe5r/0ZDZbxaTT91RU
 +XGIRLzmOWCyW9RWanuS27vUqIG9V3OSN9FOmfKOI+Qb+1KvQAq6BlbxPKoahWNsz/5p
 Hm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i9lkhl5CGNwVkPr4Gc/fkK8jj+kqc00wstH/fPwiQoY=;
 b=QpP9bGdsEaeEd4Lx9AdoV8j7z9X7u67eE1FECnTw65vqMzQXXLVje9fgZX5ECpRN4T
 YysNOxDBd9EklUXL7TQzG1yuk8fsm+Em+Z8At81YLngqtYzu3dFNrfkKYocR2fPNe56S
 Rf/nB8tLWxgz2TOmtQAHlt+d5576Hcpo9hTwdwqTjm/UwgwOgjl6knmBhEuwa0+w1bJ/
 b8+pOhBDvab+JPgej3WRS0j1sxNk5AB1PWDLFa8BrBYeiLf3A5kierFdo+HMPX6qS0oC
 OQhXJLPuYzfEZytHIt7moi6lAWoKB7H5GKlWF+sBMlqmxmDgg3z9OGncC8bugABQE9BT
 dQAQ==
X-Gm-Message-State: AOAM533Th+RFFxpWDAgzAkDWnZXKDSwgrHXrg+890oNBJ0D75+XToBkz
 8UfsBLNlgY3b7V4GzCkia/4=
X-Google-Smtp-Source: ABdhPJwe9X9dZuLm3t9+BFn8++RhOcSNWNEc70KRQR5FCUJmoeexUawaYQaytntIsbib8D73D3c9Cw==
X-Received: by 2002:a63:3dcb:: with SMTP id
 k194mr34987757pga.202.1626860339124; 
 Wed, 21 Jul 2021 02:38:59 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id j129sm27311956pfb.132.2021.07.21.02.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 02:38:58 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthieu.baerts@tessares.net,
 stefan@datenfreihafen.org
Subject: [PATCH v3 0/2] Bluetooth: fix inconsistent lock states
Date: Wed, 21 Jul 2021 17:38:30 +0800
Message-Id: <20210721093832.78081-1-desmondcheongzx@gmail.com>
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

Hi,

This series addresses inconsistent lock states first identified by
Syzbot here:
https://syzkaller.appspot.com/bug?extid=2f6d7c28bb4bf7e82060

v2 -> v3:
- Split SCO and RFCOMM code changes, as suggested by Luiz Augusto von
Dentz.
- Simplify local bh disabling in SCO by using local_bh_disable/enable
inside sco_chan_del. The rationale is inside the commit message, but in
summary I initially wanted to avoid nesting local_bh_disable until I
learned that local_bh_disable/enable pairs are reentrant.

v1 -> v2:
- Instead of pulling out the clean-up code out from sco_chan_del and
using it directly in sco_conn_del, disable local softirqs for relevant
sections.
- Disable local softirqs more thoroughly for instances of
bh_lock_sock/bh_lock_sock_nested in the bluetooth subsystem.
Specifically, the calls in af_bluetooth.c and rfcomm/sock.c are now made
with local softirqs disabled as well.

Best wishes,
Desmond

Desmond Cheong Zhi Xi (2):
  Bluetooth: fix inconsistent lock state in SCO
  Bluetooth: fix inconsistent lock state in rfcomm_connect_ind

 net/bluetooth/rfcomm/sock.c |  2 ++
 net/bluetooth/sco.c         | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
