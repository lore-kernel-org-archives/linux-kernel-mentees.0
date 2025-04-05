Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312813FC3
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  5 Apr 2025 14:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743863839; cv=none; b=Vweg7V6BcaHoqYYzgKYRZrlqcUmXesF9EmWI5IAb1CbK+GEia4O/hfzkr0/zoOrmkBJ57E0MjfgXWAA/ex1TlLo0VAtjJO3fqtfGNO2QZ47uxK3PhMtYUE5MxG7bFdXl2es7jUNwZCusL9SV3339tbCdg7BCGfIam9NYoijEvQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743863839; c=relaxed/simple;
	bh=63F5xTkitsYyHm/pyJpFkBLkPS4nsTIzUTBp3RDPaz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fu3jwB+MLklkr9ZsJ4jsN+Mk39JggcHAYJO6nke8qe8U6LlZFhIol8Tnb1H+HPbDHjIq0+XNjZbKAy6gsJedCJeRajeKlhXx138f4cIjim7NKdb6bVMH7mGQPF0ZaHiRkKh//uP8BWhyu7mysba/CBaxAmprdF6oFK9H0tpytkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLvP9eaR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLvP9eaR"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso26722575e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Apr 2025 07:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743863836; x=1744468636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87i242gNmmnQ0/JIgcQs2sxcKZ2HnRDUKllGCKseh+0=;
        b=PLvP9eaRGvjL+r/Jt5BzV4ANB9UytvtKObKd++9I6WqL6LFlYJXTWbjIYOyB1KW/PM
         EdzdllqxIf/sRo8fLshpX563RCWVyjc78CxQ31Qkk6qTiEeAv470D7meuDxkCTmza9t2
         A3bfESsnhe8wuldAD2ML+E3Pj/AzGER4bqIJDTSapuRwMFjHwUPTltLnk39yh86XL8sE
         0PUSXWLNoDQbNWw+sNKfdfXjSuKtEyyl2gJr1i3Q8gUqfaPlobeO16GEsy15Q5kbWyzj
         dQ5QdzgzUle8F25gkLiyaGJB4HAXDsnH9+fvUAz2slSFIXLYwdQl1gU/NWjSc4qIkIXs
         1ZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743863836; x=1744468636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87i242gNmmnQ0/JIgcQs2sxcKZ2HnRDUKllGCKseh+0=;
        b=sC1UyxMrjz6nZSo6upzFRxkc8L3f9i+zOB1cUTU0gupfiYbzM+m9GmcFkFW4f7/uMZ
         m18BfdYGdkt3nRWroENNbh4GWHO82eSTF+cf1a39ImD3p3NgWudyFXU+tTSxk7jiyN7x
         WdrP1kI9Punv589crYlFNBg7wGc0y9yMR508WAONc/v7UtXcH1Czb4R3iYjmkQqzfDGx
         9ax0QzXDqSUnicQmm1sMKD5WqoXsdWhPPhhn46T0Fk2qGPaE1dAZKMP7TkApmYxC0Pol
         O/8JlZ9Z5Sq4zmW3mLJZoJp2Rtlxeq77TEI+NqNLMFZK4F4EWCEV/YeNruFMsM+ZcztJ
         aMlA==
X-Forwarded-Encrypted: i=1; AJvYcCUu+rEc6mtvJ0sF0rTuEEUp7gaACYyqCnoOu5kvrVV01mfq3559y5kg7v2gtVJe0uG9EiZ+ACh5xiM5Bu/nhtWpsUVXZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJIO2NTO33ArLl1JqEg3nJ4o04wnxGMpG+jctKRdrXPdd/XFkg
	vTUXntFrvdIzNXHUN2vbok6R1OEL9scEHBydi3RtF8LeWTnvhkXT
X-Gm-Gg: ASbGncuQhQwozhBBESLkOWi73Hu+fMJ+Z/NFZXHHTmmPR88o2XgB56vwCU5lFdIyWU0
	DWd/49hrU/vKcnbQM0hCVAMrfn6c8R+eR9qWZCSB9EFU8HjvtHko+Q/REE4nFM2/auU2DFuVFTQ
	m8ZENcHrBvVKNW1tt9oddzQ7x1HAd1esl0Uf3BF/BJ9oU7SBlA5tzdNYzUZFB/SZRAmyiRFGNVl
	jdBkv54yaG174/cM5HKOmghfx/lLgu/3ssSyVeAJ4cBTviX3X+O9VWEyRgjefDmB0DW2IQYe7sz
	xhxrs0PuBWNIUabSIXoF1eYqNBxvLHb73y3lAgzCoCjlJKZSWW8DfJuYk9s=
X-Google-Smtp-Source: AGHT+IG/l4yCRNfI7DOPZyV8ReShUgrZ6Qt3TdLxndrrMT9p3qU8mq+mnkWp4ubxVT/SvOshXTzAcQ==
X-Received: by 2002:a05:600c:a07:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-43ecf843e91mr75410255e9.3.1743863836147;
        Sat, 05 Apr 2025 07:37:16 -0700 (PDT)
Received: from localhost.localdomain ([78.170.183.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3009644dsm6964693f8f.6.2025.04.05.07.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:37:15 -0700 (PDT)
From: Baris Can Goral <goralbaris@gmail.com>
To: martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Baris Can Goral <goralbaris@gmail.com>
Subject: [PATCH v4] scsi: target: transform strncpy into strscpy
Date: Sat,  5 Apr 2025 17:36:47 +0300
Message-Id: <20250405143646.10722-1-goralbaris@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402204554.205560-1-goralbaris@gmail.com>
References: <20250402204554.205560-1-goralbaris@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The strncpy() function is actively dangerous to use since it may not
NULL-terminate the destination string,resulting in potential memory
content exposures, unbounded reads, or crashes.

Link:https://github.com/KSPP/linux/issues/90
Signed-off-by: Baris Can Goral <goralbaris@gmail.com>
---
Changes from v4:
	-Description added
	-User name corrected
	-formatting issues.
	-commit name changed
 drivers/target/target_core_configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
index c40217f44b1b..5c0b74e76be2 100644
--- a/drivers/target/target_core_configfs.c
+++ b/drivers/target/target_core_configfs.c
@@ -143,7 +143,7 @@ static ssize_t target_core_item_dbroot_store(struct config_item *item,
 	}
 	filp_close(fp, NULL);
 
-	strncpy(db_root, db_root_stage, read_bytes);
+	strscpy(db_root, db_root_stage, read_bytes);
 	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
 
 	r = read_bytes;
@@ -3664,7 +3664,7 @@ static void target_init_dbroot(void)
 	}
 	filp_close(fp, NULL);
 
-	strncpy(db_root, db_root_stage, DB_ROOT_LEN);
+	strscpy(db_root, db_root_stage, DB_ROOT_LEN);
 	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
 }
 
-- 
2.34.1

