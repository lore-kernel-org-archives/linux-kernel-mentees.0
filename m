Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED68335080
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  6 Nov 2025 18:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762453235; cv=none; b=aP8QOmzZb9fUnd1qiZIrXsd5Bu3HdXSXt+4Vq2TcqMkyWiFFm9JRBMiOYSymMrCfGjhBL7fX2f00DP3D9Jk/u2PcqidpmsdqH3wNe5+i+QWtWzC9qs0GH6Jx77rfsFpbCTm8hVH/lcYQewWS6twaoJbfvytqE/isSdqIjhmhrMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762453235; c=relaxed/simple;
	bh=375jKvwYcq0QUXukIrQ1f+N3NOj9DqIX4Aj/+YlX5mk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ANAbStjpUtz+DR2FCXEhSXWDSFBZPP8DO610gY48Mg6Rc658Z0sGCbCsyKoQbgQPfmFZs9JcC6PteQ7JN84+BDeJAgtbCooTywlp+tsk0fofdfFngIp7ByxKFLeFyGjW081XsNWfdPDd6wnZUFbJtKohc7T8WCtzERtkCOLZabI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=ct/UxdeW; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="ct/UxdeW"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6770B40788
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  6 Nov 2025 18:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.998
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pX3SVuLBfQhT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Nov 2025 18:20:32 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=ssrane_b23@ee.vjti.ac.in; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D795640781
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=ee.vjti.ac.in
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D795640781
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=vjti.ac.in header.i=@vjti.ac.in header.a=rsa-sha256 header.s=google header.b=ct/UxdeW
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D795640781
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  6 Nov 2025 18:20:31 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-ba488b064cbso998272a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 06 Nov 2025 10:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1762453231; x=1763058031; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ASB8FKtZK1f63TZGwMkE6Mcut8cdvc7Tlq+5U4LNTk=;
        b=ct/UxdeWKWGl0vX92iIm/uOi1vRkwfuCL2SaC91LEKjyWfVtz4ZuJcZWjPX9dbtwtq
         AUwt9fevHR+qGr8XxdEw/TxKtjQd1u0C32EoZAJ4stCm6UzywYc7cLwQI+djBdbjx/8X
         v06PUmBQWrLF1g2RcIcKC4TgtW6uJ/mpJuj/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762453231; x=1763058031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ASB8FKtZK1f63TZGwMkE6Mcut8cdvc7Tlq+5U4LNTk=;
        b=ao5E40dQ55nZ53O5C6F8TkwltcLU6buBeztn/FN+mBEAGafGJZvGTgYqHRlE/tCcM2
         ZeTC7tq2JVvnajtU9fwo/d4Iak6xVXmkvRSlvASx/B98ApsTTPpTzaZcekLMIjH6qa1M
         x/9QVVmlKfVw3ve/7tG88VWKYydDTPFt9ruiKtvB3YFZQYpWhkIRbUWGXKpkV+s/nxGt
         8itO//RExg+1R5nOxzNI5EV5QVrwhxPFwOa6zojeAB39xkwpuXXcrKyRIYFxsCj4xyyY
         x7m/8l/6DrOiwUCYIgo0mUpZBcxIyzX8QEW9jQ1H6DXLTantBRIkidB2VbB9AutkRCS5
         iwHg==
X-Forwarded-Encrypted: i=1; AJvYcCVcTtTdz82zFn9TIuZR/dwI6mjoY04b/c443k1yM8Or+gvql6heKEXBD6oIl3jL6MWqcNoe+c0Qqh3jeP6pvO0ale+FYg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YycVZd8zW93cAig47Nc7RwappLE1VBu11LP7rwfBfxyrBy/zwcP
	RPmYWiZL1/4Q4FVEjX4rcHX7xkcGLFhlzNibA3HAl/ca8AGhGycScp6pbfK9MWhg9SQ=
X-Gm-Gg: ASbGncuTzBXLOgVO4onVqHmY9GAWhHZgzAwINt/DZ6AehiKiHI0TfyOHiel5NA+YdEz
	TzS1huI6ooiIM/V5DQjeBcq/rC5yb+3yhWvMM2VHyE9LBnuAzN8DIxgiOszG1Rc9/jpu8S5c+QS
	7A/qWUflT1nInHPEzew7ZCpf5/mWf7MOr07VcjJPZgfserJMtbvsZs6xc1DQDI2zmFBF5WXxCko
	7hvnWyUbVEsLhsLm2bI6ZaJ99FbE6v79ZDHI/TRexr1oPF28UTIOjDjhD1XpjiPatTve060zrGA
	soem7oob8Zb3gdSDHI9q6WxGnLJvlAcqFcJ6xeSNwmo2W0tbUoZGCfEKCPQak7foObX+UxPkpjs
	BV9K1axY3AO+AO2sPBvYTXx17aPFlUuy0JK6dh+FOHGBXqbWS04nQOwDKILof0QIdhpHwEVRP65
	Ll3R3Jxgb/JZes0I112yNidg7wCbra/Z9hYwOds3GM3NjMxYYMXhD3shcw9w==
X-Google-Smtp-Source: AGHT+IGjsvWizViuKvqU/9ixMSrMVwXUSyqJ0gQDi1Sv/r9iYmMJdX5r5ZgGWH4p4H/sroNO9dU7pw==
X-Received: by 2002:a17:902:e88b:b0:290:9a74:a8ad with SMTP id d9443c01a7336-297c047f196mr4517675ad.53.1762453230814;
        Thu, 06 Nov 2025 10:20:30 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([110.226.176.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ccec88sm35062555ad.107.2025.11.06.10.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 10:20:30 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com,
	marcel@holtmann.org,
	johan.hedberg@gmail.com,
	pav@iki.fi,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+14b6d57fb728e27ce23c@syzkaller.appspotmail.com,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
Subject: [PATCH v2 1/1] Bluetooth: L2CAP: Fix use-after-free in l2cap_unregister_user
Date: Thu,  6 Nov 2025 23:50:16 +0530
Message-Id: <20251106182016.26508-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251105142251.101852-1-ssranevjti@gmail.com>
References: <20251105142251.101852-1-ssranevjti@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

After commit ab4eedb790ca ("Bluetooth: L2CAP: Fix corrupted list in
hci_chan_del"), l2cap_conn_del() uses conn->lock to protect access to
conn->users and conn->hchan. However, l2cap_register_user() and
l2cap_unregister_user() still use hci_dev_lock(), creating a race
condition where these functions can access conn->users and conn->hchan
concurrently with l2cap_conn_del().

This can lead to use-after-free and list corruption bugs, as reported
by syzbot.

Fix this by changing l2cap_register_user() and l2cap_unregister_user()
to use conn->lock instead of hci_dev_lock(), ensuring consistent locking
for the l2cap_conn structure.

Reported-by: syzbot+14b6d57fb728e27ce23c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=14b6d57fb728e27ce23c
Fixes: ab4eedb790ca ("Bluetooth: L2CAP: Fix corrupted list in hci_chan_del")

Changes in v2:
 - Replaced hci_dev_lock()/unlock() with mutex_lock()/unlock(&conn->lock)
   in both l2cap_register_user() and l2cap_unregister_user().
 - Updated comments to match current locking rules.
 - Removed unnecessary hci_dev_hold()/hci_dev_put() usage.

Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 net/bluetooth/l2cap_core.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index d08320380ad6..29e78801c507 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -1685,17 +1685,15 @@ static void l2cap_info_timeout(struct work_struct *work)
 
 int l2cap_register_user(struct l2cap_conn *conn, struct l2cap_user *user)
 {
-	struct hci_dev *hdev = conn->hcon->hdev;
 	int ret;
 
 	/* We need to check whether l2cap_conn is registered. If it is not, we
-	 * must not register the l2cap_user. l2cap_conn_del() is unregisters
-	 * l2cap_conn objects, but doesn't provide its own locking. Instead, it
-	 * relies on the parent hci_conn object to be locked. This itself relies
-	 * on the hci_dev object to be locked. So we must lock the hci device
-	 * here, too. */
+	 * must not register the l2cap_user. l2cap_conn_del() unregisters
+	 * l2cap_conn objects under conn->lock, and we use the same lock here
+	 * to protect access to conn->users and conn->hchan.
+	 */
 
-	hci_dev_lock(hdev);
+	mutex_lock(&conn->lock);
 
 	if (!list_empty(&user->list)) {
 		ret = -EINVAL;
@@ -1716,16 +1714,14 @@ int l2cap_register_user(struct l2cap_conn *conn, struct l2cap_user *user)
 	ret = 0;
 
 out_unlock:
-	hci_dev_unlock(hdev);
+	mutex_unlock(&conn->lock);
 	return ret;
 }
 EXPORT_SYMBOL(l2cap_register_user);
 
 void l2cap_unregister_user(struct l2cap_conn *conn, struct l2cap_user *user)
 {
-	struct hci_dev *hdev = conn->hcon->hdev;
-
-	hci_dev_lock(hdev);
+	mutex_lock(&conn->lock);
 
 	if (list_empty(&user->list))
 		goto out_unlock;
@@ -1734,7 +1730,7 @@ void l2cap_unregister_user(struct l2cap_conn *conn, struct l2cap_user *user)
 	user->remove(conn, user);
 
 out_unlock:
-	hci_dev_unlock(hdev);
+	mutex_unlock(&conn->lock);
 }
 EXPORT_SYMBOL(l2cap_unregister_user);
 
-- 
2.34.1

