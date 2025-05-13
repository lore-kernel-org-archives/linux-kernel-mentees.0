Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A7F20B7EE
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 21:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172805; cv=none; b=qCormTH33tsFOVR9kdDKyT4/EKfYGo0laaGUfaWxK2Dg89hfV6S9YpmLWmYp+QMR2t7KpgwzEC/gaQH1D5VTi92WxlAF5B3jH8blo5gR3ZtFERKj4OLFhiZfpqCuxjXJiwAJWRdgW4zqsueU2MvOAtrYxtKXFpXP4FrpdlWEvLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172805; c=relaxed/simple;
	bh=wG/Wp1GjJWoFt+2qnjj6hA+4W+5qF2qQBrY0vwHfkDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iqC3hEH8OpBvAYr/xR7mZHmaoEV5pTppOmSLJC8+sIrbgqPGlhiE3QJ2CLhjxi+hY4rj8WdxZMf7I9xxpehrymisSUns+LcUnlKwpKis64k8py9HU301hKGDtlmOTYhZRXdxG8dowfkDFsJtoVgRjgyWGlg+Aoeh84AKUSyiqGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JK6N0e+K; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JK6N0e+K"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so7753585e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 14:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747172802; x=1747777602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stc73lGvEUEFWN8GCfFvarZDGFQnQhaMztIejiIT7GA=;
        b=JK6N0e+Kt1bJWFO1sr5QKnKPCZ8N9M75SoQuf7eU+9IeDHAt/qwOVcWdLciv5tgIw4
         vOfDh5+JlM2YRNrW24KuE+76VWMEpWSPuZRXwCPZpGgPjuAPi8KErnIeydUOc12pI9VK
         fRxB30J5Y4aRzNr9ENpMGbFOEU/p12zcVjoFWWUyxgRBzKw+iYnLaTHh6UwLBixtOtpS
         0JJBepowdAehWxKY+nWREPQy5JnzSp/prKdpFE8dtrXPrrDD7Yu/5qo69+g0czSDIetQ
         7biPbMfo/AQZkdiA743hNETSBj6qrdpH4vU+NUhFyzdhmY3AlVddKOaGecsKj3M6oPpQ
         iH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747172802; x=1747777602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stc73lGvEUEFWN8GCfFvarZDGFQnQhaMztIejiIT7GA=;
        b=jaGP37W3AU5QDhYYTpI4G5Nzyzy3EJsOZsLkIe6VUDA5e/kD/pUrhVTgm88i/Di5Ic
         TeDUqgxZt4PLUAI6z/C+TD0j8SLO7FD/ilg8GcSon4XJ8Oem2hjx0WeAse1wF4mzQlrX
         DjnjzenOYnHhwY02IT5t7NiYaPSHhJGH2fNKlrKbSBrDA2V/F+Kl/ttZb7NWVXN7vz80
         pbYn2wXjsAD0UYhlECGK/SX9zGhLB7D3+8js7rkIQpydsCUY20JnF2snIr1S/raqLZtg
         Sq2S79LdHu2Jrfjr2dY1CeC2d98DA+GQs3OFkqcjWu/6SFeCxOgDgeVhmO1z0NHWWIT4
         Gu8g==
X-Forwarded-Encrypted: i=1; AJvYcCVXYsDLV6YK4GIy3Q/pksY/zzZxRaJtcAm4kCyszngc0LQcv8x5nrx0Pp6N/B8QKO5eYZHTN5KICCrh+DIw5GxD0PneWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb81ckwLmA9np3atOlxSASLC2SVSxPK89Tflzkxi/fB/T11HLo
	7OGku77d38kmlP26ik6fSRw5DRKYQID9w4YeKLJMd+x/1nCnk9Rz
X-Gm-Gg: ASbGnct9hUZCmuZtYNsGlvcd7jpVFAIHRaV7SO2gf0mQQ2EWqUsqRxoOrcX10GYV9ou
	iy4FrJ5Qdy4Il53Smt9yNRjRxOVrRMmyFSSeuEHFLottrTJOX8lG9tSDJEQ2aWtJGQOyWBikxld
	tE9bDdk55Kvc23pvr0fTIVBQvbpQH6KsUyK9DwAIKHOS5i+id0gWg/+B78DPBmQ+YhfDR+SyelY
	pkACAgOQPyWWhf6PaUJdPJsg349H2pP2lbOPS9suDqj6bYdWKvO8pp/BHNDz2OdmnyciXAI4+Vt
	YoYNuL36Iage0GMnvfQYoMM/tjWkD02WM2QVn4gyO+ts1F8xOeVoDUBEC/BDtJW8Suf8RQy4m4J
	eKXe9GObNfsUw4vgrVe+kyJY=
X-Google-Smtp-Source: AGHT+IHiV8X+PIZMB34eU//Sz/WBPdRkfT4sZ6bPvbJjMB0TtkFVxh14WGHbwd+hbFf4okMBSwWR3Q==
X-Received: by 2002:a05:600c:4f0d:b0:439:9909:c785 with SMTP id 5b1f17b1804b1-442f217aba9mr2686485e9.7.1747172801282;
        Tue, 13 May 2025 14:46:41 -0700 (PDT)
Received: from localhost.localdomain ([102.44.114.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f337db8asm2601235e9.9.2025.05.13.14.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:46:40 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
X-Google-Original-From: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
To: shuah@Kernel.org,
	skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>,
	Abdelrahman Fekry <AbdelrahmanFekry375@gmail.com>
Subject: [PATCH] selftests: size: fix grammar and align output formatting
Date: Wed, 14 May 2025 00:46:37 +0300
Message-Id: <20250513214637.300563-1-Abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve the grammar in the test name by changing "get runtime memory use"
to "get runtime memory usage". Also adjust spacing in output lines
("Total:", "Free:", etc.) to ensure consistent alignment and readability.

Signed-off-by: Abdelrahman Fekry <AbdelrahmanFekry375@gmail.com>
---
 tools/testing/selftests/size/get_size.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/size/get_size.c b/tools/testing/selftests/size/get_size.c
index 2980b1a63366..d5b67c073d8e 100644
--- a/tools/testing/selftests/size/get_size.c
+++ b/tools/testing/selftests/size/get_size.c
@@ -86,7 +86,7 @@ void _start(void)
 	int ccode;
 	struct sysinfo info;
 	unsigned long used;
-	static const char *test_name = " get runtime memory use\n";
+	static const char *test_name = " get runtime memory usage\n";
 
 	print("TAP version 13\n");
 	print("# Testing system size.\n");
@@ -105,8 +105,8 @@ void _start(void)
 	used = info.totalram - info.freeram - info.bufferram;
 	print("# System runtime memory report (units in Kilobytes):\n");
 	print(" ---\n");
-	print_k_value(" Total:  ", info.totalram, info.mem_unit);
-	print_k_value(" Free:   ", info.freeram, info.mem_unit);
+	print_k_value(" Total : ", info.totalram, info.mem_unit);
+	print_k_value(" Free  : ", info.freeram, info.mem_unit);
 	print_k_value(" Buffer: ", info.bufferram, info.mem_unit);
 	print_k_value(" In use: ", used, info.mem_unit);
 	print(" ...\n");
-- 
2.25.1

