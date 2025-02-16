Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F394C80
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 16 Feb 2025 06:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739685728; cv=none; b=Hnqz+GlYrs0aKFilHNkU8xqqB2BVwolwbA8EoKI9XedgdU85cCzmtzM4IZ/L6Zxa/3QS8qJRzkykBGfQTVrd7vbSJoMn9JTj9r/gfR30yTpM0wVlMKe0q4Seuh9Gf61K6LBHyjaujhDOyAVpKbJRl1Ws3v0xASjmCGqZzk+B0NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739685728; c=relaxed/simple;
	bh=hcjsDuh0U0A8LjyDBKt+IPLeJ4woUgRCjbuicyVm1UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZVQXfHTbSUyo1kshYBG8KQ8n/SfbSSKGxYOH6CitzZB0/Ooryp26FjaaRWGprW73DoG2PgCjSpq6BaUpw5291ryubs1XZWS+TFPU/ptPsRh29s47FF/vQwBUW1jp2KZOm4i26rqsiXioZu8ITXKaMTht4DSvkIo8LWR3A74MHaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbYH/b63; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbYH/b63"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220e83d65e5so47343445ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Feb 2025 22:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739685726; x=1740290526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JA+U6KzuA4UAyNmQvUy/BMVw1zu+iaGbuv6srT8ddec=;
        b=WbYH/b63vXJG2wXjOsau9nGZnia4xHJHy2orIkZRfuZIxrvwghxnF9FRKfYjob9VoP
         w6vFzujirTIk7JS5CLP2qZs3C6IKAr2D5p+Ppvu60E/pzZgavVLNmSu7hTiehsH4KvYV
         WVMhOtkPIRyjxpU6YNCDz3mJIM3bdwXdI+1nw0HbM/6e97RKCzIW3UpQW9+Dz2eJ6xgI
         PCi7C9xK/YRqatZysKr0eJN1uQA/0DqKvehZw/lGdwmI0jIjILPMkIc9MStqB8q+8iRU
         nPVXB1cLwAsZwlM6qUXTFPsQvButMABXGBxwtwZbsmAfJw/yobu4Nuam4LMxhug9DUCz
         9HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739685726; x=1740290526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JA+U6KzuA4UAyNmQvUy/BMVw1zu+iaGbuv6srT8ddec=;
        b=W5oFw4Osxb8+B9ruw94M7rtd2LmfAQR+ydpYGOtsm+VDZO3O5JfbtBoi7zrhI09m/U
         AfYF0fQ2ge68Y1aHZwAxsdqLTPmU8T1P9P06UoFYM/jLgMoizqr/Bl62LogJpkCrfoCy
         t7smwtk+2A+DaIMjFsFxVTlU59LjUtX2QUXL8i1z8Nepr09hxx1NLDAaTElI+LYmPI0s
         wmGc2kzjr2eoIEXTV2MTZSN16+D6JJgOIlpTN7yNGqsJqsaZ1lzcUAQCPvlBHiJzmtgN
         5AAeCxnPbzoQw3vZ0D6f0khqbiupzpWRveplRZjo+I+NNFIIUi9m/KEP9fSPBOzSyz+5
         MhQw==
X-Forwarded-Encrypted: i=1; AJvYcCXZz1wjCHGiA5F730niqv4yb/71EfZCRRnFbtaoDbrxC9FJlFGdB5jx25ArHe5iTTwZWe8iRfQeYF56q8x2oobwdK8nsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqMoeDuhcwOa88OsXCB7C0gP0FDMWVq4BSQZZSOiCPDW5awRle
	YDSnGNoMUt6DycReoAh4AZuUufHqkcxo9L7/hDB5hXrw0IKhz5cK2nqwxzCUfCo=
X-Gm-Gg: ASbGncuDE1Tz8NdPXidqMKktsIi4zEifVeC2mComxd7aWsj8yZWShhLArgGoJ7gXNaK
	dbpoMJrSeBMTcSZfZ0G/muzWsW3z8utk7GkN3GEiG7BXsvQggkuSSFAaDcIfzBXfkAwp3lJi0ng
	vxvFim7tfx2WQIgeBvhBoihytrLCw+7YM41n9yAtChlejMLcHxhRRNqq6jJ36od22G/d4s5V90u
	PrUPfsl0ZTyFIaNhke8v/Z+KfAsjlYuixoIWwBHB0CvdcfPtKrC44h+/j6u2Q8VsnsmxgY54THp
	V3907YXuPR0TVdHrIzcEG0l1Vb0Vd26cp9zF
X-Google-Smtp-Source: AGHT+IGIDroiUkEpw9xnnB1kjya0EMZMRrdA5yFJN+D8WymGzRmQMIbAasD1j9eMc0l0BDSKJxHuOQ==
X-Received: by 2002:a05:6a21:6b04:b0:1ee:68d5:3be4 with SMTP id adf61e73a8af0-1ee8cbd2ab5mr8274726637.42.1739685726335;
        Sat, 15 Feb 2025 22:02:06 -0800 (PST)
Received: from localhost.localdomain ([14.139.69.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73268821c54sm1934173b3a.146.2025.02.15.22.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 22:02:05 -0800 (PST)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: kees@kernel.org
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	joel.granados@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] selftests/sysctl: fix wording of help messages
Date: Sun, 16 Feb 2025 11:31:50 +0530
Message-ID: <20250216060151.6155-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix paramter -> parameter, and recomended ->
recommended in sysctl.sh's help messages.

Also correct grammar: "number amount of times
is recommended" etc -> "the recommended number of
times".

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 tools/testing/selftests/sysctl/sysctl.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
index 84472b436c07..a8e5736e89a8 100755
--- a/tools/testing/selftests/sysctl/sysctl.sh
+++ b/tools/testing/selftests/sysctl/sysctl.sh
@@ -764,7 +764,7 @@ sysctl_test_0007()
 	fi
 
 	if [ ! -f /proc/cmdline ]; then
-		echo -e "SKIPPING\nThere is no /proc/cmdline to check for paramter"
+		echo -e "SKIPPING\nThere is no /proc/cmdline to check for parameter"
 		return $ksft_skip
 	fi
 
@@ -884,7 +884,7 @@ usage()
 	echo "Valid tests: 0001-$MAX_TEST"
 	echo ""
 	echo "    all     Runs all tests (default)"
-	echo "    -t      Run test ID the number amount of times is recommended"
+	echo "    -t      Run test ID the recommended number of times"
 	echo "    -w      Watch test ID run until it runs into an error"
 	echo "    -c      Run test ID once"
 	echo "    -s      Run test ID x test-count number of times"
@@ -898,7 +898,7 @@ usage()
 	echo Example uses:
 	echo
 	echo "$TEST_NAME.sh            -- executes all tests"
-	echo "$TEST_NAME.sh -t 0002    -- Executes test ID 0002 number of times is recomended"
+	echo "$TEST_NAME.sh -t 0002    -- Executes test ID 0002 the recommended number of times"
 	echo "$TEST_NAME.sh -w 0002    -- Watch test ID 0002 run until an error occurs"
 	echo "$TEST_NAME.sh -s 0002    -- Run test ID 0002 once"
 	echo "$TEST_NAME.sh -c 0002 3  -- Run test ID 0002 three times"
-- 
2.48.1

