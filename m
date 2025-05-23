Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E55A1E7C2D
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 20:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748031774; cv=none; b=Hg4wjWZxjoaJzKYpb3hKlTlHmharaXioY/+9qBkMp8OGJucNR+4IsfK1FxVNsYc+m1+/8jpQmCt3++kzEyItty0oERSYDmy8CQJpbAqqnRNQgt4wX9zvZcRYQN5VMOZAdi9jfhzACm+ueQdXT8bTjPEC9DLmw2yi+2ury3xKWyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748031774; c=relaxed/simple;
	bh=gdGOZhES5ZVdb0Ry/4gXsJos5Ia7PWWzwWxwDVw7X1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QsrKzVcjFGZAniju6LJBrXSVwtP5WJkjtkSPNR8DdkD48RimAocOXnPve8T4yECDXRTOko4+W6kiX+dQzMWxd8Lt8q6bvYZxXIMga0N1+KKGI1eBFRIV+XS3mK1xysJly11fmjS5lniuXR5i34CjsN8bDDfXW3IrG25bfLcZqgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRgF+Zlb; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRgF+Zlb"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad52d9be53cso28834166b.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 13:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748031771; x=1748636571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQGGRhDFzfYXAwRufYqCszOLJOQpXO5dLAyeYhV8EXg=;
        b=lRgF+ZlbanAR2Sab/OmW7bKWvuOqbUIBfedEYzh68Cko0B+ccqfSAvznp5ybuOVjsp
         jz6eP/8CkY0Og+A8u/TydoVQYuZwKYzS06ZYhoMW945GSqJZsHeQTFIiSZ7I2KqJujTT
         FOHBCIfPFI8n0Bm+rAOdK7n++beBuR1V3tfvyJQysCNmbL8eQr59EC0g64fFNwMHKC8C
         c03i3Ex+h9+4i1Y07OHQDPlO9jbqeAP4mRbu0iVxjtryrgWrG+pRfqCNb/uE7tt39tda
         RP27eRXwMTxfCDzj7C4QAHebDlhoPYyPtI3R6g+ajiYWT2dphLMFqV+UtkhGoroKr9YI
         Z+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748031771; x=1748636571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQGGRhDFzfYXAwRufYqCszOLJOQpXO5dLAyeYhV8EXg=;
        b=aNUnhOsBqcNif8ZHFrbPeRXkcKhlEsGPLZl2R7NUtldf5A/lO0emw8gohVDDtEnso+
         UpgP0kVRngymUtRIbSdivMxdIXQk99ravl3CimAvkojnBgsu3o2NWaMmoSXuHmqkMlGe
         ispSmwDzQhg62kr94uvz/OpoymzPaksAZVQ8TMvQZE2yZ4ELwuDALRN1s60Hd3Js7nfy
         4RUJet8M7K3EnvLFtwsSPFjhMI5NgHMQX0CZBGhw+MRn+tncFEIBislbXMVDFRdMj3l4
         PWFqzaQ6Tq0L2junV6FDRL7cZExOPIBNV5Wojkluh88/hAa5Txgt69a0ROV5qjEDIH6S
         kVwA==
X-Forwarded-Encrypted: i=1; AJvYcCXRTw8jHetja3qhurTZ67N+i8UN9EXYhPgnJW3/fNLivPwvQrbmFifz4FQdnAYRi8ujfK+tyeiwPYaeWdX/0a3sTSFOvw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo6mvTPS6cS8w6Nl4UpqjMjZrUUqh17RcFPGgxF9+EneMtsHA1
	iKfQyZ2e66C+xuFthnWcGJJjWSNcXmmzQfVBLBME6yFDsrQawMi4y4Y=
X-Gm-Gg: ASbGncs/aUp0QAP7j5UkGGu68Wqc40CZjB+QoZ39uT3JECCTc+52/tfpN+YrV1Qb5NW
	3quT0V7++Suao6fuRR6rKcGeoKdsPyY2SiOp7nKJjzc/jG7z9w4rmH+n03kB5JOkgFLR6hxG7QP
	SR1iDfk/z89UmpjlZmm8It+R0dxYtSiyEqP2GW5LJNn8qcjT2Zc9h7iGMiiZc74xJzWQJqTNi0x
	aYQH5kRpV7VSIxiu/DDoq76gGugFNlnLlj2cQeAXw4TOCM6GcSu5al2RqFuq0UA4gVg6jTWJ406
	MCNkrj/Kff/UvWd3R+cJsTAVVR0XtV3eyXJ/Wr1jzsCUDOFOROIQ+hxPsiC/Gi2LGJscVCo=
X-Google-Smtp-Source: AGHT+IFaJs+4iZ7OReznLn2Mt6fklkBCNbKteZfnNxAJkKtYhynt4wiC7/6CVaTQFRcQSDTdg40P+A==
X-Received: by 2002:a17:907:9718:b0:ac7:3912:5ea5 with SMTP id a640c23a62f3a-ad85b2a6042mr49141166b.58.1748031770318;
        Fri, 23 May 2025 13:22:50 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:42f:b2e:ea5a:d342:ee:1a7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278290sm1274299466b.78.2025.05.23.13.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 13:22:49 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: shuah@kernel.org,
	skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH v2] selftests/cpu-hotplug: fix typo in hotplaggable_offline_cpus function name
Date: Fri, 23 May 2025 22:22:39 +0200
Message-Id: <20250523202239.276760-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"hotplaggable" is replaced by "hotpluggable"

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 Changes in v2:
 - specify the subsusystem in the change log
 - Link to v1: https://lore.kernel.org/all/20250517011928.673585-1-jihed.chaibi.dev@gmail.com/
---
 tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
index d5dc7e0dc..6232a46ca 100755
--- a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
+++ b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
@@ -67,7 +67,7 @@ hotpluggable_cpus()
 	done
 }
 
-hotplaggable_offline_cpus()
+hotpluggable_offline_cpus()
 {
 	hotpluggable_cpus 0
 }
@@ -151,7 +151,7 @@ offline_cpu_expect_fail()
 
 online_all_hot_pluggable_cpus()
 {
-	for cpu in `hotplaggable_offline_cpus`; do
+	for cpu in `hotpluggable_offline_cpus`; do
 		online_cpu_expect_success $cpu
 	done
 }
-- 
2.39.5

