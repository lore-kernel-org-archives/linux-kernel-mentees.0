Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27B555E53
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720429625; cv=none; b=VbJ154dd8exodsUVruSb+g+nVYOCcVaIXNDSJu9FfDlJaOVevBXa8RThfihZgmYVRJdU+1EDVWidjDtUTZsZs645SHs/CJ6xgEWE+/5fmN7qMIOvV955lTgN/VwVtdAxOSLZfIRw4A1oGNvYLPTA/qUpDB77m/NqPo8qjy1w+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720429625; c=relaxed/simple;
	bh=mV1LipK/FuGq7j+gzyLCLNXhEfHp8ZALbfN4s0sw87w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oo5mpgUlDrA6nBFNbeFpejJCZibY+7Lc2mRsDtb56YIImJpTYTF3mNGdxURFaqDEK9vJ3VeIu1NIyhsdq/yOwBjDHXQhCntjpHsVkmFECIEw4CSRvsIyMSWJ30/1WLEa0SVgu/CBVk+aAahb0y7vxdByn55Cr4iZojsDIXSye+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkjOVoBp; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkjOVoBp"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CBC460697
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 09:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwZQYNIlOMVL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jul 2024 09:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=andrewjballance@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAD5060627
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAD5060627
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZkjOVoBp
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CAD5060627
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 09:07:01 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3d9318a005eso277085b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 08 Jul 2024 02:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720429620; x=1721034420; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sszcVanAVKdYYqxBnbm3QO7r8vp/tfxRsbR3NwzhhxM=;
        b=ZkjOVoBpA6wAHVPMSFeBdKtG9+o63PgF5IeNeN53/SG7T3UDGPrEMQUxLqPuRsT3oc
         Gr5k4I/Gy/81VG6LskR5twyc5t4VAqZwy5Wf+NyXJxy2h+zCRCAdLl57Kh6nwtncUQzc
         /ARjr6TlOaTVpwn+64uGL4Vxj0yqjUVqPMS/s0aGUdIr8JTPz/wIBJ3PEYAN3iityUTv
         HQ4y0MIjGP3uWj0AW8d4gJ+2z7uZNXxkMyH8RFTgkVPByF1W2aBUQaTmf83E8q/MyZbh
         wQU+3bncnc6CsgKzRMcoIlxsLxcHRRlQdExaLeuB6GHSSwqxBOvu3zaD91R+wQbwhLTz
         f3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720429620; x=1721034420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sszcVanAVKdYYqxBnbm3QO7r8vp/tfxRsbR3NwzhhxM=;
        b=tFyPCCdNsDj7CgO0uvs4Mkh+liBcKhKJusTvXuSMN/BbASD5d7OuTUJoXboZjIr8b3
         79JfG2JbY2w+N/SAJrsXlk57xLJfQ94XTUyCOh+tE4oQplFeG9+AgG3I3cC70BqdRHvb
         C/s/lC4txVS/69r6ulI7okDA0nJUUNgiwR8/bR60/ytNF5e6Kcj7yTv+buySbrIvTFM/
         Ptk36obHa1HiHKjrDbo372Wj3tqGG54TOP5bR8d5yLMy29nipR0x1ZkBHqnKMF7DHVSg
         kcWUi8qJ44SGPpFrzRhvlsshL7i6yjAVCcJnerdv9lg5nED6h+ykvz/FcKQPW2L6gNi+
         GOFg==
X-Gm-Message-State: AOJu0Ywftvrb7W9PGb8hEFz9Au4ckftqX0FNnJ3yOqS9HvJvFIFKkcN6
	FrGgAIME6punv3H/VWE0lHIP2YoVskLciLiLiIthRvnZ2lbhMgua
X-Google-Smtp-Source: AGHT+IGCkR3C+3ZBC987fOhuAC48dnbIyUz8o1kUcoAFt73gHT0rqnuvtcV3On4BM4WUJy/9+DhKuQ==
X-Received: by 2002:a05:6808:120d:b0:3d2:1cca:77ad with SMTP id 5614622812f47-3d914c62a65mr14638845b6e.13.1720429620393;
        Mon, 08 Jul 2024 02:07:00 -0700 (PDT)
Received: from my-computer.lan (c-98-39-68-68.hsd1.tx.comcast.net. [98.39.68.68])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-3d62fa4164csm3720563b6e.46.2024.07.08.02.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 02:07:00 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	mcgrof@kernel.org,
	russ.weight@linux.dev,
	dakr@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	Andrew Ballance <andrewjballance@gmail.com>
Subject: [PATCH] rust: firmware: fix invalid rustdoc link
Date: Mon,  8 Jul 2024 04:06:15 -0500
Message-ID: <20240708090615.2267476-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rustdoc generates a link to a nonexistent file because of a extra quote

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/firmware.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 386c8fb44785..763d7cbefab5 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -2,7 +2,7 @@
 
 //! Firmware abstraction
 //!
-//! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h")
+//! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h)
 
 use crate::{bindings, device::Device, error::Error, error::Result, str::CStr};
 use core::ptr::NonNull;
-- 
2.45.2

