Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5815D18757A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724674492; cv=none; b=RfFTuJRDVqHRCFi/Lto8sBMytQ+rhgb+oqvv+BebiwBvH2LNN0Zwj8W4YlnXwAUrr072dV6ES9qRWQ5+oEASnvdYeKclMl7XCzrH89ntLEmygGznD3ftejw9+6Di0byeKdUZuQZ6XlzBeXWmlDyiWEWNYKgejP56jhknfGMkuhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724674492; c=relaxed/simple;
	bh=PMAG5/gig7pArsoHvKL9Qukbrnz+b5ucBC4N3vJCw+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bpDDJBif53bUTM7fNnjcDB/IW7UgjTLVVVoeQUGolc0dNIe1rYR9wADEoyCqJdd64Zit+yOiZWYMwFbc/PKrJIIYcQzXT13hXNMk8IyM9PvttQnxMlK6utAjdB1mMbah77cfbL2e6ur/VUfLjG0pOriZGiuLMqtz6e/TVPi2hO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il0JuLog; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il0JuLog"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 084504010D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 12:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvGaI7xHiWQ7 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Aug 2024 12:14:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=djahchankoike@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1E0A40065
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1E0A40065
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=il0JuLog
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F1E0A40065
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 12:14:49 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-715abede256so575795b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 05:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724674489; x=1725279289; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+LVdNryLjaGNN9ifDLmqexf/yv699MnrXI0tyPkCAA=;
        b=il0JuLog31OEqvif2O3mPbTMZ4z1eklwx2SdMvgHlpmDum2jHW4be4fIJsU6++kNJ/
         KN5MnzE9ZlWavb+zvTxFJAwF+RaoDLBp3QFf2i2d+DUg75Q3bB2jkNV3lpwqsUGRdZJJ
         UgBKwExoFrNVKc+sjSG2y/gqVvwxjqy+wnYOxGuBy/7GtrqvHeZJYdfDdUrmiqxGyknV
         0OfLYcHICcdJP/eakbWC7/9oYjjCj9fjsjlSVaSSfjp2af1pfA8zzZydfa5fli0WuZRZ
         8C30DULDr6iU2drucupL4tuftM8rvNSLbF9MBQUjSUORQk6aHCZMCSUdr8XcRunhZE7L
         jHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724674489; x=1725279289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+LVdNryLjaGNN9ifDLmqexf/yv699MnrXI0tyPkCAA=;
        b=Ck4tuUuGUDmeQxjryKXE/lZLGFis4WSajruEqk5JfsrybNV0YjsMh1TePnJLB+p++H
         tl470U5sTr2qSw53w2yLZHeqYXJr8qz+amgFCTF9HkMEhRt6vGqOtl66hSWj3Zot9a9W
         i6pgfuE/0Dk/sc0sDuG/rmVWJo/b8ludM9ZyY0UfYzCfe0ItjlbF+KYcxgcrmDZ6LCoU
         ZJOfRi/r8yO43B+zKgvLlOGmL1OHXqOfznxXawMaKsGuBWvIYeSNqPAHPG1p5PgSJuKM
         Qutqrxdu/WC7DnYKu0y7WaGL2o3ha/Gu5/jqvaYdnyxHeJi32eg7TZJ9/O2UjsQ1nt8J
         m89g==
X-Forwarded-Encrypted: i=1; AJvYcCWBqt4OWkLtvByGcY/l7R/iteCqHrsTxCZQq99FMxYkFbaTKYFecWOUCDuiCgL6vPN/u4E85IZ/5qFlii2RVTFJm8acJA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxVxQp6cWZyB/2zRClpHtTizEH/La1oVm8IfBXHiSOZa0dyA2/P
	dhKxQ08pYhZBgZ7WBED50GinQV6XtCLBsUahlsVz31CE2at1e1GM
X-Google-Smtp-Source: AGHT+IGc4PtoBRWIabtZHT9NxlK06f5B+sPItVc6GiqKe1Pfr2RkH2u11V87N7o4qEv3ihUMf95H1A==
X-Received: by 2002:a05:6a00:2342:b0:706:284f:6a68 with SMTP id d2e1a72fcca58-71445e0e3a7mr9382632b3a.23.1724674488984;
        Mon, 26 Aug 2024 05:14:48 -0700 (PDT)
Received: from diogo-jahchan-ASUS-TUF-Gaming-A15-FA507RM-FA507RM.. ([200.4.98.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e10bfsm6862652b3a.121.2024.08.26.05.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 05:14:48 -0700 (PDT)
From: Diogo Jahchan Koike <djahchankoike@gmail.com>
To: davem@davemloft.net
Cc: edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	andrew@lunn.ch,
	christophe.leroy@csgroup.eu,
	linux@treblig.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzkaller-bugs@googlegroups.com,
	Diogo Jahchan Koike <djahchankoike@gmail.com>,
	syzbot+c641161e97237326ea74@syzkaller.appspotmail.com
Subject: [PATCH] net: fix unreleased lock in ethnl_act_cable_test
Date: Mon, 26 Aug 2024 09:14:15 -0300
Message-ID: <20240826121435.88756-1-djahchankoike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix an unreleased lock in out_dev_put path and substitute
both labels (out_rtnl and out_dev_put) for a simpler out.

Reported-by: syzbot+c641161e97237326ea74@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c641161e97237326ea74
Fixes: 3688ff3077d3 ("net: ethtool: cable-test: Target the command to the requested PHY")
Signed-off-by: Diogo Jahchan Koike <djahchankoike@gmail.com>
---
 net/ethtool/cabletest.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/net/ethtool/cabletest.c b/net/ethtool/cabletest.c
index 01db8f394869..c1f0510eb465 100644
--- a/net/ethtool/cabletest.c
+++ b/net/ethtool/cabletest.c
@@ -77,18 +77,18 @@ int ethnl_act_cable_test(struct sk_buff *skb, struct genl_info *info)
 				      info->extack);
 	if (IS_ERR_OR_NULL(phydev)) {
 		ret = -EOPNOTSUPP;
-		goto out_dev_put;
+		goto out;
 	}
 
 	ops = ethtool_phy_ops;
 	if (!ops || !ops->start_cable_test) {
 		ret = -EOPNOTSUPP;
-		goto out_rtnl;
+		goto out;
 	}
 
 	ret = ethnl_ops_begin(dev);
 	if (ret < 0)
-		goto out_rtnl;
+		goto out;
 
 	ret = ops->start_cable_test(phydev, info->extack);
 
@@ -97,9 +97,8 @@ int ethnl_act_cable_test(struct sk_buff *skb, struct genl_info *info)
 	if (!ret)
 		ethnl_cable_test_started(phydev, ETHTOOL_MSG_CABLE_TEST_NTF);
 
-out_rtnl:
+out:
 	rtnl_unlock();
-out_dev_put:
 	ethnl_parse_header_dev_put(&req_info);
 	return ret;
 }
-- 
2.43.0

