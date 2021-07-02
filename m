Return-Path: <SRS0=QgwC=L2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153D6C11F6B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 09:19:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B670361413
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 09:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B670361413
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 911834002B;
	Fri,  2 Jul 2021 09:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UolHVV56v3ze; Fri,  2 Jul 2021 09:19:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BFED74011F;
	Fri,  2 Jul 2021 09:19:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E467C0010;
	Fri,  2 Jul 2021 09:19:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DBC3EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 09:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDB1A4023D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 09:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-P2mciIn987
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 09:19:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 444404011F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 09:19:14 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so2649734pjl.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Jul 2021 02:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nm45adTul5XCFOT6dnN8MdpgDMBSy0CJdfrYkdLx/To=;
 b=fMt7/cmVBVuUMtYM2MNPljWLWWzqq8BjDcrJoYGSlLgyR8/DwFd3AZkMhWgc9pKPVz
 agBdKdUyFMiUx5J7g+uGRuUQJq7E7ar0qzpSrxUoaegezIR1Ah+3glG5Zdb3GqYGnDSs
 obudtjXnF2Q5qrdwHvVrNcExX3lXMBT+d+SjfP7azf5DqdC7ixS/QBP7Y+1Cif0I7tA9
 poeRctpZ+WxF7t6qXBU0bB7MKtkCsybNwb7a6UvmSnx2HHh/ST3a76Kk3xqaZ0LT2gw8
 UaazK4DhL+y8upmnQLuzR+pn68Wav1Pg8HB4UIBvCr9DyyZyNNUpvCQWdesJsCUNBnbw
 UCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nm45adTul5XCFOT6dnN8MdpgDMBSy0CJdfrYkdLx/To=;
 b=XVbp8gcbnskXCHNnzaOzja9gDQmGoBI75EnY/ppRkekzb1yGPzsCVb+u+ECe/l2Dfv
 vk7kAEw1tLUS/CZilznMoCFheRg1deWkL0c/i/e/TF88vk83SmJw/CyvzR0fNQCwV+r7
 D4J4OYDGxwuMuN0QtUqkmpR9A3+supXCW6J/qbnlMJ0f4GzP+Z7g4Zt+dQ/hzoO6hpdb
 uyEKW9LfOMn3BEncGzpSTLyjpn5qHRAAxxo57SuKP/uXtIG0BWzz4hwIzFRrECtHGbwB
 PnHUZEgih1MgEbFoc26xdTCEOp8LpbeIKk+h9oJcDkJWSmaymdcSnXTxw0hHDFxufy0W
 X8YA==
X-Gm-Message-State: AOAM5311epgucA6pCxHMeNBBS3O87mmO6Gj4Gq6VmTKrdhPx+QnY6UP1
 5m8Jj2Pz7PVw26/6dqqCmvo=
X-Google-Smtp-Source: ABdhPJy1SBWtkMHNFwz/PuByfck8ZnDs7HnX59nmGJqo0xDw/1YGwYyHkb3mPprE/D5XFUNc7Xu48A==
X-Received: by 2002:a17:90b:3506:: with SMTP id
 ls6mr3911151pjb.25.1625217553690; 
 Fri, 02 Jul 2021 02:19:13 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id y3sm3023918pga.72.2021.07.02.02.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 02:19:13 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: jlayton@kernel.org,
	bfields@fieldses.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH 2/2] fcntl: fix potential deadlock for &fasync_struct.fa_lock
Date: Fri,  2 Jul 2021 17:18:31 +0800
Message-Id: <20210702091831.615042-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702091831.615042-1-desmondcheongzx@gmail.com>
References: <20210702091831.615042-1-desmondcheongzx@gmail.com>
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

There is an existing lock hierarchy of
&dev->event_lock --> &fasync_struct.fa_lock --> &f->f_owner.lock
from the following call chain:

  input_inject_event():
    spin_lock_irqsave(&dev->event_lock,...);
    input_handle_event():
      input_pass_values():
        input_to_handler():
          evdev_events():
            evdev_pass_values():
              spin_lock(&client->buffer_lock);
              __pass_event():
                kill_fasync():
                  kill_fasync_rcu():
                    read_lock(&fa->fa_lock);
                    send_sigio():
                      read_lock_irqsave(&fown->lock,...);

&dev->event_lock is HARDIRQ-safe, so interrupts have to be disabled
while grabbing &fasync_struct.fa_lock, otherwise we invert the lock
hierarchy. However, since kill_fasync which calls kill_fasync_rcu is
an exported symbol, it may not necessarily be called with interrupts
disabled.

As kill_fasync_rcu may be called with interrupts disabled (for
example, in the call chain above), we replace calls to
read_lock/read_unlock on &fasync_struct.fa_lock in kill_fasync_rcu
with read_lock_irqsave/read_unlock_irqrestore.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 fs/fcntl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/fcntl.c b/fs/fcntl.c
index cf9e81dfa615..887db4918a89 100644
--- a/fs/fcntl.c
+++ b/fs/fcntl.c
@@ -1004,13 +1004,14 @@ static void kill_fasync_rcu(struct fasync_struct *fa, int sig, int band)
 {
 	while (fa) {
 		struct fown_struct *fown;
+		unsigned long flags;
 
 		if (fa->magic != FASYNC_MAGIC) {
 			printk(KERN_ERR "kill_fasync: bad magic number in "
 			       "fasync_struct!\n");
 			return;
 		}
-		read_lock(&fa->fa_lock);
+		read_lock_irqsave(&fa->fa_lock, flags);
 		if (fa->fa_file) {
 			fown = &fa->fa_file->f_owner;
 			/* Don't send SIGURG to processes which have not set a
@@ -1019,7 +1020,7 @@ static void kill_fasync_rcu(struct fasync_struct *fa, int sig, int band)
 			if (!(sig == SIGURG && fown->signum == 0))
 				send_sigio(fown, fa->fa_fd, band);
 		}
-		read_unlock(&fa->fa_lock);
+		read_unlock_irqrestore(&fa->fa_lock, flags);
 		fa = rcu_dereference(fa->fa_next);
 	}
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
