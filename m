Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A153B3894
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 27 Jul 2026 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175963; cv=none; b=hfRCAPjrpnr7pl2jNvfX5kIKsXSKOBYNP/KqkcmO4wY9UuaR0Qy3yjDHEqYGpQhndrjYNlNIQYY/Vy2+I30C3Ra4WfGUQTNDsCWGnLGOc8PmlgEBOJ+Bziu+4jhe2m3KHoe5mAopyX8jr/6Jhr2lBnhM5slv3RPeyN07MeNZ7GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175963; c=relaxed/simple;
	bh=N+mlLLFzr7ztiKmM8bSxWdkJrHAVpRDMVp+nWQYDTdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sWMQyXZMBSfXajZHlV7GWPZuJH8xcBy2tK0TPiVIcIjS+K+pxxEKIwjvysb3EITpKvXqAQuyWAknV58g84se7aFf0GdfkkDZjqRSMRz7sdNAs4bs7eivwzKiyn+ALn9GO3iwbmF41Yd9L0lkDBqa6+vZwt76oHnScnSKDkajVDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DW5Z9wxS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DW5Z9wxS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so29807715e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 27 Jul 2026 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785175961; x=1785780761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wYLZ7xaCueJ0HKXGOYqw27/ElSiF4nHj9CgFbPY+D4=;
        b=DW5Z9wxSP5roKsr5OKeuqfKRUIxQ8N91WQIndeQFaOvTdrEbdrYbiwkDsebOOpf8oO
         HIMSnd5M4j8b7TFmFckXcwoXI/bogaTkPZzYc89IB1kEvYecBUCqPRCS624AHaIBXpMF
         hTqfgMrVh3p24832xGX0CvG4yAK5HIjpXi0AMVQ0sKuuq6buKjZcDsdzLISi1FROM2oN
         fOWaJC9LjaTr9dYhc1Kh6emA6fwlIsRqlLeSqFGVJaTkJKSULcQB+/8b0DjIiofEpGoj
         8rPS8QZ4fzYDlhxYNOWRV5jFz/cEzKgcO9fiszW7joU4eCC9xjLI5wGoE+tCjHOXY+66
         ZSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785175961; x=1785780761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wYLZ7xaCueJ0HKXGOYqw27/ElSiF4nHj9CgFbPY+D4=;
        b=PWIr6tsLEDYPdmdzkb86Dg054I4dJBs5tYxrGIGldIvQRXLzKmrDR8qzA32noX4aTT
         WKiHJKhPRaDDYLKsqxCxYrQUQE12FCEb6J2MRPm+TIcPUd6K7QxgmLXCGCxT60JPd3/r
         3aANBlATtFCJSSF1FW5HQyjVpshWFpMGAQDefBaI3eHbM6ZBC7AVD7/+9i9wUyc8Ha80
         Cd6H9CJylq5mknnCJprciECKiNDb/J0LCAoOjvigMmAnR0qai7xuTYZmk7AEHYdTLcUS
         oWqe/DTqICz7hp/1+vhuiRsiQ4sNynzSK6RDtpGDAiCm3gShCXSxHFmWbsHcu9ROUxUd
         B2dw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2i04dzRIobzQKtwh8Mxh5CJsBiHeICllGAEMsgT4197egOKGkKzkGACq2p8MnFJT5iFzw1TdKcsc3RuQ+SDdDPQVOng==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOPBe3jC/i8oQwBiCUHzKvySdGH/llPwJ6Lzxq8uLuW7TJ09SX
	Y8eHLU96xhYloVY3bn4awc5hGNVzNZZxLr2rRMF4XW/PgVH65R/9XJ8=
X-Gm-Gg: AR+sD13WT0SLv7KHJviyGNEhvGyLMjWBcy6lUmKEUJz1R6OInlmvVQyP5MdwICZ764P
	drUyXgv94/E6uSkLMQ7q0ZdkoiS8HSk04ylgplgvbKjeyvVExpS3p+lcgGJEXWzBYTdVXxvgwwE
	qPw5oMXFyCqTm/luNK+RQ6CoYHJYnxwP84m/GMz7MbcFvyoG7mB/noBVjjTfsCbyf2aox3EvInO
	5LXdNP3R7z4VmQCu9nzSDwPBw7WRrLat5NSgAPDvu/g84S7sgFiJUoNCAZk1hhiy00xs9GBAJ8z
	fOOjJo1NL0S53ggVqI1T/BQpyZ36EB5zFtHsCetbr7zP4OzDVt7Li/3sCxsspZ+v35CR75Kp2ev
	uzI8Aywf7alkp7mTtKHNq6cU4FO0obnHRFDCVAl+AMjBa7q81JcWqu/+q+GNEUwRfmIKLqpFVMD
	fkAN9AH6y5efN7Xa6A0PElgLX85263g8AD0FmCaNY6QOphG77JDr3m1y3Q8ibdE6kjagsN1Jpvm
	7i+j+8h1SUeilTq5Ho28oKPQPRQPhf0
X-Received: by 2002:a05:600c:a4f:b0:493:d741:5d72 with SMTP id 5b1f17b1804b1-496b57116e2mr151773555e9.38.1785175960626;
        Mon, 27 Jul 2026 11:12:40 -0700 (PDT)
Received: from archtop.localdomain (92-242-248-94.broadband.mtnet.hr. [92.242.248.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm53643668f8f.31.2026.07.27.11.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:12:40 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"\\  Liam R . Howlett \\ " <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH] mm/khugepaged: replace mutex_lock/mutex_unlock usage with guard macro
Date: Mon, 27 Jul 2026 20:11:36 +0200
Message-ID: <20260727181136.2542-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, khugepaged locks the khugepaged_mutex in two functions:
start_stop_khugepaged and khugepaged_min_free_kbytes_update. Remove
mutex_lock/mutex_unlock usage in these functions and replace it with the
guard macro. This makes the code more readable (removing a goto statement)
and makes it harder to introduce bugs in the future.
No functional changes introduced.

Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 mm/khugepaged.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 617bca76db49..c583867f2e7a 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -3113,7 +3113,7 @@ int start_stop_khugepaged(void)
 {
 	int err = 0;
 
-	mutex_lock(&khugepaged_mutex);
+	guard(mutex)(&khugepaged_mutex);
 	if (hugepage_enabled()) {
 		if (!khugepaged_thread)
 			khugepaged_thread = kthread_run(khugepaged, NULL,
@@ -3122,7 +3122,7 @@ int start_stop_khugepaged(void)
 			pr_err("khugepaged: kthread_run(khugepaged) failed\n");
 			err = PTR_ERR(khugepaged_thread);
 			khugepaged_thread = NULL;
-			goto fail;
+			return err;
 		}
 
 		if (!list_empty(&khugepaged_scan.mm_head))
@@ -3132,17 +3132,14 @@ int start_stop_khugepaged(void)
 		khugepaged_thread = NULL;
 	}
 	set_recommended_min_free_kbytes();
-fail:
-	mutex_unlock(&khugepaged_mutex);
 	return err;
 }
 
 void khugepaged_min_free_kbytes_update(void)
 {
-	mutex_lock(&khugepaged_mutex);
+	guard(mutex)(&khugepaged_mutex);
 	if (hugepage_enabled() && khugepaged_thread)
 		set_recommended_min_free_kbytes();
-	mutex_unlock(&khugepaged_mutex);
 }
 
 bool current_is_khugepaged(void)
-- 
2.55.0

