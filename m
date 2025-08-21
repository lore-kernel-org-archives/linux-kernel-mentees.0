Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134A221FF24
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 20:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806501; cv=none; b=TIs2nlzRVK2Nx1IvVuDd/7LPObgpPoajCJzM7z5+7MdY19m1CDYT5c7tc3bsU+ImStiyS2Yug72DR5XomXES4MU0HjexNQAQjvff4RtSObpSXUyWLQ2EKJT89ne0sAEzlN2EH50THO0u3Zo6VjulSOBW4+s3Mfx17saEudbNGRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806501; c=relaxed/simple;
	bh=XMyIeJLm8ezYlEHsz6RdEKqN6MAhCnnVT77tGeihO/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sexHL0GnB/lEUXCoZ3h9bAn8i7d3fu3cZlNv7Og+fK3il+RTdK/he3RV04/dbtmGgbHnWVJEzQj4O5VcA/2O2V4JeH/Gk+Avmffpro3oKS7s46o/K+vM/Ma5g70552CqD5YpmbqkOr0yLLjCuWIUdWxsUhgeR/SBRPKRhddS9Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gl5PB57j; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gl5PB57j"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91A23845E1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 20:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBNx95x7rwVj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 20:01:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9F6284594
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9F6284594
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Gl5PB57j
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C9F6284594
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 20:01:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45a1b0d231eso7804465e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 13:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755806497; x=1756411297; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oTMM88/02+mT4NxUBWUjIecblms1GSJIloGllm1Pvs8=;
        b=Gl5PB57jLRcqkTeEEsllHT6+aBiSSEgGEWYEkqltO8lCmfNOJigl+8yFxKkX9ECm6G
         n5swrvuyqMIpKXMqndzEv+80Q62SPyeYygF2fLYhq5K1L7D8YTi6GcD7R+9ETSwMaPPw
         wcx6JiH9q2+qjoE99UNp31P57eG9YpNxYhbrghqlXxqOoq5IsgdGQTnakChDOW8lco5m
         3EaImuKzp/4Z8ArY77JMntpkuCgthJmpYC3gRXK9MIex5n8RjARzYPS+ObzeExx++uNI
         2fFwrBqA9NblseBomN5KjFyFUvL1+c8ZSulFmYeFkPUiKTOkcrfUaFwI0G7eHmDLscah
         GQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806497; x=1756411297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTMM88/02+mT4NxUBWUjIecblms1GSJIloGllm1Pvs8=;
        b=o6ILhOu6RMHOASfWY1jiJJXB7i7lbtR4m8/KCWuZHDh4qd1XDZKMo1uRaBqfX9Rqam
         dv2DygHje/lhbYuc5vuS/DfoaIhSsD3NSpF/ZqzUMIdlZ2P5vqStJPBBuSjJqQxHFwgH
         ClkfbVdWat4a8Xldd1nf0gJjVloaLb/nIIrxWzhJBxHVHaqeh2iq0IdkE3SPGe4N1Txh
         R3eSAeY3o6IOxRWUWCWC4335ET6JfMYVgeInWLXWq97r4oSGqPVBOdbaGYf6GwWXwFUS
         LsS9AP+POJeSg5TVUq5O/N7rby70fqfYN8TT7YMO6Du3h0CkUhxVJVK7LVUf2FAxVp7d
         cCWw==
X-Forwarded-Encrypted: i=1; AJvYcCVwFHUcMgIN9CnMl9jvQ3+GoVojhipjG7zScpOzmHDl95EnfW16ywLF7nCNAYG+LVHu/9934gZ3B+Sujmi6fZX6vPieQg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzDVeCskbbfODcRBG/WogVBzps69cVXNAXbYgHCqqWcBNBFKC3B
	MmEDIRCM9W3Cl53kg8IPyjA8hZQ6qEBxTnZUNcowzOi/ucIgyjVwZIdb
X-Gm-Gg: ASbGncv3Y9iReymcwVGRtOhNhviwdjkkr5+lYBufa/YTtDN0ew/+ClOS6ev9VDf1GLA
	/QKCUpsg1/w/x9/CqDliQavtfGvge1toLMGEcopjST94vXsuGyL9FfgX4EHXBz+kTgM+bZLWI8Y
	dL9Ogw+xkREDxnahZmQFR/f5isaJd//KE6eXiKogk18P8cSz+hhXdf8Kvm100kjaS2HPVdLPwwg
	ygsz+huUEOyDTqmxC4y7V5BXEkc/s53PkrWzkZjk6I7iO6JJelNg7E/ACb6fhwEynwmS8bytfJK
	dbufViis3tqqUYEUnFHPZujix0ZacGAHt0QxxlzJlnA9UVhGCoXSmYxQTc2xyZC9ZMeqxRyrGJA
	OIT2e+70Z0GeAYKKCi6M0k97IyaFBgUntyEadZMUoRw4=
X-Google-Smtp-Source: AGHT+IG4Kyto5Gj0d+797jRnzEa0Rw23zyv1XapBHJWTmtoAyXPo2UksJpn3Bru45jvjd4XrOZGqeQ==
X-Received: by 2002:a05:600c:a09:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-45b517c2f63mr2370555e9.24.1755806496380;
        Thu, 21 Aug 2025 13:01:36 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b51589647sm4454665e9.2.2025.08.21.13.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 13:01:36 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shuah@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH] selftests/alsa: remove 0/NULL global variable assignment
Date: Thu, 21 Aug 2025 23:01:32 +0300
Message-ID: <20250821200132.1218850-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove 0/NULL global variable assignment in mixer-test.c and pcm-test.c

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 tools/testing/selftests/alsa/mixer-test.c | 8 ++++----
 tools/testing/selftests/alsa/pcm-test.c   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 2a4b2662035e..e113dafa5c24 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -53,10 +53,10 @@ struct ctl_data {
 	struct ctl_data *next;
 };
 
-int num_cards = 0;
-int num_controls = 0;
-struct card_data *card_list = NULL;
-struct ctl_data *ctl_list = NULL;
+int num_cards;
+int num_controls;
+struct card_data *card_list;
+struct ctl_data *ctl_list;
 
 static void find_controls(void)
 {
diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index dbd7c222ce93..ce92548670c8 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -30,7 +30,7 @@ struct card_data {
 	struct card_data *next;
 };
 
-struct card_data *card_list = NULL;
+struct card_data *card_list;
 
 struct pcm_data {
 	snd_pcm_t *handle;
@@ -43,10 +43,10 @@ struct pcm_data {
 	struct pcm_data *next;
 };
 
-struct pcm_data *pcm_list = NULL;
+struct pcm_data *pcm_list;
 
-int num_missing = 0;
-struct pcm_data *pcm_missing = NULL;
+int num_missing;
+struct pcm_data *pcm_missing;
 
 snd_config_t *default_pcm_config;
 
-- 
2.50.1

