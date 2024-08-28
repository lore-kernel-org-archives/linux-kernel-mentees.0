Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BF01A7074
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 28 Aug 2024 21:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724881093; cv=none; b=SlWqjW/I5EnITwjN/J5+sKgnL3CvaTMw+TL3YS5Cz/kpsYwTdgUUrdnRB0mz3PJDXl2d6Ged+DcIB8HHFfVhkaPaX/AjT45R9VN0EkQSSWhFxtiGBAsEQ4VAmqRnwXnVQBKgJRDgyQ+fod0aaNCUXkZlRZ6+w49Rp3MTHwJwyDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724881093; c=relaxed/simple;
	bh=mXpwxscITuJmDBnHHHFo2Unzf4ty8r85TPNYp2/qzwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qFtuqjXb5azXHRUvvZig8cL+tWd+dczLG0UDG9yl8WHr/wDciwRNff3Z36+S/WMsNwCpI4vNxjehGLz7WqVAv0biMV83BW6dvF2vb0kELOM3VfJiGfXMjsdxD+LHTx8pICiTZryMnbF5qJdivcno4/28i4sS0uI0ncNeoB154Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWL55JRg; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWL55JRg"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBBA040CB3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 28 Aug 2024 21:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tt-HHZcykSGt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Aug 2024 21:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9E7940CAB
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9E7940CAB
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jWL55JRg
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B9E7940CAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 28 Aug 2024 21:38:10 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-201fba05363so62712005ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 28 Aug 2024 14:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724881090; x=1725485890; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:commitdate:commit:author:mime-version
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMk99BuXbDSj6pqZLfc1bsxguv/U5uK+knnZthXiKeo=;
        b=jWL55JRg+UllMhkepvsyI77lXwQfYGTkJu2tNaIbtAkQ7dUAz6DduV8iMCh4Bp/j6m
         FE8p/Dv/NFfanXCjQY1Dd698gqPitQFoqID3w9WVZiUM6d0cgMoXg3slkzCdlB5DiMRf
         e00u3UW/9Drq++MRrA24YeQTc4JMDBSP4YBY+wmjDk5iRrMZPxPuzyLFW4nPuQ5in2z9
         GBsBxMNb8xXkKZo96KqzCGa26HKmi67JURZ01uUU9FiBp1yecjz6KkWu4B5veqH7Q5YN
         gG0Nyjsj6BrL+aSUSWb4qkOX9bihpUMLjLLesMIQP5V0wGYUaFRfGAGBu4U+Jqsvv69G
         Uf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724881090; x=1725485890;
        h=content-transfer-encoding:commitdate:commit:author:mime-version
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMk99BuXbDSj6pqZLfc1bsxguv/U5uK+knnZthXiKeo=;
        b=cGPFNLrOqu67Ko3ULSv4rDunRJ+TpDCWhfAKkq9h75Tp4c5+VfzWvJ0tEUrPtP2PvV
         sjetXdtENc69hAE/2ZGC1xK0b1FZ1wfaal87z4+3y9l/8gn9Pbox0LirH1O/t8RFEnzL
         du+Xh3n9O/QISvOt/W17kcFhWTO5h9V6Zl72+wLJ2pVQET7JqnHMPPYRqUv1zzNbH9ys
         IrkcjNwKfYSzzIpbJyZHse7rW7xL/OOzGLJq9az0k0npBKNcYH579KNNkIztN4vHpvoL
         jZPGzmHF/WJrCr4+/frs43Ec9KBqeADdCM4fZQr1JqZYT/CZpG+XvxyYBgiI+lyn5QZf
         sRGA==
X-Forwarded-Encrypted: i=1; AJvYcCW/SeuOgNa2DThfOInB1O9vtx04wSr61TXVf5aQoKQ7R/Jmdilp9CIveiob1IaPjxpeqPUJIFaOnttJ+x4HzLaMXyUi/A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz6Dj04BuXJHwinnHDHsMIBqgF+R+4zlMHdQmogLR7Wp9KMy8xm
	OaXPYvufLjU8fW8TBb1yYWFkc2dJPtHUCXN4Dqi37Ts4UdpbD+NH
X-Google-Smtp-Source: AGHT+IFaT8OEEW0oabyNfRxvHJKgCkfSakODxyJlgwi2BKF24q8TjzgeSilZGLAJ/APAfWrYwd7Lyw==
X-Received: by 2002:a17:902:e886:b0:202:3bae:9718 with SMTP id d9443c01a7336-2050c23beecmr9354515ad.15.1724881089707;
        Wed, 28 Aug 2024 14:38:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:f022:f804:ca0a:f615:5d6e:f4e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385566585sm104084125ad.4.2024.08.28.14.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 14:38:09 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	apw@canonical.com,
	joe@perches.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH V3] scripts/checkpatch.pl: check for non-permalinks to Zulip
Date: Thu, 29 Aug 2024 03:07:54 +0530
Message-Id: <20240828213754.25137-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Author:     Siddharth Menon <simeddon@gmail.com>
Commit:     846988fa0b20c2eb1bac2ee341c973762df9a1f1
CommitDate: Thu Aug 29 02:49:40 2024 +0530
Content-Transfer-Encoding: 8bit

Zulip links to https://rust-for-linux.zulipchat.com can break in
case of renaming the topic or channel if they are not message
links (which are permanent links).

If a non-permanent Zulip link is referenced then emit a warning
and direct the user to the Zulip documentation.

Permanent links are of the format:
https://.../#narrow/stream/x/topic/x/near/<numerical_id>

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1104
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
V1->V2:
Corrected the Github link to the right issue,
Fixed grammatical errors and Replaced the link to reference 
Documentation to one that is easier to understand.
V2->V3:
Updated the URL to link directly to the section in the documentation 
with instructions on how to create perma-links.

 scripts/checkpatch.pl | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 39032224d504..58a5e02c588f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -735,6 +735,10 @@ our $obsolete_archives = qr{(?xi:
 	\Qspinics.net\E
 )};
 
+our $zulip_forums = qr{(?xi:
+	\Qrust-for-linux.zulipchat.com\E
+)};
+
 our @typeListMisordered = (
 	qr{char\s+(?:un)?signed},
 	qr{int\s+(?:(?:un)?signed\s+)?short\s},
@@ -3415,6 +3419,12 @@ sub process {
 			     "Use lore.kernel.org archive links when possible - see https://lore.kernel.org/lists.html\n" . $herecurr);
 		}
 
+# Check for permanent Zulip URL
+		if ($rawline =~ m{http.*\b$zulip_forums(?!(?:/#narrow/stream/.+/topic/.+/(?:near|with)/\d+)?($|\s+.*))}) {
+			WARN("PREFER_PERMANENT_URL",
+			     "Use permanent Zulip links when possible - see https://zulip.com/help/link-to-a-message-or-conversation#get-a-link-to-a-specific-message\n" . $herecurr);
+		}
+
 # Check for added, moved or deleted files
 		if (!$reported_maintainer_file && !$in_commit_log &&
 		    ($line =~ /^(?:new|deleted) file mode\s*\d+\s*$/ ||
-- 
2.39.2

