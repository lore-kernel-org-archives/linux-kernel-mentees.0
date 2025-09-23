Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32B823A984
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Sep 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638976; cv=none; b=FrbUlPqzIpWsWzayh/JenfJvU+i5mjDtuMPsIw1rfMWWZTAafBLA3QP87PWY+zxzRVSBP6ieQDsKfv9ufG5hNaHU6B3pdEmtC7AZebvwzHz8W0ottFnORpq4fdTLVgrT4VW93O0Vqka/DfXHk3xlDkN+DoFQ10jbaB/dfICrjbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638976; c=relaxed/simple;
	bh=sLM1xctq1sZCetv1t/FXrLccMl5BHb26sBKtCXVwXcY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mDSANSRWrIdUpie3jPlW1XF1SzW3HzbuNOEnrQTpUxky9yGS6dRJSKUv9qXfxanTkrfbh8iYvpoXw7XSWyCJnvguQkw6jzzon7vErwtbDyFcOnDbQVq4rhcFVL9C2blKdMyR6QJ0mCKOlpBvlT02Un8FRQFxhTcT/jimK2yAAK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRZ6G2Ub; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRZ6G2Ub"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3324fdfd54cso2553063a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Sep 2025 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758638974; x=1759243774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp7+9xFuqi62hdNhf2W1lvuRdA3Rtjn+hEtiwRUgEms=;
        b=VRZ6G2UbOrVTQ4RUeiufvFO9+0/NatoAbf1kK4LOd/ODqMv0klET4BRCSyGpRANnkz
         Fe2AUmGjS4mz31HV2WkKoNmFhJl6wGB3U+VQthui82tcslpKfXkRgnvqzp+yb8KsaF23
         GciJt4yo/RGit7vPozp0K8JQJpyuEVDF/jNpl+c6/kcoOVEA9T1/IsTPvMD8/FuAxozc
         fw+7AIL/m8wuvTC5d8BYu8otlDw5lnJ+iCWnoABW9xlt9+kkzEM+HBkzOz13WcGKjng6
         HhiGnOsy8wPlby3UqqYV7Rnz1U+qKNS4Ai3G/pNsFttxI2fFYaE1jzR2ia6B0whPeYMq
         V8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638974; x=1759243774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xp7+9xFuqi62hdNhf2W1lvuRdA3Rtjn+hEtiwRUgEms=;
        b=r89o41AUiUFKhxjL9ibjDWPPFhoHpnGB80HiIhppeL2BB2+fLgm85z3IkEpymPtRBv
         iOK0M7SDzW1E/HPLvQ+rFuvlSCxZ2jSi+/SvNdZsJ5dTgKQB49IbSrJAm0Izcc8GOo3Y
         M60K65eDWCKWMgPHoz0v3bHExUdLk6Q721nrBDxADpAELcVcD2jE4ZBeoid6+8RMKgPU
         BaSFPvh2xvlJPn+Cq6GZAcQQfwQC0F8CmjOkV4QWrDo7wGCcs9bLtSUBiMN3GmP3iwzv
         wdgYD5P6/HNZVfCrKtcgrRxWVLbuptKBy7nz/ky6/3SEKk9D7x+LGuOO40Yq4eHJyNFS
         DrmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf1Ftr921WZl50TBqVV+c8mALEn3zk8JG+DckcB8dMVN4vHhwmXSLG0IyvMtrNp5sUyn5Kbeox2KeXUExjrS6T27Hl0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YySQDqlClvV6gfdpONrrayrt36gWW3Ogyiw8MGPvKXtrYAqfm8+
	CTXRXxQ511r1Mmfm3//AFaIghJ5DN8OkSdacbOqmvUyTJTghljowilK4
X-Gm-Gg: ASbGncv4y70xhjlCCoBQNDotqJQ7hC2Bt/B2WEIa25TL8CkneicWpJeDesflHYSc0Il
	FIMs0hVvMohTi8jqqcfdwb8j3qX0PqpgXtpOh4GsUsp0h7NsSHrKTkSFaEuX9rvqXz+i3XcX3xj
	bfLQb1a+DFhM0vpe9ToZE76ejVLSNNny9FmdEI7wtv7u+EzNR+1yNm7ihwaVz+nnHBBIgjxdQV0
	RuBWYZHegfJ4R1SadMurbKz1Gva7wJfMYPUL6Up0yecpg1d0cI2RBKr6OJHbOriB1rt6xj/4Irj
	NBJg1zCiuI7yo1/G2Jduw/xNOSgmQ45Qf/9GNk1fcXveTCpXczr3OK6xcHY8H/gzJg2CLOST5A/
	NL1csWEzH+6NGnbRYGpu5hzzwnZxTOCelDeE/OHr0b2kk5Yjrago=
X-Google-Smtp-Source: AGHT+IEPHh/2ebqkGgimtTNshZ35ZBhXt9O04HK+1pd/wsmqmpdSWNANzUnELZmpu3VzsIEIQkb+0g==
X-Received: by 2002:a17:90b:4a8a:b0:327:9e88:7714 with SMTP id 98e67ed59e1d1-332a97051f7mr3565283a91.37.1758638973819;
        Tue, 23 Sep 2025 07:49:33 -0700 (PDT)
Received: from ti-am64x-sdk.. ([152.57.99.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed2771d43sm19092682a91.26.2025.09.23.07.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:49:33 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Michael Zaidman <michael.zaidman@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: bhanuseshukumar@gmail.com,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] HID: ft260: Use sysfs_emit to write formatted data to user buffer in sysfs show function.
Date: Tue, 23 Sep 2025 20:19:26 +0530
Message-Id: <20250923144926.307315-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline with sysfs documentation, sysfs_emit is used in show function
to write formatted data into user buffer. sysfs_emit is already PAGE_SIZE
aware.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note: Patch is compile tested and verified with checkpatch.

 drivers/hid/hid-ft260.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 333341e80b0e..8677bea46bea 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -826,7 +826,7 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret < 0)
 		return ret;
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", *field);
+	return sysfs_emit(buf, "%d\n", *field);
 }
 
 static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
@@ -838,7 +838,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret < 0)
 		return ret;
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
+	return sysfs_emit(buf, "%d\n", le16_to_cpu(*field));
 }
 
 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
-- 
2.34.1

