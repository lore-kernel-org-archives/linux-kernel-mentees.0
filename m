Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2375F32C32A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707194; cv=none; b=htWWskLKsQgcLE2qrWN5J/Gp1Mu5G7Yy84Jk0TV5nwKhKLsbOUNBls4KfHL6aNdRTVnRLCr9NWxBMR0wjSeflBTaoQhiRGWzhyLd3pgmOjUMi+JGzjMSuAbCaOn5vjdWmcUB+ylU+cDOfsSqg7qc3TstZ2FazkIWlAu5Bhuhvek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707194; c=relaxed/simple;
	bh=8oPIqiG4ntZOWMYINRbk9WB/ipFpfqMstSUkt6wUX+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ik6M3vKCzNuYem2KI6ZFEAxYgc2wIcqjZoCBW8UNYrgcM34Z4Pz5ZcifAAo5u40hvU3FCU7xOVjgxNA70v5UFecGB6aaXzmkwZWi14YH8BcMxrdugebXUzvspJIx5sQIcTYy3kM41oRd1QRMh2Fq+FMmztA4ZLD+DF5+vO/N2lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnW9MOLr; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnW9MOLr"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8A8482016
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 16:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yH2JzXE1zXX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Aug 2025 16:26:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF39881AAB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF39881AAB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YnW9MOLr
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BF39881AAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 16:26:30 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-76e2eb09041so109276b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 09:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755707190; x=1756311990; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1JlCSqIpeuA9FbNX9xQCGajhN6Uvq3tUKfZpcELoMQw=;
        b=YnW9MOLrVKIH2ELIPReghDYQ7LpsvKoC1e4F8Cdb9hKx9uEevUGWg6T8JJ0pFlKKK3
         PxGV6hfKbUoD1uZ85GmwyKiCC3kkAWWiogPIa1Y5zDWN+Xgwfk7d6lliIvqcmzxwGegH
         0qJm9HvjNA3JbStJnBS2Kz96TBOqZQ+Ypmjc2tayLtMZuJtpOgt29n1eCH+tn8w5QT4R
         1NzFzfdpzFaB0IWPHDyVEqVh/lmi0boUN1diNGVHJDFTuaSlMKH2wieEuaz+I8ouoi+3
         6+vllp+JHHioFa9qHHfH/aBkiHpnCq0WhianDB5uzhbYVPqvLZ4wUbE79ymhxhqxo6dv
         Qd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755707190; x=1756311990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JlCSqIpeuA9FbNX9xQCGajhN6Uvq3tUKfZpcELoMQw=;
        b=ebe+Z/+p0Y5pu+ybqmVrfqID2TSeaFf/uy+nc7ykVBfgrH88qKg8ItoFnGJDwHpskq
         OiL+wUXq538S6Z/KAZFRusd5jxOIShvreXaMBrB1Q2lnAOar9B/XJWdE7HTgmfH3frnz
         icuTH0UW8V03jHNCrBQgt1AHMQ0Y5dtLLk8XcrAbdXo+lZSqoSNdvNODnniJoJg/Zk6t
         zKvrup6vkg3sBgamev9war7m0qJpn38W0kOKIzDqwVj+CwVZyaNg58Sq1/SapvmjtzJ1
         Fk+LNXBQiFD+G7rNy7ilV1aLEGbEMaUA5aPdw4cGfo66TEgZRfu1gWeOfMg45xQ69yQC
         rhQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSwiiWpMvaXHKU5ud698/7nZ/5R4//pkg62Xl/qMRC8tX4fTgXlPybDS7vznm+QdZigfGwrgVYxWniLjkYO1i3xT8GWw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzulBTNhJJGMTZGABGqrc9+BCC0BuyJL3ngFASUluBEdS/cvf75
	IOPL6DYXbxqRqbiWhSuIcDQylidF5DWZAQO1nRDYHVIouyH2do58/DY3
X-Gm-Gg: ASbGnctr/x3I2/2WwFNsPiAG+qkq7WW6vBfoL5ultdmupGrPW+bsU4OHxpKUUsUcdoC
	jYON3+ZtSBUoJjx4tszIdrGAgPB+mky2+dHtmN+VNT6+syte40RMBXYKVDfLOpVWFDUZ1FAXor+
	ozLgkHcaydjfXvjRQvg2Bq0JCdK5km16UGFW3Z3r+ySWQDiW4ToIO68FSY5JvbbtP68RmH04hbL
	PyACTmwfcX3LvsoVcA1wjlNY9PiSNKU8GdSnc8Si2VFyV9y4+A7TJqkqmcyX8hHuu+obd40h/7p
	nR1uImv++8UlVGD0+s3TIoaH/0hMwxOdZCS6WQbmLEaxjIc4jKpMJ8e80S4dSfDZ9hgdQiBgTXk
	QpM+CHUVrHD1yxWMz/QG2ctN2Vh0=
X-Google-Smtp-Source: AGHT+IHlSK8Vw8sNsci9qKa77jTzlUH61at+9I/+QWwGNiiFlEw1sPTVzQmBmtVcMiFGNtbk3AKwlg==
X-Received: by 2002:a05:6a20:7f8a:b0:243:755:58b4 with SMTP id adf61e73a8af0-2431ba780bdmr5131502637.53.1755707189673;
        Wed, 20 Aug 2025 09:26:29 -0700 (PDT)
Received: from lkmp.. ([49.37.163.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm5849297b3a.29.2025.08.20.09.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:26:29 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	ardb@kernel.org,
	ebiggers@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	rakuram.e96@gmail.com
Subject: [PATCH] Documentation/staging: Fix typo and incorrect citation in crc32.rst
Date: Wed, 20 Aug 2025 21:56:13 +0530
Message-ID: <20250820162615.6942-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In Documentation/staging/crc32.rst, below errors have been corrected:

1. Line 37: from "to being" to "to bring"

2. Line 119:  Incorrect citation date:
   It must be August 1988 instead of August 1998

Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---
 Documentation/staging/crc32.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/staging/crc32.rst b/Documentation/staging/crc32.rst
index 7542220967cb..64f3dd430a6c 100644
--- a/Documentation/staging/crc32.rst
+++ b/Documentation/staging/crc32.rst
@@ -34,7 +34,7 @@ do it in the right order, matching the endianness.
 Just like with ordinary division, you proceed one digit (bit) at a time.
 Each step of the division you take one more digit (bit) of the dividend
 and append it to the current remainder.  Then you figure out the
-appropriate multiple of the divisor to subtract to being the remainder
+appropriate multiple of the divisor to subtract to bring the remainder
 back into range.  In binary, this is easy - it has to be either 0 or 1,
 and to make the XOR cancel, it's just a copy of bit 32 of the remainder.
 
@@ -116,7 +116,7 @@ for any fractional bytes at the end.
 To reduce the number of conditional branches, software commonly uses
 the byte-at-a-time table method, popularized by Dilip V. Sarwate,
 "Computation of Cyclic Redundancy Checks via Table Look-Up", Comm. ACM
-v.31 no.8 (August 1998) p. 1008-1013.
+v.31 no.8 (August 1988) p. 1008-1013.
 
 Here, rather than just shifting one bit of the remainder to decide
 in the correct multiple to subtract, we can shift a byte at a time.
-- 
2.43.0

