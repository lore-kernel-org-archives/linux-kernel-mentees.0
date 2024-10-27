Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7A6126C10
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Oct 2024 21:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730063981; cv=none; b=OeudL5A6TeSJdn9SeSEUPMClOfS6lV5qhFoWg4yzd8bzRDy7EAyxzZmjLBSM+X/tqpIJvIOXtxdpk4EeAYVuU79e0aoAP6CZGZeUMwC+5gS1hrlcaxOlGOa7Pg7um7papSR3cH+zJEr7MIPL6e6vEg9AHw5BRQnIwuLiUBcGWmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730063981; c=relaxed/simple;
	bh=KdJh3u3ZP0U2JiSBziw64zZvKITJSsDF5v402M9mu6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DJZoOtLX8k4BTgp4IZaKGNVUiy9NghtOaE9jqHAgIgH8lhjHGXLDoDXX7ue07LyDKQWnIrGMhWabxeBRCO82/wS7xWrZwWyIUGyHBlaG+QyGY9KrlTyeClzYcO1Dt10I4YBbiZkVMUOU10MvVTYpmWUuSRZqsPq1DzVKD1VQ1S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6dlZrrA; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6dlZrrA"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2b4110341so571821a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Oct 2024 14:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730063979; x=1730668779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEQW5MOWjW7KV/lqVtyNAJeFCNbHriW6AQc/1TGHzzM=;
        b=F6dlZrrApeQNVYqmGZ2h8+QaY0LdUn7iaxmXdIfa3Zjgt907SNqUwBKlTBKKvc7H31
         cz2D5dpp5Wa4dqrnp8bidcsCI1QSWXCzirZPIXy7QxsbaLBJkIvKgPCfDJijOU4isHob
         WoIed565ekTBKdpBSaYRzN7SXH/LZ/rR/MlJR3xIhf/aZf6+VEbWabjfv68OcNqUHmd5
         yr3xWEj3D2Izh9AAPa+uELz97a1L0cUdQwqPoVNENSVWvfou4xa0lt6nGoG+GekcEy+F
         TFf5NWqloSX4NdkMDFUv9AWy8yo+qC10OlCcIKxLjZmq1/C2BOO4PO46hVAl7oN39L4p
         4pGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730063979; x=1730668779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEQW5MOWjW7KV/lqVtyNAJeFCNbHriW6AQc/1TGHzzM=;
        b=SvdK7YF6IgHIaTR+7Ht3KuV5BwvtiOAuPS0HMlf4br/Sulqlo5SXZQ7V7s5N8fQU/0
         drAid0QJuYx7zLeBySgb66KOIlCDtZAjzgEeO+STMyr8E5mO+l2ZDimYxojDWssq+Llr
         U8zfBWkTMjhxhukUC5E7akCs64oExPoGSkZy5TXRXUssiEJPgh1TXMG/jrRmEp0esTrf
         0gxGjW41U7UdUmeQjq5kkTiHxCvVaOQLXZ/NkHrZ5uhXPZHhD7eIFXIzcY4CvKoL9+hf
         9cUCvuXo5AgLJ8yHipxncV/hOeq6hsLZjUwnTZVlmTXXkn1qm1toASxTU9xZPX60hQpn
         3Gzw==
X-Forwarded-Encrypted: i=1; AJvYcCVbokmBewQTBE9kOa0A7f1uuffQ4EQ5cE69MdV+yGPgikErUiVDEn/2cahPNcipolfUQ9j80w1vc5HDGetmHVB2jEQXnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAbTjnWYpmWXhxnPCAPFYUdiZ311xXKfJFj3w7M3QsC3hUL+Rk
	q2B6MiqriND+l9uZ2rVSjdIrYGSKYNlx+zHjszQGgBZt64sNydzR
X-Google-Smtp-Source: AGHT+IEOQnQ3OFqJ1bnyeZSnpt9CJgoKqnnMYnDe0BvRc7amn7cMEMJ+P4mQ2xX1emxWf5yAVIR3Ag==
X-Received: by 2002:a05:6a21:9997:b0:1d9:1894:cdc4 with SMTP id adf61e73a8af0-1d9a8534ed8mr3959762637.11.1730063979023;
        Sun, 27 Oct 2024 14:19:39 -0700 (PDT)
Received: from motti-test.. ([2409:40f4:300a:9618:92ca:3f55:718b:1cab])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc89f2d19sm4383887a12.67.2024.10.27.14.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 14:19:38 -0700 (PDT)
From: MottiKumar Babu <mottikumarbabu@gmail.com>
To: 
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	anupnewsmail@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH] Removed unnecessary initialization of "ret"
Date: Mon, 28 Oct 2024 02:48:18 +0530
Message-ID: <20241027211913.26718-2-mottikumarbabu@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initialization of ret to 0 was redundant since ret is set to meaningful values later in the function. This change simplifies the code and avoids confusion about its initial state.

The issue was reported by Coverity Scan.

Report:
CID 1633338 Unused value - An assigned value that is never used may represent unnecessary computation, an incorrect algorithm, or possibly the need for cleanup or refactoring.
In register_ftrace_graph: A value assigned to a variable is never used. (CWE-563)


Signed-off-by: MottiKumar Babu <mottikumarbabu@gmail.com>
---
 kernel/trace/fgraph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 69e226a48daa..b13ab2ad0e88 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -1249,7 +1249,7 @@ int register_ftrace_graph(struct fgraph_ops *gops)
 {
 	static bool fgraph_initialized;
 	int command = 0;
-	int ret = 0;
+	int ret;
 	int i = -1;
 
 	guard(mutex)(&ftrace_lock);
-- 
2.43.0

