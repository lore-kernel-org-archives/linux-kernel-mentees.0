Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B10F345CC0
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965084; cv=none; b=glXiRc4MoywkmFaH5iD10YjSdWXK3u/bvjH3jRgRkdIu6W0023O5viC16FDjaV4k6r5kg36rLr4h3D7q+Z060siX+bv6jDMbDVSIaR0OScUU3qEZjAMdUldyIKd8vOGizm8OINjhw+A+loTiBp7riWSklL/5rTau3FdR9eb6ecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965084; c=relaxed/simple;
	bh=lIuSLdLFUMYHYIkQND+5ezv/2Gm5SAaNrjxK7kuHO+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZGWpOYtOJU+Rr7qQ6xVqJPAHz/215hx7Q9u8w05CztTjPQzNN3nGhGuU1GgKX85VAQr0w+V7ilxBN3j/PSDgvhRVeiOKrpulhkeCZ2EjKMf60s9zosS5Wd2bhoSIlam1gRlQXJTLbvQ+RbuQlYHY/ThE/3KSJ+eZZ6phV/2p3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTnoiAQI; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTnoiAQI"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso120044a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783965083; x=1784569883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7b5s+xdKt531buNfoF0W/b2tSHU/H/fnzI1QXPkyZpQ=;
        b=HTnoiAQI+hfpVL3o+r91CCnTd6mnKXr/3hXMUQUAxqr22ZZFWx5tAqEkj1z1Iu0gV/
         6jLQKRy2I8YsAI25REco02dF0I5v1GHuwFdTeYRg1cixTisOyLa2H2o0+8xhDmMe8baB
         u7rTWNWYA5NZc1m5Ppx1e1b5UKOIfFhlzSWIilMStOl8Ml3qODGr+JyQfDBPcZtWEo10
         DC1OZxWNVM4SBAxbnZCOO3WQ5e6lRjHf6lb+5dT+siObsntDjN9jDlwEIc0/RXnPRf2w
         cBKjItmSX/pw7q93eCU9zFxo2VMEtzWMkQe5e4MLVtBAcWf+axbmxCwWBC77wjOmXpoa
         Jf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965083; x=1784569883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7b5s+xdKt531buNfoF0W/b2tSHU/H/fnzI1QXPkyZpQ=;
        b=nLXlJGSAUk8spTwyGtqRVuTQn87wDLeJHv/rw040tX1qvNNAutBdXd4cspbLFAFvKk
         0XuxhcnVMvaEu1hywHLP9J9G6NCfREGTDCniHXlgE7+PqMBccN4kQWzxDhC9EIe5thpQ
         rZ5resyuZcEUgaZUV6+BX39SsXQblWjM4BuwwTHCmhPNf9a4M0gYBO52GfdWPu1DN2t+
         2+ZpLmAADT3Ae18GrWT44li2ht+DmhAILurn5rk0D94xAmGTi/Ur2831HowJa72G7q+l
         grDVDg8fdj6F6dZySBorgkkWHZkH5xeJKz9gTIhJ2s9KIEF7YDhRsehK64M1tkNCvNzS
         EYRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUy3KO+S6nLN72oKMgmHJ7+ISznllBOSUaHj59oJliKJwGTFcjK7zsBJ9RY3Y7H2SbwNMfkkqE4Y4sBeeLFqpLYgvuqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMli0w6DcK0fBNvkPg2yxocyP+UcSJcR+5vGdjzeXPFOyh9M8c
	+BppMTSmc1NB2dTTRGitRhgMgjDDHgEbdUzPNrIeiQG9fLpkF3KCMDIO
X-Gm-Gg: AfdE7ckm73YU0viUrpWjO+fhl+y5JNMxm4SDhVYXPpwgPaCSfiaEP2k1o32ByChPAoU
	xOd3ujrALWojMD+tue2aH46DHWXiaNqSaNITPnSCEacqP5/jy489zqZi+Skq5g5up8n5rBEz82y
	ryC8kEkVYm6qbkYzwY8WaDcA2kA6qw+3dD2ylZgaR5AykmqWFW39LE5intstr1e93gI9oHy8X7f
	8d/dOP6s0PMj+1Kx+Uf6dSJeeht1GaPBdjQUZC4EoHSqVaMM8zVtVQC+YJRHido3ss2pUrmwN+2
	NZPBqwhQEVmc+IAsC91AtOnkQ86zF30HwIrh2Rs+415kfUWSw/tJ8fHyCyLXQ8HsEkEZAr6njnD
	AIKg4q9ahtfpQgjdB5lRpO0Ow0w58WXF2iLHnRqeYZ8o2U6f5TSR2a9rU2/aF49gnGTZYxY1Hgi
	EIhMUggkSWdQA7JTo6eHurXe8ucgwjGQCg6BD+Qes=
X-Received: by 2002:a17:90b:2548:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-38d15364030mr14878803a91.13.1783965082598;
        Mon, 13 Jul 2026 10:51:22 -0700 (PDT)
Received: from primary ([223.181.22.8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm72354027eec.2.2026.07.13.10.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:51:22 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Vidhu Sarwal <vidhu.linux@gmail.com>,
	syzbot+57f9327d593d301ce2a2@syzkaller.appspotmail.com
Subject: [RFC PATCH] fs/ntfs3: prevent positive E_NTFS_NONRESIDENT from reaching writeback error handling
Date: Mon, 13 Jul 2026 14:11:40 +0530
Message-ID: <20260713084140.249515-1-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

attr_data_write_resident() returns the internal positive status code
E_NTFS_NONRESIDENT when the DATA attribute becomes non-resident.
ntfs_writepages() propagates this value into generic writeback error
handling, which expects a standard negative errno and triggers
WARN_ON_ONCE(err > 0).

Translate positive E_NTFS_* status codes to -EIO before recording
the writeback error. This prevents positive internal status codes from
reaching generic writeback code while preserving the existing behaviour
of treating this path as a writeback error.

Reported-by: syzbot+57f9327d593d301ce2a2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=57f9327d593d301ce2a2
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
RFC:

I'd appreciate guidance on whether -EIO is the appropriate errno here.

E_NTFS_NONRESIDENT indicates that the DATA attribute became
non-resident during writeback. Translating it to -EIO prevents the
positive internal status code from reaching generic writeback code and
preserves the existing behaviour of treating this path as a writeback
error.

However, if the intended behaviour is to retry the write using the
non-resident path instead of failing it, then the correct solution would
be more than a simple errno translation. The proposed change assumes the
current terminal-error behaviour is intentional.
 fs/ntfs3/inode.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 0c9bd669117d..9458867c6b0b 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1019,6 +1019,15 @@ static int ntfs_writepages(struct address_space *mapping,
 
 			folio_unlock(folio);
 			if (err2) {
+				/*
+				 * attr_data_write_resident() can return the
+				 * positive internal code E_NTFS_NONRESIDENT;
+				 * both mapping_set_error() and writeback_iter()
+				 * need a negative errno and warn on a positive
+				 * value.
+				 */
+				if (err2 > 0)
+					err2 = -EIO;
 				mapping_set_error(mapping, err2);
 				if (!err)
 					err = err2;

base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.53.0

