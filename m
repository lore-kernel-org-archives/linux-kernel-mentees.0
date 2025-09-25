Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4600A321266
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 20:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758833120; cv=none; b=KlLfU8/9jv7MHTjPF4vRXWjKFZfJITSF5hw1Lga96hlkqWVFYeb+pHEzGaGZQYdeYWloVmihKEHxymgOk9k6E9zlxdR/AGYF615Mio7d6t8QzloibxJeuDd6pdquuzeywDWjXJxwPnI6iS/5Uu6n75DqGLvepAWhSMkiWUSiRPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758833120; c=relaxed/simple;
	bh=Ru0U+UR4TDnU4YEoC4bgh7/N8KX36OuOCEfHwKRdWLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rEE4PpL98eGOFc+w24KDkQ0q5KYTUgT/MlmLPF5tJNig6qNa/dhm/hjzlpiwUfrt9mZ+BzfmXjGDBrC9yH0LJ/LvHRzehU1SkxbeWTD538mS8yFWXapwYBmDgoCjqNIiB0sw7C0H2RNPal4nGi70XnizkPYieBvuIiMQy/YUyQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHcMMEDN; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHcMMEDN"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-781001e3846so1400543b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 13:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758833118; x=1759437918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3eDhSQL/LKEOp5/PaHTtO2MouZaE3+HdZOo9nr4tRw8=;
        b=VHcMMEDNFPA9OPxxfBdtg/7++AQnHyIqFflOkUmA+25xWNtTEnSBa5jJUCZqDX3mwC
         yK1PN5XU7QHt1ISZOMjFTLj53xNnTCl7rxIrfiPmeunUe1VnUZAXTrGvkBRBjinOfWR7
         YzidIs8ycejgZNRUMf2fAE+5kiDK1xWVtRIod6aVDfUdZCUMpDSF+6qbGTHrgo53J8mg
         UNEXienf9D2d4RjqCQlQd0oIWs7YuPZlge+Fq9tgfXs22SN5SCHuE67DQrwmSdW+ZriO
         c0SJxs3D8IbNxj+UieUkUAtx7UxmVzDlUpFnwpvI3OLZyXeSrp4Z/y39uhKm7l41O0qb
         WU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758833118; x=1759437918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eDhSQL/LKEOp5/PaHTtO2MouZaE3+HdZOo9nr4tRw8=;
        b=AkDQceOn7QM/p166AdTd3x2/3eFcXxNY8RtczRXKBAaCkL/fXzZIvYnS4jrYgWU0vZ
         vZwKR8XbS2mz7/u3w1oSJ+A73z51AgVXFAUkXLfiDZAVimdUdL9pCS5nkkwk35bNnVEo
         Q9WmOgHjagZyxdz7qpEDYPlpZnL6GH1FHTL/ETjToGDA3HOuVqGd5DRvV80jR6lILQFI
         odscOBVyD9T/7LE8i1qfmexiQZmfywHjI726+vfz4pY0VNqCw+PLlcliV1cmak88PBQj
         Aw97FkngICmL9aY06llVfQww5U4CwkDN2qnimyQuWu8C9bAnk6MKxSP9mxu0sqQ7pCFv
         gEbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeQxuMOzijVDMhwbPge2oIDM62PJl2wi7yIPKKHcSqHwvqYHr0MWVje4cMcl8PiTx1872V7TipV7BqRgnfVKYF5l0XMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyG8D/ViGRfRgbrtdidZRrVw3OrJ5HB8d+o5Nm75JpZY+CHXQG
	3H2Yyy4e9GQFGpqvDN0RmhBK31DbZkc+bV/3d2mcSNVUro9hTP4fZS8e
X-Gm-Gg: ASbGncsAgdQMEpagu/6TYPYuAEXzrdWz70UadHOSVaKOH7FWZ0iXbgRAR57QCYIcFo6
	bOJx6CzKwdv31ZG58rls6+V/E9Yqf5c/rDtQwKGL54yW4TV3QX4APaUPWAoXRazFjRZ7+59/2k6
	ffMX45zZoVe1Nt8ipAu9xwwqFRXQj5mQSK35uKrpR9Argzn51NcOuvCaSPtS8JE8cgQKoZ0CN2C
	QCynz9WU6jZ3r0AYEfls63Q/C8LXCA70MDGM5hdqRGUFbDDA8cG11weJCUvL2LC6OYoZ692DlvX
	GWPTff5FVGLwOIndUV3XJKvhRMky8893R/bN6RLaf6U7lXr3ne3gmrQJf00d5IyyZyn//UudyuH
	BxZxcMwZISGBUGA6KuBJkLsckmZJ/BbL/eCNVpw0=
X-Google-Smtp-Source: AGHT+IHAMz5CMMWeR4tII30EjfIdX2VnbTPNJkIYi+47i3rAuGHIXnYdncaPKHzzQmFkMUxBtAQtoQ==
X-Received: by 2002:a05:6a20:7348:b0:262:52de:c576 with SMTP id adf61e73a8af0-2e7d3db5fcdmr6163922637.29.1758833118401;
        Thu, 25 Sep 2025 13:45:18 -0700 (PDT)
Received: from cortexauth ([2401:4900:889b:7045:558:5033:2b7a:fd84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239d99dsm2675456b3a.21.2025.09.25.13.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:45:17 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	pwn9uin@gmail.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+07b635b9c111c566af8b@syzkaller.appspotmail.com
Subject: [PATCH net v2] atm: Fix the cleanup on alloc_mpc failure in atm_mpoa_mpoad_attach
Date: Fri, 26 Sep 2025 02:12:51 +0530
Message-ID: <20250925204251.232473-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported a warning at `add_timer`, which is called from the
`atm_mpoa_mpoad_attach` function

The reason for warning is that in the first call to the ioctl, if
there is no MPOA client created yet (mpcs is the linked list for
these MPOA clients) we do a `mpc_timer_refresh` to arm the timer.
Later on, if the `alloc_mpc` fails (which on success will also
initialize mpcs if it's first MPOA client created) and we didn't
have any MPOA client yet, we return without the timer de-armed

If the same ioctl is called again, since we don't have any MPOA
clients yet we again arm the timer, which might already be left
armed by the previous call to this ioctl in which `alloc_mpc` failed

Hence, de-arm the timer in the event that `alloc_mpc` fails and we
don't have any other MPOA client (that is, `mpcs` is NULL)

Do a `timer_delete_sync` instead of `timer_delete`, since the timer
callback can arm it back again

This does not need to be done at the early return in case of
`mpc->mpoad_vcc`, or a control channel to MPOAD already exists.
The timer should remain there to periodically process caches

Reported-by: syzbot+07b635b9c111c566af8b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=07b635b9c111c566af8b
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
---
v2:
 - Improved commit message
 - Fix the faulty condition check to disarm the timer
 - Use `timer_delete_sync` instead to avoid re-arming of timer

v1:
 - Disarm the timer using `timer_delete` in case `alloc_mpc`
   fails`

 net/atm/mpc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/atm/mpc.c b/net/atm/mpc.c
index f6b447bba329..4f67ad1d6bef 100644
--- a/net/atm/mpc.c
+++ b/net/atm/mpc.c
@@ -804,7 +804,7 @@ static int atm_mpoa_mpoad_attach(struct atm_vcc *vcc, int arg)
 		/* This lets us now how our LECs are doing */
 		err = register_netdevice_notifier(&mpoa_notifier);
 		if (err < 0) {
-			timer_delete(&mpc_timer);
+			timer_delete_sync(&mpc_timer);
 			return err;
 		}
 	}
@@ -813,8 +813,10 @@ static int atm_mpoa_mpoad_attach(struct atm_vcc *vcc, int arg)
 	if (mpc == NULL) {
 		dprintk("allocating new mpc for itf %d\n", arg);
 		mpc = alloc_mpc();
-		if (mpc == NULL)
+		if (!mpcs) {
+			timer_delete_sync(&mpc_timer);
 			return -ENOMEM;
+		}
 		mpc->dev_num = arg;
 		mpc->dev = find_lec_by_itfnum(arg);
 					/* NULL if there was no lec */
-- 
2.51.0

