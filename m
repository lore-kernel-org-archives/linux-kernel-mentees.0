Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618EA1AC42B
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Feb 2025 04:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739939778; cv=none; b=vGGmff8KnbSy7KrtMFOiqsOaz9q11NPwkj37JrbGQGl4om6AIbLKCZZcNLFfWyuzKp4sFwu2S+HBHjB+IlCCV2saLAoWcVjHm6cEQanFWP6BeTOViajWr67ioEigtrKEk6vkaRVhXIwsyhMqp4ai2cZGFFwE0f8jbYZsM/27Ly8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739939778; c=relaxed/simple;
	bh=N6t3dNDMECWgfwL5eXsEUs3zUEE/sHurv4seDvxqeLs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rkthlSOByoVUAFmdyjQWl+bdVMCA6HvFYN+o0VJnMs5XmgK0hlYdw1H/5PUkpeL3yVQe+eDl337oSfnTdG5/+jI8JT6I8OHnzo59iTrU1KaHJEwVgB2/F/PFyOyQAeO+0bo3wtwLsJbDKsl7ItDs8RCqTl5Wf0NZPsD3+cpH5t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/AbBdBG; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/AbBdBG"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-471dc19a6acso37939791cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 20:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739939776; x=1740544576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wxHA5MSEJJbIadhKe+0jUlM+MLWwvru75FvGSxIAHsQ=;
        b=C/AbBdBGIdT3q1sXTlF+CHJpUi431W/0ct64kM+y50oBoyJXdb2ItbS4yFgGPhdIx2
         SFy6WXmx4sl6EcKlcOyhOY3Ytc3tx9tkfh/mmjC5eFg3EIN/Yg2eN+1H0b38zwQP838A
         qvLK7a1ngukTz/kwDKQ9WvxhFM6yjiH876Y2RYa24mrmUyHck/lrkvSL86IT65bQsClF
         w2RvunYfKcj7jKN67bW707OuYm/K54ro8FBg64XmFvMoA2+0iAU91vFUSvlUCufQEwfr
         UOc5m8rKmn+rxQrmuEhap8nxTs3tCkdxj4XGJ6KHfC9Q8ZRCZR7Q8hpIU61L0JPZR35R
         p+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739939776; x=1740544576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxHA5MSEJJbIadhKe+0jUlM+MLWwvru75FvGSxIAHsQ=;
        b=Yuwm+5eXL+5p6PZ1z2opF6AMxqyu+OgGeHBTgvwihYSpr/IBKIqneX1mbjjctcUl53
         QQJZDZQ/P5QMpqe/vXPrE8WbB9DA8AV/EF0sgoH+GH1spDjX5mNqU8uMcSRCnTKwKTID
         sVxJVc+5LJiHSlDeMwnq+KkGwVi/ImBgHl59HkRWLaYTzyC8bHD7kHderEoJGXns/tfd
         fW68lPxogHMnH2vX1CZgOMYHLy0B7f2y3BOUfE3Yz2Z4SAfxzlr9DnndgQ6lHOY6rS3P
         wDMJ1V/Wdm+QLSefPIYfAFznyODy9QJ2p2+GEYrrsbKd5kGQHdBfGkBzUSIvqpjEpqTH
         HjNg==
X-Forwarded-Encrypted: i=1; AJvYcCUoP6pjQ8QI0awcSeuk47fYjE8tmMcuHcB/Vt4DTfFMJTwqLW5M2NAWT1K3AGDV//L+WRhtEUsQ7pUS377CuFd4NXN+vw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXipcUbfIYZpcdv/O7DKQXc1mAByxxzqCUy8/CvEEzNEaAg0wg
	AdIVbYcRKWUaotmLcXb2+/YbPmCNRKN03+UHMRzG+oTLnr+rE6IP
X-Gm-Gg: ASbGncsc3S7CBaRLR+DkiWGtvoZ97ZeMwqsQC6lKIJPS9UdQ+gjOEvvN1ltW1qaHsPz
	7PhL3ZTLzONpukIDJOGso8oZ4BijuaS08KTuq1h5+NG92wW7JXvZD6whtONB+pgWqCwH72mrnS4
	9xuFjxeojDJvnoPmzR1hi+r3P0inbRjvjvFejx9DsYeq1d952WG1Gur4ubakIrPFROR/VmoWM0H
	hjL5cf4pg1gWtlhuhLnLG/I7RbYFRrY1ukke1VkKR35Si62rpRaZ2H3hp9J4UFi6PKtrR9N9eR+
	45ZPBQFuT8YjF7mU4Keo1vclHETbN7IhZhZGhHbB77t9zczN9CXcA1nJFF9zVazs6bzupJM+QiC
	8296EFmgUOulzzl7EsQg/ypShIwxS2+QElL8=
X-Google-Smtp-Source: AGHT+IGXwSt2WZVIp7C3EFgkHYoFKJJZ/Tw+F2jXGT4/OkPTvJNwR1rSKtmtsKun1Y4gVglpNRaxag==
X-Received: by 2002:a05:622a:5c8c:b0:472:31:851 with SMTP id d75a77b69052e-47200310b42mr68275561cf.22.1739939776306;
        Tue, 18 Feb 2025 20:36:16 -0800 (PST)
Received: from SystemsProgramming.mynetworksettings.com (pool-100-1-71-214.nwrknj.fios.verizon.net. [100.1.71.214])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47202706a5esm13876201cf.61.2025.02.18.20.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 20:36:15 -0800 (PST)
From: Brian Ochoa <brianeochoa@gmail.com>
To: skhan@linuxfoundation.org
Cc: Brian Ochoa <brianeochoa@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: firmware: Improve readability in fallback mechanism message
Date: Tue, 18 Feb 2025 23:35:41 -0500
Message-Id: <20250219043541.122924-1-brianeochoa@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds commas to clarify sentence structure:
- "To confirm look for" --> "To confirm, look for"
- "If you do remove this file" --> "If you do, remove this file"

Signed-off-by: Brian Ochoa <brianeochoa@gmail.com>
---
 tools/testing/selftests/firmware/fw_fallback.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/firmware/fw_fallback.sh b/tools/testing/selftests/firmware/fw_fallback.sh
index 70d18be46af5..cd1ff88feb28 100755
--- a/tools/testing/selftests/firmware/fw_fallback.sh
+++ b/tools/testing/selftests/firmware/fw_fallback.sh
@@ -173,13 +173,13 @@ test_syfs_timeout()
 		echo ""
 		echo "This might be a distribution udev rule setup by your distribution"
 		echo "to immediately cancel all fallback requests, this must be"
-		echo "removed before running these tests. To confirm look for"
+		echo "removed before running these tests. To confirm, look for"
 		echo "a firmware rule like /lib/udev/rules.d/50-firmware.rules"
 		echo "and see if you have something like this:"
 		echo ""
 		echo "SUBSYSTEM==\"firmware\", ACTION==\"add\", ATTR{loading}=\"-1\""
 		echo ""
-		echo "If you do remove this file or comment out this line before"
+		echo "If you do, remove this file or comment out this line before"
 		echo "proceeding with these tests."
 		exit 1
 	fi
-- 
2.34.1

