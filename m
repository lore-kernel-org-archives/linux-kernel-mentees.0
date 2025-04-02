Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC4D5C96
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Apr 2025 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743617775; cv=none; b=n91GreRi0+PPZ5BjgNDsrkjZ3V7BvVRnJ+7R1BZEQ6wu4Hh3wLWUUlf79xNSUuAPlCZnf1Hcwlr5aPTcsCoaY5TwBh2fzBnRzjhTr4yAOdr77kvcgh87P2s1JZukRd6ueNxwqjofeyI+VlkYokOGciW7iN2RyWM8+IgEt5TUgy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743617775; c=relaxed/simple;
	bh=DIH9ivi+lh/hzgbKGXNvqFzCJgtGWKWEU6a5nsjLyUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZZSFZpYbTO2cLxvJ0AzqhGO/pIvlLBviV7HbdX/B9JbqKvRDu4f2MQaztnWcAa/JMfybe7FlxzqS70UAAHRHvrYB1+8nDZwRNVN19JNaGkhcLPjPkXSEViSsJg6geUN639X65PDDTSWFDW6X9NjH/CeJZdM5wqivevc7LiLtbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wzafqzaj; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wzafqzaj"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af59c920d32so96939a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Apr 2025 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743617774; x=1744222574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0TdMKNGPTVum9Gw2uyoKM+R1Bk/OCWS7Vd5opsWj9s=;
        b=Wzafqzaj3E3mFjpyXoOvXUpDq9nbIQDW+ylBH2YRoaOcICknTHTC8z0ORqdMwTgBBN
         0BYqy2TFRpQUFsP3375Vj9DMezR9/uTShboPl+YILZ9dBgl5EeYJEHG8RvWNeEmzsvKW
         QrWSegQHJtbJclqn0cIzEkCtI3vZ1Tpp+3D0/tirCqg1F0qLIcyUdlxmwx7I8ZlzWHay
         6LOQLNq8Vg7hGqgNoEk5zEsKCv3E9IPIlmPcGkTlQAJKNlOvfcp4oJAQaTDEIfyKDap6
         sGZtvRCu7lhzQfNWpzYqxbkabYRdN47c1WnFVNr4qVliQOgZIv9repUDZNu/yajvMm7u
         rl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743617774; x=1744222574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0TdMKNGPTVum9Gw2uyoKM+R1Bk/OCWS7Vd5opsWj9s=;
        b=RYV8/Z6Gdfprt79Z07D8Z0SmJNh5yPU9b/h9m6dkIsxDedYZml/NcH9gIYJHCsB2Fe
         wlClAdLsc1Z3XY4JROFEmiubd+oMGlYItt4kdu7fjFDBt5VNAlbua2V894kQmVNvHgGd
         efbuwOFMQi10JRT5nJok91MBT2YVcf6GeI4LRVKPXED2bO5QKVP5XUXQAgdOjqsg9/7j
         56pJh79kEjZDWKSV8vnyk4hg/moenaab8suhGY7zTZux4vl0a6IKxYPjA7EMt4s0t4wE
         Y0iWn7EA9olpaOPrCB6KRoi7zRBgio5MJc063RrOTnUGczywwsRtCzefF9ta4D/ymOYx
         9Lwg==
X-Forwarded-Encrypted: i=1; AJvYcCWPX4vAMyH2sJCZwue2RKoweWOShz7vpzW4W3UxQPzI82KpqSmPFHwb7fv0EfZJygRzS1Y/6JbCDD/rrP+62SKyTbnxcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKHINIGzqK1FQxLUPqfhIYiDGq7qSZurLk3+md7w0yLmcPKoKg
	c5sZtiFPG98ThCIlASvyj1FCAhQOBtU/HJqlpDPDxhRa0Pi+V1Ai
X-Gm-Gg: ASbGnctaZCbbYJNgQHtoy82+jf9NhfNhBsQ10gJAYzSQV/4A5YMUZveV5kwqlldo/+s
	Cv8rJ4iP8z84E79UJShB2Jd/+zixmlU9x+nK2Ixhsaci3nmjPeSvS1Ek4cEbx9MBL1VtC5Y3dxS
	1BoE3bXtrmWFhTfKvQpWfW0z8PfvPnQGd+ncQMdyELmI3cSw7yclcVYlzSq8KmpV4aTXmghEcPv
	RPIi71zj13Rg4bRR1OuYCPl74lSKrhVKQsET9SWej7/Y9kT8aASScSc3VA5ZrUI6Dxz5iZ8BBHX
	wyfPJ19W2W+30pFKjEX6fHkyldUHWNU8dvMVfkadPvqNKe8DLMZxJK9k6idmj8m01Q==
X-Google-Smtp-Source: AGHT+IF0oea4zc4vg1J+wdlW4qiDKMUxbE8/u+yBFJthNc7Rd32uz5JsdoUwKx3/CjqQ5l3svlkACA==
X-Received: by 2002:a17:90b:3c4f:b0:2ee:f550:3848 with SMTP id 98e67ed59e1d1-30531f7c573mr23548735a91.5.1743617773656;
        Wed, 02 Apr 2025 11:16:13 -0700 (PDT)
Received: from localhost.localdomain ([14.139.69.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f888d3csm2151378a91.29.2025.04.02.11.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:16:12 -0700 (PDT)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: kent.overstreet@linux.dev
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	linux-bcachefs@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH bcachefs-testing] bcachefs: use nonblocking variant of print_string_as_lines in error path
Date: Wed,  2 Apr 2025 23:45:53 +0530
Message-ID: <20250402181556.81529-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The inconsistency error path calls print_string_as_lines, which calls
console_lock, which is a potentially-sleeping function and so can't be
called in an atomic context.

Replace calls to it with the nonblocking variant which is safe to call.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 fs/bcachefs/error.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/bcachefs/error.c b/fs/bcachefs/error.c
index b885bd92834c..baf5dfb32298 100644
--- a/fs/bcachefs/error.c
+++ b/fs/bcachefs/error.c
@@ -34,7 +34,7 @@ bool __bch2_inconsistent_error(struct bch_fs *c, struct printbuf *out)
 				   journal_cur_seq(&c->journal));
 		return true;
 	case BCH_ON_ERROR_panic:
-		bch2_print_string_as_lines(KERN_ERR, out->buf);
+		bch2_print_string_as_lines_nonblocking(KERN_ERR, out->buf);
 		panic(bch2_fmt(c, "panic after error"));
 		return true;
 	default:
@@ -71,7 +71,7 @@ static bool bch2_fs_trans_inconsistent(struct bch_fs *c, struct btree_trans *tra
 	if (trans)
 		bch2_trans_updates_to_text(&buf, trans);
 	bool ret = __bch2_inconsistent_error(c, &buf);
-	bch2_print_string_as_lines(KERN_ERR, buf.buf);
+	bch2_print_string_as_lines_nonblocking(KERN_ERR, buf.buf);
 
 	printbuf_exit(&buf);
 	return ret;
-- 
2.49.0

