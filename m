Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A191B28643D
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100079; cv=none; b=X0BiM2lNeGjgbNZn8llT7m9q5lcu5dYZ1bMNo5JuTBTLnwC4xrtzwDZ0mUQAWld6+OB/mKOjVhYGmHI1MbiqwHS5+kVEVwkW1Td1i5g2sstlZAPPeNy2HkKC7t3HRYXSCzfgJ3ViO93LWhzDhCR/KyHyMPb3r+B3pbuORlTQjkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100079; c=relaxed/simple;
	bh=qN9x0M5iZ/AJ3TuhCeARilRxngvX7v10a63t3HFI3z8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sXSLUIR7Mcw9HXDXiUZiAVQD4zOGIFirBShDGw9ZhSpcuGSBOijSvIMagNvUTd9QjNJd+Je93ZovA+fAJU07whiWyifzExbdydqkyn6YmPfzrQKDSGXfntEWmkY8lWvODJ4NF3ZdrrzmRL7/AsgNxkoPYfJTO/RTHUnqjbjrwVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpX76pbx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpX76pbx"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e2eabf7a6so42317b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755100076; x=1755704876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FA+E4yoYzdUzcvg+5vC+lhnzGIxbCNmvdw1XMVNouhI=;
        b=FpX76pbxktiD55LohSjoVv6EQOOipSTQdb5rIZ40wf1hDIiEMC8n7bEQlhHpUIXEXO
         C6QTjtgAa3f1g6SwqvbJ5/xoc80RNYm1Cm6BkB67bZzJHvhIsVKiG6OBDi9jsTg13SY7
         dRZi+rdaC79athoXsZL56bX88A6RxgUkAIwVpTGsothhW2NulL9c0OBhwWizX7m7I3SO
         El213ti40sTQo1Hv8IgxtPTVSz/bjbpfPLox+Jpe4DhezXLMO+kFxZIBXknVwTDCOfFF
         1yc1AnMlHhx0niFD7P3CBFCcs7+NMblNUmbgWAVEIVvG6AyVjSITQx9wMjgj1tXdmtQ/
         6nfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755100076; x=1755704876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FA+E4yoYzdUzcvg+5vC+lhnzGIxbCNmvdw1XMVNouhI=;
        b=Ml7fP+UhmfHNLMbPaV8eLedwRWav34WyTC3fFzvupyshkVMSzFu2Ywlty0YIILsDhT
         r7rj2xJPtBSSTpqbrGkFJeQ+OT53NcqDebsfd4RsjJ+ArvELnotNEmOhAnTBRHP9COuy
         1iUNsP/cNB4Y9mAR2cwPPyBCUHTJ1RsnaJCIhX1bggizM8zbFLFn8wbgcMoxDxL3LxeA
         rcEfSvlNQO7dZcdTcAZtEaNV4MsHmkdZ40TWhgumxrzq/HFBpxZLqLC47louo8C6Vwpj
         1TuV+D8P6vDRAgdiVNrOeETBbxJFxGCm26MeUg6RMCCsFsrYzx1b+9tHpaM+EuH0UnBL
         /kng==
X-Gm-Message-State: AOJu0YwFtII3assT9h/oQASB3KR8EJxSxJWuo6etsrYsvZZ0ewhusoZn
	i6lSRGhPOvG5FpHGpOP0EA/+V3bC+3iVa4HeGRP1BtoMDAQzSMM8wIotnmhwbx2OSmM=
X-Gm-Gg: ASbGncs1IzUG/KIDt+FpcHV6Vt+WGBu/3G2uJnvI3tPxNad9wpp41B9h/HvcoV9Gl/a
	qJFL5CZ1kU090JT9qYyNUSxa41lfVzzWf5loWYmafnGi/RUdCIAyl6yA2qjQISIx+l+n6NmFctF
	YdkaiEJgL74ya6yaROg74NdjpMJZ0/z800HmEPtv6OngtqL1Ooul8UPygmcQEBKBFR/MQ0Sv+6J
	1IyMDpNdZFOOzDv4cjpAZ+GuPYJwQOZSk3Sq6KlkgBerMsSG9XpC20IF5x/4k3pkULzWybpIO6I
	gQxaGiRjkPva1IRGItwQdTMU37NoUkyI3LYLDXUmd2EGTxISO1Uz1VHotyjFsSK0/ZSxzCnJEcT
	26QDcFwQy49sBAqOnOTcpxDW4zcO1+OQw/r7YsnUNCc0=
X-Google-Smtp-Source: AGHT+IGEVYbfMp99wkoejVUvwTSAbUMkKkbcb3/TkyiOpGBuM/G0R/6uEUlm84p4znQECld1sXq79g==
X-Received: by 2002:a17:903:234c:b0:23f:adc0:8cc2 with SMTP id d9443c01a7336-2430d1a8e88mr43399185ad.27.1755100076421;
        Wed, 13 Aug 2025 08:47:56 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976cfdsm327629355ad.101.2025.08.13.08.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:47:56 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: linux-kernel-mentees@lists.linux.dev,
	borntraeger@linux.ibm.com
Subject: [PATCH] KVM: selftests: fix minor typo in cpumodel_subfuncs
Date: Wed, 13 Aug 2025 21:17:51 +0530
Message-ID: <20250813154751.5725-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813153838.5470-1-krishnagopi487@gmail.com>
References: <20250813153838.5470-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specifically, fix spelling of "available" in main function.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 tools/testing/selftests/kvm/s390/cpumodel_subfuncs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/s390/cpumodel_subfuncs_test.c b/tools/testing/selftests/kvm/s390/cpumodel_subfuncs_test.c
index 27255880dabd..aded795d42be 100644
--- a/tools/testing/selftests/kvm/s390/cpumodel_subfuncs_test.c
+++ b/tools/testing/selftests/kvm/s390/cpumodel_subfuncs_test.c
@@ -291,7 +291,7 @@ int main(int argc, char *argv[])
 			ksft_test_result_pass("%s\n", testlist[idx].subfunc_name);
 			free(array);
 		} else {
-			ksft_test_result_skip("%s feature is not avaialable\n",
+			ksft_test_result_skip("%s feature is not available\n",
 					      testlist[idx].subfunc_name);
 		}
 	}
-- 
2.43.0

