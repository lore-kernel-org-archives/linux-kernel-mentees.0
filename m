Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52876268686
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 20 May 2025 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734240; cv=none; b=NaJeqE40W1TgWw/4QO9DQ7OsjddznUm0i5i86ZuJMgOfzjAbIugyQgFXU8JpekjRC5MXE0bahHaaDN42yqBUhDddKm56ygoa0LM92PgH613qUVKMf8futDAc1osXzQjbsVIxbZ2lQFKmtcmLQgimCIRdIUXTIPv7OLFDXqIFdmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734240; c=relaxed/simple;
	bh=KRC80vXoGGKP5ZAHY2BxEV2sWz7Ool89aoaHqbBCfdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1inYvCYE+FRN1omz1Uu0+wpbSfwhaXvcS9voB1nRQpg90Misyrd+qUAg2ts6wWJiY8dZencs6gAU/E3N4gghRSG9MC+bAl5MouwG/hDzV2ArFQQhfXU+EPGugez2p4nR+17rZKg/s+r8+UcLjfV3u74FuMMLR7TgvLnvf+viLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icEozplx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icEozplx"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742c46611b6so3292510b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 20 May 2025 02:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747734237; x=1748339037; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=72RXTv/sI4vy4urdgBX3zIYwp1p5m2C94ZkpYBDXKgc=;
        b=icEozplx7FBsVa86uw5osVi0lAkrTQEI3M24MTAO2IQMj8D19YzF4jSgUk0/Djvwqz
         uhMLhzh53Kukg/uGxkiWKFcMmV+N9C3AnNYdHKDVxPj1mWvLPJxfVTE5eyeHBzVjnbuD
         DYx+RmSdjwgHjtfHxcQramAUDMwa0iJqrrM20zjPbRDMkTWe2GVwMLCx3dELczDZqWSg
         7KvbTf3LeAK6jICsQ1GDmke1MFV5a9XTs1IHI/nZ8Gf0kRkKkQYwfOH538Qo/EZfznHf
         26aSNrf11DmT7Q2K5wdqmXPnKsEEsJGooAG06yJv2SDqdG76KcCOSn9dyrVxV6RC1G6F
         QbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747734237; x=1748339037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72RXTv/sI4vy4urdgBX3zIYwp1p5m2C94ZkpYBDXKgc=;
        b=XEZpvQW+/SdOnhUHiOnZqWRS0VrIEmlH7vtAb2r826Ofsg2OLmuKSuC+FdyFOs3HrX
         EWIdeNf6i+A8sVPPpNtTEX9v6yq/Ga/q/xZgZsde73pDz9sGA632xjitTLzjaxoB9OCB
         qbTCbl6Oe5DfKkH8oIBwW4rq9osZaZ4KGJ5I+/xm2bObmfTy9nYs8uBQwFLKLOir9YKM
         geuaR+ZLicb5fi2Kk6RyRXJWTaqpLY2u2oL61TZkwLSIWpOngt+MTDNtce1dQeW9xZkt
         No+PJLmQQT2TzPXbjhVj/YvwvHmxLBvPjd6mokzy88AYni+KpAPJ1AciqqQxtTAVxgdM
         BZFg==
X-Gm-Message-State: AOJu0YzpvUvdsShOTZiknHhP5XzomXX1IkGXKwRsK/y2qiNLX1mxvGbx
	KiWLB9eJ3jN0J+RnHlbbg14THUDA580P87AsfJHQJ0JdyA4xZvUMaWk4
X-Gm-Gg: ASbGncv9hm6MYF6FQq6iQQ3c0qwTUFH2BOiWaFZZUNQYRxZASQcJjdgaFAGf0sV40gK
	kjtPsU6csieEnfCF35GDpG/FTU9L6ZjrwfmIHjpREd3tHZGLfFrnx++tiDA/jcD39zaOVnJ+2+j
	s6kAUv3wO2bT9vvQ1lUb/i4OB1ej1r/GrqHyvpSlwBa7MbGGvd2wb8S7Lyg+1/U/YEsnO8GGfp9
	m1aE1+1vr9cTmn+SN0/YyW5WDdwudKf/WnoA0skv4bVgCEVggssBu9Qxw4lYWica08u2jDVZd2C
	f8KAlFXrtY+zhFwG6JNgMT0LWIlXW1PcFLa4kbt/3C/zxCauktg7YHhJxOeYphkHt7Fa3JQj0f/
	xQZrwgLLrCc2Wew==
X-Google-Smtp-Source: AGHT+IGowChZd0yBQuEnow5mD+xA969bcqL8YkmmtlUyLJOW3JKKttacw6iwp5p0zrT9Yq8ZzAOl4w==
X-Received: by 2002:a05:6a20:3d1c:b0:1ee:d418:f764 with SMTP id adf61e73a8af0-2170ce33ad3mr24484932637.38.1747734237424;
        Tue, 20 May 2025 02:43:57 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:62fe:9593:f762:39d9:3865:830a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6ffdbsm6559891a12.20.2025.05.20.02.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 02:43:57 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: trenn@suse.com,
	shuah@kernel.org,
	jwyatt@redhat.com,
	jkacur@redhat.com,
	linux-pm@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v2] cpupower: Implement powercap_set_enabled()
Date: Tue, 20 May 2025 15:13:45 +0530
Message-ID: <20250520094345.97200-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The powercap_set_enabled() function previously returned a dummy value
and was marked with a TODO comment to implement it. This patch implements the 
function by writing the desired mode (0 or 1) to /sys/class/powercap/intel-rapl/enabled

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 tools/power/cpupower/lib/powercap.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tools/power/cpupower/lib/powercap.c b/tools/power/cpupower/lib/powercap.c
index 94a0c69e55ef..7947b9809239 100644
--- a/tools/power/cpupower/lib/powercap.c
+++ b/tools/power/cpupower/lib/powercap.c
@@ -70,6 +70,22 @@ static int sysfs_get_enabled(char *path, int *mode)
 	return ret;
 }
 
+static int sysfs_set_enabled(const char *path, int mode)
+{
+	int fd;
+	char buf[2] = { mode ? '1' : '0', '\n' };
+	ssize_t ret;
+
+	fd = open(path, O_WRONLY);
+	if (fd == -1)
+		return -1;
+
+	ret = write(fd, buf, sizeof(buf));
+	close(fd);
+
+	return ret == sizeof(buf) ? 0 : -1;
+}
+
 int powercap_get_enabled(int *mode)
 {
 	char path[SYSFS_PATH_MAX] = PATH_TO_POWERCAP "/intel-rapl/enabled";
@@ -77,12 +93,10 @@ int powercap_get_enabled(int *mode)
 	return sysfs_get_enabled(path, mode);
 }
 
-/*
- * TODO: implement function. Returns dummy 0 for now.
- */
 int powercap_set_enabled(int mode)
 {
-	return 0;
+	char path[SYSFS_PATH_MAX] = PATH_TO_POWERCAP "/intel-rapl/enabled";
+	return sysfs_set_enabled(path, mode);
 }
 
 /*
-- 
2.49.0

