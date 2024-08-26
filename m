Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1658A17C984
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724677649; cv=none; b=Yo3OeloQVP8c6A8r3uRjEXwGrQMZa9SpUro7igkYgKXiukF+1qnHwwh/qFdX9kk1Ke6sbAmCYmosRbE828LD28/BtUMGCmK/14jUCxKErlCLmSNE0IbBVcRaSNABCh+K0+wb+YrUUkiwebAKwB8et/c8Nbdm5gY7g2ZySCAXp9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724677649; c=relaxed/simple;
	bh=Tm560mVWC62ebtgeH9UzDbDfVz3a/kuqxIo8F49eQjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h1RqE/M5OTFNFVLa2+e7OHzafaqErttm/uDFwj42cKHRiJ/hQjLh96DNUfIYj21UNge/f8aC6uR90RExW4DW/MjN4KxQuGgfeft8kCtVtz7frjU8jp1hoYeG8TphG158dFlB7uJsF+2WzpWjCSc++mcSGkZfc5l7nSmdXdPLIQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=em4W1IFG; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="em4W1IFG"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1D83606B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 13:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrWvblk6erlL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Aug 2024 13:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=djahchankoike@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2E7660670
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2E7660670
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=em4W1IFG
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A2E7660670
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 13:07:26 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2021c08b95cso39743095ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724677646; x=1725282446; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fjSIkEAguZvpp5zFP4qTDSn4cL9ylZImedCGDs8J790=;
        b=em4W1IFGaqJ3Dz48gzdt7ueazCA57b3K6LSlN2dLGr5hBAZQFN9ttzdYDUt5+OljrO
         M5AL080kcQANS+Vgc/VjJlX7LBLPofuoYIlS0sUjPUqdxl0JJhXmEFkiYlYOJwPSjEr2
         +T/Lhq+aUxG1mpCBCqRTbvaAi4g3U73Vnamp7SoW6jvPmuUWaB6sbfd4qNGRIjnfuEo1
         IDiRjXW77vGAuzm6uMfMhgPt6u7ISAsaOjtOb90BH6jkgaBLy06ozYoGgP7DafQOpPUm
         2Tta9TKaNKinPQ0Bbwv5b0Iz2MBnItWMRl5PLHCAjeanx9zjIIvThjg/8pgz9xM9W1hS
         0osQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724677646; x=1725282446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjSIkEAguZvpp5zFP4qTDSn4cL9ylZImedCGDs8J790=;
        b=HcZX2XiHQ0FdhHn3KKeCr4FGQDH2zP8kaFZnUILzlQMwbHkj//C6umPuOxviAjfDE6
         Mn/AMOFbrcWQYvge8UzTWI4DuMPkKr339IO9fjrC4Whs3pYLgkgGsopXGMmMlb6NeZVP
         vwHtqbMLv6gbRs2qSJ+0DpYjAURYGdQeSmqZ2E2833Opd6rMH6f83AMXEBWSOg8kTHzK
         ocyKE9uTEmqPyrRMA4x8Hjndnouqe1S5Rridu7X0zhH8Tqw9/IJp22FZyzlCcKpuR0PA
         AfvbPbuvxMgKrRrK4tAAN0J9KfgcgjR5qcSg2jQYeHhurh/2Jd1J/NbrFeRfS8IpZ9Ti
         PDFw==
X-Forwarded-Encrypted: i=1; AJvYcCW6BokY120o4bWNn5+AmpwSjC7SaVxj2rw50JUKMEdKAr3rk3LK6Tde+e+ZNLWTlvNadoW7mqhdIpCa9FWzPrgwoZCHYQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyDbaoni8XOmi1u7OrtTkEMzUqUEIXKlKG5xMW7pSxJaT9J9xwS
	fHwWYOg7qdiTXQry65Jl6gGWZ69bMgwhzEtt4NMTFtxxWq2JaDPF
X-Google-Smtp-Source: AGHT+IG202UJ8Q/mYcz90DLjjI54Jr9fnHjviwfSQ1zKgvVkr+IAMOe+qpIUOFxiXsnnb2XPTDhJ3Q==
X-Received: by 2002:a17:903:6c8:b0:1f2:fcc0:66f with SMTP id d9443c01a7336-2039c638710mr111386975ad.31.1724677645630;
        Mon, 26 Aug 2024 06:07:25 -0700 (PDT)
Received: from diogo-jahchan-ASUS-TUF-Gaming-A15-FA507RM-FA507RM.. ([200.4.98.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038557eeccsm67326565ad.84.2024.08.26.06.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 06:07:24 -0700 (PDT)
From: Diogo Jahchan Koike <djahchankoike@gmail.com>
To: davem@davemloft.net
Cc: edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	kory.maincent@bootlin.com,
	o.rempel@pengutronix.de,
	maxime.chevallier@bootlin.com,
	andrew@lunn.ch,
	christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzkaller-bugs@googlegroups.com,
	Diogo Jahchan Koike <djahchankoike@gmail.com>,
	syzbot+ec369e6d58e210135f71@syzkaller.appspotmail.com
Subject: [PATCH] net: ethtool: fix unheld rtnl lock
Date: Mon, 26 Aug 2024 10:06:50 -0300
Message-ID: <20240826130712.91391-1-djahchankoike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ethnl_req_get_phydev should be called with rtnl lock
held.

Reported-by: syzbot+ec369e6d58e210135f71@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ec369e6d58e210135f71
Fixes: 31748765bed3 ("net: ethtool: pse-pd: Target the command to the requested PHY")
Signed-off-by: Diogo Jahchan Koike <djahchankoike@gmail.com>
---
 net/ethtool/pse-pd.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/net/ethtool/pse-pd.c b/net/ethtool/pse-pd.c
index 507cb21d6bf0..290edbfd47d2 100644
--- a/net/ethtool/pse-pd.c
+++ b/net/ethtool/pse-pd.c
@@ -226,17 +226,21 @@ ethnl_set_pse_validate(struct ethnl_req_info *req_info, struct genl_info *info)
 {
 	struct nlattr **tb = info->attrs;
 	struct phy_device *phydev;
+	int ret = 1;
 
+	rtnl_lock();
 	phydev = ethnl_req_get_phydev(req_info, tb[ETHTOOL_A_PSE_HEADER],
 				      info->extack);
 	if (IS_ERR_OR_NULL(phydev)) {
 		NL_SET_ERR_MSG(info->extack, "No PHY is attached");
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		goto out;
 	}
 
 	if (!phydev->psec) {
 		NL_SET_ERR_MSG(info->extack, "No PSE is attached");
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		goto out;
 	}
 
 	if (tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL] &&
@@ -244,17 +248,21 @@ ethnl_set_pse_validate(struct ethnl_req_info *req_info, struct genl_info *info)
 		NL_SET_ERR_MSG_ATTR(info->extack,
 				    tb[ETHTOOL_A_PODL_PSE_ADMIN_CONTROL],
 				    "setting PoDL PSE admin control not supported");
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		goto out;
 	}
 	if (tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL] &&
 	    !pse_has_c33(phydev->psec)) {
 		NL_SET_ERR_MSG_ATTR(info->extack,
 				    tb[ETHTOOL_A_C33_PSE_ADMIN_CONTROL],
 				    "setting C33 PSE admin control not supported");
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		goto out;
 	}
 
-	return 1;
+out:
+	rtnl_unlock();
+	return ret;
 }
 
 static int
-- 
2.43.0

