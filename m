Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B033DF
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 23 Aug 2025 09:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755942916; cv=none; b=n4yqg7gql/nnZwN5SVCXr+3UsnatSPoXpsoTpwnbvWP8ZS681NJSrjXbUrmveV2WC9mS1PRI0QOuGX415APK6itvsDOqIvrDYmGyT2jxSHCRrpjmdh+GuZeeqV0jSJUdkIYrby9wZF+s382qpNZ/hbeucdeRGVm+s5bUSaiMYaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755942916; c=relaxed/simple;
	bh=uIodOOzfSuLa5ymRdYCXoNe4VoVqcq49TGy2twKM2hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tf1MQv1CEMZfpy0nrHJH/gr8mN/gkI3K8UquDd5l521aDCaC3CKIEalYahdFHgEK7rXlKMNBqPJDLKSCpAopL1TBWso2TCkC4uazILvkRaSCwJ5Y3Qy11EWPJVrf/VVRoNHqSJQPttGPIvKPczCLhEO8V9Ksun/BgYXgMiP5Cf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJkYfCpe; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJkYfCpe"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b475dfb4f42so1952444a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 23 Aug 2025 02:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755942915; x=1756547715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtBd4S8gBjtekvzQSGcw+kUn5WfZDsRpyS3ABLi3AB4=;
        b=cJkYfCpeYzsYo/BGDHKnAf9mZWN5cr2liu1ZfHg5t/1p0vwcEE7EYk2fJZNy3QITTx
         GqbACrubMSfqz8bE20bX6Ditmv8RHqjAZHNXDdy1O7oYe+5oj3gyStcaKRAIQSkmsnmZ
         sYnXU7Et+A92LV1pQ+HvVEUM+hzWCCa3e3RR9Elx0tRPtHki1r69cIyYoGWg5DONT8/C
         F6UnfbIb3n0nW2Sg7ddNaDimGzWEv2DfSnQQBP6a3cHrRrbrlbFde94yZuxWKulXcL5p
         PNKdOt0j6uVEpIUOCsaqkYhAPEh3vCPpMo8PBsrbb5WYBnh3G0aoa1ixgYw/9BRS8C9N
         IV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755942915; x=1756547715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtBd4S8gBjtekvzQSGcw+kUn5WfZDsRpyS3ABLi3AB4=;
        b=bDMKhL8cAM+1Ytw9D9t6k4vhlhS2vqZbPsQfj/b1wzbnyR6RjX8iD1EVqjxN6zzn/j
         f2/+CcQfOGPkGvb2HBofsinThdxRfcHn8/s3k81YFwJO7PhOkNBqbNNu0C4jW+IfESWD
         MBOHJenzZgfVNWJ+QkQkZAsyXkldHTseJhec6xOZZe04cS8mQcBAULOsVv1Fjiw9vZDs
         j4yuIk4bM5bMuvypRp84pUQxZxlTjgO8+hf30cok8QeaFEmwewoNCwyel99RUe0cNczz
         KQzAKj3jzOU4UbSQ+SomPYj9ZPJTg1JLeNWj5sAv9cyfp02Q5xJAYlGChYVumZhqkGnZ
         Mg2A==
X-Forwarded-Encrypted: i=1; AJvYcCU2ahDb1RRhHn5W3qQst2VqNJRmLNncDOM/K39/okttRy2a2NNSHYUi3vEix5W9BX9uk35IqhOy1EDVV6/AZ4g6zbAKOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIP3MoE2r8tqzkbsdTfStKXGZDlGZdUtkgzVnMPmr0wTjHgkHE
	ACfrpDg5mLpjKGzZAfpUhAh2B9ak5NRWMmeu3WXoPeipaSfaaaeA5RMN
X-Gm-Gg: ASbGncvxhY4wHLSR7D8pTwKJ+Xzo6DokGMUl0VSKZcBqiPY1NbR+0WZtL2WoWYkZ1lf
	pW74UG8aDIWx/LBoN7adEUpfigCcf5MPC4LYr6ZKmW95zq2HMvNE825EDq/fXGwoEJehBFpQp9E
	rz7Y+sr+BanWaxriwMn0QqyFLpc+BfA45ULiN7Fc9W0UyLxx964Lgv9/IC5oyX9KaD2AAX35EtJ
	gSAdDlnFWs6EYChqD7CtIzoDM5/zXE3LIsDxKLhR8aqTR+NDkN8hpF1TxHYle4rru6l0ND1RwoE
	VqxGluoU7SlhkSX5SEuhIrd+ozOWBeXBdgjUFmYbDUzWVahsJmjv98zB5Fbu9dtM+SH3k4zK1Jv
	8IlkTqpI6zHznIJFRUgrgw6td2eA7aQXhj/2cxiXe6SkSlM4luqkVoM4OeDrCNPtS
X-Google-Smtp-Source: AGHT+IE2so4WIG5u9yQapXGIsWzilpdvLlKfItl5h7+IUTuT26kA7HfGpY5pdHi28WRaqPUzwlNKng==
X-Received: by 2002:a17:902:f603:b0:242:9bcb:7b92 with SMTP id d9443c01a7336-2462efc703bmr100756255ad.54.1755942914544;
        Sat, 23 Aug 2025 02:55:14 -0700 (PDT)
Received: from primalkenja-desktop.hsd1.ca.comcast.net ([2601:646:9d00:1ed0:41f2:9409:27da:bab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246837c124fsm8194295ad.138.2025.08.23.02.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 02:55:14 -0700 (PDT)
From: Vivek Alurkar <primalkenja@gmail.com>
To: broonie@kernel.org,
	skhan@linuxfoundation.org
Cc: Vivek Alurkar <primalkenja@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] selftests: alsa: Fix typo in mixer-test.c
Date: Sat, 23 Aug 2025 02:54:38 -0700
Message-ID: <20250823095439.476797-2-primalkenja@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "libray" to "library".

Signed-off-by: Vivek Alurkar <primalkenja@gmail.com>
---
 tools/testing/selftests/alsa/mixer-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 2a4b2662035e..dc7b290fc4ad 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -685,7 +685,7 @@ static int write_and_verify(struct ctl_data *ctl,
 	}
 
 	/*
-	 * Use the libray to compare values, if there's a mismatch
+	 * Use the library to compare values, if there's a mismatch
 	 * carry on and try to provide a more useful diagnostic than
 	 * just "mismatch".
 	 */
-- 
2.48.1

