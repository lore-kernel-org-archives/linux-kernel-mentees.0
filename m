Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3DE2DCBF0
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 01:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747965271; cv=none; b=SLSCgTm3NPzYb/qMLpmTjNPh6gNZvwVLmr6cW8iPBn1Cty4k9IOA0Tflzbc37ETyh90zOVZ5EOaI2His4ZamH12Va5X+xAVeHeC7xczcjd6KYTVs36lK9BTtRG7z/Z4b4T+rDKhNRG9EokfJ1Of4g9wE2Uz72j3G/Dunzh/l2bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747965271; c=relaxed/simple;
	bh=yHNn1kpmygwg53ZHi34KtfiW/yfFROg8GODehdXTALE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QNDwIwuTD7ngxkOOWHV/xeKifHyKYtilRvI3SvM26c2nkQjeZ8Dpzxv8xJG3SVM7ca4LOPBOTTTHBgw+dbajZVg6+T/QlutoQE8wlnXOkBs1AUO+yY199eT5t8dwaIzBMzXB/VJl/NE66URWFCsJghTO8SlJNHT06iUkWqaNY04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bs6KNwB/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bs6KNwB/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a361c8a830so1103232f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 18:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747965268; x=1748570068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79V167OlWoOMjxF5WYVMw8k6BQD80P80B7UPNjk48/Q=;
        b=Bs6KNwB/jZ4bfCjO6EwQv44soJSA5ZpRxYNxpB5vHhLTaGztEpch0fVoKUw63agn/7
         RWhB19H14ty+DLTpU5UGrg7tS+WwI5wMx48nDYdSKCMXhOIFKlQpXJ95hRdFUvsi2gYz
         osHsi3AdDG4i3Rx/8iGuhQl7W+/G7SQl/zdCB36PErTc2GA1gP1cP7SW/SCAHdXvbPRQ
         Az9LbXLjZngnMvHpaOggCQ0p5CYe8Od/c2pE7kMs5L60A66em4pdx6PAATkfh0KJ6AD6
         85z7f6k547k+G7GAD8UOMRNMrCmJoAaWdGzYqzlSQay4AwCEJGNsyLIiQYClr7KX+sOy
         qEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747965268; x=1748570068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79V167OlWoOMjxF5WYVMw8k6BQD80P80B7UPNjk48/Q=;
        b=OfZYpA2r12Ajz4VaXbXmlgxodWQMBl6aHOoD2/DrU7omqZoNwJNFbQYlFEvCvx1xT7
         Xhth4OP6vviYTrq8uvKEXauInrXqGc7PkjB2BdTvrLfkdI4qIjaZO37VUMgv3PAdi3L8
         yXShVycMLk6CuQnJmX3m60mX+zg/Iu0fhMEGlko26l6oIhQGcgYYgq0dUkeVrSF/qUYm
         PIuuxWR6EzUq5cb1V2MxkYMsF5iGAwjq5ulLqvRpyW9DYVRj4xNZHJKAqVJ8OH+270gD
         HcHL9SXknzzmXkfHYp0I6TcuhJFdtXJVvhpxDu6hrn/9Dxk3mmhCdKZkKqvclk0Zfb3G
         U23w==
X-Forwarded-Encrypted: i=1; AJvYcCVn3TG73mpLCwicb1SR0lpTejPM++YzAlO30GgqsK7OmotztoCpkwFnE9YiSbBilEY1gQ/yetfEeEwmdFPqjpPbf/HZag==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNNr11uUSYP8xzIxNszVOpWKH7SEnO2cLUU5v/GaLmIS0QTk0U
	t9CoEHyIDKRByDH3TLwwf8Ey+VNu9tgTDxWOspn1QNwCM6XK9k0KUDK+
X-Gm-Gg: ASbGncssoWsffHBcJD6uzHJnrBWrH8bPar0gFsjAvDJRQ08Z3xJnWN3Y2Y8YKFIe2Hk
	9BCbMBCshH3l+h4APZ407wmT4e3kEpjRKBaiR+s0cY63nH59J1HOU+wtn3dCIJ4ZjXW6q6Uud0/
	Tpv4+2z9UUQrgpcmzOWh/gKLVa0PK60y5V6dDx6Te7vaECJG/GfSGDKExmNLBOY6xknI4Unt+xz
	mZvjnA9FHJzm1+WrQ/iFgvgNW0cENe+mK5J2bRiJ1NfuKK65UwMcCrxheeEOtkQnC7gQbvmgibB
	T+39W87fhagdDfcRl+IdmxdWEqLT6dhiGiQjyLvhRNFCkjdS+egVqxbmTKy8bs8yWqZ/YNDNy0l
	LOHlN82UgQw==
X-Google-Smtp-Source: AGHT+IGP/OcQmZ+8Rez1eXPN6RCO//j5OyG61fsbXNCAyeBF66j+q2Pl5U4WUL+7/oxCe6xrEteKQA==
X-Received: by 2002:a05:600c:350c:b0:442:e0e0:24d with SMTP id 5b1f17b1804b1-44b8cc9bf92mr1760595e9.7.1747965268035;
        Thu, 22 May 2025 18:54:28 -0700 (PDT)
Received: from localhost.localdomain ([156.208.37.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef032esm130309995e9.9.2025.05.22.18.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 18:54:27 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: shuah@kernel.org,
	skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2] selftests: acct: fix grammar and clarify output messages - Fixed email case mismatch in Signed-off-by
Date: Fri, 23 May 2025 04:54:01 +0300
Message-Id: <20250523015401.9712-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch improves the clarity and grammar of output messages in the acct()
selftest. Minor changes were made to user-facing strings and comments to make
them easier to understand and more consistent with the kselftest style.

Changes include:
- Fixing grammar in printed messages and comments.
- Rewording error and success outputs for clarity and professionalism.
- Making the "root check" message more direct.

These updates improve readability without affecting test logic or behavior.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 tools/testing/selftests/acct/acct_syscall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/acct/acct_syscall.c b/tools/testing/selftests/acct/acct_syscall.c
index 87c044fb9293..2c120a527574 100644
--- a/tools/testing/selftests/acct/acct_syscall.c
+++ b/tools/testing/selftests/acct/acct_syscall.c
@@ -22,9 +22,9 @@ int main(void)
 	ksft_print_header();
 	ksft_set_plan(1);
 
-	// Check if test is run a root
+	// Check if test is run as root
 	if (geteuid()) {
-		ksft_exit_skip("This test needs root to run!\n");
+		ksft_exit_skip("This test must be run as root!\n");
 		return 1;
 	}
 
@@ -52,7 +52,7 @@ int main(void)
 	child_pid = fork();
 
 	if (child_pid < 0) {
-		ksft_test_result_error("Creating a child process to log failed\n");
+		ksft_test_result_error("Failed to create child process for logging\n");
 		acct(NULL);
 		return 1;
 	} else if (child_pid > 0) {
-- 
2.25.1

