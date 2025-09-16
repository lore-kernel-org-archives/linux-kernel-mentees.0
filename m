Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6745F280325
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Sep 2025 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019583; cv=none; b=gU4EmvVtHHzUfOOOSxL6vC8bY6fWsuN8ENa2LHg5e4z0I9l01lIWabfnnO0eBBnyB2aYwSJ4tQIpo5tCY9HE1RI6HuBFmzwwoML9g5DfNm2IqLiX4h1cEoZfl0TQQTv8c2zVvuNtJ/kClKKryy4fKql3aF64Jn8pBtSxPhXp818=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019583; c=relaxed/simple;
	bh=6mcsjg4mpO7vTJmNBL+xKZEXfWJ+PXy1vWl3m3v7CM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T0xYOPxmcSoT0+425jq8TJ6bafXLMius7zj/ZKnJeZnTMKYute9BQNUvnj0lcerfWb+7spjyGDirzMv/uwIidfU6KF6hgVyXmmj6z+Zkf4uh2tB1VQsDvivV158/q1DXR2oDoOQle60zzBYewBI+NA+dvqQFwC5WHyAgerY67ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKA5UO3Z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKA5UO3Z"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so36192915e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Sep 2025 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758019580; x=1758624380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9EdigPIMX6NPHC4cwORQzphly7TiWe8t44OOW+EEUbE=;
        b=JKA5UO3Zg7Gmf//IDXutUnOOfCx8ZnCElGQ3izrUpXjt95kcq1jGMuqP6KfBoZCjnm
         Y0pG/bnxZPFysa+88KQARA/XZhV3f5BBvOZyrqfc9aEGhZfnQLYv4lEP8tF2huCeMSAe
         3auXN92epFEA2DIXeN1QLWehMHeQbckcELcDW4IeyIQeSQ88mdB8T8ndLbIjyMXfEWpd
         0Zp/jOtCTObtLSondCzCQgXwP0Mssn2s1yHALBpfGCBZsjfImti6pNA7r2EZkSE86/wg
         YCTmWyR8VrYTTo2dec1PzmAlod07GsBks5g23H7m6MeditJ6CHUctFs5C5MWvVPcf2ac
         tpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758019580; x=1758624380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EdigPIMX6NPHC4cwORQzphly7TiWe8t44OOW+EEUbE=;
        b=Tlc5HxhiAEeQxOIufELMSgrnhxVliy3oBrBX4mrC4zg4k+YnN/Tf1qGz4yjXBpUeUo
         WQY33CWCyacrMKaM8ZSltEMOjkdQa86qY+ZewRZaec6xGdorna7zRhmLzJ1PG5OobnXY
         +/xq4ZvMd/0iPhkOuxQwvTC7umpP7xX/nr0SsEEw+lMni7lgWvI662l6wCg5WMQ788ZV
         q5AqfPhp7VYHIuBaUSDa7wQWzLzjdP2vTw5Fxb1fSZHfzLhw+gCoaLFeCZkqHL0Ynn9l
         8l7Vk1xgkd9d51yuS3l3Vx/3MdQspsMN9vJURgKzP0hFEh3Tz3RgaIEXo0XlWmiRHMXK
         a0xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE8SMLRdA01PfgeVONF2gmWaEApNTDTW6fo64f6wpiVdSMb8KveC99/yF6ARgcgHIYN+kHX1Smw5U770oTbhp6lZAnpg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz58RdDLBTlnhKneW/evSml5wKm20h7o8yWL1DtNRzKKftDKUil
	M+0ku9o7v9LoO0zyoGUAa0sBpDRFxBmZs0SXvqK+Ns5mkpaVfHIlxyss
X-Gm-Gg: ASbGncugFFHW/dwQf9Mg1ZfKHL7nLVF49H9I69bOHGtCHCj0T20f4OBccNuBn6WpGFu
	PG67byOET3CqyNR1fXWArv7JYZY+AcKVNZIvJeEcsvjCkgep2j8Ec9dd7AwqG84BRxBbfSbb/by
	S91QWWhqIpPzepaKv34YL6K0ikIy4IRj+MNtRj3zMTh9pL30AvfkbFyARUFy9Ucb8K5Q88pUkoZ
	fT7OGsqOQU5rUsBSROOEQiexwOM3IhDBoej38CrthhOC8LTIKt44Z+yt/IW3pKu3Z3GTMRnqD+V
	mab3FSHGfNWh/sAs0CY2N6eEt8Zr3wT8vAcBxZ9gY+O/5F16/l/h9J7mR3ZLhMVt+4QeUbcqJC8
	zPEOsOkqugfuJaVKN3CXbGsv6
X-Google-Smtp-Source: AGHT+IEwploMqHYB5eM2vvE3PR4MXORlVYqWpE9ZMhJ/ZDhY5aGxDy1NW3Rem0cCgzWHPEtu12e+OA==
X-Received: by 2002:a05:600c:4fcb:b0:45d:d099:873 with SMTP id 5b1f17b1804b1-45f2926264fmr106100155e9.6.1758019579471;
        Tue, 16 Sep 2025 03:46:19 -0700 (PDT)
Received: from gmail.com ([136.226.167.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45edd9f75d1sm195147265e9.17.2025.09.16.03.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:46:19 -0700 (PDT)
From: hariconscious@gmail.com
To: shuah@kernel.org,
	syzbot+c3dbc239259940ededba@syzkaller.appspotmail.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] sound/core/seq : fix data-race in snd_seq_fifo_cell_out/snd_seq_fifo_poll_wait
Date: Tue, 16 Sep 2025 16:15:48 +0530
Message-ID: <20250916104547.27599-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

data race in both the functions, snd_seq_fifo_cell_out &
snd_seq_fifo_poll_wait is protected with guards

Reported-by: syzbot+c3dbc239259940ededba@syzkaller.appspotmail.com
Fixes: https://syzkaller.appspot.com/bug?extid=c3dbc239259940ededba
Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
 sound/core/seq/seq_fifo.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/sound/core/seq/seq_fifo.c b/sound/core/seq/seq_fifo.c
index f23c6b7ae240..65e28ebb0eb1 100644
--- a/sound/core/seq/seq_fifo.c
+++ b/sound/core/seq/seq_fifo.c
@@ -138,16 +138,18 @@ static struct snd_seq_event_cell *fifo_cell_out(struct snd_seq_fifo *f)
 {
 	struct snd_seq_event_cell *cell;
 
-	cell = f->head;
-	if (cell) {
-		f->head = cell->next;
+	scoped_guard(spinlock_irqsave, &f->lock) {
+		cell = f->head;
+		if (cell) {
+			f->head = cell->next;
 
-		/* reset tail if this was the last element */
-		if (f->tail == cell)
-			f->tail = NULL;
+			/* reset tail if this was the last element */
+			if (f->tail == cell)
+				f->tail = NULL;
 
-		cell->next = NULL;
-		f->cells--;
+			cell->next = NULL;
+			f->cells--;
+		}
 	}
 
 	return cell;
@@ -210,7 +212,9 @@ int snd_seq_fifo_poll_wait(struct snd_seq_fifo *f, struct file *file,
 			   poll_table *wait)
 {
 	poll_wait(file, &f->input_sleep, wait);
-	return (f->cells > 0);
+	guard(spinlock_irqsave)(&f->lock);
+	int isNonzero = (f->cells > 0);
+	return isNonzero;
 }
 
 /* change the size of pool; all old events are removed */
-- 
2.43.0

