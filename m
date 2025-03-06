Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A064F2063DD
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  6 Mar 2025 21:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741295539; cv=none; b=iWOCisbAwaeFYwaQdxJefyb6bUS3JZ29WQUmi6DZNXcUkJeUqDj9frlv1uC2d8xvUrFhxR70xx0nAJ328NR4akoy0sG/CNqxUh6NfbsAImmqPPRZxAlV0B3QoHS5w3tfKP3DfakTNP+lmvXn6BC8epJ2JUyW2eUvYTsoKJfoc58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741295539; c=relaxed/simple;
	bh=h+VIqaX0d9abQ3DgSDf9PJxmMtWd3EZWAdJBHQKExe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BFRnt3pum46WGKSOLEurkr7YbrRjxA2guvaHMiV5QQIloVcbtcTQF8kAvLHkPlYzOn5X2ELD/PlMIEgfUAQq2S+xpmaCAFYS7Nc8Qdl2lCVC6+OEkD7emYx9dJ6X9w+k10DbXIGYG8TGN25oDk5fsuvqCHm+mMKsKjRv/ipfDxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=XVN4ljCe; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="XVN4ljCe"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1741295521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y3UeIRikRnYRQC1pPCbxniJMgfci1KvvEP9uumjgL+U=;
	b=XVN4ljCeqOBTo6h9ilroA0XqRUI4a5PIl8nHzuRYVep5tjK5EVhCd9EMldPg9Q+IpW6okJ
	xiRBNwncleDyexs5zZrJgC9yofcmBwfjeBNo2vtLzMWtY210Upk1Fg1Kg05s+AIgyWQ3U5
	7eVyKZ+enbEBYFUHLlL3JC/EBcinRHbQ5wmI+dqgy7RFspS56DRBgnDbROQVE1CXmyemO/
	/TmLC6p9ZN25yuMCGXvIqe2iyLniERd/herFvWjtrVc8ApBLhyiNq9Q9U2MdnYYHtr9ENo
	QjR/KvYNc1TgdPtaPctkstLvNAizyYqmoC8kXv1FPMr81UdKwtJuzjywwwW/wQ==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Thu, 06 Mar 2025 22:11:45 +0100
Subject: [PATCH] Documentation: kcsan: fix "Plain Accesses and Data Races"
 URL in kcsan.rst
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-fix-plain-access-url-v1-1-9c653800f9e0@iencinas.com>
X-B4-Tracking: v=1; b=H4sIAJAPymcC/x2MSQqAMAwAv1JyNlD36lfEQ6hRA1KlQRHEv1s8D
 szMA8pRWKE3D0S+RGUPCfLMgF8pLIwyJYbCFrUtbYOz3HhsJAHJe1bFM27oiF2V80xV20FKj8j
 J+7fD+L4fi0brDmYAAAA=
X-Change-ID: 20250306-fix-plain-access-url-8ae841efa479
To: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: kasan-dev@googlegroups.com, workflows@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ignacio Encinas <ignacio@iencinas.com>
X-Migadu-Flow: FLOW_OUT

Make the URL point to the "Plain Accesses and Data Races" section again
and prevent it from becoming stale by adding a commit id to it.

Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
I noticed this while reviewing the documentation.

The "fix" isn't perfect as the link might become stale because it points
to a fixed commit. Alternatively, we could lose the line number
altogether.
---
 Documentation/dev-tools/kcsan.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kcsan.rst b/Documentation/dev-tools/kcsan.rst
index d81c42d1063eab5db0cba1786de287406ca3ebe7..8575178aa87f1402d777af516f5c0e2fc8a3379d 100644
--- a/Documentation/dev-tools/kcsan.rst
+++ b/Documentation/dev-tools/kcsan.rst
@@ -203,7 +203,7 @@ they happen concurrently in different threads, and at least one of them is a
 least one is a write. For a more thorough discussion and definition, see `"Plain
 Accesses and Data Races" in the LKMM`_.
 
-.. _"Plain Accesses and Data Races" in the LKMM: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/memory-model/Documentation/explanation.txt#n1922
+.. _"Plain Accesses and Data Races" in the LKMM: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/memory-model/Documentation/explanation.txt?id=8f6629c004b193d23612641c3607e785819e97ab#n2164
 
 Relationship with the Linux-Kernel Memory Consistency Model (LKMM)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---
base-commit: 19b100b0116d703b9529f7bbbf797428de51816a
change-id: 20250306-fix-plain-access-url-8ae841efa479

Best regards,
-- 
Ignacio Encinas <ignacio@iencinas.com>

