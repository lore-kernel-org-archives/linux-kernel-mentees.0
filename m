Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFCA1C1F16
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 19:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731095820; cv=none; b=Ch8F4fPyyGDCWbYXLgzsNuie26dqhgcymOng7TOB9BTtYZ/yiyMPsPNkrse3QZ0BmNCOOWlf4ZdpTAmJy/dt/ILB3lYZsiHyXSeuVvVb8i6y12eTgzrSj7JXmD0NrPXrSsJbWpMFl3OBHNxxMV88HLlqPFqEcGmpqVTrtezPAuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731095820; c=relaxed/simple;
	bh=RnRYMG0r5Tb8CA/prh1T62sDpdMwAAltux+0MaQuw+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XvVMAXiCDbUp7X049awzZvNbPKzlrASDmWBNnwO9PrFK33iNx08/o/gKn6XGYjfK06m8GBC6kuZpdOiAH4US7i3FiM0Z9ZOLGC/eh64kuKMVHN/JLyw4Qs5pfSHfTxqw5O82Q7x6Es4qXtM2368dlhFDOZdwGda8hZesDwrD+aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JL9PGkBO; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JL9PGkBO"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F90441E96
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 19:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xzo_aW_8pJpI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Nov 2024 19:56:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACEED408EE
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACEED408EE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JL9PGkBO
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ACEED408EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 19:56:57 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7240fa50694so1620155b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 08 Nov 2024 11:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731095816; x=1731700616; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UmHi0kdn3wN+ndrULDIunuwFGgPO4PZyVJQogrQ8fKo=;
        b=JL9PGkBOjzVzENwCBKCt9r/IvRa0rZT7mivzVTHcEpQVE3PtZOCR1dquXWU/25iXnz
         kO6lKfdxW+oNdBu+MWImZeZ+QJKw1QfMBNqnH/Nga17gDuyrWI+pdJZLSPsAXT/Qs0V4
         B/sfcZou7EqkwkWQAY4UEhxfU8N/DuQ+5eAsDdYgT3k3/IyS4dUItIxUzcGRcCZzOPBf
         lAPh7TGeHkJOAFTbpE/cv02R8N2KDtdjR+cs6Wxz1J+uPHUEIvDyuNJPFsyRhrcy9sn5
         bInjkNsnt5ylQa5U0qhCeEJ2UCWcrIOANwAtC6ZSABb2Z9pGWwcQEGXDZ4tNXbCRXlfY
         fMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095816; x=1731700616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmHi0kdn3wN+ndrULDIunuwFGgPO4PZyVJQogrQ8fKo=;
        b=hR3KJx70jroGkY0k7UvgP7ImZhW1QtrwoUptHJjQVK1deIufew3Opm4uhmKGhOAUmq
         ReaWCIy8EOzJwzffHMhM+K5VXSzTz7PmZr6w2c9uT82jzq6nYnqRYMKXOD+R7lbEjqDs
         EBm2EOSXFfZ4AgWsBEeIusfdmdG1atmdF/yZ8VeEZ9xyqYBWquToglLbtRkUXzKMgO4I
         IqyQ0AyAeFFgTBvTgx/QBfvSZ6AAvaWSu6zo1ZU6PpAr5JP5ixrNaM0whPO6WDybKMgu
         bulW9pQFVvIn3EilhzvibOux6XoZpzJpUsv0gn0VZEK1UhwjMBJxqg3A8daKdooFHgpJ
         kjkw==
X-Gm-Message-State: AOJu0Yz4DdgdN1KqRliZKqkD1cZLqslGSr4d3NTrZLCWn9JDuZBFBrTs
	ol7jCumZTmAnVnXvs5U96/p2ysIbxQcfUK8BqPjhKs/4Fnzc8T2E51NqLHDk
X-Google-Smtp-Source: AGHT+IFTohcBku2wu4peqwuNZQdYZKLKlPBcz4eTW8IXVdP1pnayn0FCaHcbMUYyxQ2C0uZaXwzxSw==
X-Received: by 2002:a05:6a00:17a7:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-724132a111amr5586111b3a.8.1731095816377;
        Fri, 08 Nov 2024 11:56:56 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078c0b13sm4190964b3a.83.2024.11.08.11.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 11:56:55 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Alessandro Marcolini <alessandromarcolini99@gmail.com>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH] tc: fix typo probabilty in tc.yaml doc
Date: Fri,  8 Nov 2024 12:56:42 -0700
Message-Id: <20241108195642.139315-1-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling of "probability" in tc.yaml documentation. This corrects
the max-P field description in struct tc_sfq_qopt_v1.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/netlink/specs/tc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/tc.yaml b/Documentation/netlink/specs/tc.yaml
index b02d59a0349c..aacccea5dfe4 100644
--- a/Documentation/netlink/specs/tc.yaml
+++ b/Documentation/netlink/specs/tc.yaml
@@ -622,7 +622,7 @@ definitions:
       -
         name: max-P
         type: u32
-        doc: probabilty, high resolution
+        doc: probability, high resolution
       -
         name: stats
         type: binary
-- 
2.34.1

