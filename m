Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C314B3164A8
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  5 Nov 2025 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762352606; cv=none; b=Jd5rSuZ+fNWoLsE9x4btmNsr7KcSCqQfuyup7Wcodz/SSAP19IBjHjVDsq8CEsi4CHl3kOcvVRuyjPgafagtoPKPpsfuYsHavlfs9mt8M/K83bXmkBFcIFeJiC39Cnj0Pz0VLkNPDVc/L8DTDBptMGaHRzP0DGnAYQs/mEAaDFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762352606; c=relaxed/simple;
	bh=qpmJTC6YKospDeO0jUXU1ZaIBfIL9Uhz+7Oos97PVAs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uQgDCNiotXM9eGb2puOsbQ7boMThstcrvfW1fy/PvyCDCT7FrMdc5h/UcPOPrj9CvU6BNZ+Otl1ViYtuhvci+VCLodaVXMsebSq8EFyqNlwDeHfLZVN6pWfGtJCO76O2ScFPFzfiVIZdFJ4ciU30yGs0N0/Hx0sCC+IyG3nB0/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=bHXqwiOw; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="bHXqwiOw"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7ae4656d6e4so900840b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 05 Nov 2025 06:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1762352603; x=1762957403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y71Q4Or9q+0cg0Yv4fMcIkVRqD+KfzfM2pip1To6eSQ=;
        b=bHXqwiOwDhrrpw0ooB3nM+4tieGyfv9kj6F9i6yH34kSUvDrAMacXP2bnoxrB3K3lz
         neRzNtteav5pQwQYfiOtsf0CQ2cW20DabIR/nXGgLqAxfqrb2wyT1P3TY8PcnhR/uPOA
         ZOndywJ5SjAwkbEthV/pthw/cMmFq4UWEhiH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762352603; x=1762957403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y71Q4Or9q+0cg0Yv4fMcIkVRqD+KfzfM2pip1To6eSQ=;
        b=MoeYjGcL1qyq7eB77qK6l3iGH8K5G/mlAsdBKW0KiB8N5dJVAJMMBJhtuY1jna22cr
         Dp7eYeJ0b8TjTLrMNFIAhvC9IbeSnBnH9SchM0bb8LJG8F6vUVwV8kdOfDsF0gXsQK2i
         QIDHw8OoJIZkd00dH7qSIWMqyOmjrF7azUVGMJvZwyU9S6/2h6o5PV+lnKdgbEdA//lb
         skFymnf3EFZ3eK3c3H2Aqvvozb2QjGf+PKNkl8BpV0pasNRG6663hCzzhkBc+/mAeCdi
         gs8Z7hGdE8mYCeDeI/mvjvLP0m2ai9c8N8HmL9b2XTVqtGE8nCld4RoUVfU3MB27pUOq
         zRcw==
X-Forwarded-Encrypted: i=1; AJvYcCVO6CS4HtiGNQSccI8JxZluIgb7LrjyLVWeUsK5TuREOlXq4Ls0R/1MC40xy77mMTy1dBg6Ygj9YkGuKSbpf73xuoEu4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnY9ujw60sgj3vTWcYRw3A5AujtxoBBYC9qUzlqJ3dU8R7zn/K
	lmb8Ii8RmTEmW5SBN2PXO1JgWy7U12G1a4rYNZESxgtL3bZVW0JxADHxm1vqy2Ugrxw=
X-Gm-Gg: ASbGncvzZwZaFAYbpSUlouqbzipbOEneudRHLpHOCO0uLjFbyh3QmbkllCiDajkUSUO
	rhF5oF1BB3A835N74sgHEwFj4Z/BpDCUU1KvowC8l7grcnweUJZJj2rvxUmqvGsN6ywEzSFUgUU
	8VKCIJcfhZfZRQACxAmZd/UMMEWR5LrobIjzsde0lQmubYEn6tLvkdAgsxfK043YDEtCyN5Ijj5
	TaMt7ksL6c+EKw2EQt1Ub1eFlMv7+V46ht0m9Xs4FXSP9hfacXECrzCE0afFPziXycB5PX57bpi
	F+opkO5WJTWNJ6DNYkmgLogsUkHoGRsDGWIlCHkAcfj+KFDy0GFGxAPeXk3dyvCtKE/ZvOqYCch
	FjBHFH4s2tTzT6JGRHC3XVc19eQVugxHletrtlbqWEpN4rpfVxZeajkuNRdy2axdzrpMRbtrxNL
	EFh5UO0/N0ZW7tkjrQ2dYIv5Xuoz6TAhQIbYN0iVBC7u2HRA==
X-Google-Smtp-Source: AGHT+IFQQjNZZXg3azKMLg0M8p5F0zJHNipEU0X4Cm3Gg9oyoPK3H+JFlHZpPjn/covtWTqzUQ8ZLg==
X-Received: by 2002:a05:6a20:a123:b0:34a:f44:1ce0 with SMTP id adf61e73a8af0-34f843107admr4405601637.23.1762352602792;
        Wed, 05 Nov 2025 06:23:22 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([110.226.177.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd3247ef3sm6485299b3a.11.2025.11.05.06.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 06:23:22 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: marcel@holtmann.org
Cc: johan.hedberg@gmail.com,
	luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+14b6d57fb728e27ce23c@syzkaller.appspotmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
Subject: [PATCH] Bluetooth: L2CAP: Fix use-after-free in l2cap_unregister_user
Date: Wed,  5 Nov 2025 19:52:51 +0530
Message-Id: <20251105142251.101852-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

Syzbot reported a use-after-free in l2cap_unregister_user(), caused by
missing reference counting on the associated hci_dev. If the device is
unregistered while L2CAP users are still active, l2cap_unregister_user()
may access a freed hci_dev when taking its lock.

Fix this by taking a device reference in l2cap_register_user() using
hci_dev_hold(), and releasing it in l2cap_unregister_user() via
hci_dev_put(). This ensures the hci_dev remains valid for the lifetime
of registered L2CAP users.

Reported-by: syzbot+14b6d57fb728e27ce23c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=14b6d57fb728e27ce23c
Fixes: c8992cffbe74 ("Bluetooth: hci_event: Use of a function table to handle Command Complete")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 net/bluetooth/l2cap_core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 805c752ac0a9..6a880f8ab6c2 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -1688,6 +1688,11 @@ int l2cap_register_user(struct l2cap_conn *conn, struct l2cap_user *user)
 	struct hci_dev *hdev = conn->hcon->hdev;
 	int ret;
 
+	/* Hold a reference to hdev to prevent it from being freed while
+	 * we have registered users.
+	 */
+	hci_dev_hold(hdev);
+
 	/* We need to check whether l2cap_conn is registered. If it is not, we
 	 * must not register the l2cap_user. l2cap_conn_del() is unregisters
 	 * l2cap_conn objects, but doesn't provide its own locking. Instead, it
@@ -1717,6 +1722,10 @@ int l2cap_register_user(struct l2cap_conn *conn, struct l2cap_user *user)
 
 out_unlock:
 	hci_dev_unlock(hdev);
+
+	if (ret)
+		hci_dev_put(hdev);
+
 	return ret;
 }
 EXPORT_SYMBOL(l2cap_register_user);
@@ -1735,6 +1744,9 @@ void l2cap_unregister_user(struct l2cap_conn *conn, struct l2cap_user *user)
 
 out_unlock:
 	hci_dev_unlock(hdev);
+
+	/* Release the reference we took in l2cap_register_user */
+	hci_dev_put(hdev);
 }
 EXPORT_SYMBOL(l2cap_unregister_user);
 
-- 
2.34.1

