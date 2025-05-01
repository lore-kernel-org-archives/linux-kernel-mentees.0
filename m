Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4565E15D5B6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 May 2025 00:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746061054; cv=none; b=hyJNiwMrlvhm8FCs+h2zExGA/SoHZibVHKw/84zvLcdZA6LOQSm5X5swBw2KthitWoq4UxB4oPQiLH1r2w5A8VeY087X6k7DkmJSRsyNa9biKeEbZ5qOMt7jUHerknLX4G3rr2wbagb9JXvpTwgmjDHNwjeZ8/YPD2G+yzf20uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746061054; c=relaxed/simple;
	bh=Isa6ZqIMgXzkI1d4s90yw+F6YIICIspQQc80fkj297M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=fRZ9Z7N4MB20UzvbQVGvGnfFlFPJr/vVBezYDxS+gU5dW9gRUSkS/Jnej+U8yyNV77RhoBVCFsEiudth9pQ85USaCh5IgkOlI0615tZxqazZxSihZNTXkHO+Fl7bQ4U6bU46lCNNjcr+tCIkmfNAneaEVo/OVGwTTzqOL6ylies=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvNeEdHm; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvNeEdHm"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A89FB405D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 May 2025 00:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4sA074L9Q3d for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 May 2025 00:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2DBC4003A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2DBC4003A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VvNeEdHm
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E2DBC4003A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 May 2025 00:57:31 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2241053582dso6549485ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Apr 2025 17:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746061051; x=1746665851; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=seJv2vqR4qDF6T9e0PoV6RNeVYH3HHbim1BZhuGyy2I=;
        b=VvNeEdHm1uAvVp7yMqZB+v+oHUGpo/pz+pQ++usZb27Ql4m9OafQbo0N0jypzGGNFP
         /Tdu+IbSUVdj/MKQEby0sAA/0CCE3RkuY1vna3PrPPpsx6O31LqkeW6Pm1t8ymwJ/VJj
         dERspVcNoFGzlByHzvyH60UlmjnlUrsU68slHlTZEa73ZrVD+XBU7UD3gtaFPXZQysw6
         q8j4rGQkzNSpZRqV2GW1TnybwbT93r3O1uSqOId8hO0mKlu9VVUeOqO5b4UFLnw1X3FD
         +I2tJPKYfLklffYMnm9n/r4KMHXl8rHzDNAcxbJ42ksXvj+pLgQhrSGLkEgqisb5AYwY
         Xvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746061051; x=1746665851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=seJv2vqR4qDF6T9e0PoV6RNeVYH3HHbim1BZhuGyy2I=;
        b=uN1ZvQ/t6Exr7rY+6rnwuMxY5VmjTUjxtpW8Cajp/rfZZgBG913NQTiXCeYvV0u8sP
         qifCbO+Bs6mVZHKicdOQc32zG1FDdD/OhJC9MrCXqZrjvGeuCf96GmH38Q/UGRU3anHe
         mYwV5iwnrq6CKNFeWX16jOxsaZZBkbdEISA8EGie1Du/ZSqSzem86+L9jknmJUNP1ZZz
         q1FKTCdL6YLdw9/lHk8JY0l0lTBtfxIRJk38KjW9qqIza7jiHnD7T8DcaD/qxmUSWb0t
         Qi0yfEb+YcPFLF1yYxmSFw054w8RJvksFD9Fy1Up5PAhI3Jh91KTOkWIHE/0VWK6SUm9
         /ZcA==
X-Forwarded-Encrypted: i=1; AJvYcCW4TXM5vjkGZ754z+bOE9dcppc8mXyJpLbVYT1RewjxXrodQ94/ZRiGGAiZSKe/5iEQkfqTZQkZTJVLedlMWkRWb/lBMA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy3l/lxZDIZ5Z2VqeFKDPNjg2/QXSlYtqNzAwa3lnDWeuBkYrAW
	M29pB3N2lkIzXYmiKXuSo2OdH/c9NPlJ7e3PoUE8N6ERi33GdHre
X-Gm-Gg: ASbGncs7suv0AwYGHDBPFoNw0X3IjvdkiR9fE9OVsp4DlCg+0jGBYZ2aZP2qcFLafYt
	zXZ0aD/LpFMtYoiW4MNfNw18NZZCFzURhDf5mWSb9XCVCTffBxBNx0Q8GTAzUsMNrkORQVvYm/+
	8QcgkCb7uqLg3VzW2EI19OtmjnuL6Okt2zt3UJkVA9DPbkY1hWk96sT5IW3lAM+e1uStLhTfGrX
	Cj0ia/tVwApX09DoNih8vV2pZpHcM1i4cLPninPRLS8SoxxgV9ECF4wifNQcGLNUKwKIlpgqXnE
	rxRoM4Gebbzi+fZ0XkjnbYHKnM3FEw==
X-Google-Smtp-Source: AGHT+IFBmdPTIPgN3stiXEWqdjO3F1B0vxFt9RNvgVez2m4ZbDEUBSt3+9nu16CMhB2dXa4cFwwI1A==
X-Received: by 2002:a17:902:c40f:b0:229:1717:8812 with SMTP id d9443c01a7336-22df56afa5emr69290555ad.0.1746061051130;
        Wed, 30 Apr 2025 17:57:31 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221677sm128447465ad.248.2025.04.30.17.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 17:57:30 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: benno.lossin@proton.me,
	ojeda@kernel.org,
	aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] rust: revocable: clarify invariants in safety documentation
Date: Wed, 30 Apr 2025 21:57:05 -0300
Message-ID: <20250501005726.744027-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarify the safety invariants for `Revocable<T>`, documenting that `data`
is only valid if `is_available` is `true`, and that access requires
holding the RCU read-side lock.

This helps developers understand when it is safe to access the wrapped
data and the role of RCU in ensuring memory safety.

This is part of issue #1160 ("correct safety comments and documentation
in revocable.rs"), reported by Miguel Ojeda and Benno Lossin.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1160
Reported-by: Benno Lossin <benno.lossin@proton.me>
Closes: https://github.com/Rust-for-Linux/linux/issues/1160
Tested-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 1e5a9d25c21b..2da3e9460c07 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -61,6 +61,15 @@
 /// v.revoke();
 /// assert_eq!(add_two(&v), None);
 /// ```
+///
+/// # Invariants
+///
+/// - The wrapped object `data` is valid if and only if `is_available` is `true`.
+/// - Access to `data` must occur only while holding the RCU read-side lock (e.g., via
+///   [`Revocable::try_access`] or [`Revocable::try_access_with_guard`]).
+/// - Once `is_available` is set to `false`, further access to `data` is disallowed,
+///   and the object is dropped either after an RCU grace period (in [`revoke`]),
+///   or immediately (in [`revoke_nosync`]).
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
     is_available: AtomicBool,
-- 
2.49.0

