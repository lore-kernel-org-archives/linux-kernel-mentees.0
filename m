Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6979938E8C9
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782115660; cv=none; b=Ym5+hNaZnAFmKT2iXjN0tguWQhidHOTIfHbFQQZCzc5sywbVEXc9Qt1QejTl2ketRFi0WarE0qS1hjJZm4FYLEn+jINfOsUBZTauGcHjWSe3paAA4yefpds2gyHPKGPXQT/jdIhiJEEk1jElf+OWXCGLoBO4Q+aeaLrCyVFTBf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782115660; c=relaxed/simple;
	bh=ixZklIegwP1IHDJlid6jVapKS2KVUPy7cX75DC99+MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HcC0KjzH6nsDnNiONSTYET/jBv26V1oFbgPcJCruBkxZpZrEni+fbuFevpWrpJPFY1nUAGFQ4hgHpnWJXedBy9+ggYb9zM6JLbRcsclYMzhKRqfzOxLkAk7IuSRAQISDi6c6w7gVBtfJELSOy2aW0wtH2cyZyW7s9r793PG+H8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlcD39ni; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlcD39ni"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8422871b42dso2428295b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 01:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782115658; x=1782720458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rlV3+D4ZZRALKldfUDeeoVyJTWnvlXeJCAWh7uoewIg=;
        b=rlcD39nijsRBjkVT7+Z/Hc5VZiADFmGyaLoyQZLtiAECK5tb51H3DOTQbE3Wk/Pb2Q
         Oo6OuHCOQucFz57x97YWVPTotZs4UHH8MAchmulRNbWkPAZhihiwp1G40Vr8Sjj0jytX
         djGHYaO25fYL7PcAozitQ7JwasXq/YwVIuojXCKVnH8B2UDc5EIhLjVlnzRNkoQ/6Yv2
         GZuwIwYE/WAtZ80GhnX7qB0aByC10tNMeoHO744/TJp5dRXeZVEW5swtqPjhEdcevqbJ
         VH550mU6nPYxLsBaoUSORFOr0mZ84oxtbfo5QbNsSuZ92FiWOfxAejKQAg6NrzClK6te
         dMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782115658; x=1782720458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlV3+D4ZZRALKldfUDeeoVyJTWnvlXeJCAWh7uoewIg=;
        b=KOHMGGLwxJbk2wx6ndqhbYaAZljVySgmdXpa1zmx4JoPjGlqtOlDinK5dXBChDQ6AX
         4dPK+xtbqHPQcIw0STSseAwKiwdCfsbn77Lef9CSQU7q6gkLKk/3hVoXiB6h3oF45DrE
         4B318qAwG9vnP5Sn3UfdTRt3zsGqLf1IqcbhJigjZXpEKx0QkJXtdu2rDPyrZTXN7zKG
         3H5tEVKdl+PF9fi+sulcy2HmOitafzCWBs40IEp9UHWcTFuWMuwchPcImaZdNBMeMOP5
         s40e30zeHD3mwnfyS8xcJYPVHZ0qwJXNq1Bg82uB8wl9s8kKa7uvTZXWBbKJSrOE+XU5
         Vjgg==
X-Forwarded-Encrypted: i=1; AFNElJ9Woq7Aea/44OwCRWMki4/YWFo3z/HVz1CxtZ0ljxMXEaflN9mhInbQmHH0iAvRjYCBxZakc+koZxo5lQtG4c04rvNYVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6q/BY+pgWvwGJcLO7m96TVdI71Qj5wCOa2cOH3MOcsn8j8fcS
	KegGZp+SnNmKbZC/Doa8gr7PD+L0WqE1OJUgt6AVxsWlN71baL3RSrTD
X-Gm-Gg: AfdE7ckWqLG5OQj0ou13m/+etAPTQhIcOUIeFy12l+28bPvIN/UeRFvjbDtiH4R7/nW
	L/OPqPgeJ5SgjJmRu8N4dW0kwXUD5zh8iGXMKOAw7oMyO++N4BMrmPmmUH8BzZBMGM1EUYRsAOb
	k9FpDzgO1BHLCI0kFQ3EsbLpA90aUKcT+8AQVem9Jrj0u1G/zjcRtUca3pg61LgzI4YW6rwwV0i
	eMpDamDijtUIiWYmFx2BVgBHy71ciV66X2rCFV7bVyiekAQ0p/+nbY4AE66/VLUVjZaU22S613V
	D3aSibBuwr6vq5Z9IVBoJEPPIgdvbR4b7IrUYjchO0Ck5iGYoKx+9zFM4bs4aAJUILirEnvJv/+
	Uf1+8HE4Dv35SJr1rSEWQW4km+OyipFgzVVns8nBG47uYFp1M541Mg7na+hSKG0cyv7ePRNqE1s
	YnHDX4AYmBaGTvbyryeyJyb8d2
X-Received: by 2002:a05:6a00:1d8c:b0:842:2ddb:e303 with SMTP id d2e1a72fcca58-845560736bbmr13315970b3a.12.1782115657543;
        Mon, 22 Jun 2026 01:07:37 -0700 (PDT)
Received: from fedora ([106.219.196.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed9516sm6688804b3a.57.2026.06.22.01.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:07:37 -0700 (PDT)
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
Subject: [PATCH] md/raid5-ppl: convert pending_flushes from atomic_t to refcount_t
Date: Mon, 22 Jun 2026 13:34:32 +0530
Message-ID: <20260622080656.22786-1-sajal2005gupta@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old atomic_t based counter allowed ppl_do_flush() to continue using io
after it could already have been freed by ppl_io_unit_finished(), leading
to a use-after-free.

Convert pending_flushes from atomic_t to refcount_t with a proper ownership
model. The creator holds a reference for the duration of ppl_do_flush(),
and each submitted flush bio holds a reference until its endio callback
runs. This makes the io lifetime explicit and removes the need for the
second loop in ppl_do_flush().

Fixes: 1532d9e87e8b ("raid5-ppl: PPL support for disks with write-back cache enabled")
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/ajJF2wKYWRk4GGCK@stanley.mountain/
Signed-off-by: Sajal Gupta <sajal2005gupta@gmail.com>
---
 drivers/md/raid5-ppl.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/md/raid5-ppl.c b/drivers/md/raid5-ppl.c
index a70cbec12ed0..157a89edd9c8 100644
--- a/drivers/md/raid5-ppl.c
+++ b/drivers/md/raid5-ppl.c
@@ -145,7 +145,7 @@ struct ppl_io_unit {

 	struct list_head stripe_list;	/* stripes added to the io_unit */
 	atomic_t pending_stripes;	/* how many stripes not written to raid */
-	atomic_t pending_flushes;	/* how many disk flushes are in progress */
+	refcount_t pending_flushes;	/* how many disk flushes are in progress */

 	bool submitted;			/* true if write to log started */

@@ -249,7 +249,7 @@ static struct ppl_io_unit *ppl_new_iounit(struct ppl_log *log,
 	INIT_LIST_HEAD(&io->log_sibling);
 	INIT_LIST_HEAD(&io->stripe_list);
 	atomic_set(&io->pending_stripes, 0);
-	atomic_set(&io->pending_flushes, 0);
+	refcount_set(&io->pending_flushes, 1);
 	bio_init(&io->bio, log->rdev->bdev, io->biovec, PPL_IO_INLINE_BVECS,
 		 REQ_OP_WRITE | REQ_FUA);

@@ -599,7 +599,7 @@ static void ppl_flush_endio(struct bio *bio)

 	bio_put(bio);

-	if (atomic_dec_and_test(&io->pending_flushes)) {
+	if (refcount_dec_and_test(&io->pending_flushes)) {
 		ppl_io_unit_finished(io);
 		md_wakeup_thread(conf->mddev->thread);
 	}
@@ -611,11 +611,8 @@ static void ppl_do_flush(struct ppl_io_unit *io)
 	struct ppl_conf *ppl_conf = log->ppl_conf;
 	struct r5conf *conf = ppl_conf->mddev->private;
 	int raid_disks = conf->raid_disks;
-	int flushed_disks = 0;
 	int i;

-	atomic_set(&io->pending_flushes, raid_disks);
-
 	for_each_set_bit(i, &log->disk_flush_bitmap, raid_disks) {
 		struct md_rdev *rdev;
 		struct block_device *bdev = NULL;
@@ -632,20 +629,18 @@ static void ppl_do_flush(struct ppl_io_unit *io)
 					       GFP_NOIO, &ppl_conf->flush_bs);
 			bio->bi_private = io;
 			bio->bi_end_io = ppl_flush_endio;
+			refcount_inc(&io->pending_flushes);

 			pr_debug("%s: dev: %ps\n", __func__, bio->bi_bdev);

 			submit_bio(bio);
-			flushed_disks++;
 		}
 	}

 	log->disk_flush_bitmap = 0;

-	for (i = flushed_disks ; i < raid_disks; i++) {
-		if (atomic_dec_and_test(&io->pending_flushes))
-			ppl_io_unit_finished(io);
-	}
+	if (refcount_dec_and_test(&io->pending_flushes))
+		ppl_io_unit_finished(io);
 }

 static inline bool ppl_no_io_unit_submitted(struct r5conf *conf,
--
2.54.0

