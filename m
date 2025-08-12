Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C7B2F066F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 21:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032656; cv=none; b=RLbQhsONZlcIvjA/sxX58SpYBltMs5tRs1dphNnmDH/+y5FroMGKNBd++ZaVUU5qBO6wNqTb0R0AVw1Xe5Ar4/DCF2RwYoDbX7o4gH4NcgIOg/p398nd5w29nzd73Au6yT+TDMgq/YJB8HFMRUX+BC5Q3tVro2cvSPRVKMxLJns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032656; c=relaxed/simple;
	bh=TFD0N36x9nUil9ORJg6xcGUfZhK8W8K3MjjfYGGc7Nc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uAYSNrL7wbUAPP5JtH4u/IpE9uPwz41X8gbt9/yA+rql9IaMeQpquBp/tzUFVMnJtCMoNV+SP325256kztttDpDolmBALH/4S4is34PpurcQVgngyQRQpUBOM0UxOq53AhG/RBH+u331nUBq1wH852s4A+FSAH3XTapJ3ye/CO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koOTOxdF; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koOTOxdF"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C3C684260
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 21:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNgsmrWOeEzy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 21:04:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B527A8424A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B527A8424A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=koOTOxdF
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B527A8424A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 21:04:14 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-242d3ba2b44so25174315ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 14:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755032654; x=1755637454; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGUsQ/sj7ZoEg3RcWInIAFXjfXgYxi+8KFeXZWWzawk=;
        b=koOTOxdFC3FYjurAvVydLnT+A1PoDhfUn6/Ixa6DgkN1Itk1kfr6em8iRuaqS95H9P
         14okjj6ud06NX9T9MjrRt/RwEun87bTIIq2sf9toZb+kNbPZ6QPJ6WWpu6Wfsl0oNmBY
         gw83N4TU3/1sjOBptz3Dm/mKdk8ZUnTDpu+D7Mze2ZUVVpujleU+FQ8bnJ65bjXkEF1k
         A/CWN+1/d/d7UjGKiywcVfag5oZQ5gcFOBpPyg2jCJ36trWsGspu0r8gz+c86h2lSb57
         3oiso7lv1J5I7Vuiqdfz3s+HQwRy+3ITRM9DysG9WywLU0JA0pkr/8YoLbaPJ3q69MTT
         fNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755032654; x=1755637454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGUsQ/sj7ZoEg3RcWInIAFXjfXgYxi+8KFeXZWWzawk=;
        b=uEynvsvG2OUFeBGpp2DBWLaPsfb+2TwBGko6T1ZUjZOzRZLRqdImtUNN/2hIvU2mpv
         clc4JRgHs5LSscl0gm75lTOvqATyiqws2qC6EhbScB5IZ9N2jcGlZP70p7PlukFfCfsM
         MtZIbjH6OMokI/ri9rvKTrxT5vPMID4mvF52JyoxNcyMp19QnyUc7dNtiS7tygbzl7PM
         A2Hkks/IUeZwh+aXP2AUpcVW5X8rH00zhWcCPjQW096RHeBx2BDnJosudFthQNOh5PDn
         H1zXQepVNSRuxiizI+8ilP4fS+JRZMFq824NmGP7G58GP0hx7MAFHEYFYLg0RiAn1cN1
         6x7A==
X-Gm-Message-State: AOJu0Yy4r884XhisnKKI2+nwP4nWI0YjsiAC8dYtctKADj0nJMIu2MAM
	YcbiVOYo+8k5rkrcNwBkTkfpx2/wAGD0umSo4HwrPbZlbXIqxRzh/OWE
X-Gm-Gg: ASbGncuc1vtRoUO2VK89ysR9mRNfAOj4KNNcCCB655uQCJD8MbLYdItIDr6YuW1jHho
	SOHExnU5WloWm8pgm/5Fty3+GigA87fp5vY+Hm7VxJnHlGn+uyVeY/6lrGQXyGy7f+8kurdeXEg
	K5M4zVoOLHaIrC+bNPX8Zg2fyMDAb+4rwuhbCOJsQyd93DhYZ2zEz909a5njDNZAkzmYSgLj4xF
	ve5jFdw/LtFrKdKBgT45s8/KpNR7g1SSQmngCtcPQVH0T+q1yF+z1RbIBvVUZFRZZilMAeugOnL
	AO8yZSXZpleOZ9LIr5560Ij/uulz4kU8XmJZUimOcwpCVXMm7sLkAjc8Vhl+M0G1QtlTup6Jksy
	c10C2WXCp/LlQMcnxegoDaIsFInBNmdVMd99kUc8PLA==
X-Google-Smtp-Source: AGHT+IG6xBgpMhcO5IV+Rc2zkIZj9anD7gmBVY5NkvqSTvXC62aZX0FDejwxN5Ju47vnKWKhngM9ZA==
X-Received: by 2002:a17:903:986:b0:235:f298:cbbd with SMTP id d9443c01a7336-2430d0fcdd6mr9843065ad.21.1755032653911;
        Tue, 12 Aug 2025 14:04:13 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aaf855sm307852285ad.168.2025.08.12.14.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 14:04:13 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	corbet@lwn.net,
	Soham Metha <sohammetha01@gmail.com>,
	Matthias Maennich <maennich@google.com>
Subject: [PATCH v2 9/9] docs: symbol-namespaces: fixed spelling mistake in documentation
Date: Wed, 13 Aug 2025 02:34:00 +0530
Message-Id: <20250812210400.74370-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812201523.69221-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typo

- whoes -> whose

in `Documentation/core-api/symbol-namespaces.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/core-api/symbol-namespaces.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index 32fc73dc5529..18278dc6ca2a 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -89,7 +89,7 @@ For example::
 
   EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
 
-will limit usage of this symbol to modules whoes name matches the given
+will limit usage of this symbol to modules whose name matches the given
 patterns.
 
 How to use Symbols exported in Namespaces
-- 
2.34.1

