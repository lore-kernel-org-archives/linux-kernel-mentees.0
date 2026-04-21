Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794020E334
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 21 Apr 2026 02:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776739891; cv=none; b=WZrNoLwNB/NeatPSivYFI24Gra585mRohLFL1Y3e3QN+VQ5TIS/MhRmvCTlPFRPuCcuRbWj1/giRJAEZKcvgNd/Zn0R3qDKjEsl+tjzsC7jcy33xHkppATaIlsDH6V7B7HwJXfvT6j4+uJw4c2My72rUgqOeq8PI4CNFFx8ZP48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776739891; c=relaxed/simple;
	bh=VqSBexJMNIHC54WdCID6u/xPpx/3eQos31xFOQdy8sU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TBal/7tq1hF/0El2bbfl7Dh+Ru2rR6poyPkhBA2xglvBAx3PL2bAqBnyBMgMgKjWGaPFzmr1sY9GPcEYh4ldUhIQLQd0PMtx8a3ILxL4Dak6B1XdBURV2NnAO9XhdkNH1G2L45z5uQlRgEHQFvzTqV6Kk/XL3tpwe1q9ihxGSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRu0L0LH; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRu0L0LH"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82fa01e86e2so1792327b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Apr 2026 19:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776739889; x=1777344689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xpaxH8+vQYVlcVoYKktqzw1Wuz9BvpJGipAw/vPCovU=;
        b=aRu0L0LHa7sDR4MsCgnMadAf2jHGrfZ3l+38jyRjloz6BHx1121+N5kkl5AZqsbgzP
         qBOWNwxBQ7l64oaGM6HyJt+izwRpozWFprdSeBtJZi9JKyoYL7rEflmZPuG/aGI7gQdU
         ukWQTqHYHtoCrxZeGj5Ii2qfy09lXoGM7UMvEfhQ1dgR3peWQquUbNzpDUgSt+VTF19J
         MFJtTV65jNyBVARDl9O7kewQBkhUFz9FZ3lqH6Q7EIK3sdER91GbUQz90d+4jhkmKjW4
         Gkut3zfnhnqsn4MsM+SQe6BEGHM+W9UnrwW5KRWskleq6wlaHxYROE1U8hgE/NXZOX6E
         jD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776739889; x=1777344689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpaxH8+vQYVlcVoYKktqzw1Wuz9BvpJGipAw/vPCovU=;
        b=EncCYVLN0nx9873ox98cMo2c8s+O3GsQv2VyXG6gI8Z0Hn11pXTKsny8zRdkJ+KXBD
         pAm0YKICw8GbqS6UbPsL022d3nahSZh6G1gZjAiqJs9Ep5TStgXaffSy8LbCl6gYe3QP
         xreQORn30smvslyWzg3QPh1PNG63wjwm4Q2N0HIOgwG2dd/SozHK0xlo14L62/GrYTLD
         QAHV8Nr+uTH6p+FrsHB8hQ/UIy4N1Z8bFym9gofj8Ehq9PtdnmbVEBBKyIHSYgqU/PwR
         pF7Yx5M/0Dws/MqVUhn2a6Iyf1HIpum9eea7TlkECNWtNFYPMJvba2TqxeglBNmF0few
         Psnw==
X-Forwarded-Encrypted: i=1; AFNElJ/kZCEgFOjHiACc47q0qasbI+cu/u3bgowumls/8mGdV+xajuvYnxLL0oXFfAoWfOhvwn9AIUZrWcgm8SZrEqo7M8UjBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yynb3+ol48TK7C/KLopcmuPZ87+rnVim3VW9VZYk8VnIjg3ITv3
	7kLp0VDViuyIq0M6cqd9WCiKtpnEtGfaF93UDi5vS6f7nzM4ojX4vSwF
X-Gm-Gg: AeBDies7qofzXu2QMtd1Jk7VHgDxeSv+VBP5kFYALj/cXFQjgULF2AjbfHSwYIVdjND
	ZQ2a72LkQVpD0D1wmiCV95nJWaUMEnloLN0Ck3CuzJBAkVtwySqiHgdYUWB2gU6ScQwmMTmRfvX
	SmI5TJPunuVx1Y8DFLvbbrEL7uXoT/qwBXsitwOWEpPuIcrqTxu2LZR9OCYdvkH8kaRO3N/xFQB
	gLlh9VlcdyX1NMcvvkX9i9L0d53ocADT7gBOxiSpG3RN6CKUOu+Y6BzVLAf05X9SPM0LiMXt0dq
	waGo+S6IORKVJP18OWdnuSQA9G9bOdG4KpBqKoh3z5AGZEYcyvgk3z5YnCaWQ7INRnHj+Sx657K
	mDgrdU+svsyHRWUiGZ1MSbKkM6+GeWd30KrNUm+5L3svCN9NxICkNpU8fiaBLxK09y7v5gNDwwU
	VY3XPAYC2yGZouHgwX1Ltly5kL9cRsGV0Pu4lGrmFLUcUb/s9FoUaMCjx4KUaPj3ndCC+Z
X-Received: by 2002:a05:6a00:3cc8:b0:82f:1b50:d2f2 with SMTP id d2e1a72fcca58-82f8c8335fbmr17014982b3a.18.1776739888830;
        Mon, 20 Apr 2026 19:51:28 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d9a1csm12823502b3a.20.2026.04.20.19.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 19:51:28 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: luiz.dentz@gmail.com,
	marcel@holtmann.org
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v2 0/2] Bluetooth: ISO: Fix KCSAN data-races on iso_pi(sk)
Date: Tue, 21 Apr 2026 11:51:20 +0900
Message-ID: <20260421025122.55781-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found while auditing iso_pi(sk) field accesses after a KCSAN report.
Patch 1/2 is the reported race on iso_pi(sk)->dst in iso_sock_connect();
patch 2/2 covers related races on other iso_pi(sk) fields accessed in
iso_connect_{bis,cis}() and iso_connect_ind() that were found by
inspection during the same audit.

Changes in v2:
 - Patch 1/2: Use sa->iso_bdaddr directly instead of caching the
   bacmp() result in a local variable, as suggested by Luiz [1].
   This avoids reading from iso_pi(sk) entirely for the broadcast
   check.

 - Patch 2/2: No changes.

v1: https://lore.kernel.org/linux-bluetooth/20260418053239.128190-1-suunj1331@gmail.com/

[1] https://lore.kernel.org/linux-bluetooth/CABBYNZLBoU3byfK_G+=sTkBx3wNwEh2X6_7dG4+4LFtrc3Skpw@mail.gmail.com/

SeungJu Cheon (2):
  Bluetooth: ISO: Fix data-race on dst in iso_sock_connect()
  Bluetooth: ISO: Fix data-race on iso_pi(sk) in socket and HCI event
    paths

 net/bluetooth/iso.c | 56 +++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 25 deletions(-)

-- 
2.52.0

