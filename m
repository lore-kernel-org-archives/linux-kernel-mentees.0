Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFEC26D4FB
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 May 2025 08:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643977; cv=none; b=hk4dnwHPo9IwSNsf5vcYacvTRakkMiOiKKzQbfQZcR5fV0qi66biIaErYaicLA5FzafL5XmjBdPmsHhKHCVfc+73M4rDCM3xBK6oUI4eREwvjCn0zjTfX54lCzzdfq9pMBR32NikjUksbyYTFkkCl0VaooWB+ar8jURdDRHlXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643977; c=relaxed/simple;
	bh=gkL4c0N8EQCQ/TM+Xgmyl4Xxmq9xWn4IgHVEm5KSkQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C1IVt3yxXnzBdFetWhJBpH/cUibXKpm0VQmDzTrG61+5h5HoPIpekYVw78g9bFmA649cxngaGy8tVx/fvCVkay3PmGEOrRDRqL0KffUn4nv/oQp9eF5m2l5bqQKPcaQ5+tq8TXO9Z+owYCIe+DbymI7cMEWefOdnQt3LqcNWeeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blES142H; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blES142H"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742af84818cso1926743b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 May 2025 01:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747643975; x=1748248775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kENFOvYuWcx0UUtOBeD2O9KLGAkfolJVCKtEv6YXZCE=;
        b=blES142Ht5onpFE/4025XpUnohoOFpgSzNqitbV7MhzEtCaG8twIJVDG7TeG4jXLkO
         xLc/kgwJYXZGpCrudmf7om7aZprjA2ZiysStzKdxK2W7V6zTc+X5qRsZlgQh48boEc76
         ZapHrZIXK5GgaCSdT0S7j7f1h6Z+M9FZD7ARVMINUya+fCQuHR0ELJkaxb7471l/opYG
         fln2xkN+rUArKTj4ExofU7hIMIEyqVP9DCOArUePgAs4HVLfqLvMrQNY6yVf5wAWewoG
         ORH8fRFbOibWAw9xJvn6yeL32Fbi5cqa9FncB0Hm810/ne6fTnNTcnF7bfiAGRuoj5ky
         5HGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643975; x=1748248775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kENFOvYuWcx0UUtOBeD2O9KLGAkfolJVCKtEv6YXZCE=;
        b=kqleswTeRE4fULPzF9sc1trYXGI9h6G8TZKOQ3y5EGAuamR1GZBYPWZ+qvaqpvCEkM
         b5fv5YPqfPvF/VaI82ix38IPGI7bjSXKZn7A4EW7BM08zOU15eqUyOxLii/oD69hWs7T
         +NKKFz2Mn7AOonOFD84kazQAi9SJp2BljVvv12L3gQTYOgUesEqKnwiMfgrR4VT6xPxz
         TAJ5PLvKtpfDMYOL1dtAUY6/j2z4qyPqw4CfJAZbNzxzb42YNim85q5F2c/n8g/wnNXZ
         HcvHbRSczwSotSAJ/0vz5MDCz4KhnLcIMho54/wG/48miOxqDuPXJCwM/LA90cHv1jht
         S0Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWQbO7UJM8/noTTa5QhuWSUxQkY4Ik2XqGEZQwIaUARhp852wLeuVOeKIuxe4+an0qA60K3lmN5y0aX0s4IwUTHpDXdiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyS/Ed7uFZgEK0x8DklRaN9jPawIN1ZcoNj9S9pFAcwUB7ZrKMU
	0Zx6nRau4tCyJewC7nnDohzfKz28pjOG/oUz0Lg0Imi+GlLVEAwBTUdxrUCCE3XUT2U=
X-Gm-Gg: ASbGncuKAkpYklHrRdJdG1QmskYKrkWJ/QP7Xdxq+cGNE6cNqexyhiub0mqz2UMEiKx
	zADkIAR66DDWdaAgxtTcVNlqKGXUs9EhokQWjN5fgX32jWj3CxuHgktaBlJsr9Fyl5E0GqhM5vI
	WX7hF/cdoc3664Bvh1itZLVN5aOTg1gQ0/6QDpof7J7lF+gQbmG47bLe3SThW6RmbWvjJ48rVQ/
	CEKrESgJAa//CTbffbV9ZDnz9Mq1J8gHMqQZg8SuDv1J56wAVvTa5OfNIP8+VVQAqCh7er8X0Th
	g1y/CDcq7DvfrV9mXxH01iRclbM35Rp54EfVBPsYmx1+ER6bvDj8i8roobHjDv40ztZT1g==
X-Google-Smtp-Source: AGHT+IHnMFyK4wPedXmqlwx7Uy3jvXCrtJ1LuMTdzsfxvdbOvP3q5VhbVHgZkkiVl/c3T1W5ka8SXA==
X-Received: by 2002:a05:6a21:3511:b0:1f5:9961:c44 with SMTP id adf61e73a8af0-21621882725mr20142425637.3.1747643974720;
        Mon, 19 May 2025 01:39:34 -0700 (PDT)
Received: from localhost.localdomain ([45.252.73.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb084428sm5705950a12.57.2025.05.19.01.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:39:34 -0700 (PDT)
From: Anish Dabhane <anishdabhane71@gmail.com>
To: skhan@linuxfoundation.org
Cc: Anish Dabhane <anishdabhane71@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: cachestat: fix typo in error message
Date: Mon, 19 May 2025 14:08:38 +0530
Message-ID: <20250519083840.57099-1-anishdabhane71@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a grammatical error in the output where the word 'to' was missing.

Signed-off-by: Anish Dabhane <anishdabhane71@gmail.com>
---
 tools/testing/selftests/cachestat/test_cachestat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools/testing/selftests/cachestat/test_cachestat.c
index 632ab44737ec..1406bc9f2b87 100644
--- a/tools/testing/selftests/cachestat/test_cachestat.c
+++ b/tools/testing/selftests/cachestat/test_cachestat.c
@@ -76,7 +76,7 @@ bool write_exactly(int fd, size_t filesize)
 		ssize_t write_len = write(fd, cursor, remained);
 
 		if (write_len <= 0) {
-			ksft_print_msg("Unable write random data to file.\n");
+			ksft_print_msg("Unable to write random data to file.\n");
 			ret = false;
 			goto out_free_data;
 		}
-- 
2.49.0

