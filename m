Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE1E1CBE99
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Oct 2024 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729526105; cv=none; b=cZnZ4MBT4hFq1jAQPUKCLMpQ2l9oho6+HCwrNoPOsevJ+5u0m72b6DAWW5Mx0wGms6BJqf30FV3zKD1KQ0dXWfH7FAhKVoSEKW0dCExgKKLQ/HxOUjqPcSuXjMLrGk34wwnUcHyBL7tdMJaARQ65sGXhgEFGbm1u38QKicTxi+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729526105; c=relaxed/simple;
	bh=xAumv43BNFsGKsMqasYPmqwir94NH0Fv2u1Mzznbwxs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RmnoXyuKiNAmU/xbtmHsGq6hiXRViicBhZJY/UhBZGzUNSuqeSh/+4UsI+I9/eRDOjiSnvY9rhAc4pECPLoHZijxoHJsqoDapZAEHqTCTHStaohDOZxEc1pjADh/sI7w4m2lkrFUMPf1ULteWVWKAPZJg/86c8v4K3DbS4cR5dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3oZKohJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3oZKohJ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cbcd71012so41615285ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Oct 2024 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729526103; x=1730130903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sh1aJBxWv0VwDDcKCoEkZD4rXl4897TVpmKVT9zgLRQ=;
        b=G3oZKohJxY4a/mWMbLTFAIpYvK+WiJo3JuGXsm6txXr7DBPyLNou7MjHIVPS+kxeci
         53R8D7oQeyKq0N3EIyeBIHRoqUx6zvlfO5KsTP7ZsffMPMpVvSZNGlsQ+aFarCxCEK5/
         c45m90aPdfz7CtMFoClfvDXyoxd7vTzJnNhTkP1QYwe2afiejzLhr+zKPplP6kFy+Qci
         GpE5njiTvhMQEjjJ/3ANnuPqgXxeSK731337TuZBpZMFTABKCpSS7CHlEahupwk7nJSF
         JxjNy2yktzDHnHUAgmulBj9C5XDthGML1mO70w+b6pBBopXs+7VYDAYPayq6Kkwx03nG
         iUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729526103; x=1730130903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sh1aJBxWv0VwDDcKCoEkZD4rXl4897TVpmKVT9zgLRQ=;
        b=rWEIvxYTI1aASjN1b5pLC4P7/aGEeNdmfF64BufWmJPHVZaAbe0OwCymmtP6P71JKE
         cF4ZlCkQaK11N8Vmtj1bdGkU3TGCiJH80akiapjBJIZe0CcmLJW4dQ8oGxERvS57C32P
         Urg6dj6VHqXz6n1cvEOmMg2bO9rNrG9vWZ6/8vGgPjN/uxH9up0/7eSHtMpmYHi9bvGk
         gRp/JHJ/0xilURdvRDGFPVCHB1P0dgr00+Sxmv6THyo+s2RLvDbM9s4PEiyo6Ju12QfQ
         7M7p5Qb99ldVAi/I2dBOgbb+AItHfvFiW8zh6UPUsmCkktkOokHfDDHoGfJu8XAtf0+L
         38ew==
X-Forwarded-Encrypted: i=1; AJvYcCVXaoH6p3aFvFOfKR/2i3wFZtYRcQapzwxrjnuTqo8/yGEI8qppyaMAZCYKJCWKZpybqF7Dt7X3RUZoYIRezLQcyavEqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHUJGk5eMb631ABtZ0NJmq/Be+QE/H08AyxQHYn4XrcWSM33sQ
	VxIqOd5totiGQmQ3PNkpIcdyK4kXfqhnhaEBW4pqvgVGrlBRJ7E4
X-Google-Smtp-Source: AGHT+IHJDq6KQ/Z+VA/Ppwmy86CaogWcH97pdQYjvExuTNdZBgq2iRpRli2bAOSYM4yVUpe2a2DI9Q==
X-Received: by 2002:a17:903:40ce:b0:20b:b238:9d02 with SMTP id d9443c01a7336-20e5a8d1560mr147067215ad.33.1729526102969;
        Mon, 21 Oct 2024 08:55:02 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:23:59fe:c0e:3382:bbfd:44ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0ad34sm27688725ad.68.2024.10.21.08.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 08:55:02 -0700 (PDT)
From: Amit Vadhavana <av2082000@gmail.com>
To: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	mhiramat@kernel.org,
	ricardo@marliere.net,
	skhan@linuxfoundation.org
Cc: av2082000@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH] fgraph: Remove unused value
Date: Mon, 21 Oct 2024 21:24:37 +0530
Message-Id: <20241021155437.5633-1-av2082000@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable `ret` is assigned a value which is unused.
Fix this by removing the redundant `ret = 0;` assignment.

This issue was reported by Coverity Scan.
Report:
CID 1600916: (#1 of 1): Unused value (UNUSED_VALUE)
assigned_value: Assigning value 0 to ret here,
but that stored value is overwritten before it can be used.

Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
---
 kernel/trace/fgraph.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 06d254edaed7..306f1cb7bba3 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -1302,7 +1302,6 @@ int register_ftrace_graph(struct fgraph_ops *gops)
 			return ret;
 		}
 		fgraph_initialized = true;
-		ret = 0;
 	}
 
 	if (!fgraph_array[0]) {
-- 
2.25.1

