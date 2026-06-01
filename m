Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0173A3816
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Jun 2026 11:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312765; cv=none; b=Km+5wykAubC5ipvN9zZAllD2BMOhht0xOCnnHZpz8dO16L5QM70X9uXuJay674kN9aNuN9OxHqgtQDociou5ednfKFW4hA4nQr0n7bb11TWohMWpDQde0H5K5cUJXZMFFtbvuDiHPD4gHqwSdmmNxZWp3U/eyAa1AJmM/rhJzjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312765; c=relaxed/simple;
	bh=J8FZmtgSM37RNzXn+Uy7DFPcpuJB8jWk2wbQx4hB7jI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ebs9DUo4kVanRhv5EmxCVq2lWDbfx22ZKW+QkT4tiROkxmFzFjqJZQ2Bf9cnNeeR5MgpIsi7xOWVVLT5YQrnNdVsQ1QY1ZE5a+eWQWwkCqvigDw7IlnJMpv6Lfnbn8uQSDOzl/Ihms/KQoXt6PXVjW0Os2uJ/qhtRIGe33/4WPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ook/lmct; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ook/lmct"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c857fba35cfso954935a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Jun 2026 04:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780312763; x=1780917563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j1yaCrs/RG3cEhV+R3dst7KhkNMCm6jYadJmv3o3t9Q=;
        b=Ook/lmctw5yz/UKfxPOQ1qTVNDlh4n17b2BAw7fLFhxA7DtxUrpMuAwYlGdsFA4fku
         QnYADtY25wX4bF3EbM3mKHR2jf70k1p7Q0EcZ+SCaSCzeg8y0PcQ7cshkK2rwxae2OoH
         kRYxYl0aAj5LzXY86xlRU+81C0+f6LgwiRB9LqC8gPRSrUfmBege3OnZDue+C0uRGdlH
         hRw8owRYlBH/wZ5gi3bDS4LCrkTNGMk62eyauveXI5ezXdAr1uCDqccJPde/wn7llkRd
         0XHF24zyTo0C0DWTfzp4hE59eiHzluTxzKUY5/GzMFWypljWaBbV75uLAUF6oNTlnndy
         A8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312763; x=1780917563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1yaCrs/RG3cEhV+R3dst7KhkNMCm6jYadJmv3o3t9Q=;
        b=mOfehkqItgvoOCOj9Khye+WmqUN5dlvgELa7dt7qxzxzwwkLXSJtbqxlJAVzPx94pR
         Jn8IoioYGI//T/WCVrw7c5Y6wOx7qES998p43FRsoFUks233/CWyHrV0WI/5COF3r1Nm
         vJwfacdJf+qd7SW/Xd/Dg238lDXTOpC7Y9+ash+S3loWoUZHDKDIg3maUY3Z9OrCCQR0
         GBUGZiZmv/IT9jpSdL2DI31NqnqcQymcaKF6+OapwANT2Svz66Cg+U0/e70qzs6tLW+t
         moIsawMJmkI4lAy9ANhXOx3/zWusyZ7SK+Tcu0kgoj4CnqvWch8VkNHPMFzLBXmhZ47s
         kTHg==
X-Forwarded-Encrypted: i=1; AFNElJ8lSlZE9F+9lA4TZQEY+VLxWZE2gSdHYSsAsRmGVS86ZxRLSSCkp9+PDyqBaS2DcRYyvIa84TSlzkuUx012rqm7yz/cBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEQ7mcp+BuR4/G5tAQOmr202dlnjA1vbDzh4rDMV8axqgpAcls
	BkWZ6lHjoJ9deTKhiEnI+zudFeK0B3jmk0XwN+BCL/aauYXp7ln5/P3Q
X-Gm-Gg: Acq92OEmTAD+hyHDaGACJIpbObQ3LQlb2c8hw88JRnzzWuo9dCeCGHJvtfe0Uk28D4w
	l7B90f5lgnEjv/J9juYiM6wTjrBusNkNUpRMWLUQ7/1WF9uDqI2EcsL1sEHM9UzqUb+UQ4GJ33x
	2hDZ6HpMBtnnY8k1XDPLkEAXEoNK0cx7uUJPlaPRCFTdZENWjYb3CggrBJxHbPgJO4EvGJ6Nh2g
	nbeZHNDDnc1woHoKEVIKCBJxSlLO8StKy1hJdpmfacpYfB0pbAvwhIdjVVkzHwHaLw6/wEGDpPt
	En+KHEhg5ukzYF9UJnhAMWT2IHzpcL6jrbGklJjW9+AcwQYZxsj8XazP8YHbMuqJny3wsys6kX3
	cMCzGzx3UKv7MUyJ1h+/30CcwCIhnXjTc2/hnlzbVPD+SbmU/2thC4WoOqc7w1NTUHvrMh40CjH
	6KWUidWrOosm9kZbEBwHOhWTUqJv6R3WemLyk1zvUvwfex2Sm6Czu3Zty07g==
X-Received: by 2002:a17:902:ef49:b0:2c0:c625:4010 with SMTP id d9443c01a7336-2c0c625439bmr69679175ad.32.1780312763044;
        Mon, 01 Jun 2026 04:19:23 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm104225475ad.4.2026.06.01.04.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:19:22 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v2 0/2] Bluetooth: Fix data-races in SCO/ISO connect paths
Date: Mon,  1 Jun 2026 20:19:06 +0900
Message-ID: <20260601111908.232707-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The connect paths read socket address and config fields without
lock_sock() and pass them to hci_get_route() and hci_connect_*(),
while connect()/bind()/setsockopt() can update them concurrently.

Patch 1 covers ISO (iso_connect_bis/cis, iso_listen_bis,
iso_conn_big_sync), patch 2 covers SCO (sco_connect).

The added lock_sock() sections are reached with the lock not held and
released before hci_get_route()/hci_dev_lock(), so no recursive locking
or new lock ordering is introduced.

Tested on KCSAN + PROVE_LOCKING with VHCI reproducers on the SCO and
ISO CIS connect paths; the hci_get_route() race no longer reproduces
and no lockdep splat is seen.

Changes in v2:
- ISO: cache bc_sid too, and pass cached src/dst/bc_sid to
  __iso_get_sock_listen_by_sid() in iso_listen_bis() (missed in v1)
- ISO: use cached bc_sid in BT_DBG() in iso_connect_bis()
- SCO: also snapshot src, setting and codec; v1 only did dst
- reword: the fix stops torn reads, it does not close the TOCTOU window
- fix the SCO Fixes: tag title

SeungJu Cheon (2):
  Bluetooth: ISO: Fix data-race on iso_pi fields in hci_get_route calls
  Bluetooth: SCO: Fix data-race on sco_pi fields in sco_connect

 net/bluetooth/iso.c | 60 +++++++++++++++++++++++++++++++++------------
 net/bluetooth/sco.c | 20 +++++++++++----
 2 files changed, 59 insertions(+), 21 deletions(-)

-- 
2.52.0

