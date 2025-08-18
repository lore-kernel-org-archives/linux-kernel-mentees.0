Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAC7311955
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 18:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755541235; cv=none; b=iIFQTvge/JdLFg15JI8Ke06Biy5qushP5YzeFAZT8JSbU0hu3TNgsE7ztR1wJru35dWzP3d5/hmCniLRDcJQov2mgbhaJ2jnlslCdFX6AjeDfp6vyvjq1krGdyaCGE+YZ9BRxAydmUehY40lwMPhTYyJxbxjpw5FF9BfWQKznuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755541235; c=relaxed/simple;
	bh=PwIjObjNEXnILCG6Etqwvak9uZ8WrPCGLpoI1Xb4OBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cNipZJZ9sSvgxAfbZ19/NPo6qBOfEj5qlgK4mBAZVbhS8Ke2ez15qoFR2Je+yote4oIZyMbNKQ3ONigwPg8txixPT5G5p6ZhTglnGQW3JsUSr9BU/Ij7JYwMi6GfIa0VAMDxfTLnb17QD0h/NKZVi4cLZfnPHwHyrgyAn5K/LY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCwAt9+5; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCwAt9+5"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBAA04018A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 18:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCDO6N-cChKJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Aug 2025 18:20:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=rpthibeault@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C02040184
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C02040184
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XCwAt9+5
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0C02040184
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 18:20:32 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4b109bd3f9fso56768221cf.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 11:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755541232; x=1756146032; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nrSYI9QoQCti3KzYW07TUz+VPNm/G69l6PB9811/RbE=;
        b=XCwAt9+5GrkgDto3pjeJ8mw2TpKuWElNNZxDXFk7gZr5svJbppArDFi6VNDpkhaQEz
         AmK9bNbKtlRoSM0iVoqVNFclOWpVwRMBvN5eFcid5KAKqIAgCt5uLGcCKT8oqN6gZjo/
         /gbETAvBFnbPONIsZUNSPslNEHdfF0WGlu3WM4B9pP/vcoWmnLhV6WlNyA26pp+2mCpw
         7UQAkuq8zUv91wMufC+jpp9kBmbqIyAAW4j72SoR7qmVyINc4m0cVHx9D3pmvIkpG9MP
         VvD3aVC4D6ZSZc6rlaglUCjd9GYO0g2D0Vx1QVy0fecaZ806Duk5YBzlQm/CU3R71SO/
         24iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755541232; x=1756146032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrSYI9QoQCti3KzYW07TUz+VPNm/G69l6PB9811/RbE=;
        b=IN1+k6Ko3drSxnEfOtQR795Mc79ypEHAwFbxQxdnjJhQCegWLY22uR4VAbmcl+YnhT
         flb0TFpeUKgiwEGpIU/CH2sA4E83SyFN3O1faKXmQOrqx7I823Ok9SiXj4ydkl6aVoC6
         sBf8UTvoxB1KUSyydyJpSQzOOQ5koYR0d8ha8SACOhEpkZlPfIM1cYa8kN7cpY3xL51c
         8Sg/9GCKwCi5qLII9Uhqul34wrIwuLycsudayv8fgpcN+c77OGCnMckoLvQhmrrW5XO9
         cFska8THzEA/VjtRBZdHETKrutfYEYVwNSqm4lXvg1Lwjz72SPYMwm9yaQgrC5V/Tp7l
         JOOw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ9VPc5Q4AWHgNSoPZDPbc5UWrgtWIwqIeNaZETPQzeC3fu3OM+pRtUzCwoD2nqqegCtS2oFoibRhwE3UDVk0RdBDUoA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywtpsx/o497mweqRH7iRnFSKvUyPPB1189+vK2omkLKK1+INBC0
	zyuSB3wElSgzk3GdwdqrGyKXsZEmlyuOIR01ec/PCN5KvtuzcyVSISvV
X-Gm-Gg: ASbGncuLUi4lA5CDYbDV8P9MGhUNl4XlVpBIzOyWsXuNZ1VEAMky7XLLoM1N2D5sdwa
	A3KOPO39rulmaKuX0MO/FaEtUfKd7+gkipF8L81lVEVRrw2Z3TcYyV1+CSlD5Z7opLCANwBl9vU
	LxQowI6glcai/HZaTUsYdWfptj9PY+A/8sOPOY9cCJO/pnQzh6nwJPucg7t+o+/f8txsilQ2OEu
	2xxkKYWVjrZsNLUnji8nBO1gg5HKP4YF2RbjccV/tCSF35d1rNuGuLOj+RGDpjYsRczz/hJelJE
	4vYrNcxt12PqTcwzeo4CzBCRxWzJjv5ILneiNXpbBx0z6ijGJxsBPLavy3l6kCklNWpjKa5gErz
	nF6PMxVCFOevL+4FpUdTU4vqbjHkzgkSZp3J7P1i0OC8=
X-Google-Smtp-Source: AGHT+IFdCFoIWH+NW1tEJJiuqHiXqdPjwHco3+jsUBbyLhPEQe/utSV/NDFrs3kVmC/ukjigzg+GIw==
X-Received: by 2002:a05:622a:1246:b0:4b0:e934:6ff4 with SMTP id d75a77b69052e-4b2856f4c32mr188791cf.52.1755541231475;
        Mon, 18 Aug 2025 11:20:31 -0700 (PDT)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dc188desm55994811cf.2.2025.08.18.11.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 11:20:31 -0700 (PDT)
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: corbet@lwn.net,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	skhan@linuxfoundation.org
Cc: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] docs: fix trailing whitespace error and remove repeated words in propagate_umount.txt
Date: Mon, 18 Aug 2025 14:19:34 -0400
Message-ID: <20250818181934.55491-2-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

in Documentation/filesystems/propagate_umount.txt:
line 289: remove whitespace on blank line
line 315: remove duplicate "that"
line 364: remove duplicate "in"

Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---
 Documentation/filesystems/propagate_umount.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/propagate_umount.txt b/Documentation/filesystems/propagate_umount.txt
index c90349e5b889..9a7eb96df300 100644
--- a/Documentation/filesystems/propagate_umount.txt
+++ b/Documentation/filesystems/propagate_umount.txt
@@ -286,7 +286,7 @@ Trim_one(m)
 		strip the "seen by Trim_ancestors" mark from m
 		remove m from the Candidates list
 		return
-		
+
 	remove_this = false
 	found = false
 	for each n in children(m)
@@ -312,7 +312,7 @@ Trim_ancestors(m)
 	}
 
 	Terminating condition in the loop in Trim_ancestors() is correct,
-since that that loop will never run into p belonging to U - p is always
+since that loop will never run into p belonging to U - p is always
 an ancestor of argument of Trim_one() and since U is closed, the argument
 of Trim_one() would also have to belong to U.  But Trim_one() is never
 called for elements of U.  In other words, p belongs to S if and only
@@ -361,7 +361,7 @@ such removals.
 Proof: suppose S was non-shifting, x is a locked element of S, parent of x
 is not in S and S - {x} is not non-shifting.  Then there is an element m
 in S - {x} and a subtree mounted strictly inside m, such that m contains
-an element not in in S - {x}.  Since S is non-shifting, everything in
+an element not in S - {x}.  Since S is non-shifting, everything in
 that subtree must belong to S.  But that means that this subtree must
 contain x somewhere *and* that parent of x either belongs that subtree
 or is equal to m.  Either way it must belong to S.  Contradiction.
-- 
2.43.0

