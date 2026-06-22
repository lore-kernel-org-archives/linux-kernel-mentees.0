Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03A6363095
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138326; cv=none; b=jZaNP4tRusDlIS850R1wzCu8nhPVMW4UKtQXfJNkgZDzBfuBMBeroXQ6LRl+GkTx4//bJjfDUYotvUECJ8o8pKH1XQsh8rRgh8o2LxMhUgYmlajnviG1OXYrNs/vYN9HR6qY3J3CfrlGh56VN8Kf5YAYyEc6mtoZgiHXYzUBRsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138326; c=relaxed/simple;
	bh=6TlC5iKs4oGGtjlQhKrO62YrJ1iR7M1LI24T+DV3aio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R6rCudAmjboqISoVwAqTMRjGWmBE4erRDgpiS2m2v5N5sHUBgrT1kmhW1kAn5534AJLdDHrQPhvrIosB7+A4JvYlN1mvVb+RjPJc4EcyovALOUQVzKI7ua4jFV8LBW3CHT7V50nUXVe+k1mXpu4rzD36Vfpbi/3OoI4rn5CjMeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QF5ooYop; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QF5ooYop"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37cb36ca63bso2288301a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782138324; x=1782743124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RpcQYOvswIv41txXTMSElAqSDhX4txnVyyIxDhRgzp8=;
        b=QF5ooYopjBeseMAt/pLzdBDjx4GdSxFlyzBAikvgK6EjJ/3J5yF6+AzjtC/wC3uvml
         fHhUjV1rnyws8xsPvqAv6lbFHenS7vYQfByqiuRY3mVrH2seD8hk3O9yIjEMVirrldma
         pBl9FViw8P9VMvHZYknl++O87lJUQmgx/JwFHgQpzEFoLHQeqo/IDjMrjbRBG0HFflih
         uCpgM1CGnn0kgSIdg9IlCSvyD07H7MFPRbn+nO+PWcD05VCoQ6UZKlNhB7OQsAwDdEOT
         +QcbDhfp6BDBXwK60H0CQ1I63hjTgjvOsRoUjAPsHSAnG2BZf6wfoCQ3s6N/MEWwDJzt
         cAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782138324; x=1782743124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpcQYOvswIv41txXTMSElAqSDhX4txnVyyIxDhRgzp8=;
        b=TuGxNbR35qNfxLeVcTxQES74CbHDHSKRru6AX1ObAvcNlNJHV5ffYMnA5qtcazZJ16
         wKpc0eUT7meUCcfZIICnRKn0veY1/aSIM81cHXs9MWeWF+caA82bzhS8F38QYMzRcoyp
         QnZndFIJxvv4JoZvRRslgBYiX1iLgktQjrCXjoUF0hlML6YA7ySZFJ462JyfbsZKjyVn
         5y8NAuKTvmZnp+RRXCMgRnd8UN5fbQlkOP+DQYzPtqdeJDDxZao5j+PBQxQRuYaQNekm
         /+70Uo6QFIzmLHN5l+WKQe5jYUEuvIzVBVpHOahsmJbq4C0dbvCELbLDqICERk5pGTjA
         ep/A==
X-Forwarded-Encrypted: i=1; AHgh+RqdoOhvgobEn5D65hMs22D6efF7TYBhhwPJqnPLTj2MvGJpkqwzcI9fqLpCr+jUgF6ORG2p7oL++A+KWfMU1T4JpjWy+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/PR4Ky6OnrWcZd7/ms/z0rj4BEuME7FV2OeMuS3bGvazMHIyR
	aNDuBKwjSemHM25q+v+PCWnD7RH7aQFdhyt9MnomDxmndgwgHkS8MdW5
X-Gm-Gg: AfdE7cmRyzmaVhWFeGvQfirqN5SzKiBFg0/FoFkUD314gNRRjkq4r2SlK14Te/B/bT2
	ITwXUKTFTyeCBNikICqzvKRDY1639vHsjz5TxaYaaPM1tbrhkCwigLh0P35xghMnut28GhAjwzu
	lPOrtQGUoWukdQTtbZxX0GrFVxvTTk7rhoLQzZb2SbhE1fHfnPV7IMw7fTgN9lLdR6YhxIccnvo
	4ThQY9V9zmwWdCWpvyWIMR75pHQd9ey5Wty0qSmItQc+afuRIrwvFhNdtS/sVtbV4/qAk3Rlw4G
	80r2mJNqpKw9ZaehHkDBXSfHuGWm9AfkMUlTzk6rQOHnWnV4/rrErc9VimRshg/SgSwHW1j/eb3
	qX9g7tHZJ5EwflOdP4fhum5rmePG9BqbHeSkgs17j+BSdGg7bRU7sYFha+LCvmR6otjnCctVXHw
	mPq3aMZNEWCX5oVugmzDxpNmd1/I4=
X-Received: by 2002:a17:902:e84c:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2c718f1f359mr143907015ad.8.1782138323993;
        Mon, 22 Jun 2026 07:25:23 -0700 (PDT)
Received: from fedora ([2409:40d2:1263:e07c:fd73:765d:e4e1:c1eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af220sm78063345ad.16.2026.06.22.07.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:25:23 -0700 (PDT)
From: Sajal Gupta <sajal2005gupta@gmail.com>
To: linux-raid@vger.kernel.org,
	song@kernel.org
Cc: yukuai3@huawei.com,
	tomasz.majchrzak@intel.com,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Sajal Gupta <sajal2005gupta@gmail.com>
Subject: [PATCH v2] md/raid5-ppl: fix use-after-free in ppl_do_flush()
Date: Mon, 22 Jun 2026 19:36:03 +0530
Message-ID: <20260622142146.56637-1-sajal2005gupta@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The loop in ppl_do_flush() continues iterating after calling
ppl_io_unit_finished(), touching io->pending_flushes and leading to a
use-after-free.

Add a break statement to stop the loop once io is freed.

Fixes: 1532d9e87e8b ("raid5-ppl: PPL support for disks with write-back cache enabled")
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/ajJF2wKYWRk4GGCK@stanley.mountain/
Signed-off-by: Sajal Gupta <sajal2005gupta@gmail.com>
---
Compile tested only.

Changes in v2:
 - drop the refcount_t conversion

v1: https://lore.kernel.org/all/20260622080656.22786-1-sajal2005gupta@gmail.com/

 drivers/md/raid5-ppl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/raid5-ppl.c b/drivers/md/raid5-ppl.c
index a70cbec12ed0..c3cfdd66d8b0 100644
--- a/drivers/md/raid5-ppl.c
+++ b/drivers/md/raid5-ppl.c
@@ -643,8 +643,10 @@ static void ppl_do_flush(struct ppl_io_unit *io)
 	log->disk_flush_bitmap = 0;

 	for (i = flushed_disks ; i < raid_disks; i++) {
-		if (atomic_dec_and_test(&io->pending_flushes))
+		if (atomic_dec_and_test(&io->pending_flushes)) {
 			ppl_io_unit_finished(io);
+			break;
+		}
 	}
 }

--
2.54.0

