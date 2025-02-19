Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B82822AE65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 19:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739993617; cv=none; b=EggZK952ln36+2gF7jnyPZDEXMhKaXxkTnw/QP0wJ+gmfbN7Lxde/hrQYqVYpKg0Arfi7YfPiiV/HAjtOH5DZAKnWcwb+iMSnBN7X9one9Z66apWatWGwFPU8RZehOBbP034QUyTkGXXyXOHM0OC60qzGmy0lceRmDQjUvtR+uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739993617; c=relaxed/simple;
	bh=GeZf4kDWRw/Af0VAE8UW473eCeB6nzQJVVunELl0mnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tknwJKHwmLRv8Er6TsD6roaCLF9ywDROnNS/CYM6XqMk7xR+88shBJFwfnNatGOCAx4QffrLrzlkGgse7WvzUwyA85Xc2zvOHFwPOq4RQRgwkSrBH+LiCxaE6EYDk3osJlO+J8Sd5cuWH4vtQpV6gRYD45Ig8paN24YvpbskX54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVmYK2hg; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVmYK2hg"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB356606C1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 19:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhH9ouTGYB9b for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2025 19:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=sumyahoque2012@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14F6C606A6
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14F6C606A6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TVmYK2hg
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 14F6C606A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 19:33:34 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2fa5af6d743so248561a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 11:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739993614; x=1740598414; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSTRBDyjlCXG1A80Pr2C6LuOvywBhiJXPi7qtOpll3M=;
        b=TVmYK2hgf5HELyYJlDJYLK0IR75rjWT/6ljaofK8OMKYDVV8pKhQiK+DBnG6tDpMFP
         wx7UNxwvQ47r329hpyzeM489XEenGiMHXkwA0+Fhr33fDT8nVpsixhOgffUXJ/RVfklP
         h0+M72pudtgaPZuHh+jvOK46JRDrzTfgMIpSkQRGO3fvb19OUYPSk+cbzAgNmmmzUEVn
         sh8QL0zbAXMqdD2H8U3hUlZ0jR5/Eff4gUJVni2//aF/KkhH5xSM3LNdC4klxdnW1bj3
         0BoWgk5nRJTYUeIEARTWq4KswhBEFKWrss3aa4ZHP33NE0dLBE0TNc3woYVLQ6DETwMr
         8Ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739993614; x=1740598414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSTRBDyjlCXG1A80Pr2C6LuOvywBhiJXPi7qtOpll3M=;
        b=Hz2zBU5yZwZWOj/pxZaT5moGthgLIW6aRw7sohF6AM+NnynL6aRTj3fYEiLlqzIMHn
         qBseqhejVvoAVP9XH7humVsYy75XR7e9J/6RtmpiGCLyILTOhoDc2aH/viQh1bi8RQTC
         NlSFJ4U+qURN44gJ/f8J6BNal/gwvj+F0sUsw9Zf3aDwcdxQKBpkLEoumgT/28jzlX1Z
         s3k986rrM0qQWZ6tMsSBWhPifdZTjbaMHEEmDFkc55IcrXJ0G1dFS/plvv9QhYUMsG7R
         OL5rfoNavNnQ5bASUHnxwJ4ipqQ1BvTSNZLf0EeIoa6DH9HgYi8RLu3f4Ye8uYoyVodK
         UsSg==
X-Forwarded-Encrypted: i=1; AJvYcCUREQkF2OTa8nWwX4IFYZ0zN4AjgwHc2vJ2YBIH5ynHhPnbORRP/lqpufk9uGIABdERY8gzn1LxCk1WGaB4pwZ7MTYZdw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz5rzdQHOQFGRBXopW8SUUJEFnsGIqRDlwCGsUTvfH6vQRrcGvj
	6invk3jWO3dZwmycshV5nQD17+vclqEKcJa99clwb6qK3nsjIpmR
X-Gm-Gg: ASbGncs7bopwDWQE1Q0wK3ZaYxtoRJkZ+fKMeRWeKPYu67vKkf1x77yYnFIaFAgQYnR
	8j+ktN3Ksb4JpkuagH+a1wv0EzkCvyRFwJxn5V8LHSjtVgKM4W/WL/ULEkqHLHgJ28Nn59w+c5I
	D1MvwRogYFy2eADBtHqOtXEqfdwFPJm3cxEopBfcn3sXxvF6waAKW804fcmt6VSgsGuuVtlPKn/
	pQC0boPnAVNcVliASHzr2Mv8IxrEOlAjnhWl9pnW8wj10cmSlEvV/0d8ygAcXOw47Iw2Mtj0yFX
	GhnncANEOfVeDq5gzQ/mG4tAeWkOLSkWxs/Xe0Sf35F8FKvIUfaTw+bWsEyEZaAR4rkzF3VbEQ=
	=
X-Google-Smtp-Source: AGHT+IHTgtVoWn3jrKGALRPQNFfpnDcaIG9q9d3lBREc3fWPQIxYttYGlnxyXuJE2rxhVOnFy1zxbA==
X-Received: by 2002:a17:90b:2887:b0:2fa:1a23:c01d with SMTP id 98e67ed59e1d1-2fc40f26600mr26453316a91.21.1739993613788;
        Wed, 19 Feb 2025 11:33:33 -0800 (PST)
Received: from node0.suho-242436.threadtune-pg0.utah.cloudlab.us ([128.110.217.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b3305sm14193282a91.6.2025.02.19.11.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:33:33 -0800 (PST)
From: Sumya Hoque <sumyahoque2012@gmail.com>
To: skhan@linuxfoundation.org
Cc: Sumya Hoque <sumyahoque2012@gmail.com>,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	linux-fsdevel@vger.kernel.org,
	kees@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] selftests:sysctl:Fix minor typos in sysctl test
Date: Wed, 19 Feb 2025 19:33:01 +0000
Message-Id: <20250219193301.46563-1-sumyahoque2012@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202502190912.CA03B56796@keescook>
References: <202502190912.CA03B56796@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
---
 tools/testing/selftests/sysctl/sysctl.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
index 84472b436c07..323468653327 100755
--- a/tools/testing/selftests/sysctl/sysctl.sh
+++ b/tools/testing/selftests/sysctl/sysctl.sh
@@ -891,11 +891,11 @@ usage()
 	echo "    -l      List all test ID list"
 	echo " -h|--help  Help"
 	echo
-	echo "If an error every occurs execution will immediately terminate."
+	echo "If an error ever occurs execution will immediately terminate."
 	echo "If you are adding a new test try using -w <test-ID> first to"
 	echo "make sure the test passes a series of tests."
 	echo
-	echo Example uses:
+	echo Example usage:
 	echo
 	echo "$TEST_NAME.sh            -- executes all tests"
 	echo "$TEST_NAME.sh -t 0002    -- Executes test ID 0002 number of times is recomended"
-- 
2.34.1

