Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CC3A41
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 08:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762246002; cv=none; b=roVpIavYuReTCcEF7MsrxKSJxrK59S7sdjgTLbhlrY2o5BZ5fuIxA0mLpSM1OZWhxWPwZdSMQumrHEQexTXmHhjp8w/sv+yKMN8aHBw4d9/Qsv5hADXG2/BedOQO4EmQ9SZHNkUwnzoxPIh2INJvt9eNdlm/v6hcMvvtPRx1tpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762246002; c=relaxed/simple;
	bh=ElckniwCkRR9OspymP+wD+dOygCeLor/HhB1Abe68Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EDxTz0h7WE1XGYdw5F5kO5kaa5HM093e63f3h/XbEq+BUlD9R+FwSVNWa40SpzoTVrVbgz0fq9hZ9HLcdC2VPwhDJSQ5VyM5AqqG86YI8MJgFEf0PLNpPu8zcZtzSWnfEBZo5O5W7rCN6jY09SQTxhxcdhcZYQ0QXJDaPPHSnrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKpRlehq; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKpRlehq"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A09E381DAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 08:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-C8hl2h5zv1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Nov 2025 08:46:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAE2D81DA3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAE2D81DA3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KKpRlehq
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CAE2D81DA3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 08:46:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-471b80b994bso67927945e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 04 Nov 2025 00:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762245998; x=1762850798; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXqY7SpktVETsfwyWDIsUXpt3grfqqVeE+nZmdbKIDw=;
        b=KKpRlehqfLU4z34ySvYJNJX7IYABTftDJ+y1mj8vAEJYabm6gBTsPC2w0KNpK+ss/x
         NH7WvGeqtitVpEpjn29xewWc8XfedwdF/0soqxHmzXIXir6GgglOjRoqzsU6oqErcyD4
         fsGxCNOxB3jmxs+xAAIldUp/La8A/JxDVNkXtpWH66FKzBnuy73y07T1RxNM8B8LlMDK
         LNzhHLJ/6s1OqD48vxs30G05jqoFN2mMKkK2O/5gHtjCxOtDg+3COexZ/NwjtdW0rzN9
         lm2rEi0eqmG5v7lv8PYZKKZXtTAPqBt0hhhIv7SVeIBd0dvHDKZ7fH51s3PCIo84jLPS
         63Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762245998; x=1762850798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXqY7SpktVETsfwyWDIsUXpt3grfqqVeE+nZmdbKIDw=;
        b=o98sRFzrFl4Q5+yRHXhN9A5efD7z3GCjbsy1YO6mwa7H9zEgt/raAq/4SdGgfCoC54
         BvqcvjEw2Ncte/khMXdrq0rmp+fGa9q2xDKcpRQsP7Nb4I8FJc1rYK4+0MpKf5bvVqqq
         WOEyXYKIXkQhIsNVa6JATUuWjVCPgI5maxqk7cjO/tslyjC3PoBkr+xpKQnDKuLvTJGX
         EAJlVPkOEzqxLMJWfmBkHDI5ZLqroPff1SfVdTUrL3Y7fpIj3Hsl9Qxw0DH9f29HgcpU
         kDXoKgHiGTAWaHMzHs01aBN9VdkNcGYHuWyd45QJ0EcapSEeXkbZxuKLt9KFA0B1WQUD
         NwuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrDFCz5+CC8J8Zo2bfSsfDOkNhwRJQ3TuRxebpEeKvym09KSVMpi7Kq+2CZMNS1Vw32oeVqysC0WtftYTozI/GuumVLg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwAf+SUdKL0Qc2RQIOlDNmI7KDlESD33OH4gPf0eivLA4Bjb6WM
	r/fiMgquJeSOV/k6wVVQ1GfZleR6ycUBDMgtrHec3nkf2i9BjwaaVB7K
X-Gm-Gg: ASbGnctDAGMw2ux6NLQ3eIo0SxZ7uUIGNqFY2iDZHu4Em7qQ4wCZ/PXtgcC/EtxA0op
	PE/TlEEsFD40IlNe1J92fUrF+fkyMtpG/rSe3tfWoTudrHExmu/456o8XtyD/u1CxKVagQLUoDi
	g2zU9mJTYEufeoGz81MgD7jNqWziQnlEbXauEMQh8JjmvN5Wc0m08SQOUneT495p1isnqODsB2u
	BCkgyXyzMWwfqjODfeBn/2FhdnPYucWP2lbZhueIeMb+g+O8YBOgBETDXvOVQAy9xEOLByorImX
	UkiU1WuGcfY11KlWlnxhR8R3wD3cUDztqHevpR0CBsrTB62sPiM08yQEJx7MB+5ZmgfeD/UL8+I
	rWhqsuqZszwCKSBfOZNzWLfzP92jOKLJWsCbFIJRMsgrrglvi5X6sgV+XF2ig1j20thdp4D4Lt1
	dkULVLnFKM3hw=
X-Google-Smtp-Source: AGHT+IHHhUl9Ud+xEn5Gnt/Mc5v3hcvcv7RyFxR4dOxpzt0xz7nLGm9rMaCxa0muEll/2oeYbMw0sA==
X-Received: by 2002:a05:600c:5249:b0:471:1717:40f with SMTP id 5b1f17b1804b1-4773087259amr138572865e9.22.1762245997577;
        Tue, 04 Nov 2025 00:46:37 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c394e33sm200375535e9.13.2025.11.04.00.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:46:36 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	khalid@kernel.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH v3 0/2] f2fs: Add sanity checks before unlinking and loading inodes
Date: Tue,  4 Nov 2025 10:46:18 +0200
Message-ID: <cover.1762184787.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is provoked by syzbot warnings caused by corrupted directory
inode with i_nlink == 1 that passes the initial sanity check which will
only mark the filesystem as corrupted in case i_nlink == 0.

Tests:
- fio/fsmark parallel create/unlink on VM with f2fs root filesystem.
- syzbot

Changelog:
  Changes from v1:
  - Rename exit label in f2fs_unlink().
  - Add sanity check in sanity_check_inode() and remove it from f2fs_iget()
    as suggested by Chao Yu in order to detect on-disk corruption early.
  https://lore.kernel.org/linux-f2fs-devel/d4b7c03c-6554-4407-b823-aecfcdf7dc3f@kernel.org/T/#t

  Changes from v2:
  - Remove i_nlink == 0 check from sanity_check_inode.
  - Wrap i_nlink == 1 in unlikely() marco.
  https://lore.kernel.org/linux-f2fs-devel/1f519357-a489-41fe-8159-a8e319aedd17@kernel.org/T/#u

Nikola Z. Ivanov (2):
  f2fs: Rename f2fs_unlink exit label
  f2fs: Add sanity checks before unlinking and loading  inodes

 fs/f2fs/inode.c |  6 ++++++
 fs/f2fs/namei.c | 27 +++++++++++++++++----------
 2 files changed, 23 insertions(+), 10 deletions(-)

-- 
2.51.0

