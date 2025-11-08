Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA74270EC1
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Nov 2025 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762633610; cv=none; b=aq99iXj9UGmsNYuqP32pHkbJ1nVBxpjxQuQ1EKw4KgTivXPY7FDoFQbFDxGpo27eU0de7EcsfoImmJ/sHHmsKPd129PC+OpTM+P+eVpKP/tXPmUi1a38Q6iEGHSNIG8QoxWKHbQ9/dE2mLfennAil/XlKIP2K4ROrhlB1RqxHrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762633610; c=relaxed/simple;
	bh=7r2vaQFsXYEdBsj8HiqWkBplfeax3sxT6mHqMhZQqOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mraUwIZbhUt305C3Rgz70EBtiqiBa2GQ4SEjq4h/Txru/TVxR0zR3sa/dr5bL2p60G8D/3wQ/8HofGx4ln3X0gQg5cf0k+aPuDDA4IcSkHcq91LqhIi8zM5cH1f4+qYAysD6pZFvX6B8tTzBew8/sWNlh8XNUUupREuFEkJT3t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7ucyf/p; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7ucyf/p"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8af121588d9so264637885a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 08 Nov 2025 12:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762633607; x=1763238407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vqdNy1cXW3Hz2aSEK4LLxs8ePlR8f5QrAsxwadDsOPg=;
        b=i7ucyf/pJrsbIWStqSy6MsEfojMr1Ysp5QVnCIa75KpPwJzELyl1r4uKnKqvNaFXOE
         hLrZdF+4vXel4S4ttQ1P0thyOekg3zRoQBOfnUMVWH6T4u5IHMG+cuEA/nNeTtj9cCY8
         Lwqu9zFNiW9WA/rOmyRyhNdo3E9KNegTIefJViCEicEcSoXXmX8K9TzU68xi+2ZEtB+v
         qB6OmssjLF4B/hF7TPH1dzmAVJ5N9QIHq8lJxdN1Vl7iMB3stLUsGTXvUbidiZai4vln
         kl4sTVKlUJDXEb7lE4XX3V+QRvO2ost7r9LUUif8MnRGK3QFr3rQF/JFbLgoRc3tTDpQ
         l1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762633607; x=1763238407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqdNy1cXW3Hz2aSEK4LLxs8ePlR8f5QrAsxwadDsOPg=;
        b=CJG+/Bh2B45fuzV+CllAHeoiKiDP3UaI27g5WitS/pRci71gElnIW5zHrOtnRNXkU7
         f81RiRJiwz49YIzaeSM634yc6iQ7KKkD0qsDML9sM2yQeEHzu0im1NvWZlaTa/Jbwzfm
         am2Y6zp4cv54mLDxSy/ejLqtaIRyGMlTQ006uTgmVzGWioHIrTDhIjTYNvQ3X+jmx7Zi
         M6GisBjWxR9AtvxMCUhL0LCLX+Kk8DKCDVdZ/0m//Q3RRihy4qKKGXUMRlYz30j5WUAV
         4BiBesmPJrZ4I1K+byhoSDqbTsJ86E9P0T63Ug7sFZUBhpBURfLBCtwJP6xPTCmrEe29
         DKOw==
X-Forwarded-Encrypted: i=1; AJvYcCWdFFyqkKuw74egthVV/UV75qwTHQ0IC9hxmhGaj3gHLV43Yli0KwaU2Gb2x44mcZz9wzbC7waKIWv05RqnBxZcM0pIDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/lHXEJXOP8ivF6ISY5pZ10xnhxmzxXs2ikIxclPSVn2OlfXJ4
	ooKfneZjUY50he+j2JidgqCBRdJ+3CPB/v16l7FE1BMN2V0tU7OZ9qdF
X-Gm-Gg: ASbGncunTAsXnbAfIYluyePUqU0OwBbrGFyixIbmjoVjYOS4juN+OVoRF+d7HdFhBQK
	Xvjea1BNbSjApi7jmZTnbBNAxeYziS/4FiyJFf33GlWAER3CGcUuja3jmeo+k0hm6XMNKu/ForQ
	KjUaTPRnY+DfmMdKn1JPSxQtXtb512MHQPMPnXD2dVCvLQCwAmqBJdLeNhALdf4nVxl2KjbL7T/
	Tqzn4D/Q6K8Zvg+oMyd/kIWvP/PCL/e1uHeu1V13lcaUcqB3LXd0kKkJxzrAEd1cpJ1+Bbuecy5
	HRJ8mElGKuJU4dV1A5lfw4e500SRYLR00KMIJnpl6w3pP2L5xLEP3JNcd7PmmmtOr+o07xAbalZ
	3xJ4VdvC2PN4j4QSiQuUyA2auvcK1OqxzsDPlGPxilpV9eT1i/I3N0b/pX/WAdImyMJt57rJfQz
	4cVi0ikSf1lifakJRxdNZQ
X-Google-Smtp-Source: AGHT+IGONkC6+DYOwOtmQYThFKcoR7JN6qMjHtFFocpFa9KyeI27WnTRQjoR1Bqiw3sai+RnnmkvIw==
X-Received: by 2002:ac8:584e:0:b0:4eb:a291:fbf7 with SMTP id d75a77b69052e-4eda4f90bd7mr46135221cf.49.1762633607356;
        Sat, 08 Nov 2025 12:26:47 -0800 (PST)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4edaebc73b0sm7067891cf.22.2025.11.08.12.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 12:26:47 -0800 (PST)
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca
Cc: cascardo@igalia.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com,
	Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Subject: [PATCH] ext4: validate xattrs to avoid OOB in ext4_find_inline_entry
Date: Sat,  8 Nov 2025 15:25:46 -0500
Message-ID: <20251108202545.1524330-2-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When looking for an entry in an inlined directory, if e_value_offs is
changed underneath the filesystem by some change in the block device, it
will lead to an out-of-bounds access that KASAN detects as a
use-after-free.

This is a similar problem as fixed by
commit c6b72f5d82b1 ("ext4: avoid OOB when system.data xattr changes underneath the filesystem")
whose fix was to call ext4_xattr_ibody_find() right after reading the
inode with ext4_get_inode_loc() to check the validity of the xattrs.

However, ext4_xattr_ibody_find() only checks xattr names, via
xattr_find_entry(), not e_value_offs.

Fix by calling xattr_check_inode() which performs a full check on the
xattrs in inode.

Reported-by: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3ee481e21fd75e14c397
Tested-by: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com
Fixes: c6b72f5d82b10 ("ext4: avoid OOB when system.data xattr changes underneath the filesystem")
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---
 fs/ext4/inline.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
index 1b094a4f3866..7d46e1e16b52 100644
--- a/fs/ext4/inline.c
+++ b/fs/ext4/inline.c
@@ -1593,6 +1593,13 @@ struct buffer_head *ext4_find_inline_entry(struct inode *dir,
 
 	down_read(&EXT4_I(dir)->xattr_sem);
 
+	if (EXT4_INODE_HAS_XATTR_SPACE(dir)) {
+		ret = xattr_check_inode(dir, IHDR(dir, ext4_raw_inode(&is.iloc)),
+					ITAIL(dir, ext4_raw_inode(&is.iloc)));
+		if (ret)
+			goto out;
+	}
+
 	ret = ext4_xattr_ibody_find(dir, &i, &is);
 	if (ret)
 		goto out;
-- 
2.43.0

